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
        
        public function deleteUploadedCustomerFIleById($file_id){
            $sql = "DELETE FROM `" . DB_PREFIX . "` customer_files WHERE file_id='" . (int)$file_id . "'";
            
            $result = $thid->db->query($sql);
            
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
        
        public function getContestantList($filter_data){
            $sql = "SELECT * FROM `" . DB_PREFIX . "customer`";
            
            $result = $this->db->query($sql);
            
            return $result->rows;
        }
        
        // Contestant score
        public function saveContestantScore($score_data, $level){
            $sql  = "INSERT INTO `" . DB_PREFIX . "contestant_score_" . (string)$level . "` SET ";
            $sql .= "contestant_id='" . (int)$score_data['contestant_id'] . "', ";
            $sql .= "curator_id='" . (int)$score_data['curator_id'] . "', ";
            $sql .= "checking='" . (string)$score_data['checking'] . "',";
            $sql .= "level_2_allowance='" . (bool)$score_data['level_2_allowance'] . "'";
            
            foreach($score_data['score'] as $score_key => $score){
                $sql .= ", " . (string)$score_key . "='" . (int)$score . "'";
            }
            
            $sql .= " ON DUPLICATE KEY UPDATE curator_id='" . (int)$score_data['curator_id'] . "', ";
            
            $sql .= "checking='" . (string)$score_data['checking'] . "', ";
            $sql .= "level_2_allowance='" . (bool)$score_data['level_2_allowance'] . "'";
            
            foreach($score_data['score'] as $score_key => $score){
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
}
