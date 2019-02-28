<?php
class ControllerAccountAccount extends Controller{
	public function index() {
            $this->level1();
	}
        
        public function profile(){
            $this->checkLogged();
            
            $this->load->model('account/customer');
            
            $data['heading_title'] = "Профиль пользователя";
            
            $c_id = $this->customer->isLogged();
            $customer_data = $this->model_account_customer->getCustomerDataById($c_id);
            
            if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
                if($this->validate()){
                    $customer_data_array = [
                        'customer_id'              => $customer_data['customer_id'],
                        'full_name'                => $customer_data['full_name'],
                        'email'                    => $customer_data['email'],
                        'birth_date'               => $customer_data['birth_date'],
                        'study_place'              => isset($this->request->post['study_place']) ? $this->request->post['study_place'] : $customer_data['study_place'],
                        'city'                     => isset($this->request->post['city']) ? $this->request->post['city'] : $customer_data['city'],
                        'telephone'                => isset($this->request->post['telephone']) ? $this->request->post['telephone'] : $customer_data['telephone'],
                        'teacher_name'             => $customer_data['teacher_name'],
                        'teacher_phone'            => $customer_data['teacher_phone'],
                        'teacher_email'            => $customer_data['teacher_email'],
                        'favorite_film'            => $customer_data['favorite_film'],
                        'favorite_film_influence'  => $customer_data['favorite_film_influence'],
                        'profession'               => $customer_data['profession'],
                        'profession_opportunities' => $customer_data['profession_opportunities']
                    ];

                    $add_customer_data = $this->model_account_customer->updateCustomerDataById($customer_data_array);
                    
                    $data['customer_data'] = $customer_data_array;
                } else {
                    echo "Validation fail";
                }
            } else {
                $data['customer_data'] = $customer_data;
            }
            
            $data['action'] = $this->url->link('account/account/profile', true);
            
            $customer_navbar = $this->load->controller('account/customer_navbar');
            
