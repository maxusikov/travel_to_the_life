<?php
class ControllerCommonHome extends Controller {
	public function index() {
                $this->load->language('landing/landing');
            
		$data['navbar'] = $this->load->controller('landing/navbar');
                $data['registration'] = $this->url->link('account/register');
                
                define('MONTHES', [
                    '1' => 'января',
                    '2' => 'февраля',
                    '3' => 'марта',
                    '4' => 'апреля',
                    '5' => 'мая',
                    '6' => 'июня',
                    '7' => 'июля',
                    '8' => 'августа',
                    '9' => 'сентября',
                    '10' => 'октября',
                    '11' => 'ноября',
                    '12' => 'декабря',
                ]);
                
                $data['personal_account'] = $this->url->link('account/account', true);
                
                $timestamp = new Datetime($this->config->get('config_registration_end_date'));
                $data['registration_end_date'] = date_format($timestamp, "d") . " " . MONTHES[date_format($timestamp, "n")] . " " . date_format($timestamp, "Y") . " г";
		
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		
		$this->response->setOutput($this->load->view('landing/landing', $data));
	}
}
