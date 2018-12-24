<?php
class ControllerLandingNavbar extends Controller {
	public function index() {
		$this->load->language('landing/navbar');

                $data['navbar'] = [
                    'headline' => [
                        'text' => $this->language->get('text_headline'),
                        'href' => $this->url->link('landing/landing', '#headline')
                    ],
                    'program_description' => [
                        'text' => $this->language->get('text_program_description'),
                        'href' => $this->url->link('landing/landing', '#program-description')
                    ],
                    'levels' => [
                        'text' => $this->language->get('text_levels'),
                        'href' => $this->url->link('landing/landing', '#levels')
                    ],
                    'expert_jury' => [
                        'text' => $this->language->get('text_expert_jury'),
                        'href' => $this->url->link('landing/landing', '#expert-jury')
                    ],
                    'teaching_session' => [
                        'text' => $this->language->get('text_teaching_session'),
                        'href' => $this->url->link('landing/landing', '#teaching-session')
                    ],
                    'organizer' => [
                        'text' => $this->language->get('text_organizer'),
                        'href' => $this->url->link('landing/landing', '#organizer')
                    ],
                ];
                
		return $this->load->view('landing/navbar', $data);
	}
}