            $data['customer_navbar'] = $customer_navbar->getNavbar('project');
            
            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            $this->response->setOutput($this->load->view('account/profile', $data));
        }
        
        public function level1(){
            $this->checkLogged();
            
            $this->load->language('account/account');
            
            $this->load->model('account/customer');
            
            $data['heading_title'] = "Этап 1";
            
            //
            if($this->request->server['REQUEST_METHOD'] == 'POST'){
                if(isset($this->request->post['agreement']) && $this->request->post['agreement'] == '1'){
                    $this->load->model('account/customer');

                    $levelData = [
                        'customer_id'            => $this->customer->isLogged(),
                        'speciality_perspective' => isset($this->request->post['speciality_perspective']) ? $this->request->post['speciality_perspective'] : '',
                        'esse'                   => isset($this->request->post['customer_esse']) ? $this->request->post['customer_esse'] : '',
                        'film_information'       => isset($this->request->post['film_information']) ? $this->request->post['film_information'] : ''
                    ];

                    if($this->model_account_customer->saveCustomerLevel1Data($levelData)){
                        $data['save_result'] = [
                            'result' => 'success',
                            'info'   => 'Информация этапа №1 обновлена'
                        ];

                        $customer_representer_data = [
                            'customer_id'       => $this->customer->isLogged(),
                            'representer_name'  => isset($this->request->post['parent']['name']) ? $this->request->post['parent']['name'] : '',
                            'representer_email' => isset($this->request->post['parent']['email']) ? $this->request->post['parent']['email'] : '',
                            'representer_phone' => isset($this->request->post['parent']['phone']) ? $this->request->post['parent']['phone'] : '',
                        ];

                        if ($this->model_account_customer->saveCustomerRepresenter($customer_representer_data)) {
                            $data['save_result'] = [
                                'result' => 'success',
                                'info'   => 'Информация этапа №1 обновлена'
                            ];
                        }else {
                            $data['save_result'] = [
                                'result' => 'fail',
                                'info'   => 'Информация этапа №1 не обновлена'
                            ];
                        }
                    } else {
                        $data['save_result'] = [
                            'result' => 'fail',
                            'info'   => 'Информация этапа №1 не обновлена'
                        ];
                    }
                } else {
                    $error_agreement = [
                        'status' => 'error',
                        'info'   => "Необходимо дать согласие на подписание Договора на отчуждение исключительных прав"
                    ];

                    $data['error_agreement'] = json_encode($error_agreement);
                }
               
                //$data['customer_level_1_film_information'] = isset($this->request->post['film_information']) ? $this->request->post['film_information'] : '';
                $data['customer_level_1_speciality_perspective'] = isset($this->request->post['speciality_perspective']) ? $this->request->post['speciality_perspective'] : '';
                $data['customer_level_1_esse'] = isset($this->request->post['customer_esse']) ? $this->request->post['customer_esse'] : '';
                
                $data['customer_representer'] = [
                    'name'  => isset($this->request->post['parent']['name']) ? $this->request->post['parent']['name'] : '',
                    'phone' => isset($this->request->post['parent']['phone']) ? $this->request->post['parent']['phone'] : '',
                    'email' => isset($this->request->post['parent']['email']) ? $this->request->post['parent']['email'] : ''
                ];
            } else {
                $c_id = $this->customer->isLogged();
                
                $customer_level_1_data = $this->model_account_customer->getCustomerLevel1Data($c_id);
                
                //$data['customer_level_1_film_information'] = isset($customer_level_1_data['film_information']) ? $customer_level_1_data['film_information'] : '';
                $data['customer_level_1_speciality_perspective'] = isset($customer_level_1_data['speciality_perspective']) ? $customer_level_1_data['speciality_perspective'] : '';
                $data['customer_level_1_esse'] = isset($customer_level_1_data['esse']) ? $customer_level_1_data['esse'] : '';
                
                $customer_representer_data = $this->model_account_customer->getCustomerRepresenter($c_id);
                $data['customer_representer'] = [
                    'name'  => isset($customer_representer_data['representer_name']) ? $customer_representer_data['representer_name'] : '',
                    'phone' => isset($customer_representer_data['representer_phone']) ? $customer_representer_data['representer_phone'] : '',
                    'email' => isset($customer_representer_data['representer_email']) ? $customer_representer_data['representer_email'] : ''
                ];
            }
            
            $customer_navbar = $this->load->controller('account/customer_navbar');
            
            $data['customer_navbar'] = $customer_navbar->getNavbar('project');
            
            $data['level1'] = $this->url->link('account/account/level1', true);
            $data['level2'] = $this->url->link('account/account/level2', true);
            $data['psychotest'] = $this->url->link('account/account/psychotest', true);
            
            // Score
            $customer_id = $this->customer->isLogged();
            
            $data['total_score'] = 0;
            
            $contestant_level_1_score_data = $this->model_account_customer->getContestantScoreByContestantIdAndLevel($customer_id, 'level_1');
            
            $data['total_score'] += (int)$contestant_level_1_score_data[0]['question_4_score'];
            $data['total_score'] += (int)$contestant_level_1_score_data[0]['question_5_score'];
            $data['total_score'] += (int)$contestant_level_1_score_data[0]['question_6_score'];
            
            $data['level_score'] = $data['total_score'];
            
            // Level 2 score
            $contestant_score_data = $this->model_account_customer->getContestantScoreByContestantIdAndLevel($customer_id, 'level_2');
            
            $level_2_score = 0;
            
            $score_list = [];

            foreach($contestant_score_data as $score){
                $score_list[$score['score_key']] = (int)$score['score_value'];
                
                if($level_2_score < (int)$score['score_value']){
                    $level_2_score = (int)$score['score_value'];
                }
            }

            $data['total_score'] += $level_2_score;
            
            $contestant_psychologist_score_data = $this->model_account_customer->getContestantScoreByContestantIdAndLevel($customer_id, 'psychologist');
            $psychologist_score = $contestant_psychologist_score_data[0];
            
            $data['total_score'] += (int)$psychologist_score['score_value'];
            //
            
            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            $this->response->setOutput($this->load->view('account/level1', $data));
        }
        
        public function level2(){
            $this->checkLogged();
            
            $this->load->language('account/account');
            
            $this->load->model('account/customer');
            
            if(isset($this->request->post)){
                $post_data = $this->request->post;
            
                $customer_id = $this->customer->isLogged();
                
                $data['level_2'] = [];

                $data['level_2']['film_director'] = [];
                if(isset($post_data['level_2']['film_director'])){
                    $film_director = $post_data['level_2']['film_director'];
                    
                    if(empty($film_director['case_of_life'])){
                        $this->model_account_customer->deleteLevel2FilmDirectorDataByCustomerId($customer_id);
                    } else {
                        $data['level_2']['film_director'] = $post_data['level_2']['film_director'];
                        $data['level_2']['film_director']['customer_id'] = $customer_id;

                        $this->model_account_customer->saveLevel2FilmDirectorData($data['level_2']['film_director']);
                    }
                }

                $data['level_2']['dramaturgy_screenwriter'] = [];
                if(isset($post_data['level_2']['dramaturgy_screenwriter'])){
                    $dramaturgy_screenwriter = $post_data['level_2']['dramaturgy_screenwriter'];
                    
                    if(empty($dramaturgy_screenwriter['theme_1']) &&
                            empty($dramaturgy_screenwriter['theme_2']) &&
                            empty($dramaturgy_screenwriter['theme_3'])){
                        
                        $this->model_account_customer->deleteLevel2DramaturgyScreenwriterDataCustomerId($customer_id);
                    } else {
                        $data['level_2']['dramaturgy_screenwriter'] = $post_data['level_2']['dramaturgy_screenwriter'];
                        $data['level_2']['dramaturgy_screenwriter']['customer_id'] = $customer_id;

                        $this->model_account_customer->saveLevel2DramaturgyScreenwriterData($data['level_2']['dramaturgy_screenwriter']);
                    }
                }

                $data['level_2']['acting_skills'] = [];
                if(isset($post_data['level_2']['acting_skills'])){
                    $acting_skills = $post_data['level_2']['acting_skills'];
                    
                    if(empty($acting_skills['video_url'])){
                        $this->model_account_customer->deleteLevel2ActingSkillsDataByCustomerId($customer_id);
                    } else {
                        $data['level_2']['acting_skills'] = $post_data['level_2']['acting_skills'];
                        $data['level_2']['acting_skills']['customer_id'] = $customer_id;

                        $this->model_account_customer->saveLevel2ActingSkillsData($data['level_2']['acting_skills']);
                    }
                }

                $data['level_2']['production_in_filmmaking'] = [];
                if(isset($post_data['level_2']['production_in_filmmaking'])){
                    $production_in_filmmaking = $post_data['level_2']['production_in_filmmaking'];
                    
                    if(empty($production_in_filmmaking['question_1']) && 
                            empty($production_in_filmmaking['question_2']) && 
                            empty($production_in_filmmaking['question_3']) &&
                            empty($production_in_filmmaking['question_4']) && 
                            empty($production_in_filmmaking['question_5']) && 
                            empty($production_in_filmmaking['question_6']) &&
                            empty($production_in_filmmaking['question_7'])){
                        
                       $this->model_account_customer->deleteLevel2ProductionInFilmmakingDataByCustomerId($customer_id);
                    } else {
                        $data['level_2']['production_in_filmmaking'] = $post_data['level_2']['production_in_filmmaking'];
                        $data['level_2']['production_in_filmmaking']['customer_id'] = $customer_id;

                        $this->model_account_customer->saveLevel2ProductionInFilmmakingData($data['level_2']['production_in_filmmaking']);
                    }
                }

                $data['level_2']['soundproducer'] = [];
                if(isset($post_data['level_2']['soundproducer'])){
                    $soundproducer = $post_data['level_2']['soundproducer'];
                    
                    if(empty($soundproducer['detective']) && 
                            empty($soundproducer['melodrama']) && 
                            empty($soundproducer['comedy']) &&
                            empty($soundproducer['triller']) && 
                            empty($soundproducer['fantasy']) && 
                            empty($soundproducer['draama'])){
                        
                        $this->model_account_customer->deleteLevel2SoundproducerDataByCustomerId($customer_id);
                    } else {
                        $data['level_2']['soundproducer'] = $post_data['level_2']['soundproducer'];
                        $data['level_2']['soundproducer']['customer_id'] = $customer_id;

                        $this->model_account_customer->saveLevel2SoundproducerData($data['level_2']['soundproducer']);
                    }
                }
            }
            
            $data['heading_title'] = "Этап 2";
            
            $customer_navbar = $this->load->controller('account/customer_navbar');
            
            $data['customer_navbar'] = $customer_navbar->getNavbar('project');
            
            $data['level1'] = $this->url->link('account/account/level1', true);
            $data['level2'] = $this->url->link('account/account/level2', true);
            $data['psychotest'] = $this->url->link('account/account/psychotest', true);
            
            $c_id = $this->customer->isLogged();
            
            $customer_uploaded_files = $this->model_account_customer->getCustomerFilesByCustomerId($c_id, "level1__files");
            $data['uploaded_files'] = $customer_uploaded_files;

            $customer_score = $this->model_account_customer->getContestantScoreById($this->customer->isLogged(), 'level_1');

            $data['score']['level_1'] = $customer_score;
            
            $data['upload_file'] = $this->url->link('account/account/upload', true);
            $data['delete_file'] = $this->url->link('account/account/deleteFile', true);
            $data['sort_file'] = $this->url->link('account/account/sort', true);
            $data['get_file'] = $this->url->link('account/account/getfile', true);

            // Level 2 data
            $data['save_contestant_level_2_data'] = $this->url->link('account/account/saveContestantLevel2Data');

            $customer_id = $this->customer->isLogged();

            $data['level_2'] = [
                'soundproducer'             => $this->model_account_customer->getLevel2SoundproducerDataByCustomerId($customer_id),
                'production_in_filmmaking'  => $this->model_account_customer->getLevel2ProductionInFilmmakingData($customer_id),
                'acting_skills'             => $this->model_account_customer->getLevel2ActingSkillsData($customer_id),
                'dramaturgy_screenwriter'   => $this->model_account_customer->getLevel2DramaturgyScreenwriterData($customer_id),
                'film_director'             => $this->model_account_customer->getLevel2FilmDirectorData($customer_id)
            ];

            // Customer files
            $data['get_uploaded_file_list'] = $this->url->link('account/account/filelist', true);

            $customer_files = $this->model_account_customer->getCustomerLevelFileListByCustomerId($this->customer->isLogged());

            $data['customer_files'] = [];

            foreach($customer_files as $customer_file){
                if(!isset($data['customer_files'][$customer_file['purpose']])){
                    $data['customer_files'][$customer_file['purpose']] = [];
                }

                $data['customer_files'][$customer_file['purpose']][] = [
                    'file_id'  => $customer_file['file_id'],
                    'filename' => $customer_file['filename'],
                    'filepath' => $customer_file['filepath'],
                    'fullname' => $customer_file['filepath'] . '/' . $customer_file['filename'],
                    'purpose'  => $customer_file['purpose'],
                    'filetype'   => $customer_file['type'],
                    'sort_order' => $customer_file['sort_order']
                ];
            }

            // Score data
            $data['total_score'] = 0;
            
            $contestant_level_1_score_data = $this->model_account_customer->getContestantScoreByContestantIdAndLevel($customer_id, 'level_1');
            
            $data['total_score'] += (int)$contestant_level_1_score_data[0]['question_4_score'];
            $data['total_score'] += (int)$contestant_level_1_score_data[0]['question_5_score'];
            $data['total_score'] += (int)$contestant_level_1_score_data[0]['question_6_score'];
            
            // Level 2
            $contestant_score_data = $this->model_account_customer->getContestantScoreByContestantIdAndLevel($customer_id, 'level_2');
            
            $data['level_score'] = 0;
            
            $score_list = [];

            foreach($contestant_score_data as $score){
                $score_list[$score['score_key']] = (int)$score['score_value'];
                
                if($data['level_score'] < (int)$score['score_value']){
                    $data['level_score'] = (int)$score['score_value'];
                }
            }

            $data['total_score'] += $data['level_score'];
            
            // Psychologist
            $contestant_psychologist_score_data = $this->model_account_customer->getContestantScoreByContestantIdAndLevel($customer_id, 'psychologist');
            $psychologist_score = $contestant_psychologist_score_data[0];
            
            $data['total_score'] += (int)$psychologist_score['score_value'];
            
            $data['contestant_score_data'] = $score_list;

            // Recommendation data
            $curator_recommendation_data = $this->model_account_customer->getCuratorRecommendationByContestantId($customer_id);

            $recommendation_list = [];

            foreach($curator_recommendation_data as $recommendation){
                $recommendation_list[$recommendation['recommendation_key']] = $recommendation['recommendation_text'];
            }

            $data['curator_recommendation_data'] = $recommendation_list;
            
            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            $this->response->setOutput($this->load->view('account/level2', $data));
        }
        
        public function psychotest(){
            $this->checkLogged();
            
            $this->load->language('account/account');
            
            $this->load->model('account/customer');
            
            $data['heading_title'] = "Тест психолога";
            
            $customer_navbar = $this->load->controller('account/customer_navbar');
            
            $data['customer_navbar'] = $customer_navbar->getNavbar('project');
            
            $data['level1'] = $this->url->link('account/account/level1', true);
            $data['level2'] = $this->url->link('account/account/level2', true);
            
            $customer_id = $this->customer->isLogged();
            
            // Score data
            $data['total_score'] = 0;
            
            $contestant_level_1_score_data = $this->model_account_customer->getContestantScoreByContestantIdAndLevel($customer_id, 'level_1');
            
            $data['total_score'] += (int)$contestant_level_1_score_data[0]['question_4_score'];
            $data['total_score'] += (int)$contestant_level_1_score_data[0]['question_5_score'];
            $data['total_score'] += (int)$contestant_level_1_score_data[0]['question_6_score'];
            
            // Level 2
            $contestant_score_data = $this->model_account_customer->getContestantScoreByContestantIdAndLevel($customer_id, 'level_2');
            
            $data['level_2_score'] = 0;
            
            $score_list = [];

            foreach($contestant_score_data as $score){
                $score_list[$score['score_key']] = (int)$score['score_value'];
                
                if($data['level_2_score'] < (int)$score['score_value']){
                    $data['level_2_score'] = (int)$score['score_value'];
                }
            }

            $data['total_score'] += $data['level_2_score'];
            //
            $psychologist_score_data = $this->model_account_customer->getContestantScoreByContestantIdAndLevel($customer_id, 'psychologist');
            $data['psychologist_score'] = $psychologist_score_data[0]['score_value'];
            
            $data['total_score'] += (int)$psychologist_score_data[0]['score_value'];
            
            
            // Recommendation
            $curator_psychologist_recommendation_data = $this->model_account_customer->getCuratorRecommendationByContestantIdAndKey($customer_id, 'psychologist');
            
            $data['psychologist_recommendation'] = !empty($curator_psychologist_recommendation_data['recommendation_text']) ? $curator_psychologist_recommendation_data['recommendation_text'] : '';
            
            
            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            $this->response->setOutput($this->load->view('account/contestant_psychotest', $data));
        }
        
        private function checkLogged(){
            if (!$this->customer->isLogged()) {
                    $this->session->data['redirect'] = $this->url->link('account/account', '', true);

                    $this->response->redirect($this->url->link('account/login', '', true));
            }
        }
        
        private function validate() {
                if (isset($this->request->post['city'])) {
                    if ((utf8_strlen(trim($this->request->post['city'])) < 2) || (utf8_strlen(trim($this->request->post['city'])) > 128)) {
                        $error['city'] = $this->language->get('error_city');
                    }
                }
                
                if (isset($this->request->post['telephone'])) {
                    if ((utf8_strlen($this->request->post['telephone']) < 3) || (utf8_strlen($this->request->post['telephone']) > 32)) {
                        $error['telephone'] = $this->language->get('error_telephone');
                    }
                }
                
                if (isset($this->request->post['password'])) {
                    if ((utf8_strlen($this->request->post['password']) < 4) || (utf8_strlen($this->request->post['password']) > 20)) {
                        $error['password'] = $this->language->get('error_password');
                    }
                }

                if (isset($this->request->post['confirm']) && isset($this->request->post['password'])) {
                    if ($this->request->post['confirm'] != $this->request->post['password']) {
                        $error['confirm'] = $this->language->get('error_confirm');
                    }
                }

                if(isset($this->request->post['agreement'])){
                    if($this->request->post['agreement'] == '0'){
                        //$data['error_agreement'] = "Необходимо дать согласие на подписание Договора на отчуждение исключительных прав";
                    }
                }
                
		// Captcha
		if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('register', (array)$this->config->get('config_captcha_page'))) {
			$captcha = $this->load->controller('extension/captcha/' . $this->config->get('config_captcha') . '/validate');

			if ($captcha) {
				$error['captcha'] = $captcha;
			}
		}

		return !$this->error;
	}
        
        public function getCustomerForm(){
            

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

            $this->load->model('account/customer');

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

            $data['save_profile_data'] = $this->url->link('account/account/saveProfileData', true);
            $data['save_customer_level_data'] = $this->url->link('account/account/saveCustomerLevelData', true);
            
            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            $this->response->setOutput($this->load->view('account/account', $data));
        }
        
        public function upload(){
            $response_data = [
                'status' => 'success'
            ];
            
            $processed_files = [];
            
            $this->load->language('account/account');
            
            $this->load->model('account/customer');
            
            if(isset($this->request->post['level'])){
                (string)$level = $this->request->post['level'];
            } else {
                (string)$level = '';
            }
            
            $customer = $this->model_account_customer->getCustomer($this->customer->isLogged());
            
            $customer_dir = CUSTOMER_UPLOAD . $level;
            if(!is_dir($customer_dir)){
                mkdir($customer_dir);
            }
            
            $customer_dir .= '/' . $customer['customer_id'];
            if(!is_dir($customer_dir)){
                mkdir($customer_dir);
            }
            
            $file_purpose = isset($this->request->post['purpose']) ? $this->request->post['purpose'] : '';
            
            $customer_dir_purpose = $customer_dir . '/' . $file_purpose;
            if(!is_dir($customer_dir_purpose)){
                mkdir($customer_dir_purpose);
            }
            
            // Check if multiple files are uploaded or just one
            $files = array();

            if (!empty($this->request->files['file']['name']) && is_array($this->request->files['file']['name'])) {
                foreach (array_keys($this->request->files['file']['name']) as $key) {
                    $files[] = array(
                        'name'     => $this->request->files['file']['name'][$key],
                        'type'     => $this->request->files['file']['type'][$key],
                        'tmp_name' => $this->request->files['file']['tmp_name'][$key],
                        'error'    => $this->request->files['file']['error'][$key],
                        'size'     => $this->request->files['file']['size'][$key]
                    );
                }
            }

            foreach ($files as $file) {
                $file_validation = [
                    'status' => 'success'
                ];

                if (is_file($file['tmp_name'])) {
                    // Sanitize the filename
                    $filename = basename($this->translit(html_entity_decode($file['name'], ENT_QUOTES, 'UTF-8')));

                    // Validate the filename length
                    if ((utf8_strlen($filename) < 3) || (utf8_strlen($filename) > 255)) {
                        $file_validation = [
                            'status' => 'error',
                            'error'  => [
                                'code' => 'filename_length',
                                'info' => 'Имя файла должно быть от 3 до 255 символов'
                            ],
                            'notification' => [
                                'type' => 'error',
                                'info' => 'Имя файла должно быть от 3 до 255 символов'
                            ]
                        ];
                    }
                    
                    if(isset($this->request->post['filetype'])){
                        if($this->request->post['filetype'] == 'doc'){
                            // Allowed file extension types
                            $allowed = array(
                                'doc',
                                'docx'
                            );

                            // Allowed file mime types
                            $allowed_mimetype = array(
                                'application/msword',
                                'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
                            );

                            $filetype = 'word_doc';
                        } else {
                            // Allowed file extension types
                            $allowed = array(
                                'jpg',
                                'jpeg',
                                'gif',
                                'png'
                            );

                            // Allowed file mime types
                            $allowed_mimetype = array(
                                'image/jpeg',
                                'image/pjpeg',
                                'image/png',
                                'image/x-png',
                                'image/gif'
                            );

                            $filetype = 'image';
                        }
                    } else {
                        // Allowed file extension types
                        $allowed = array(
                            'jpg',
                            'jpeg',
                            'gif',
                            'png'
                        );

                        // Allowed file mime types
                        $allowed_mimetype = array(
                            'image/jpeg',
                            'image/pjpeg',
                            'image/png',
                            'image/x-png',
                            'image/gif'
                        );

                        $filetype = 'image';
                    }

                    $directory = $customer_dir . '/' . $file_purpose;

                    if (!in_array(utf8_strtolower(utf8_substr(strrchr($filename, '.'), 1)), $allowed)) {
                        $file_validation = [
                            'status' => 'error',
                            'error'  => [
                                'code'     => 'file_extension',
                                'info'     => 'Неправильное расширение файла',
                                'filename' => $filename
                            ],
                            'notification' => [
                                'type' => 'error',
                                'info' => 'Неправильное расширение файла ' . $filename . '. Допустимы следующие расширения файлов: ' . implode(', ', $allowed) . '.'
                            ]
                        ];
                    }

                    if (!in_array($file['type'], $allowed_mimetype)) {
                        $file_validation = [
                            'status' => 'error',
                            'error'  => [
                                'code'     => 'file_mimetype',
                                'info'     => 'Неправильный mime-тип файла',
                                'filename' => $filename
                            ],
                            'notification' => [
                                'type' => 'error',
                                'info' => 'Неправильный mime-тип файла ' . $filename . '. Допустимы следующие mime-типы файлов: ' . implode(', ', $allowed_mimetype) . '.'
                            ]
                        ];
                    }

                    // Return any upload error
                    if ($file['error'] != UPLOAD_ERR_OK) {
                        $file_validation = [
                            'status' => 'error',
                            'error'  => [
                                'code'     => 'upload',
                                'info'     => 'Ошибка загрузки файла',
                                'filename' => $filename
                            ],
                            'notification' => [
                                'type' => 'error',
                                'info' => 'Ошибка загрузки файла ' . $filename
                            ]
                        ];
                    }
                } else {
                    $file_validation = [
                        'status' => 'error',
                        'error'  => [
                            'code'     => 'error_upload',
                            'info'     => 'Ошибка загрузки файла',
                            'filename' => $filename
                        ],
                        'notification' => [
                            'type' => 'error',
                            'info' => 'Ошибка загрузки файла' . $filename
                        ]
                    ];
                }

                $full_filename = $directory . '/' . $filename;

                $filedata = $this->model_account_customer->getCustomerLevelFileByFullFilename($filename, $directory);

                if(!empty($filedata)){
                    $file_validation = [
                        'status'  => 'warning',
                        'warning' => [
                            'code'     => 'file_exists',
                            'info'     => 'Для данной формы этот файл уже загружен',
                            'filename' => $filename
                        ],
                        'notification' => [
                            'type' => 'warning',
                            'info' => 'Для данной формы файл ' . $filename . ' уже загружен'
                        ]
                    ];
                }

                if ($file_validation['status'] == 'success') {
                    move_uploaded_file($file['tmp_name'], $full_filename);

                    $customer_purpose_file_list = $this->model_account_customer->getCustomerLevelFileListByPurpose($this->customer->isLogged(), $file_purpose);

                    $customer_file_data = [
                        'customer_id'   => $this->customer->isLogged(),
                        'filename'      => $filename,
                        'filepath'      => $directory,
                        'type'          => $filetype,
                        'purpose'       => $file_purpose,
                        'sort_order'    => count($customer_purpose_file_list)
                    ];

                    $this->model_account_customer->addCustomerLevelFile($customer_file_data);

                    $file_validation = [
                        'status'   => 'success',
                        'success'  => [
                            'info'     => 'Файл успешно загружен',
                            'filename' => $filename
                        ]
                    ];
                } else {
                    $response_data['status'] = 'warning';
                }

                $processed_files[] = $file_validation;
            }
            
            $response_data['processed_files'] = $processed_files;
            
            echo json_encode($response_data);
        }
        
        public function sort(){
            $this->load->model('account/customer');
            
            $response_data = [
                'status' => 'success',
                'info'   => 'Not processed'
            ];
            
            if(isset($this->request->post['file_id'])){
                $file_id = (int)$this->request->post['file_id'];
            } else {
                $file_id = (bool)false;
            }
            
            if((bool)$file_id){
                $filedata = $this->model_account_customer->getCustomerLevelFileById($file_id);
                
                if(isset($filedata['purpose'])){
                    $purpose = (string)$filedata['purpose'];
                } else {
                    $purpose = '';
                }
                
                if(isset($filedata['sort_order'])){
                    $sort_order = (string)$filedata['sort_order'];
                } else {
                    $sort_order = 0;
                }
                
                $sort_order_data = [
                    'customer_id' => $this->customer->isLogged(),
                    'file_id'     => $file_id,
                    'purpose'     => $purpose,
                    'sort_order'  => $sort_order
                ];
                
                if(!empty($this->request->post['forward'])){
                    $closest_bigger = $this->model_account_customer->getCustomerLevelFileWithClosestBiggerSortOrder($sort_order_data);
                    
                    if(!empty($closest_bigger)){
                        $temp_sort_order = $closest_bigger['sort_order'];
                        
                        $property_filedata = [
                            'file_id'        => $closest_bigger['file_id'],
                            'property_name'  => 'sort_order',
                            'property_value' => $sort_order
                        ];
                        
                        $property_filedata_2 = [
                            'file_id'        => $file_id,
                            'property_name'  => 'sort_order',
                            'property_value' => $temp_sort_order
                        ];
                        
                        if($this->model_account_customer->updateCustomerLevelFilePropertyById($property_filedata) &&
                           $this->model_account_customer->updateCustomerLevelFilePropertyById($property_filedata_2)){
                            $response_data = [
                                'status' => 'success',
                                'info'   => 'Moved forward successfull'
                            ];
                        } else {
                            $response_data = [
                                'status' => 'error',
                                'info'   => 'Sort error(Update file property error)'
                            ];
                        }
                    } else {
                        $biggest_number = $this->model_account_customer->getCustomerLevelFileBiggestSortOrder($sort_order_data);
                        
                        $property_filedata = [
                            'file_id'        => $file_id,
                            'property_name'  => 'sort_order',
                            'property_value' => $biggest_number + 1
                        ];
                        
                        if($this->model_account_customer->updateCustomerLevelFilePropertyById($property_filedata)){
                            $response_data = [
                                'status' => 'success',
                                'info'   => 'Moved forward successfull'
                            ];
                        } else {
                            $response_data = [
                                'status' => 'error',
                                'info'   => 'Sort error(Update file property error)'
                            ];
                        }
                    }
                } else {
                    $closest_smaller = $this->model_account_customer->getCustomerLevelFileWithClosestSmallerSortOrder($sort_order_data);
                
                    if(!empty($closest_smaller)){
                        $temp_order = $closest_smaller;

                        $property_filedata = [
                            'file_id'        => $closest_smaller['file_id'],
                            'property_name'  => 'sort_order',
                            'property_value' => $filedata['sort_order']
                        ];

                        $property_filedata_2 = [
                            'file_id' => $filedata['file_id'],
                            'property_name' => 'sort_order',
                            'property_value' => $temp_order['sort_order']
                        ];

                        if($this->model_account_customer->updateCustomerLevelFilePropertyById($property_filedata_2) &&
                           $this->model_account_customer->updateCustomerLevelFilePropertyById($property_filedata)){
                            $response_data = [
                                'status' => 'success',
                                'info'   => 'Moved back'
                            ];
                        }

                    } else {
                        $response_data = [
                            'status' => 'success',
                            'info'   => 'This is the first item in the list'
                        ];
                    }
                }
                

                $response_data['postdata'] = $this->request->post;
            } else {
                $response_data = [
                    'status' => 'fail',
                    'info'   => 'There are no file ID'
                ];
            }
            
            echo json_encode($response_data);
        }
        
        public function filelist(){
            $response = [];
            
            $this->load->model('account/customer');
            
            $customer_id = $this->customer->isLogged();
            
            if(isset($this->request->post['purpose'])){
                $purpose = $this->request->post['purpose'];
            } else if(isset($this->request->post['file_id'])){
                $file_data = $this->model_account_customer->getCustomerLevelFileById($this->request->post['file_id']);

                if(!empty($file_data['purpose'])){
                    $purpose = $file_data['purpose'];
                } else {
                    $purpose = '';
                }
            } else {
                $purpose = "";
            }
            
            $customer_file_list = $this->model_account_customer->getCustomerLevelFileListByPurpose($customer_id, $purpose);
            
            $response['filelist'] = [];
            
            foreach($customer_file_list as $customer_file){
                $response['filelist'][] = [
                    'file_id'       => $customer_file['file_id'],
                    'filename'      => $customer_file['filename'],
                    'filepath'      => $customer_file['filepath'],
                    'fullname'      => $customer_file['filepath'] . '/' . $customer_file['filename'],
                    'filetype'      => $customer_file['type'],
                    'purpose'       => $customer_file['purpose'],
                    'sort_order'    => $customer_file['sort_order'],
                    'date_added'    => $customer_file['date_added']
                    
                ];
            }
            
            //var_dump($response); 
            
            echo json_encode($response);
        }
        
        public function getfile(){
            $response_data = [
                'status' => 'success'
            ];
            
            if(!empty($this->request->post['file_id'])){
                $file_id = $this->request->post['file_id'];
                
                $this->load->model('account/customer');
                
                $filedata = $this->model_account_customer->getCustomerLevelFileById($file_id);
                
                //var_dump($filedata);
                
                $response_data['filedata'] = [
                    'file_id'    => $filedata['file_id'],
                    'filename'   => $filedata['filename'],
                    'filepath'   => $filedata['filepath'],
                    'fullname'   => $filedata['filepath'] . '/' .$filedata['filename'],
                    'sort_order' => $filedata['sort_order']
                ];
            } else {
                $response_data = [
                    'status' => 'error',
                    'info'   => 'There are no file ID in request'
                ];
            }
            
            echo json_encode($response_data);
        }
        
        public function changeCustomerFileSortOrder($file_id, $sort_order){
            $response_status = [
                'status' => 'info',
                'info' => 'Выберите файл'
            ];
            
            $this->load->model('account/customer');
            
            $file_id = $this->request->post['file_id'];
            
            $filedata = [
                'file_id'        => $file_id,
                'property_name'  => 'sort_order'
            ];
            
            if($this->model_account_customer->updateCustomerLevelFilePropertyById($filedata)){
                $response_status = [
                    'status' => 'success',
                    'info'   => 'Порядок сортировки успешно обновлен'
                ];
            } else {
                $response_status = [
                    'status' => 'fail',
                    'info'   => 'Порядок сортировки не обновлен!!!'
                ];
            }
            
            echo json_encode($status_data);
        }
        
        public function uploadLevel1File(){
            $response_status = [
                'status' => 'info',
                'info' => 'Выберите файл'
            ];
            
            if (is_uploaded_file($this->request->files['attached_file']['tmp_name'])) {
                $upload_status = true;
                
                $file = $this->request->files['attached_file'];
                
                $uploads_directory = DIR_UPLOAD;
                
                // Check file size
                if ($file["size"] > 5000000) {
                    $response_status = [
                        'status'   => 'fail',
                        'info'     => 'Файл слишком большой!!!(допустимый размер 5Мб)',
                        'filename' => $file['name']
                    ];
                    
                    $upload_status = false;
                }
                
                if($upload_status){
                    $c_id = $this->customer->isLogged();
                    $customer_dir = $upload_directory . "/" . $_id;
                    
                    if(!is_dir($upload_directory)){
                        mkdir($customer_directory);
                    }
                        
                    $uploads_customer_directory = $customer_directory . "/" . "uploads";
                    
                    if(!is_dir($uploads_customer_directory)){
                        mkdir($uploads_customer_directory);
                    }
                    
                    $full_file_name = $uploads_customer_directory . "/" . $file['name'];
                    
                    if (move_uploaded_file($file['tmp_name'], $full_file_name)) {
                        $file_data = [
                            'customer_id' => $c_id,
                            'filename'    => $file['name'],
                            'purpose'     => 'level1__files'
                        ];
                    
                        if($this->model_account_customer->addCustomerFile($file_data)){
                            $response_status = [
                                'result' => 'success',
                                'info'   => 'Файл загружен успешно'
                            ];
                        } else {
                            $response_status = [
                                'result' => 'fail',
                                'info'   => 'Ошибка записи базы данных!!!'
                            ];
                        };
                    } else {
                        $response_status = [
                            'result' => 'fail',
                            'info'   => 'Ошибка сохранения файла!!!'
                        ];
                    }
                }
                
                if($upload_status){
                    $c_id = $this->customer->isLogged();
                    $customer_dir = $upload_directory . "/" . $_id;
                    
                    if(!is_dir($upload_directory)){
                        mkdir($customer_directory);
                    }
                        
                    $uploads_customer_directory = $customer_directory . "/" . "uploads";
                    
                    if(!is_dir($uploads_customer_directory)){
                        mkdir($uploads_customer_directory);
                    }
                    
                    $full_file_name = $uploads_customer_directory . "/" . $file['name'];
                    
                    if (move_uploaded_file($file['tmp_name'], $full_file_name)) {
                        $file_data = [
                            'customer_id' => $c_id,
                            'filename'    => $file['name'],
                            'purpose'     => 'level1__files'
                        ];
                    
                        if($this->model_account_customer->addCustomerFile($file_data)){
                            $response_status = [
                                'result' => 'success',
                                'info'   => 'Файл загружен успешно'
                            ];
                        } else {
                            $response_status = [
                                'result' => 'fail',
                                'info'   => 'Ошибка записи базы данных!!!'
                            ];
                        };
                    } else {
                        $response_status = [
                            'result' => 'fail',
                            'info'   => 'Ошибка сохранения файла!!!'
                        ];
                    }
                }
            }
            
            echo json_encode($response_status);
        }     
        
        public function deleteFile(){
            $this->load->model('account/customer');
            
            $response_data = [
                'result' => 'info',
                'info'   => 'Файл отстутствует'
            ];
            
            if(isset($this->request->post['file_id'])) {
                $file_id = $this->request->post['file_id'];

                $filedata = $this->model_account_customer->getCustomerLevelFileById($file_id);

                $full_filename = CUSTOMER_UPLOAD . '/' . $filedata['filepath'] . '/' . $filedata['filename'];
                
                if(is_file($full_filename)){
                    $is_file_in_use = $this->model_account_customer->getCustomerLevelFileByPathAndName($filepath, $filename);
                    
                    if(empty($is_file_in_use)){
                        unlink($full_filename);
                    }
                    
                    if($this->model_account_customer->deleteCustomerLevelFileById($file_id)){
                        $response_data = [
                            'status' => 'success',
                            'info'   => 'Файл удален успешно'
                        ];
                    } else {
                        $response_data = [
                            'status' => 'fail',
                            'info'   => 'Ощибка удаления файла из БД!!!'
                        ];
                    };
                } else {
                    $response_data = [
                        'status' => 'info',
                        'info'   => 'Файл не существует'
                    ];
                }
                
                $customer_file_to_delete = $this->model_account_customer->getCustomerLevelFileById($file_id);
                
                if ($customer_file_to_delete){
                    if($this->model_account_customer->deleteCustomerLevelFileById($file_id)){
                        $full_filename = $customer_file_to_delete['filepath'] . '/' . $customer_file_to_delete['filename'];
                        
                        if(is_file($full_filename)){
                            unlink($full_filename);
                        }
                        
                        $response_data = [
                            'status' => 'success',
                            'info'   => 'Файл успешно удален'
                        ];
                    } else {
                        $response_data = [
                            'status' => 'fail',
                            'info'   => 'Ошибка удаления файла'
                        ];
                    }
                } else {
                    $response_data = [
                        'status' => 'fail',
                        'info'   => 'Ошибка удаления файла'
                    ];
                };
            }
            
            echo json_encode($response_data);
        }
        
        public function saveProfileData(){
            $response = [];
            
            $this->load->language('account/account');
            $this->load->model('account/customer');
            
            $profile_data = [
                'customer_id' => $this->customer->isLogged(),
                'city'        => isset($this->request->post['city']) ? $this->request->post['city'] : '',
                'study_place' => isset($this->request->post['study_place']) ? $this->request->post['study_place'] : '',
                'telephone'   => isset($this->request->post['telephone']) ? $this->request->post['telephone'] : ''
            ];
            
            if($this->model_account_customer->saveProfileData($profile_data)){
                $response = [
                    'result' => 'success',
                    'info'   => 'Профиль сохранен успешно'
                ];
            } else {
                $response = [
                    'result' => 'fail',
                    'info'   => 'Профиль не сохранен!!!'
                ];
            };
            
            echo json_encode($response);
        }
        
        public function saveContestantLevel2Data(){
            $this->load->model('account/customer');
            
            $post_data = $this->request->post;
            
            $data['level_2'] = [];
            
            $data['level_2']['film_director'] = [];
            if(isset($post_data['level_2']['film_director'])){
                if(!empty($post_data['level_2']['film_director'])){
                    $data['level_2']['film_director'] = $post_data['level_2']['film_director'];
                    $data['level_2']['film_director']['customer_id'] = $this->customer->isLogged();
                    
                    $this->model_account_customer->saveLevel2FilmDirectorData($data['level_2']['film_director']);
                }
            }
            
            $data['level_2']['dramaturgy_screenwriter'] = [];
            if(isset($post_data['level_2']['dramaturgy_screenwriter'])){
                if(!empty($post_data['level_2']['dramaturgy_screenwriter'])){
                    $data['level_2']['dramaturgy_screenwriter'] = $post_data['level_2']['dramaturgy_screenwriter'];
                    $data['level_2']['dramaturgy_screenwriter']['customer_id'] = $this->customer->isLogged();
                    
                    $this->model_account_customer->saveLevel2DramaturgyScreenwriterData($data['level_2']['dramaturgy_screenwriter']);
                }
            }
            
            $data['level_2']['acting_skills'] = [];
            if(isset($post_data['level_2']['acting_skills'])){
                if(!empty($post_data['level_2']['acting_skills'])){
                    $data['level_2']['acting_skills'] = $post_data['level_2']['acting_skills'];
                    $data['level_2']['acting_skills']['customer_id'] = $this->customer->isLogged();
                    
                    $this->model_account_customer->saveLevel2ActingSkillsData($data['level_2']['acting_skills']);
                }
            }
            
            $data['level_2']['production_in_filmmaking'] = [];
            if(isset($post_data['level_2']['production_in_filmmaking'])){
                if(!empty($post_data['level_2']['production_in_filmmaking'])){
                    $data['level_2']['production_in_filmmaking'] = $post_data['level_2']['production_in_filmmaking'];
                    $data['level_2']['production_in_filmmaking']['customer_id'] = $this->customer->isLogged();
                    
                    $this->model_account_customer->saveLevel2ProductionInFilmmakingData($data['level_2']['production_in_filmmaking']);
                }
            }
            
            $data['level_2']['soundproducer'] = [];
            if(isset($post_data['level_2']['soundproducer'])){
                if(!empty($post_data['level_2']['soundproducer'])){
                    $data['level_2']['soundproducer'] = $post_data['level_2']['soundproducer'];
                    $data['level_2']['soundproducer']['customer_id'] = $this->customer->isLogged();
                    
                    $this->model_account_customer->saveLevel2SoundproducerData($data['level_2']['soundproducer']);
                }
            }
            
            $this->index();
        }
        
        protected function translit($text) {
            $rus = array("а","А","б","Б","в","В","г","Г","д","Д","е","Е","ё","Ё","є","Є","ж", "Ж",  "з","З","и","И","і","І","ї","Ї","й","Й","к","К","л","Л","м","М","н","Н","о","О","п","П","р","Р", "с","С","т","Т","у","У","ф","Ф","х","Х","ц","Ц","ч", "Ч", "ш", "Ш", "щ",  "Щ", "ъ","Ъ", "ы","Ы","ь","Ь","э","Э","ю", "Ю", "я","Я",'/',' ');
            $eng =array("a","A","b","B","v","V","g","G","d","D","e","E","e","E","e","E", "zh","ZH","z","Z","i","I","i","I","yi","YI","j","J","k","K","l","L","m","M","n","N","o","O", "p","P","r","R","s","S","t","T","u","U","f","F","h","H","c","C","ch","CH", "sh","SH","sch","SCH","", "", "y","Y","","","e","E","ju","JU","ja","JA",'','');
            $text = strtolower(str_replace($rus,$eng,$text));
                
            $disallow_symbols = array(
                ' ' => '-', '\\' => '-', '/' => '-', ':' => '-', '*' => '',
                '?' => '', ',' => '', '"' => '', '\'' => '', '<' => '', '>' => '', '|' => ''
            );
            
            return trim(strip_tags(str_replace(array_keys($disallow_symbols), array_values($disallow_symbols), trim(html_entity_decode($text, ENT_QUOTES, 'UTF-8')))), '-');
	}
}
