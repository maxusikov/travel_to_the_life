<?php
class ControllerCustomerCurator extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('customer/curator');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('customer/curator');

		$this->getCuratorList();
	}

	public function add() {
		$this->load->language('customer/curator');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('customer/curator');
                
                if(isset($this->request->post['action'])){
                    if(isset($this->request->post['action']) == 'add'){
                        $curator_data = [
                            'name'     => $this->request->post['curator_name'],
                            'email'    => $this->request->post['curator_email'],
                            'password' => $this->request->post['curator_password']
                        ];

                        $this->model_customer_curator->addCurator($curator_data);
                    }
                }
                
		$this->getCuratorForm();
	}

	public function edit() {
		$this->load->language('customer/curator');

		$this->document->setTitle($this->language->get('heading_title'));

                $this->load->model('customer/curator');
                
                if(isset($this->request->post['action'])){
                    if($this->request->post['action'] == 'edit') {
                        $curator_data = [
                            'curator_id' => $this->request->get['curator_id'],
                            'name'     => $this->request->post['curator_name'],
                            'email'    => $this->request->post['curator_email'],
                            'password' => $this->request->post['curator_password']
                        ];

                        $this->model_customer_curator->updateCuratorById($curator_data);
                    }
                }

		$this->getCuratorForm();
	}

	public function delete() {
		$this->load->language('customer/customer');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('customer/customer');

		$this->getList();
	}

	protected function getCuratorList() {
                $this->load->language('customer/curator');
            
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('customer/curator', 'token=' . $this->session->data['token'], true)
		);

		$data['add'] = $this->url->link('customer/curator/add', 'token=' . $this->session->data['token'], true);
		$data['delete'] = $this->url->link('customer/curator/delete', 'token=' . $this->session->data['token'], true);

		$data['curators'] = array();

                $this->load->model('customer/curator');
                
		$results = $this->model_customer_curator->getCuratorList();

		foreach ($results as $result) {
                    
                    $data['curators'][] = array(
                            'curator_id'    => $result['curator_id'],
                            'name'           => $result['name'],
                            'email'          => $result['email'],
                            'edit'           => $this->url->link('customer/curator/edit', 'token=' . $this->session->data['token'] . '&curator_id=' . $result['curator_id'], true)
                    );
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
                $data['text_no_results'] = $this->language->get('text_no_results');
                $data['text_edit'] = $this->language->get('text_edit');
                
                $data['column_name'] = $this->language->get('column_name');
		$data['column_email'] = $this->language->get('column_email');
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_action'] = $this->language->get('column_action');

                $data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');

		$data['token'] = $this->session->data['token'];

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$selected = (array)$this->request->post['selected'];
		} else {
			$selected = array();
		}

		$this->load->model('customer/curator');

                foreach($selected as $item){
                    $this->model_customer_curator->deleteCuratorById($item);
                }

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('customer/curator_list', $data));
	}

	public function getCuratorForm() {
            if(isset($this->request->get['curator_id'])){
                $curator_id = (int)$this->request->get['curator_id'];
            } else {
                $curator_id = false;
            }
            
            $this->load->language('customer/curator');
            
            $data['breadcrumbs'] = array();

            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('text_home'),
                'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
            );

            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('heading_title'),
                'href' => $this->url->link('customer/curator', 'token=' . $this->session->data['token'], true)
            );
            
            $data['breadcrumbs'][] = array(
                'text' => ($curator_id) ? $this->language->get('text_edit') : $this->language->get('text_add'),
                'href' => $this->url->link('customer/curator', 'token=' . $this->session->data['token'], true)
            );
            
            if (isset($this->error['warning'])) {
                $data['error_warning'] = $this->error['warning'];
            } else {
                $data['error_warning'] = '';
            }

            if (isset($this->session->data['success'])) {
                $data['success'] = $this->session->data['success'];

                unset($this->session->data['success']);
            } else {
                $data['success'] = '';
            }
            
            $this->load->model('customer/curator');
            
            if($curator_id){
                $curator_data = $this->model_customer_curator->getCuratorById($curator_id);
                
                $data['curator_name'] = $curator_data['name'];
                $data['curator_email'] = $curator_data['email'];
            } else {
                $data['curator_name'] = '';
                $data['curator_email'] = '';
            }
            
            if($curator_id){
                $data['action'] = $this->url->link('customer/curator/edit', 'token=' . $this->session->data['token'] . '&curator_id=' . $curator_id);
                $data['form_action'] = 'edit';
            } else {
                $data['action'] = $this->url->link('customer/curator/add', 'token=' . $this->session->data['token']);
                $data['form_action'] = 'add';
            }
            
            $data['cancel'] = $this->url->link('customer/curator', 'token=' . $this->session->data['token']);
            
            $data['heading_title'] = $this->language->get('heading_title');
            
            $data['text_form'] = $this->language->get('text_form');
            
            $data['entry_curator_name'] = $this->language->get('entry_curator_name');
            $data['entry_curator_email'] = $this->language->get('entry_curator_email');
            $data['entry_password'] = $this->language->get('entry_password');
            $data['entry_password_confirm'] = $this->language->get('entry_password_confirm');
            
            $data['button_save'] = $this->language->get('button_save');
            $data['button_cancel'] = $this->language->get('button_cancel');
            
            $data['header'] = $this->load->controller('common/header');
            $data['column_left'] = $this->load->controller('common/column_left');
            $data['footer'] = $this->load->controller('common/footer');

            $this->response->setOutput($this->load->view('customer/curator_form', $data));
	}
        
        private function validateForm(){
            if (!$this->user->hasPermission('modify', 'customer/curator')) {
                $this->error['warning'] = $this->language->get('error_permission');
            }

            if ((utf8_strlen($this->request->post['curator_name']) < 1) || (utf8_strlen(trim($this->request->post['curator_name'])) > 64)) {
                $this->error['name'] = $this->language->get('error_name');
            }

            if ((utf8_strlen($this->request->post['curator_email']) < 1) || (utf8_strlen(trim($this->request->post['curator_email'])) > 96)) {
                $this->error['email'] = $this->language->get('error_email');
            }
            
            if ((utf8_strlen($this->request->post['curator_password']) < 1) || (utf8_strlen(trim($this->request->post['curator_password'])) > 32)) {
                $this->error['password'] = $this->language->get('error_password');
            }
            
            if ((utf8_strlen($this->request->post['curator_password_confirm']) < 1) || (utf8_strlen(trim($this->request->post['curator_password_confirm'])) > 32)) {
                $this->error['password_confirm'] = $this->language->get('error_password_confirm');
            }
        }
}
