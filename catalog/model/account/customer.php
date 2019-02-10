<?php
class ModelAccountCustomer extends Model {
	public function addCustomer($data) {
		if (isset($data['customer_group_id']) && is_array($this->config->get('config_customer_group_display')) && in_array($data['customer_group_id'], $this->config->get('config_customer_group_display'))) {
			$customer_group_id = $data['customer_group_id'];
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}

		$this->load->model('account/customer_group');

		$customer_group_info = $this->model_account_customer_group->getCustomerGroup($customer_group_id);

		$this->db->query("INSERT INTO " . DB_PREFIX . "customer SET customer_group_id = '" . (int)$customer_group_id . "', store_id = '" . (int)$this->config->get('config_store_id') . "', language_id = '" . (int)$this->config->get('config_language_id') . "', firstname = '', lastname = '', email = '" . $this->db->escape($data['email']) . "', telephone = '" . $this->db->escape($data['telephone']) . "', fax = '', custom_field = '" . $this->db->escape(isset($data['custom_field']['account']) ? json_encode($data['custom_field']['account']) : '') . "', salt = '" . $this->db->escape($salt = token(9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "', newsletter = '" . (isset($data['newsletter']) ? (int)$data['newsletter'] : 0) . "', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', status = '1', approved = '" . (int)!$customer_group_info['approval'] . "', date_added = NOW()");

		$customer_id = $this->db->getLastId();

		$this->db->query("INSERT INTO " . DB_PREFIX . "address SET customer_id = '" . (int)$customer_id . "', firstname = '', lastname = '', company = '', address_1 = '', address_2 = '', city = '', postcode = '', country_id = '', zone_id = '', custom_field = '" . $this->db->escape(isset($data['custom_field']['address']) ? json_encode($data['custom_field']['address']) : '') . "'");

		$address_id = $this->db->getLastId();

		$this->db->query("UPDATE " . DB_PREFIX . "customer SET address_id = '" . (int)$address_id . "' WHERE customer_id = '" . (int)$customer_id . "'");

		$this->load->language('mail/customer');

		$subject = sprintf($this->language->get('text_subject'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));

		$message = sprintf($this->language->get('text_welcome'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8')) . "\n\n";

		if (!$customer_group_info['approval']) {
			$message .= $this->language->get('text_login') . "\n";
		} else {
			$message .= $this->language->get('text_approval') . "\n";
		}

		$message .= $this->url->link('account/login', '', true) . "\n\n";
		$message .= $this->language->get('text_services') . "\n\n";
		$message .= $this->language->get('text_thanks') . "\n\n";
                $message .= $this->language->get('text_thanks_2') . "\n";
		$message .= html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8');

		$mail = new Mail();
		$mail->protocol = $this->config->get('config_mail_protocol');
		$mail->parameter = $this->config->get('config_mail_parameter');
		$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
		$mail->smtp_username = $this->config->get('config_mail_smtp_username');
		$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
		$mail->smtp_port = $this->config->get('config_mail_smtp_port');
		$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

		$mail->setTo($data['email']);
		$mail->setFrom($this->config->get('config_email'));
		$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
		$mail->setSubject($subject);
		$mail->setText($message);
		$mail->send();

		// Send to main admin email if new account email is enabled
		if (in_array('account', (array)$this->config->get('config_mail_alert'))) {
			$message  = $this->language->get('text_signup') . "\n\n";
			$message .= $this->language->get('text_website') . ' ' . html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8') . "\n";
			$message .= $this->language->get('text_firstname') . ' ' . $data['firstname'] . "\n";
			$message .= $this->language->get('text_lastname') . ' ' . $data['lastname'] . "\n";
			$message .= $this->language->get('text_customer_group') . ' ' . $customer_group_info['name'] . "\n";
			$message .= $this->language->get('text_email') . ' '  .  $data['email'] . "\n";
			$message .= $this->language->get('text_telephone') . ' ' . $data['telephone'] . "\n";

			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			$mail->setTo($this->config->get('config_email'));
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
			$mail->setSubject(html_entity_decode($this->language->get('text_new_customer'), ENT_QUOTES, 'UTF-8'));
			$mail->setText($message);
			$mail->send();

			// Send to additional alert emails if new account email is enabled
			$emails = explode(',', $this->config->get('config_alert_email'));

			foreach ($emails as $email) {
				if (utf8_strlen($email) > 0 && preg_match($this->config->get('config_mail_regexp'), $email)) {
					$mail->setTo($email);
					$mail->send();
				}
			}
		}

		return $customer_id;
	}

	public function editCustomer($data) {
		$customer_id = $this->customer->getId();

		$this->db->query("UPDATE " . DB_PREFIX . "customer SET firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $this->db->escape($data['email']) . "', telephone = '" . $this->db->escape($data['telephone']) . "', fax = '" . $this->db->escape($data['fax']) . "', custom_field = '" . $this->db->escape(isset($data['custom_field']) ? json_encode($data['custom_field']) : '') . "' WHERE customer_id = '" . (int)$customer_id . "'");
	}

	public function editPassword($email, $password) {
		$this->db->query("UPDATE " . DB_PREFIX . "customer SET salt = '" . $this->db->escape($salt = token(9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($password)))) . "', code = '' WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");
	}

	public function editCode($email, $code) {
		$this->db->query("UPDATE `" . DB_PREFIX . "customer` SET code = '" . $this->db->escape($code) . "' WHERE LCASE(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");
	}

	public function editNewsletter($newsletter) {
		$this->db->query("UPDATE " . DB_PREFIX . "customer SET newsletter = '" . (int)$newsletter . "' WHERE customer_id = '" . (int)$this->customer->getId() . "'");
	}

	public function getCustomer($customer_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE customer_id = '" . (int)$customer_id . "'");

		return $query->row;
	}

	public function getCustomerByEmail($email) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");

		return $query->row;
	}

	public function getCustomerByCode($code) {
		$query = $this->db->query("SELECT customer_id, firstname, lastname, email FROM `" . DB_PREFIX . "customer` WHERE code = '" . $this->db->escape($code) . "' AND code != ''");

		return $query->row;
	}

	public function getCustomerByToken($token) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE token = '" . $this->db->escape($token) . "' AND token != ''");

		$this->db->query("UPDATE " . DB_PREFIX . "customer SET token = ''");

		return $query->row;
	}

	public function getTotalCustomersByEmail($email) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");

		return $query->row['total'];
	}

	public function getRewardTotal($customer_id) {
		$query = $this->db->query("SELECT SUM(points) AS total FROM " . DB_PREFIX . "customer_reward WHERE customer_id = '" . (int)$customer_id . "'");

		return $query->row['total'];
	}

	public function getIps($customer_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "customer_ip` WHERE customer_id = '" . (int)$customer_id . "'");

		return $query->rows;
	}

