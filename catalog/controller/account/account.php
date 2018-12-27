<?php
class ControllerAccountAccount extends Controller {
	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/account', '', true);

			$this->response->redirect($this->url->link('account/login', '', true));
		}

		$this->load->language('account/account');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_account'),
			'href' => $this->url->link('account/account', '', true)
		);

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		} 

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_my_account'] = $this->language->get('text_my_account');
		$data['text_my_orders'] = $this->language->get('text_my_orders');
		$data['text_my_newsletter'] = $this->language->get('text_my_newsletter');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_password'] = $this->language->get('text_password');
		$data['text_address'] = $this->language->get('text_address');
		$data['text_credit_card'] = $this->language->get('text_credit_card');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_reward'] = $this->language->get('text_reward');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_newsletter'] = $this->language->get('text_newsletter');
		$data['text_recurring'] = $this->language->get('text_recurring');
                
                $data['text_user_navbar'] = $this->language->get('text_user_navbar');
                $data['text_manual_materials'] = $this->language->get('text_manual_materials');
                
                $data['text_logout'] = $this->language->get('text_logout');
                $data['text_my_profile'] = $this->language->get('text_my_profile');
                $data['text_my_projects'] = $this->language->get('text_my_projects');
                $data['text_settings'] = $this->language->get('text_settings');
                $data['text_photo'] = $this->language->get('text_photo');
                $data['text_change_password'] = $this->language->get('text_change_password');
                
		$data['edit'] = $this->url->link('account/edit', '', true);
		$data['password'] = $this->url->link('account/password', '', true);
		$data['address'] = $this->url->link('account/address', '', true);
		
		$data['credit_cards'] = array();
		
		$files = glob(DIR_APPLICATION . 'controller/extension/credit_card/*.php');
		
		foreach ($files as $file) {
			$code = basename($file, '.php');
			
			if ($this->config->get($code . '_status') && $this->config->get($code . '_card')) {
				$this->load->language('extension/credit_card/' . $code);

				$data['credit_cards'][] = array(
					'name' => $this->language->get('heading_title'),
					'href' => $this->url->link('extension/credit_card/' . $code, '', true)
				);
			}
		}
		
                if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
                    $customer_data = [
                            'customer_id'              => $this->request->post['customer_id'],
                            'full_name'                => $this->request->post['full_name'],
                            'email'                    => $this->request->post['email'],
                            'birth_date'               => $this->request->post['birth_date'],
                            'study_place'              => $this->request->post['study_place'],
                            'city'                     => $this->request->post['city'],
                            'telephone'                => $this->request->post['telephone'],
                            'teacher_name'             => $this->request->post['teacher_name'],
                            'teacher_phone'            => $this->request->post['teacher_phone'],
                            'teacher_email'            => $this->request->post['teacher_email'],
                            'favorite_film'            => $this->request->post['favorite_film'],
                            'favorite_film_influence'  => $this->request->post['favorite_film_influence'],
                            'profession'               => $this->request->post['profession'],
                            'profession_opportunities' => $this->request->post['profession_opportunities'],
                            //'password'                 => $this->request->post['password'],
                            //'confirm'                  => $this->request->post['confirm']
                        ];
                        
                        $this->load->model('account/customer');
                        $add_customer_data = $this->model_account_customer->updateCustomerDataById($customer_data);
                }
                
		$data['wishlist'] = $this->url->link('account/wishlist');
		$data['order'] = $this->url->link('account/order', '', true);
		$data['download'] = $this->url->link('account/download', '', true);
                
                $data['action'] = $this->url->link('account/account', true);
                
		$data['logout'] = $this->url->link('account/logout', true);
                $data['my_profile'] = $this->url->link('account/account', true);
                $data['my_projects'] = $this->url->link('account/my_projects', true);
                $data['settings'] = $this->url->link('account/settings', true);
                $data['photo'] = $this->url->link('account/photo', true);
                $data['change_password'] = $this->url->link('account/change_password', true);
                
                $this->load->model('account/customer');
                
                $data['customer_data'] = $this->model_account_customer->getCustomerDataById($this->customer->isLogged());
                                
                if (isset($this->request->post['email'])) {
			$data['email'] = (string)$this->request->post['email'];
		} elseif (isset($this->session->data['shipping_address']['email'])) {
			$data['email'] = $this->session->data['shipping_address']['email'];
		} else {
			$data['email'] = '';
		}
                
                if (isset($this->request->post['full_name'])) {
			$data['full_name'] = (string)$this->request->post['full_name'];
		} elseif (isset($this->session->data['shipping_address']['full_name'])) {
			$data['full_name'] = $this->session->data['shipping_address']['full_name'];
		} else {
			$data['full_name'] = '';
		}
                
                if (isset($this->request->post['birth_date'])) {
			$data['birth_date'] = (string)$this->request->post['birth_date'];
		} elseif (isset($this->session->data['shipping_address']['birth_date'])) {
			$data['birth_date'] = $this->session->data['shipping_address']['birth_date'];
		} else {
			$data['birth_date'] = '';
		}
                
                if (isset($this->request->post['city'])) {
			$data['city'] = (string)$this->request->post['city'];
		} elseif (isset($this->session->data['shipping_address']['city'])) {
			$data['city'] = $this->session->data['shipping_address']['city'];
		} else {
			$data['city'] = '';
		}
                
                if (isset($this->request->post['study_place'])) {
			$data['study_place'] = (string)$this->request->post['study_place'];
		} elseif (isset($this->session->data['shipping_address']['study_place'])) {
			$data['study_place'] = $this->session->data['shipping_address']['study_place'];
		} else {
			$data['study_place'] = '';
		}
                
                if (isset($this->request->post['telephone'])) {
			$data['telephone'] = (string)$this->request->post['telephone'];
		} elseif (isset($this->session->data['shipping_address']['telephone'])) {
			$data['telephone'] = $this->session->data['shipping_address']['telephone'];
		} else {
			$data['telephone'] = '';
		}
                
                if (isset($this->request->post['teacher_name'])) {
			$data['teacher_name'] = (string)$this->request->post['teacher_name'];
		} elseif (isset($this->session->data['shipping_address']['teacher_name'])) {
			$data['teacher_name'] = $this->session->data['shipping_address']['teacher_name'];
		} else {
			$data['teacher_name'] = '';
		}
                
                if (isset($this->request->post['teacher_phone'])) {
			$data['teacher_phone'] = (string)$this->request->post['teacher_phone'];
		} elseif (isset($this->session->data['shipping_address']['teacher_phone'])) {
			$data['teacher_phone'] = $this->session->data['shipping_address']['teacher_phone'];
		} else {
			$data['teacher_phone'] = '';
		}
                
                if (isset($this->request->post['teacher_email'])) {
			$data['teacher_email'] = (string)$this->request->post['teacher_email'];
		} elseif (isset($this->session->data['shipping_address']['teacher_email'])) {
			$data['teacher_email'] = $this->session->data['shipping_address']['teacher_email'];
		} else {
			$data['teacher_email'] = '';
		}
                
                if (isset($this->request->post['favorite_film'])) {
			$data['favorite_film'] = (string)$this->request->post['favorite_film'];
		} elseif (isset($this->session->data['shipping_address']['favorite_film'])) {
			$data['favorite_film'] = $this->session->data['shipping_address']['favorite_film'];
		} else {
			$data['favorite_film'] = '';
		}
                
                if (isset($this->request->post['favorite_film_influence'])) {
			$data['favorite_film_influence'] = (string)$this->request->post['favorite_film_influence'];
		} elseif (isset($this->session->data['shipping_address']['favorite_film_influence'])) {
			$data['favorite_film_influence'] = $this->session->data['shipping_address']['favorite_film_influence'];
		} else {
			$data['favorite_film_influence'] = '';
		}
                
                if (isset($this->request->post['profession'])) {
			$data['profession'] = (string)$this->request->post['profession'];
		} elseif (isset($this->session->data['shipping_address']['profession'])) {
			$data['profession'] = $this->session->data['shipping_address']['profession'];
		} else {
			$data['profession'] = '';
		}
                
                if (isset($this->request->post['profession_opportunities'])) {
			$data['profession_opportunities'] = (string)$this->request->post['profession_opportunities'];
		} elseif (isset($this->session->data['shipping_address']['profession_opportunities'])) {
			$data['profession_opportunities'] = $this->session->data['shipping_address']['profession_opportunities'];
		} else {
			$data['profession_opportunities'] = '';
		}
                
                if (isset($this->request->post['password'])) {
			$data['password'] = (string)$this->request->post['password'];
		} elseif (isset($this->session->data['shipping_address']['password'])) {
			$data['password'] = $this->session->data['shipping_address']['password'];
		} else {
			$data['password'] = '';
		}
                
                if (isset($this->request->post['confirm'])) {
			$data['confirm'] = (string)$this->request->post['confirm'];
		} elseif (isset($this->session->data['shipping_address']['confirm'])) {
			$data['confirm'] = $this->session->data['shipping_address']['confirm'];
		} else {
			$data['confirm'] = '';
		}
                
                if (isset($this->request->post['teacher_data'])) {
			$data['teacher_data'] = (string)$this->request->post['teacher_data'];
		} elseif (isset($this->session->data['shipping_address']['teacher_data'])) {
			$data['teacher_data'] = $this->session->data['shipping_address']['teacher_data'];
		} else {
			$data['teacher_data'] = '';
		}
                
		$data['return'] = $this->url->link('account/return', '', true);
		$data['transaction'] = $this->url->link('account/transaction', '', true);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true);
		$data['recurring'] = $this->url->link('account/recurring', '', true);
		
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		
		$this->response->setOutput($this->load->view('account/account', $data));
	}
        
        private function validate() {
                if (isset($this->request->post['city'])) {
                    if ((utf8_strlen(trim($this->request->post['city'])) < 2) || (utf8_strlen(trim($this->request->post['city'])) > 128)) {
                        $this->error['city'] = $this->language->get('error_city');
                    }
                }
                
                if (isset($this->request->post['telephone'])) {
                    if ((utf8_strlen($this->request->post['telephone']) < 3) || (utf8_strlen($this->request->post['telephone']) > 32)) {
                        $this->error['telephone'] = $this->language->get('error_telephone');
                    }
                }
                
                if (isset($this->request->post['password'])) {
                    if ((utf8_strlen($this->request->post['password']) < 4) || (utf8_strlen($this->request->post['password']) > 20)) {
                        $this->error['password'] = $this->language->get('error_password');
                    }
                }

                if (isset($this->request->post['confirm']) && isset($this->request->post['password'])) {
                    if ($this->request->post['confirm'] != $this->request->post['password']) {
                        $this->error['confirm'] = $this->language->get('error_confirm');
                    }
                }

		// Captcha
		if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('register', (array)$this->config->get('config_captcha_page'))) {
			$captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');

			if ($captcha) {
				$this->error['captcha'] = $captcha;
			}
		}

		return !$this->error;
	}
}
