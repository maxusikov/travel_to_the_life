<?php
class ControllerCommonHome extends Controller {
	public function index() {
                $this->load->language('landing/landing');
            
		$data['navbar'] = $this->load->controller('landing/navbar');
                $data['registration'] = $this->url->link('account/register');
                
		$this->response->setOutput($this->load->view('landing/landing', $data));
		
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		
		$this->response->setOutput($this->load->view('landing/landing', $data));
	}
}