	public function addLoginAttempt($email) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_login WHERE email = '" . $this->db->escape(utf8_strtolower((string)$email)) . "' AND ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "'");

		if (!$query->num_rows) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "customer_login SET email = '" . $this->db->escape(utf8_strtolower((string)$email)) . "', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', total = 1, date_added = '" . $this->db->escape(date('Y-m-d H:i:s')) . "', date_modified = '" . $this->db->escape(date('Y-m-d H:i:s')) . "'");
		} else {
			$this->db->query("UPDATE " . DB_PREFIX . "customer_login SET total = (total + 1), date_modified = '" . $this->db->escape(date('Y-m-d H:i:s')) . "' WHERE customer_login_id = '" . (int)$query->row['customer_login_id'] . "'");
		}
	}

	public function getLoginAttempts($email) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "customer_login` WHERE email = '" . $this->db->escape(utf8_strtolower($email)) . "'");

		return $query->row;
	}

	public function deleteLoginAttempts($email) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "customer_login` WHERE email = '" . $this->db->escape(utf8_strtolower($email)) . "'");
	}
        
        //
        public function getTotalCustomers($data = array()) {
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer";

		$implode = array();

		if (!empty($data['filter_name'])) {
			$implode[] = "CONCAT(firstname, ' ', lastname) LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (!empty($data['filter_email'])) {
			$implode[] = "email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
		}

		if (isset($data['filter_newsletter']) && !is_null($data['filter_newsletter'])) {
			$implode[] = "newsletter = '" . (int)$data['filter_newsletter'] . "'";
		}

		if (!empty($data['filter_customer_group_id'])) {
			$implode[] = "customer_group_id = '" . (int)$data['filter_customer_group_id'] . "'";
		}

		if (!empty($data['filter_ip'])) {
			$implode[] = "customer_id IN (SELECT customer_id FROM " . DB_PREFIX . "customer_ip WHERE ip = '" . $this->db->escape($data['filter_ip']) . "')";
		}

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$implode[] = "status = '" . (int)$data['filter_status'] . "'";
		}

		if (isset($data['filter_approved']) && !is_null($data['filter_approved'])) {
			$implode[] = "approved = '" . (int)$data['filter_approved'] . "'";
		}

		if (!empty($data['filter_date_added'])) {
			$implode[] = "DATE(date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}
        
        public function addCustomerDataById($data) {
            $sql  = "INSERT INTO `" . DB_PREFIX . "customer_data` SET ";
            $sql .= "customer_id='" . (int)$data['customer_id'] . "', ";
            $sql .= "email='" . (string)$data['email'] . "', ";
            $sql .= "full_name='" . (string)$data['full_name'] . "', ";
            $sql .= "study_place='" . (string)$data['study_place'] . "', ";
            $sql .= "birth_date='" . (string)$data['birth_date'] . "', ";
            $sql .= "city='" . (string)$data['city'] . "', ";
            $sql .= "telephone='" . (string)$data['telephone'] . "', ";
            
            $sql .= "teacher_name='" . (string)$data['teacher_name'] . "', ";
            $sql .= "teacher_phone='" . (string)$data['teacher_phone'] . "', ";
            $sql .= "teacher_email='" . (string)$data['teacher_email'] . "', ";
            $sql .= "favorite_film='" . (string)$data['favorite_film'] . "', ";
            
            $sql .= "favorite_film_influence='" . (string)$data['favorite_film_influence'] . "', ";
            $sql .= "profession='" . (string)$data['profession'] . "', ";
            $sql .= "profession_opportunities='" . (string)$data['profession_opportunities'] . "', ";
            $sql .= "password='" . (string)$data['password'] . "', ";
            $sql .= "confirm='" . (string)$data['confirm'] . "', ";
            $sql .= "agree='" . (string)$data['agree'] . "'";
            
            $result = $this->db->query($sql);
            
            return $result;
        }
        
        //
        public function saveCustomerDataById($data) {
            $sql  = "INSERT INTO `" . DB_PREFIX . "customer_data` SET ";
            $sql .= "customer_id='" . (string)$data['customer_id'] . "', ";
            $sql .= "email='" . (string)$data['email'] . "', ";
            $sql .= "full_name='" . (string)$data['full_name'] . "', ";
            $sql .= "birth_date='" . (string)$data['birth_date'] . "', ";
            $sql .= "study_place='" . (string)$data['study_place'] . "', ";
            $sql .= "city='" . (string)$data['city'] . "', ";
            $sql .= "telephone='" . (string)$data['telephone'] . "', ";
            
            $sql .= "teacher_name='" . (string)$data['teacher_name'] . "', ";
            $sql .= "teacher_phone='" . (string)$data['teacher_phone'] . "', ";
            $sql .= "teacher_email='" . (string)$data['teacher_email'] . "', ";
            $sql .= "favorite_film='" . (string)$data['favorite_film'] . "', ";
            
            $sql .= "favorite_film_influence='" . (string)$data['favorite_film_influence'] . "', ";
            $sql .= "profession='" . (string)$data['profession'] . "', ";
            $sql .= "profession_opportunities='" . (string)$data['profession_opportunities'] . "' ";
            $sql .= "ON DUPLICATE KEY UPDATE ";
            $sql .= "email='" . (string)$data['email'] . "', ";
            $sql .= "full_name='" . (string)$data['full_name'] . "', ";
            $sql .= "birth_date='" . (string)$data['birth_date'] . "', ";
            $sql .= "study_place='" . (string)$data['study_place'] . "', ";
            $sql .= "city='" . (string)$data['city'] . "', ";
            $sql .= "telephone='" . (string)$data['telephone'] . "', ";
            
            $sql .= "teacher_name='" . (string)$data['teacher_name'] . "', ";
            $sql .= "teacher_phone='" . (string)$data['teacher_phone'] . "', ";
            $sql .= "teacher_email='" . (string)$data['teacher_email'] . "', ";
            $sql .= "favorite_film='" . (string)$data['favorite_film'] . "', ";
            
            $sql .= "favorite_film_influence='" . (string)$data['favorite_film_influence'] . "', ";
            $sql .= "profession='" . (string)$data['profession'] . "', ";
            $sql .= "profession_opportunities='" . (string)$data['profession_opportunities'] . "'";
            
            $result = $this->db->query($sql);
            
            return $result;
        }
        //
        
        public function updateCustomerDataById($data) {
            $sql  = "UPDATE `" . DB_PREFIX . "customer_data` SET ";
            $sql .= "email='" . (string)$data['email'] . "', ";
            $sql .= "full_name='" . (string)$data['full_name'] . "', ";
            $sql .= "birth_date='" . (string)$data['birth_date'] . "', ";
            $sql .= "study_place='" . (string)$data['study_place'] . "', ";
            $sql .= "city='" . (string)$data['city'] . "', ";
            $sql .= "telephone='" . (string)$data['telephone'] . "', ";
            
            $sql .= "teacher_name='" . (string)$data['teacher_name'] . "', ";
            $sql .= "teacher_phone='" . (string)$data['teacher_phone'] . "', ";
            $sql .= "teacher_email='" . (string)$data['teacher_email'] . "', ";
            $sql .= "favorite_film='" . (string)$data['favorite_film'] . "', ";
            
            $sql .= "favorite_film_influence='" . (string)$data['favorite_film_influence'] . "', ";
            $sql .= "profession='" . (string)$data['profession'] . "', ";
            $sql .= "profession_opportunities='" . (string)$data['profession_opportunities'] . "' ";
            $sql .= "WHERE customer_id='" . (int)$data['customer_id'] . "'";
            
            $result = $this->db->query($sql);
            
            return $result;
        }
        
        public function saveProfileData($profile_data){
            $sql  = "UPDATE `" . DB_PREFIX . "customer_data` SET ";
            $sql .= "city='" . (string)$profile_data['city'] . "', ";
            $sql .= "telephone='" . (string)$profile_data['telephone'] . "', ";
            $sql .= "study_place='" . (string)$profile_data['study_place'] . "' ";
            $sql .= "WHERE customer_id='" . (int)$profile_data['customer_id'] . "'";
            
            $result = $this->db->query($sql);
            
            return $result;
        }
        
        public function getCustomerDataById($customer_id) {
            $sql = "SELECT * FROM `" . DB_PREFIX . "customer_data` WHERE customer_id='" . (int)$customer_id . "'";
            
            $result = $this->db->query($sql);
            
            return $result->row;
        }
        
        public function getCustomerDataByEmail($customer_email) {
            $sql = "SELECT * FROM `" . DB_PREFIX . "customer_data` WHERE email='" . (string)$customer_email . "'";
            
            $result = $this->db->query($sql);
            
            return $result->row;
        }
        
        public function saveCustomerLevel1Data($level_data){
            $sql = "INSERT INTO `" . DB_PREFIX . "customer_level_1` (customer_id, speciality_perspective, esse) VALUES('" . (int)$level_data['customer_id'] . "', '" . (string)$level_data['speciality_perspective'] . "', '" . (string)$level_data['esse'] . "') ON DUPLICATE KEY UPDATE esse='" . (string)$level_data['esse'] . "', speciality_perspective='" . (string)$level_data['speciality_perspective'] . "', film_information='" . $level_data['film_information'] . "'";
            
            return $this->db->query($sql);
        }
        
        public function getCustomerLevel1Data($customer_id){
            $sql = "SELECT * FROM `" . DB_PREFIX . "customer_level_1` WHERE customer_id='" . (int)$customer_id . "'";
            
            $result = $this->db->query($sql);

            return $result->row;
        }
        
        public function saveCustomerRepresenter($representer_data){
            $sql  = "INSERT INTO `" . DB_PREFIX . "customer_representer` (customer_id, representer_name, representer_email, representer_phone) VALUES('" . (int)$representer_data['customer_id'] .  "', '" . (string)$representer_data['representer_name'] . "', '" . (string)$representer_data['representer_email'] . "', '" . (string)$representer_data['representer_phone'] . "') ON DUPLICATE KEY UPDATE ";
            $sql .= "representer_name='" . (string)$representer_data['representer_name'] . "', ";
            $sql .= "representer_email='" . (string)$representer_data['representer_email'] . "', ";
            $sql .= "representer_phone='" . (string)$representer_data['representer_phone'] . "'";
            
            $result = $this->db->query($sql);
            
            return $result;
        }
        
        public function getCustomerRepresenter($customer_id){
            $sql = "SELECT * FROM `" . DB_PREFIX . "customer_representer` WHERE customer_id='" . (int)$customer_id . "'";
            
            $result = $this->db->query($sql);
            
            return $result->row;
        }
        
        public function addCustomerFile($file_data){
            $sql = "INSERT INTO `" . DB_PREFIX . "customer_files` (customer_id, filename, purpose) VALUES('" . $file_data['customer_id'] . "', '" . $file_data['filename'] . "', '" . $file_data['purpose'] . "')";            
            
            $result = $this->db->query($sql);
            
            return $result;
        }
        
        public function getUploadedFileById($file_id){
            $sql = "SELECT * FROM `" . DB_PREFIX . "customer_files` WHERE file_id='"  . (int)$file_id . "'";
            
            $result = $this->db->query($sql);
            
            return $result->row;
        }
        
        public function deleteUploadedCustomerFileById($file_id){
            $sql = "DELETE FROM `" . DB_PREFIX . "` customer_files WHERE file_id='" . (int)$file_id . "'";
            
            $result = $this->db->query($sql);
            
            return $result;
        }
        
        public function getCustomerFilesByCustomerId($customer_id, $purpose){
            $sql = "SELECT * FROM `" . DB_PREFIX . "customer_files` WHERE customer_id='" . (int)$customer_id . "' AND purpose='" . (string)$purpose . "'";
            
            $result = $this->db->query($sql);
            
            return $result->rows;
        }
        
        // Curator
        public function getCuratorByEmail($curator_email){
            $sql = "SELECT * FROM `" . DB_PREFIX . "contestant_curator` WHERE email='" . (string)$curator_email . "'";
            
            $result = $this->db->query($sql);
            
            return $result->row;
        }
        
        public function getCustomers($data = array()) {
		$sql = "SELECT *, CONCAT(c.firstname, ' ', c.lastname) AS name, cgd.name AS customer_group FROM " . DB_PREFIX . "customer c LEFT JOIN " . DB_PREFIX . "customer_group_description cgd ON (c.customer_group_id = cgd.customer_group_id) WHERE cgd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		$implode = array();

		if (!empty($data['filter_name'])) {
			$implode[] = "CONCAT(c.firstname, ' ', c.lastname) LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (!empty($data['filter_email'])) {
			$implode[] = "c.email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
		}

		if (isset($data['filter_newsletter']) && !is_null($data['filter_newsletter'])) {
			$implode[] = "c.newsletter = '" . (int)$data['filter_newsletter'] . "'";
		}

		if (!empty($data['filter_customer_group_id'])) {
			$implode[] = "c.customer_group_id = '" . (int)$data['filter_customer_group_id'] . "'";
		}

		if (!empty($data['filter_ip'])) {
			$implode[] = "c.customer_id IN (SELECT customer_id FROM " . DB_PREFIX . "customer_ip WHERE ip = '" . $this->db->escape($data['filter_ip']) . "')";
		}

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$implode[] = "c.status = '" . (int)$data['filter_status'] . "'";
		}

		if (isset($data['filter_approved']) && !is_null($data['filter_approved'])) {
			$implode[] = "c.approved = '" . (int)$data['filter_approved'] . "'";
		}

		if (!empty($data['filter_date_added'])) {
			$implode[] = "DATE(c.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if ($implode) {
			$sql .= " AND " . implode(" AND ", $implode);
		}

		$sort_data = array(
			'name',
			'c.email',
			'customer_group',
			'c.status',
			'c.approved',
			'c.ip',
			'c.date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY name";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}
        
        /*
        public function getContestantList2($data = []){
            $sql = "SELECT *, CONCAT(c.firstname, ' ', c.lastname) AS name, cgd.name AS customer_group FROM " . DB_PREFIX . "customer c LEFT JOIN " . DB_PREFIX . "customer_group_description cgd ON (c.customer_group_id = cgd.customer_group_id) WHERE cgd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		$implode = array();

		if (!empty($data['filter_name'])) {
			$implode[] = "CONCAT(c.firstname, ' ', c.lastname) LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (!empty($data['filter_email'])) {
			$implode[] = "c.email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
		}

		if (isset($data['filter_newsletter']) && !is_null($data['filter_newsletter'])) {
			$implode[] = "c.newsletter = '" . (int)$data['filter_newsletter'] . "'";
		}

		if (!empty($data['filter_customer_group_id'])) {
			$implode[] = "c.customer_group_id = '" . (int)$data['filter_customer_group_id'] . "'";
		}

		if (!empty($data['filter_ip'])) {
			$implode[] = "c.customer_id IN (SELECT customer_id FROM " . DB_PREFIX . "customer_ip WHERE ip = '" . $this->db->escape($data['filter_ip']) . "')";
		}

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$implode[] = "c.status = '" . (int)$data['filter_status'] . "'";
		}

		if (isset($data['filter_approved']) && !is_null($data['filter_approved'])) {
			$implode[] = "c.approved = '" . (int)$data['filter_approved'] . "'";
		}

		if (!empty($data['filter_date_added'])) {
			$implode[] = "DATE(c.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if ($implode) {
			$sql .= " AND " . implode(" AND ", $implode);
		}

		$sort_data = array(
			'name',
			'c.email',
			'customer_group',
			'c.status',
			'c.approved',
			'c.ip',
			'c.date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY name";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if (!isset($data['start'])) {
				$data['start'] = 0;
			}

                        echo "<br />" . $data['start'] . "<br />";
                        
			if (!isset($data['limit'])) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
        }
        
        public function getContestantList32($data = []){
            $sql = "SELECT * FROM (SELECT c.customer_id as customer_id, c.date_added as date_added, c.email as email, (csl1.question_4_score + csl1.question_5_score + csl1.question_6_score) as score_sum FROM `" . DB_PREFIX . "customer` c LEFT JOIN `" . DB_PREFIX . "contestant_score_level_1` csl1 ON c.customer_id=csl1.contestant_id ORDER BY score_sum DESC, customer_id ASC) AS all_contestants";

            if (!isset($data['start'])) {
                $data['start'] = 0;
            }

            if (!isset($data['limit'])) {
                $data['limit'] = 5;
            }

            $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
            
            $result = $this->db->query($sql);
            
            return $result->rows;
        }
        */
        
        public function getContestantList($data = []){
            $sql = "SELECT c.customer_id as customer_id, c.date_added as date_added, c.email as email, (csl1.question_4_score + csl1.question_5_score + csl1.question_6_score) as score_sum FROM `" . DB_PREFIX . "customer` c LEFT JOIN `" . DB_PREFIX . "contestant_score_level_1` csl1 ON c.customer_id=csl1.contestant_id ORDER BY score_sum DESC";
            
            $result = $this->db->query($sql);
            
            return $result->rows;
        }
        
        // Contestant score
        public function saveContestantScore($score_data, $level){
            $sql  = "INSERT INTO `" . DB_PREFIX . "contestant_score_" . (string)$level . "` SET ";
            $sql .= "contestant_id='" . (int)$score_data[$level]['contestant_id'] . "', ";
            $sql .= "curator_id='" . (int)$score_data[$level]['curator_id'] . "', ";
            $sql .= "checking='" . (string)$score_data[$level]['checking'] . "',";
            $sql .= "level_2_allowance='" . (bool)$score_data[$level]['level_2_allowance'] . "'";
            
            foreach($score_data[$level]['score'] as $score_key => $score){
                $sql .= ", " . (string)$score_key . "='" . (int)$score . "'";
            }
            
            $sql .= " ON DUPLICATE KEY UPDATE contestant_id='" . (int)$score_data[$level]['contestant_id'] . "', ";
            
            $sql .= "checking='" . (string)$score_data[$level]['checking'] . "', ";
            $sql .= "level_2_allowance='" . (bool)$score_data[$level]['level_2_allowance'] . "'";
            
            foreach($score_data[$level]['score'] as $score_key => $score){
                $sql .= ", " . (string)$score_key . "='" . (int)$score . "'";
            }
            
            $result = $this->db->query($sql);
            
            return $result;
        }
        
        public function deleteContestantScore($contestant_id, $level){
            $sql = "DELETE FROM `" . DB_PREFIX . "contestant_score_" . (string)$level . "` WHERE contestant_id='" . (int)$contestant_id . "'";
            
            $result = $this->db->query($sql);
            
            return $result;
        }
        
        public function getContestantScoreById($contestant_id, $level){
            $sql = "SELECT * FROM `" . DB_PREFIX . "contestant_score_" . (string)$level . "` WHERE contestant_id='" . (int)$contestant_id . "'";
            
            $result = $this->db->query($sql);
            
            return $result->row;
        }

        public function getAllowedToNextLevelList($level="level_1", $field_name="level_2_allowance"){
            $sql = "SELECT * FROM `" . DB_PREFIX . "contestant_score_" . (string)$level . "` WHERE " . (string)$field_name . "='1'";
            
            $result = $this->db->query($sql);
            
            return $result->rows;
        }
        
        // Level 2 data
        
        
        // Clear all allowance
        public function clearAllAllowance(){
            $sql = "UPDATE `" .DB_PREFIX . "contestant_score_level_1` SET level_2_allowance='0'";
            
            $result = $this->db->query($sql);
            
            return $result;
        }
        
        public function addAllNeccessaryData($contestant_id){
            $sql  = "INSERT INTO `" . DB_PREFIX . "contestant_score_level_1` SET ";
            $sql .= "contestant_id = '" . (int)$contestant_id . "',";
            $sql .= "curator_id = '0', ";
            $sql .= "question_4_score = '0', ";
            $sql .= "question_5_score = '0', ";
            $sql .= "question_6_score = '0', ";
            $sql .= "checking = '', ";
            $sql .= "level_2_allowance = '0'";
            
            $result = $this->db->query($sql);
            
            return $result;
        }
        
        // File uploads
        public function addCustomerLevelFile($filedata){
            $sql  = "INSERT INTO `" . DB_PREFIX . "customer_level_file` SET ";
            $sql .= "customer_id='" . $filedata['customer_id'] . "', ";
            $sql .= "filename='" . $filedata['filename'] . "', ";
            $sql .= "filepath='" . $filedata['filepath'] . "', ";
            $sql .= "type='" . $filedata['type'] . "', ";
            $sql .= "purpose='" . $filedata['purpose'] . "', ";
            $sql .= "sort_order='" . $filedata['sort_order'] . "', ";
            $sql .= "date_added=NOW()";
            
            $this->db->query($sql);
            
            $result = $this->db->getLastId();
            
            return $result;
        }
        
        public function deleteCustomerLevelFileById($file_id){
            $sql = "DELETE FROM `" . DB_PREFIX . "customer_level_file` WHERE file_id='" . (int)$file_id . "'";
            
            $result = $this->db->query($sql);
            
            return $result;
        }
        
        public function getCustomerLevelFileById($file_id){
            $sql = "SELECT * FROM `" . DB_PREFIX . "customer_level_file` WHERE file_id='" . (int)$file_id . "'";
            
            $result = $this->db->query($sql);
            
            return $result->row;
        }
        
        public function getCustomerLevelFileByPathAndName($filepath, $filename){
            $sql = "SELECT * FROM `" . DB_PREFIX . "customer_level_file` WHERE filepath='" . (string)$filepath . "' AND filename='" . (string)$filename . "'";
            
            $result = $this->db->query($sql);
            
            return $result->rows;
        }
        
        public function getCustomerLevelFileByFullFilename($filename, $filepath){
            $sql = "SELECT * FROM `" . DB_PREFIX . "customer_level_file` WHERE filename='" . (string)$filename . "' AND filepath='" . (string)$filepath . "'";
            
            $result = $this->db->query($sql);
            
            return $result->row;
        }
        
        public function getCustomerLevelFileListByCustomerId($customer_id){
            $sql = "SELECT * FROM `" . DB_PREFIX . "customer_level_file` WHERE customer_id='" . (int)$customer_id . "' ORDER BY sort_order ASC";
            
            $result = $this->db->query($sql);
            
            return $result->rows;
        }
        
        public function getCustomerLevelFileListByPurpose($customer_id, $purpose){
            $sql = "SELECT * FROM `" . DB_PREFIX . "customer_level_file` WHERE customer_id='" . (int)$customer_id . "' AND purpose='" . (string)$purpose . "' ORDER BY sort_order ASC";
            
            $result = $this->db->query($sql);
            
            return $result->rows;
        }
        
        public function updateCustomerLevelFilePropertyById($filedata){
            $sql = "UPDATE `" . DB_PREFIX . "customer_level_file` SET " . (string)$filedata['property_name'] . "='" . (string)$filedata['property_value'] . "' WHERE file_id='" . (int)$filedata['file_id'] . "'";
            
            $result = $this->db->query($sql);
            
            return $result;
        }
        
        public function getCustomerLevelFileWithClosestSmallerSortOrder($sort_order_data){
            $sql  = "SELECT * FROM `" . DB_PREFIX . "customer_level_file` WHERE customer_id='" . (int)$sort_order_data['customer_id'] . "' ";
            $sql .= "AND purpose='" . (string)$sort_order_data['purpose'] . "' ";
            $sql .= "AND sort_order <= " . (int)$sort_order_data['sort_order'] . " ";
            $sql .= "AND file_id <> " . (int)$sort_order_data['file_id'] . " ";
            $sql .= "ORDER BY sort_order DESC LIMIT 1";
            
            $result = $this->db->query($sql);
            
            return $result->row;
        }
        
        public function getCustomerLevelFileWithClosestBiggerSortOrder($sort_order_data){
            $sql  = "SELECT * FROM `" . DB_PREFIX . "customer_level_file` WHERE customer_id='" . (int)$sort_order_data['customer_id'] . "' ";
            $sql .= "AND purpose='" . (string)$sort_order_data['purpose'] . "' ";
            $sql .= "AND sort_order >= " . (int)$sort_order_data['sort_order'] . " ";
            $sql .= "AND file_id <> " . (int)$sort_order_data['file_id'] . " ";
            $sql .= "ORDER BY sort_order ASC LIMIT 1";
            
            $result = $this->db->query($sql);
            
            return $result->row;
        }
        
        public function getCustomerLevelFileBiggestSortOrder($sort_order_data){
            $biggest_sort_order = 0;
            
            $sql = "SELECT * FROM `" . DB_PREFIX . "customer_level_file` WHERE customer_id='" . (int)$sort_order_data['customer_id'] . "' AND purpose='" . (string)$sort_order_data['purpose'] . "' ORDER BY sort_order DESC LIMIT 1";
            
            $result = $this->db->query($sql);
            
            if(!empty($result->row)){
                $res = $result->row;
                $biggest_sort_order = $res['sort_order'];
            }
            
            return $biggest_sort_order;
        }
        
        // Level 2
        public function saveLevel2SoundproducerData($soundproducer_data){
            $sql  = "INSERT INTO `" . DB_PREFIX . "level_2_sound_producer` SET ";
            $sql .= "customer_id='" . (int)$soundproducer_data['customer_id'] . "', ";
            $sql .= "detective='" . (string)$soundproducer_data['detective'] . "', ";
            $sql .= "melodrama='" . (string)$soundproducer_data['melodrama'] . "', ";
            $sql .= "comedy='" . (string)$soundproducer_data['comedy'] . "', ";
            $sql .= "triller='" . (string)$soundproducer_data['triller'] . "', ";
            $sql .= "fantasy='" . (string)$soundproducer_data['fantasy'] . "', ";
            $sql .= "drama='" . (string)$soundproducer_data['drama'] . "' ";
            $sql .= "ON DUPLICATE KEY UPDATE ";
            $sql .= "detective='" . (string)$soundproducer_data['detective'] . "', ";
            $sql .= "melodrama='" . (string)$soundproducer_data['melodrama'] . "', ";
            $sql .= "comedy='" . (string)$soundproducer_data['comedy'] . "', ";
            $sql .= "triller='" . (string)$soundproducer_data['triller'] . "', ";
            $sql .= "fantasy='" . (string)$soundproducer_data['fantasy'] . "', ";
            $sql .= "drama='" . (string)$soundproducer_data['drama'] . "' ";
            
            $result = $this->db->query($sql);
            
            return $result;
        }
        public function getLevel2SoundproducerDataByCustomerId($customer_id){
            $sql = "SELECT * FROM `" . DB_PREFIX . "level_2_sound_producer` WHERE customer_id='" . (int)$customer_id . "'";
            
            $result = $this->db->query($sql);
            
            return $result->row;
        }
        public function deleteLevel2SoundproducerDataByCustomerId($customer_id){
            $sql = "DELETE FROM `" . DB_PREFIX . "level_2_sound_producer` WHERE customer_id='" . (int)$customer_id . "'";
            
            $result = $this->db->query($sql);
            
            return $result;
        }
        
        public function saveLevel2ProductionInFilmmakingData($data){
            $sql  = "INSERT INTO `" . DB_PREFIX . "level_2_production_in_filmmaking` SET ";
            $sql .= "customer_id='" . (int)$data['customer_id'] . "', ";
            $sql .= "question_1='" . (string)$data['question_1'] . "', ";
            $sql .= "question_2='" . (string)$data['question_2'] . "', ";
            $sql .= "question_3='" . (string)$data['question_3'] . "', ";
            $sql .= "question_4='" . (string)$data['question_4'] . "', ";
            $sql .= "question_5='" . (string)$data['question_5'] . "', ";
            $sql .= "question_6='" . (string)$data['question_6'] . "', ";
            $sql .= "question_7='" . (string)$data['question_7'] . "' ";
            $sql .= "ON DUPLICATE KEY UPDATE ";
            $sql .= "question_1='" . (string)$data['question_1'] . "', ";
            $sql .= "question_2='" . (string)$data['question_2'] . "', ";
            $sql .= "question_3='" . (string)$data['question_3'] . "', ";
            $sql .= "question_4='" . (string)$data['question_4'] . "', ";
            $sql .= "question_5='" . (string)$data['question_5'] . "', ";
            $sql .= "question_6='" . (string)$data['question_6'] . "', ";
            $sql .= "question_7='" . (string)$data['question_7'] . "'";
            
            $result = $this->db->query($sql);
            
            return $result;
        }        
        public function getLevel2ProductionInFilmmakingData($customer_id){
            $sql = "SELECT * FROM `" . DB_PREFIX . "level_2_production_in_filmmaking` WHERE customer_id='" . (int)$customer_id . "'";
            
            $result = $this->db->query($sql);
            
            return $result->row;
        }        
        public function deleteLevel2ProductionInFilmmakingData($customer_id){
            $sql = "DELETE FROM `" . DB_PREFIX . "level_2_production_in_filmmaking` WHERE customer_id='" . (int)$customer_id . "'";
            
            $result = $this->db->query($sql);
            
            return $result;
        }
        
        public function saveLevel2ActingSkillsData($data){
            $sql  = "INSERT INTO `" . DB_PREFIX . "level_2_acting_skills` SET ";
            $sql .= "customer_id='" . (int)$data['customer_id'] . "', ";
            $sql .= "video_url='" . (string)$data['video_url'] . "' ";
            $sql .= "ON DUPLICATE KEY UPDATE ";
            $sql .= "video_url='" . (string)$data['video_url'] . "'";
            
            $result = $this->db->query($sql);
            
            return $result;
        }
        public function getLevel2ActingSkillsData($customer_id){
            $sql = "SELECT * FROM `" . DB_PREFIX . "level_2_acting_skills` WHERE customer_id='" . (int)$customer_id . "'";
            
            $result = $this->db->query($sql);
            
            return $result->row;
        }
        public function deleteLevel2ActingSkillsData($customer_id){
            $sql = "DELETE FROM `" . DB_PREFIX . "level_2_acting_skills` WHERE customer_id='" . (int)$customer_id . "'";
            
            $result = $this->db->query($sql);
            
            return $result;
        }
        
        public function saveLevel2DramaturgyScreenwriterData($data){
            $sql  = "INSERT INTO `" . DB_PREFIX . "level_2_dramaturgy_screenwriter` SET ";
            $sql .= "customer_id='" . (int)$data['customer_id'] . "', ";
            $sql .= "theme_1='" . (string)$data['theme_1'] . "', ";
            $sql .= "theme_2='" . (string)$data['theme_2'] . "', ";
            $sql .= "theme_3='" . (string)$data['theme_3'] . "' ";
            $sql .= "ON DUPLICATE KEY UPDATE ";
            $sql .= "theme_1='" . (string)$data['theme_1'] . "', ";
            $sql .= "theme_2='" . (string)$data['theme_2'] . "', ";
            $sql .= "theme_3='" . (string)$data['theme_3'] . "'";
            
            $result = $this->db->query($sql);
            
            return $result;
        }
        public function getLevel2DramaturgyScreenwriterData($customer_id){
            $sql = "SELECT * FROM `" . DB_PREFIX . "level_2_dramaturgy_screenwriter` WHERE customer_id='" . (int)$customer_id . "'";
            
            $result = $this->db->query($sql);
            
            return $result->row;
        }
        public function deleteLevel2DramaturgyScreenwriterData($customer_id){
            $sql = "DELETE FROM `" . DB_PREFIX . "level_2_dramaturgy_screenwriter` WHERE customer_id='" . (int)$customer_id . "'";
            
            $result = $this->db->query($sql);
            
            return $result;
        }
        
        public function saveLevel2FilmDirectorData($data){
            $sql  = "INSERT INTO `" . DB_PREFIX . "level_2_film_director` SET ";
            $sql .= "customer_id='" . (int)$data['customer_id'] . "', ";
            $sql .= "case_of_life='" . (string)$data['case_of_life'] . "' ";
            $sql .= "ON DUPLICATE KEY UPDATE ";
            $sql .= "case_of_life='" . (string)$data['case_of_life'] . "'";
            
            $result = $this->db->query($sql);
            
            return $result;
        }
        public function getLevel2FilmDirectorData($customer_id){
            $sql = "SELECT * FROM `" . DB_PREFIX . "level_2_film_director` WHERE customer_id='" . (int)$customer_id . "'";
            
            $result = $this->db->query($sql);
            
            return $result->row;
        }
        public function deleteLevel2FilmDirectorData($customer_id){
            $sql = "DELETE FROM `" . DB_PREFIX . "level_2_film_director` WHERE customer_id='" . (int)$customer_id . "'";
            
            $result = $this->db->query($sql);
            
            return $result;
        }
}
