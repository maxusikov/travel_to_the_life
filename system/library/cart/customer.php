<?php
namespace Cart;
class Customer {
	private $customer_id;
	private $firstname;
	private $lastname;
        private $fullname;
        private $curator;
	private $customer_group_id;
	private $email;
	private $telephone;
	private $fax;
	private $newsletter;
	private $address_id;

	public function __construct($registry) {
		$this->config = $registry->get('config');
		$this->db = $registry->get('db');
		$this->request = $registry->get('request');
		$this->session = $registry->get('session');

		if (isset($this->session->data['customer_id'])) {
			$customer_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE customer_id = '" . (int)$this->session->data['customer_id'] . "' AND status = '1'");

			if ($customer_query->num_rows) {
				$this->customer_id = $customer_query->row['customer_id'];
				$this->firstname = $customer_query->row['firstname'];
				$this->lastname = $customer_query->row['lastname'];
				$this->customer_group_id = $customer_query->row['customer_group_id'];
				$this->email = $customer_query->row['email'];
				$this->telephone = $customer_query->row['telephone'];
				$this->fax = $customer_query->row['fax'];
				$this->newsletter = $customer_query->row['newsletter'];
				$this->address_id = $customer_query->row['address_id'];

				$this->db->query("UPDATE " . DB_PREFIX . "customer SET language_id = '" . (int)$this->config->get('config_language_id') . "', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "' WHERE customer_id = '" . (int)$this->customer_id . "'");

				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_ip WHERE customer_id = '" . (int)$this->session->data['customer_id'] . "' AND ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "'");

				if (!$query->num_rows) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "customer_ip SET customer_id = '" . (int)$this->session->data['customer_id'] . "', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', date_added = NOW()");
				}
			} else {
				$this->logout();
			}
		}
	}

	public function login($email, $password, $override = false, $curator = false) {
            if($curator){
                $curator_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "contestant_curator` WHERE LOWER(email) = '" . (string)$this->db->escape(utf8_strtolower($email)) . "'");
                
                if ($curator_query->num_rows) {
                    $this->session->data['customer_id'] = $curator_query->row['curator_id'];

                    $this->customer_id = $curator_query->row['curator_id'];
                    $this->fullname = $curator_query->row['name'];
                    $this->email = $curator_query->row['name'];
                    $this->curator = true;
                    $this->firstname = false;
                    $this->lastname = false;
                    $this->customer_group_id = false;
                    $this->telephone = false;
                    $this->fax = false;
                    $this->newsletter = false;
                    $this->address_id = false;

                    return true;
                } else {
                    return false;
                }
            } else {
                if ($override) {
                    $customer_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "' AND status = '1'");
                } else {
                    $customer_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "' AND (password = SHA1(CONCAT(salt, SHA1(CONCAT(salt, SHA1('" . $this->db->escape($password) . "'))))) OR password = '" . $this->db->escape(md5($password)) . "') AND status = '1' AND approved = '1'");
                }

                if ($customer_query->num_rows) {
                    $this->session->data['customer_id'] = $customer_query->row['customer_id'];
                    
                    $this->customer_id = $customer_query->row['customer_id'];
                    $this->firstname = $customer_query->row['firstname'];
                    $this->lastname = $customer_query->row['lastname'];
                    $this->curator = false;
                    $this->customer_group_id = $customer_query->row['customer_group_id'];
                    $this->email = $customer_query->row['email'];
                    $this->telephone = $customer_query->row['telephone'];
                    $this->fax = $customer_query->row['fax'];
                    $this->newsletter = $customer_query->row['newsletter'];
                    $this->address_id = $customer_query->row['address_id'];

                    $this->db->query("UPDATE " . DB_PREFIX . "customer SET language_id = '" . (int)$this->config->get('config_language_id') . "', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "' WHERE customer_id = '" . (int)$this->customer_id . "'");

                    return true;
                } else {
                    return false;
                }
            }
	}

	public function logout() {
		unset($this->session->data['customer_id']);

		$this->customer_id = '';
		$this->firstname = '';
                $this->fullname = '';
                $this->curator = false;
		$this->lastname = '';
		$this->customer_group_id = '';
		$this->email = '';
		$this->telephone = '';
		$this->fax = '';
		$this->newsletter = '';
		$this->address_id = '';
	}

	public function isLogged() {
		return $this->customer_id;
	}

        public function isCurator() {
		return $this->curator;
	}
        
	public function getId() {
		return $this->customer_id;
	}

	public function getFirstName() {
		return $this->firstname;
	}

        public function getFullName(){
            if(isset($this->fullname)){
                return $this->fullname;
            } else {
                return $this->firstname . ' ' . $this->lastname;
            }
        }
        
	public function getLastName() {
		return $this->lastname;
	}

	public function getGroupId() {
		return $this->customer_group_id;
	}

	public function getEmail() {
		return $this->email;
	}

	public function getTelephone() {
		return $this->telephone;
	}

	public function getFax() {
		return $this->fax;
	}

	public function getNewsletter() {
		return $this->newsletter;
	}

	public function getAddressId() {
		return $this->address_id;
	}

	public function getBalance() {
		$query = $this->db->query("SELECT SUM(amount) AS total FROM " . DB_PREFIX . "customer_transaction WHERE customer_id = '" . (int)$this->customer_id . "'");

		return $query->row['total'];
	}

	public function getRewardPoints() {
		$query = $this->db->query("SELECT SUM(points) AS total FROM " . DB_PREFIX . "customer_reward WHERE customer_id = '" . (int)$this->customer_id . "'");

		return $query->row['total'];
	}
}
