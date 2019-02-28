<?php
class ControllerAccountCurator extends Controller {
	public function index() {
	    $this->getContestantList();
	}
        
        public function getContestantList(){
            $this->load->model('account/customer');
            
            $filter_data = [];
            
            // Sorting filter
            if(isset($this->request->get['sort_order'])){
                $sort_order = (string)$this->request->get['sort_order'];
            } else {
                $sort_order = 'total_score';
            }
            
            if(isset($this->request->get['sort_order_order'])){
                $sort_order_order = (string)$this->request->get['sort_order_order'];
            } else {
                $sort_order_order = 'DESC';
            }
            
            $filter_data['sort_order'] = $sort_order;
            $filter_data['sort_order_order'] = $sort_order_order;
            
            $string_filter_data = 'sort_order=' . (string)$sort_order . '&sort_order_order=' . (string)$sort_order_order;
            
            if(isset($this->request->get['page'])){
                $page = (int)$this->request->get['page'];
            } else {
                $page = 1;
            }
            
            $page_limit = 10;
            
            if(isset($this->request->get['page'])){
                $filter_data['start'] = (int)$this->request->get['page'];
            }
            
            $filter_data['limit'] = $page_limit;
            
            $contestant_total = $this->model_account_customer->getTotalCustomers();
            
            $pagination = new Pagination();
            $pagination->total = $contestant_total;
            $pagination->page = $page;
            $pagination->limit = $page_limit;
            $pagination->url = $this->url->link('account/curator', $string_filter_data . '&page={page}', true);
            
            $data['pagination'] = $pagination->render();
            
            $level_score_mapping = [
                'level_1' => [
                    'question_4_score',
                    'question_5_score',
                    'question_6_score'
                ]
            ];
            
            // Level 2 score data >>
            $level_2_contestant_score_data = $this->model_account_customer->getAllContestantScoreListByLevel('level_2');
            $level_2_max_score_data = [];
            
            foreach($level_2_contestant_score_data as $item){
                if(!isset($level_2_max_score_data[$item['contestant_id']])){
                    $level_2_max_score_data[$item['contestant_id']] = 0;
                }
                
                if($level_2_max_score_data[$item['contestant_id']] < $item['score_value']){
                    $level_2_max_score_data[$item['contestant_id']] = $item['score_value'];
                }
            }
            // << Level 2 score data
            
            // Psychologist score data >>
            $psychologist_contestant_score_data = $this->model_account_customer->getAllContestantScoreListByLevel('psychologist');
            $psychologist_score_data = [];
            
            foreach($psychologist_contestant_score_data as $item){
                $psychologist_score_data[$item['contestant_id']] = $item['score_value'];
            }
            // << Psychologist score data 
            
            // Level 2 selected speciality data >>
            $questions_speciality_mapping = [
                'acting_skills'            => 'А',
                'dramaturgy_screenwriter'  => 'Д',
                'film_director'            => 'К',
                'production_in_filmmaking' => 'П',
                'sound_producer'           => 'З'
            ];
            
            $files_speciality_mapping = [
                'level_2_operator'                        => 'О',
                'level_2_dramaturgy_screenwriter'         => 'Д',
                'level_2_production_designer'             => 'Х',
                'level_2_production_designer_image_story' => 'Х',
                'level_2_film_director'                   => 'К'
            ];
            
            $customer_selected_speciality_data = [];
            
            // data
            $soundproducer_data = $this->model_account_customer->getLevel2AllSoundproducerData();
            foreach($soundproducer_data as $data_item){
                if(!isset($customer_selected_speciality_data[$data_item['customer_id']])){
                    $customer_selected_speciality_data[$data_item['customer_id']] = [];
                }
                
                $customer_selected_speciality_data[$data_item['customer_id']][] = $questions_speciality_mapping['sound_producer'];
            }
            
            $production_in_filmmaking_data = $this->model_account_customer->getLevel2AllProductionInFilmmakingData();
            foreach($production_in_filmmaking_data as $data_item){
                if(!isset($customer_selected_speciality_data[$data_item['customer_id']])){
                    $customer_selected_speciality_data[$data_item['customer_id']] = [];
                }
                
                $customer_selected_speciality_data[$data_item['customer_id']][] = $questions_speciality_mapping['production_in_filmmaking'];
            }
            
            $acting_skills_data = $this->model_account_customer->getLevel2AllActingSkillsData();
            foreach($acting_skills_data as $data_item){
                if(!isset($customer_selected_speciality_data[$data_item['customer_id']])){
                    $customer_selected_speciality_data[$data_item['customer_id']] = [];
                }
                
                $customer_selected_speciality_data[$data_item['customer_id']][] = $questions_speciality_mapping['acting_skills'];
            }
            
            $dramaturgy_screenwriter_data = $this->model_account_customer->getLevel2AllDramaturgyScreenwriterData();
            foreach($dramaturgy_screenwriter_data as $data_item){
                if(!isset($customer_selected_speciality_data[$data_item['customer_id']])){
                    $customer_selected_speciality_data[$data_item['customer_id']] = [];
                }
                
                $customer_selected_speciality_data[$data_item['customer_id']][] = $questions_speciality_mapping['dramaturgy_screenwriter'];
            }
            
            $film_director_data = $this->model_account_customer->getLevel2AllFilmDirectorData();
            foreach($film_director_data as $data_item){
                if(!isset($customer_selected_speciality_data[$data_item['customer_id']])){
                    $customer_selected_speciality_data[$data_item['customer_id']] = [];
                }
                
                $customer_selected_speciality_data[$data_item['customer_id']][] = $questions_speciality_mapping['film_director'];
            }
            
            // file
            $questions_speciality_file_data = $this->model_account_customer->getAllCustomerLevelFileList();
            
            foreach($questions_speciality_file_data as $contestant_file_data){
                if(!isset($customer_selected_speciality_data[$contestant_file_data['customer_id']])){
                    $customer_selected_speciality_data[$contestant_file_data['customer_id']] = [];
                }
                
                if(!in_array($files_speciality_mapping[$contestant_file_data['purpose']], $customer_selected_speciality_data[$contestant_file_data['customer_id']])){
                    $customer_selected_speciality_data[$contestant_file_data['customer_id']][] = $files_speciality_mapping[$contestant_file_data['purpose']];
                }
            }
            // << Level 2 selected speciality data
            
            // Level 2 checker >>
            $level_2_checking_data = $this->model_account_customer->getAllCheckingDataByLevel('level_2');
            $level_2_checking_data_array = [];
                    
            foreach($level_2_checking_data as $data_item){
                $level_2_checking_data_array[$data_item['contestant_id']] = $data_item['checking_fullname'];
            }
            // << Level 2 checker 
            
            // Sort links
            $data['column_id_sort_asc']  = $this->url->link('account/curator', 'sort_order=id&sort_order_order=ASC');
            $data['column_id_sort_desc'] = $this->url->link('account/curator', 'sort_order=id&sort_order_order=DESC');
            $data['column_date_added_sort_asc']  = $this->url->link('account/curator', 'sort_order=date_added&sort_order_order=ASC');
            $data['column_date_added_sort_desc'] = $this->url->link('account/curator', 'sort_order=date_added&sort_order_order=DESC');
            $data['column_contestant_fio_sort_asc']  = $this->url->link('account/curator', 'sort_order=contestant_fio&sort_order_order=ASC');
            $data['column_contestant_fio_sort_desc'] = $this->url->link('account/curator', 'sort_order=contestant_fio&sort_order_order=DESC');
            $data['column_total_score_sort_asc']  = $this->url->link('account/curator', 'sort_order=total_score&sort_order_order=ASC');
            $data['column_total_score_sort_desc'] = $this->url->link('account/curator', 'sort_order=total_score&sort_order_order=DESC');
            
            $customers = $this->model_account_customer->getContestantList($filter_data);
            
            $contestant = [];
            
            foreach($customers as $customer){
                $customer_score = [];
                
                $customer_data = $this->model_account_customer->getCustomerDataById($customer['customer_id']);

                foreach($level_score_mapping as $level => $score_map){
                    $customer_score[$level] = [];
                    
                    $customer_score_data = $this->model_account_customer->getContestantScoreById($customer['customer_id'], $level);
                    
                    foreach($score_map as $score_name){
                        $customer_score[$score_name] = isset($customer_score_data[$score_name]) ? $customer_score_data[$score_name] : 0;
                    }
                }
                
                $question_4_score = !empty($customer_score['question_4_score']) ? (int)$customer_score['question_4_score'] : 0;
                $question_5_score = !empty($customer_score['question_5_score']) ? (int)$customer_score['question_5_score'] : 0;
                $question_6_score = !empty($customer_score['question_6_score']) ? (int)$customer_score['question_6_score'] : 0;
                
                $total_score_level_1 = $customer_score['question_4_score'] + $customer_score['question_5_score'] + $customer_score['question_6_score'];
                
                $level_2_score = !empty($level_2_max_score_data[$customer['customer_id']]) ? $level_2_max_score_data[$customer['customer_id']] : '';
                
                $psychologist_score = !empty($psychologist_score_data[$customer['customer_id']]) ? $psychologist_score_data[$customer['customer_id']] : 0;
                
                $total_all = (int)$total_score_level_1 + (int)$level_2_score + (int)$psychologist_score;
                
                $contestant[$customer['customer_id']] = [
                    'contestant_id'     => $customer['customer_id'],
                    'registration_date' => $customer['date_added'],
                    'fio'               => isset($customer_data['full_name']) ? $customer_data['full_name'] : '',
                    'email'             => isset($customer_data['email']) ? $customer_data['email'] : $customer['email'],
                    'telephone'         => isset($customer_data['telephone']) ? $customer_data['telephone'] : '',
                    'birthdate'         => isset($customer_data['birth_date']) ? $customer_data['birth_date'] : '',
                    'speciality'        => isset($customer_data['profession']) ? $customer_data['profession'] : '',
                    'school'            => isset($customer_data['study_place']) ? $customer_data['study_place'] : '',
                    'question_4_score'  => !empty($customer_score['question_4_score']) ? $customer_score['question_4_score'] : '',
                    'question_5_score'  => !empty($customer_score['question_5_score']) ? $customer_score['question_5_score'] : '',
                    'question_6_score'  => !empty($customer_score['question_6_score']) ? $customer_score['question_6_score'] : '',
                    
                    'total_score_level_1' => $total_score_level_1,
                    'level_2_allowance' => !empty($customer_score_data['level_2_allowance']) ? true : false,
                    'level_1_checking'  => isset($customer_score_data['checking']) ? $customer_score_data['checking'] : '',
                    'level_2_score'     => $level_2_score,
                    'level_2_selected_speciality' => !empty($customer_selected_speciality_data[$customer['customer_id']]) ? implode('', $customer_selected_speciality_data[$customer['customer_id']]) : '',
                    'level_2_checking_fullname'   => !empty($level_2_checking_data_array[$customer['customer_id']]) ? $level_2_checking_data_array[$customer['customer_id']] : '',
                    
                    'psychologist_score' => $psychologist_score,
                    'all_total_score'    => $total_all,
                    'edit'               => $this->url->link('account/curator/level1', 'contestant_id=' . $customer['customer_id'] . '&page=' . $page . '&' . $string_filter_data, true)
                ];
                
                //
                $resdata = $this->model_account_customer->getContestantScoreById($customer['customer_id'], 'level_1');
                
                if(empty($resdata)){
                    //$this->model_account_customer->addAllNeccessaryData($customer['customer_id']);
                }
            }   
            
            $data['contestants'] = $contestant;
            
            $data['logout'] = $this->url->link('account/logout', true);
            
            // Clear all
            /*
            $data['clearAllAllowance'] = $this->url->link('account/curator', true);
            
            if(isset($this->request->post['action'])){
                if($this->request->post['action'] == 'clearAllAllowance'){
                    //$this->model_account_customer->clearAllAllowance();
                }
            }
            */
            //
            
            // Send notification to allowed
            /*
            $data['submit_notification_to_allowed'] = $this->url->link('account/curator', true);
            
            if(isset($this->request->post['action'])){
                if($this->request->post['action'] == 'submitNotificationToAllowed'){
                    // $this->sendNotificationToAllowed();
                }
            }
            */
            
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            $this->response->setOutput($this->load->view('account/contestant_list', $data));
        }
        
        public function sendNotificationToAllowed(){
            $this->load->model('account/customer');
            
            $allowed_list = $this->model_account_customer->getAllowedToNextLevelList("level_1", "level_2_allowance");
            
            foreach($allowed_list as $allowed_contestant){
                $contestant = $this->model_account_customer->getCustomer((int)$allowed_contestant['contestant_id']);
                
                $email = trim((string)$contestant['email']);
                
                $this->sendEmailNotification($email);
            }
        }
        
        public function sendEmailNotification($email){
            $attachment = 'catalog/view/theme/lifetravel/image/programma.jpg';
            
            $message  = 'Добрый день! 
            По итогам оценки анкет на участие в программе «Путевка в жизнь» 
            Вы прошли во второй этап проекта. 
            Поздравляем Вас!

            Задания по второму этапу будут выложены после обучающей сессии. 
            Рады будем видеть Вас 31 января в Суздале  
            на обучающей сессии  http://iffw.ru/#teaching-session.

            По вопросам организации трансфера на обучающую сессию, обращайтесь к директору (завучу) Вашей школы или в местный департамент образования.
            Регистрация участников обучающей сессии состоится в ГТК «Суздаль»
            31.01.2019 с 09:00 до 10:00.
            Программа сессии в прикрепленном файле.
            Желаем Вам удачи!';

            $mail_html  = '<h2>Добрый день!</h2>';
            $mail_html .= '<p>По итогам оценки анкет на участие в программе "Путевка в жизнь"';
            $mail_html .= 'Вы прошли во второй этап проекта.</p>';
            $mail_html .= '<h3>Поздравляем Вас!</h3><br /><br />';
            $mail_html .= '<p>Задания по второму этапу будут выложены после обучающей сессии.</p>';
            $mail_html .= '<p>Рады будем видеть Вас 31 января в Суздале  
            на обучающей сессии <a style="color: magenta;" href="http://iffw.ru/#teaching-session"></a>.</p><br /><br />';
            $mail_html .= '<p>По вопросам организации трансфера на обучающую сессию, обращайтесь к директору (завучу) Вашей школы или в местный департамент образования.</p>';
            $mail_html .= '<p>Регистрация участников обучающей сессии состоится в ГТК «Суздаль»</p>';
            $mail_html .= '<p style="font-size: 20px;font-style:italic;font-weight:600;">31.01.2019 с 09:00 до 10:00.</p>';
            $mail_html .= '<p>Программа сессии в прикрепленном файле.</p>';
            $mail_html .= '<p>Желаем Вам удачи!</p>';
            
            $mail = new Mail();
            $mail->protocol = $this->config->get('config_mail_protocol');
            $mail->parameter = $this->config->get('config_mail_parameter');
            $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
            $mail->smtp_username = $this->config->get('config_mail_smtp_username');
            $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
            $mail->smtp_port = $this->config->get('config_mail_smtp_port');
            $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

            $mail->setTo($email);
            $mail->setFrom($this->config->get('config_email'));
            $mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
            $mail->setSubject('Программа «Путевка в жизнь»');
            $mail->setText('');
            $mail->setHtml($mail_html);
            $mail->addAttachment($attachment);
            $mail->send();
        }
        
        public function save(){
            // Save processing
            if(isset($this->request->post['contestant_id'])){
                $contestant_id = $this->request->post['contestant_id'];
                
                if(isset($this->request->post['checking_fio'])){
                    $checking_fio = $this->request->post['checking_fio'];
                } else {
                    $checking_fio = '';
                }
                
                $data['checking_fio'] = $checking_fio;
                
                if(isset($this->request->post['fio'])){
                    $fio = $this->request->post['fio'];
                } else {
                    $fio = '';
                }
                
                $data['fio'] = $fio;
                
                if(isset($this->request->post['telephone'])){
                    $telephone = $this->request->post['telephone'];
                } else {
                    $telephone = '';
                }
                
                $data['telephone'] = $telephone;
                
                if(isset($this->request->post['email'])){
                    $email = $this->request->post['email'];
                } else {
                    $email = '';
                }
                
                $data['email'] = $email;
                
                if(isset($this->request->post['city'])){
                    $city = $this->request->post['city'];
                } else {
                    $city = '';
                }
                
                $data['city'] = $city;
                
                if(isset($this->request->post['study_place'])){
                    $study_place = $this->request->post['study_place'];
                } else {
                    $study_place = '';
                }
                
                $data['study_place'] = $telephone;
                
                if(isset($this->request->post['teacher'])){
                    $teacher = [];
                    
                    if(isset($this->request->post['teacher']['fio'])){
                        $teacher['fio'] = $this->request->post['teacher']['fio'];
                    } else {
                        $teacher['fio'] = '';
                    }
                    
                    if(isset($this->request->post['teacher']['telephone'])){
                        $teacher['telephone'] = $this->request->post['teacher']['telephone'];
                    } else {
                        $teacher['telephone'] = '';
                    }
                    
                    if(isset($this->request->post['teacher']['email'])){
                        $teacher['email'] = $this->request->post['teacher']['email'];
                    } else {
                        $teacher['email'] = '';
                    }
                } else {
                    $teacher = [
                        'fio'       => '',
                        'telephone' => '',
                        'email'     => ''
                    ];
                }
                
                $data['teacher'] = $teacher;
                
                if(isset($this->request->post['question'])){
                    $question = [];
                    
                    if(isset($this->request->post['question']['level_1'])){
                        $question['level_1'] = [];
                        
                        if(isset($this->request->post['question']['level_1']['favorite_film'])){
                            $question['level_1']['favorite_film'] = $this->request->post['question']['level_1']['favorite_film'];
                        } else {
                            $question['level_1']['favorite_film'] = '';
                        }
                        
                        if(isset($this->request->post['question']['level_1']['film_influation'])){
                            $question['level_1']['film_influation'] = $this->request->post['question']['level_1']['film_influation'];
                        } else {
                            $question['level_1']['film_influation'] = '';
                        }
                        
                        if(isset($this->request->post['question']['level_1']['speciality'])){
                            $question['level_1']['speciality'] = $this->request->post['question']['level_1']['speciality'];
                        } else {
                            $question['level_1']['speciality'] = '';
                        }
                        
                        if(isset($this->request->post['question']['level_1']['speciality_opportunities'])){
                            $question['level_1']['speciality_opportunities'] = $this->request->post['question']['level_1']['speciality_opportunities'];
                        } else {
                            $question['level_1']['speciality_opportunities'] = '';
                        }
                        
                        if(isset($this->request->post['question']['level_1']['perspective_reasons'])){
                            $question['level_1']['perspective_reasons'] = $this->request->post['question']['level_1']['perspective_reasons'];
                        } else {
                            $question['level_1']['perspective_reasons'] = '';
                        }
                        
                        if(isset($this->request->post['question']['level_1']['esse'])){
                            $question['level_1']['esse'] = $this->request->post['question']['level_1']['esse'];
                        } else {
                            $question['level_1']['esse'] = '';
                        }
                    } else {
                        $question['level_1'] = [
                            'favorite_film'            => '',
                            'film_influation'          => '',
                            'speciality'               => '',
                            'speciality_opportunities' => '',
                            'perspective_reasons'      => '',
                            'esse'                     => ''
                        ];
                    }
                } else {
                    $question = [
                        'level_1' => [
                            'favorite_film'            => '',
                            'film_influation'          => '',
                            'speciality'               => '',
                            'speciality_opportunities' => '',
                            'perspective_reasons'      => '',
                            'esse'                     => ''
                        ]
                    ];
                }
                
                $data['question'] = $question;
                
                if(isset($this->request->post['score'])){
                    $score = [];
                    
                    if(isset($this->request->post['score']['level_1'])){
                        $score['level_1'] = [];
                        
                        if(isset($this->request->post['score']['level_1']['question_4_score'])){
                            $score['level_1']['question_4_score'] = $this->request->post['score']['level_1']['question_4_score'];
                        } else {
                            $score['level_1']['question_4_score'] = '';
                        }
                        
                        if(isset($this->request->post['score']['level_1']['question_5_score'])){
                            $score['level_1']['question_5_score'] = $this->request->post['score']['level_1']['question_5_score'];
                        } else {
                            $score['level_1']['question_5_score'] = '';
                        }
                        
                        if(isset($this->request->post['score']['level_1']['question_6_score'])){
                            $score['level_1']['question_6_score'] = $this->request->post['score']['level_1']['question_6_score'];
                        } else {
                            $score['level_1']['question_6_score'] = '';
                        }
                    } else {
                        $score['level_1'] = [
                            'question_4_score' => '',
                            'question_5_score' => '',
                            'question_6_score' => ''
                        ];
                    }
                } else {
                    $score = [
                        'level_1' => [
                            'question_4_score' => '',
                            'question_5_score' => '',
                            'question_6_score' => ''
                        ]
                    ];
                }
                
                $data['score'] = $score;
                
                if(!empty($this->request->post['score']['level_1']['level_2_allowance'])){
                    $level_2_allowance = true;
                } else {
                    $level_2_allowance = false;
                }
                
                $data['level_2_allowance'] = $level_2_allowance;
                
                $this->load->model('account/customer');
            
                $level_score_mapping = [
                    'level_1' => [
                        'question_4_score',
                        'question_5_score',
                        'question_6_score'
                    ]
                ];
                
                foreach($level_score_mapping as $level_key => $level_score){
                    $score_data[$level_key] = [
                        'contestant_id' => $contestant_id,
                        'curator_id'    => $this->customer->isLogged(),
                        'checking'      => $checking_fio,
                        'score'         => $score[$level_key],
                        'level_2_allowance' => $level_2_allowance
                    ];
                    
                    $this->model_account_customer->saveContestantScore($score_data, $level_key);
                }
                
                $data['score'] = $score_data;
                
                // Contestant data
                $contestant_data = [
                    'customer_id' => $contestant_id,
                    'full_name' => $fio,
                    'email' => $email,
                    'birth_date' => '',
                    'study_place' => $study_place,
                    'city' => $city,
                    'telephone' => $telephone,
                    'teacher_name' => $teacher['fio'],
                    'teacher_phone' => $teacher['telephone'],
                    'teacher_email' => $teacher['email'],
                    'favorite_film' => $question['level_1']['favorite_film'],
                    'favorite_film_influence' => $question['level_1']['film_influation'],
                    'profession' => $question['level_1']['speciality'],
                    'profession_opportunities' => $question['level_1']['speciality_opportunities']                    
                ];
                
                $this->model_account_customer->saveCustomerDataById($contestant_data);
                
                // Contestant answers to questions
                $customer_level_1_data = [
                    'customer_id'             => $contestant_id,
                    'speciality_perspective'  => $question['level_1']['perspective_reasons'],
                    'esse'                    => $question['level_1']['esse'],
                    'film_information'        => $question['level_1']['favorite_film']
                ];
                
                $this->model_account_customer->saveCustomerLevel1Data($customer_level_1_data);
            }
            
            $this->level1();
        }
        
        public function level1(){
            $this->load->model('account/customer');
            
            if(isset($this->request->get['contestant_id'])){
                $contestant_id = (int)$this->request->get['contestant_id'];
            }
            
            $filter_string_data = '';
            
            if(isset($this->request->get['page'])){
                $page = (int)$this->request->get['page'];
            } else {
                $page = 0;
            }
            
            $filter_string_data .= '&page=' . $page;
            
            if(isset($this->request->get['sort_order'])){
                $filter_string_data .= '&sort_order=' . $this->request->get['sort_order'];
            }
            
            if(isset($this->request->get['sort_order_order'])){
                $filter_string_data .= '&sort_order_order=' . $this->request->get['sort_order_order'];
            }
            
            $data['save_contestant_data'] = $this->url->link('account/curator/save', 'contestant_id=' . $contestant_id . $filter_string_data, true);
            $data['back_to_list'] = $this->url->link('account/curator', $filter_string_data . "#contestant-" . $contestant_id, true);
            $data['logout'] = $this->url->link('account/logout', true);
            
            $contestant_data = $this->model_account_customer->getCustomerDataById($contestant_id);
            
            $contestant_question_level_1_data = $this->model_account_customer->getCustomerLevel1Data($contestant_id);
            
            $question['level_1'] = [
                'favorite_film'            => isset($contestant_data['favorite_film']) ? $contestant_data['favorite_film'] : '',
                'film_influation'          => isset($contestant_data['favorite_film_influence']) ? $contestant_data['favorite_film_influence'] : '',
                'speciality'               => isset($contestant_data['profession']) ? $contestant_data['profession'] : '',
                'speciality_opportunities' => isset($contestant_data['profession_opportunities']) ? $contestant_data['profession_opportunities'] : '',
                'perspective_reasons'      => isset($contestant_question_level_1_data['speciality_perspective']) ? $contestant_question_level_1_data['speciality_perspective'] : '',
                'esse'                     => isset($contestant_question_level_1_data['esse']) ? $contestant_question_level_1_data['esse'] : ''
            ];
            
            $level_score_mapping = [
                'level_1' => [
                    'question_4_score',
                    'question_5_score',
                    'question_6_score'
                ]
            ];
            
            $customer_score = [];
            $customer_score_data = [];
            foreach($level_score_mapping as $level => $score_map){
                $customer_score_data[$level] = $this->model_account_customer->getContestantScoreById($contestant_id, $level);
                
                $customer_score[$level] = [];
                foreach($score_map as $score_name){
                    $customer_score[$level][$score_name] = isset($customer_score_data[$level][$score_name]) ? $customer_score_data[$level][$score_name] : 0;
                }
            }
            
            $data['contestant_data'] = [
                'contestant_id' => $contestant_id,
                'fio'           => isset($contestant_data['full_name']) ? $contestant_data['full_name'] : '',
                'telephone'     => isset($contestant_data['telephone']) ? $contestant_data['telephone'] : '',
                'email'         => isset($contestant_data['email']) ? $contestant_data['email'] : '',
                'city'          => isset($contestant_data['city']) ? $contestant_data['city'] : '',
                'study_place'   => isset($contestant_data['study_place']) ? $contestant_data['study_place'] : '',
                
                'teacher'       => $contestant_data['teacher'] = [
                    'fio'           => isset($contestant_data['teacher_name']) ? $contestant_data['teacher_name'] : '',
                    'telephone'     => isset($contestant_data['teacher_phone']) ? $contestant_data['teacher_phone'] : '',
                    'email'         => isset($contestant_data['teacher_email']) ? $contestant_data['teacher_email'] : ''
                ],
                'question'      => $question,
                'score'         => $customer_score,
                'checker_fio'       => [
                    'level_1'   => isset($customer_score_data['level_1']['checking']) ? $customer_score_data['level_1']['checking'] : ''
                ],
                //'level_2_allowance' => isset($customer_score_data['level_1']['level_2_allowance']) ? $customer_score_data['level_1']['level_2_allowance'] : ''
                'level_2_allowance' => !empty($customer_score_data['level_1']['level_2_allowance']) ? true : false
            ];
            
            // level 2
            $data['level_navbar'] = [
                'level-1' => [
                    'name' => 'Этап 1',
                    'href' => $this->url->link('account/curator/level1', 'contestant_id=' . $contestant_id . $filter_string_data, true)
                ],
                'level-2' => [
                    'name' => 'Этап 2',
                    'href' => $this->url->link('account/curator/level2', 'contestant_id=' . $contestant_id . $filter_string_data, true)
                ],
                'psychologist-test' => [
                    'name' => 'Тест с психологом',
                    'href' => $this->url->link('account/curator/psychotest', 'contestant_id=' . $contestant_id . $filter_string_data, true)
                ],
            ];
            
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');
            
            $this->response->setOutput($this->load->view('account/curator_contestant_form', $data));
        }
        
        public function level2(){
            $this->load->model('account/customer');
            
            if(isset($this->request->get['contestant_id'])){
                $contestant_id = (int)$this->request->get['contestant_id'];
            }
            
            $filter_string_data = '';
            
            if(isset($this->request->get['page'])){
                $page = (int)$this->request->get['page'];
            } else {
                $page = 0;
            }
            
            $filter_string_data .= '&page=' . $page;
            
            if(isset($this->request->get['sort_order'])){
                $filter_string_data .= '&sort_order=' . $this->request->get['sort_order'];
            }
            
            if(isset($this->request->get['sort_order_order'])){
                $filter_string_data .= '&sort_order_order=' . $this->request->get['sort_order_order'];
            }
            
            // Checking data
            if(isset($this->request->post['checking_fullname'])){
                $checking_fullname = (string)$this->request->post['checking_fullname'];
                
                $checking_data = [
                    'curator_id'        => (int)0,
                    'contestant_id'     => (int)$contestant_id,
                    'level'             => 'level_2',
                    'checking_fullname' => $checking_fullname
                ];
                
                $this->model_account_customer->saveCheckingData($checking_data);
                
                $data['checking_data'] = $checking_data;
            } else {
                $checking_data = $this->model_account_customer->getCheckingDataByContestantIdAndLevel($contestant_id, 'level_2');
                
                $data['checking_data'] = $checking_data;
            }
            
            // Score data
            $data['contestant_score_data'] = [];
            
            if(isset($this->request->post['score'])){
                $contestant_score_data = $this->request->post['score'];
                
                $score = [];
                
                foreach($contestant_score_data as $score_key => $score_value){
                    $score[$score_key] = (int)$score_value;
                }
                
                $score_data = [
                    'curator_id'    => 0,
                    'level'         => 'level_2',
                    'contestant_id' => $contestant_id,
                    'score'         => $score
                ];
                
                $this->model_account_customer->saveContestantScoreByLevelAndCustomerId($score_data);
                
                $data['contestant_score_data'] = $score;
            } else {
                $contestant_score_data = [];
            }
            
            if(empty($contestant_score_data)){
                $contestant_score_data = $this->model_account_customer->getContestantScoreByContestantIdAndLevel($contestant_id, 'level_2');
                
                $score_list = [];
                
                foreach($contestant_score_data as $score){
                    $score_list[$score['score_key']] = (int)$score['score_value'];
                }
                
                $data['contestant_score_data'] = $score_list;
            }

            // Curator recommendation
            $data['curator_recommendation_data'] = [];
            
            if(isset($this->request->post['recommendation'])){
                $curator_recommendation_data = $this->request->post['recommendation'];
                
                $recommendation = [];

                foreach($curator_recommendation_data as $recommendation_key => $recommendation_text){
                    $recommendation[$recommendation_key] = $recommendation_text;
                }

                $recommendation_data = [
                    'curator_id'    => 0,
                    'contestant_id' => $contestant_id,
                    'recommendation' => $recommendation
                ];
                
                $this->model_account_customer->saveCuratorRecommendation($recommendation_data);
                
                $data['curator_recommendation_data'] = $recommendation;
            } else {
                $curator_recommendation_data = [];
            }
            
            if(empty($curator_recommendation_data)){
                $curator_recommendation_data = $this->model_account_customer->getCuratorRecommendationByContestantId($contestant_id);
                
                $recommendation_list = [];
                
                foreach($curator_recommendation_data as $recommendation){
                    $recommendation_list[$recommendation['recommendation_key']] = $recommendation['recommendation_text'];
                }
                
                $data['curator_recommendation_data'] = $recommendation_list;
            }
            
            
            $data['save_contestant_data'] = $this->url->link('account/curator/level2', 'contestant_id=' . $contestant_id . $filter_string_data, true);
            $data['back_to_list'] = $this->url->link('account/curator', $filter_string_data . "#contestant-" . $contestant_id, true);
            $data['logout'] = $this->url->link('account/logout', true);
            
            $data['top_navbar'] = [];
            
            $data['level_navbar'] = [
                'level-1' => [
                    'name' => 'Этап 1',
                    'href' => $this->url->link('account/curator/level1', 'contestant_id=' . $contestant_id . $filter_string_data, true)
                ],
                'level-2' => [
                    'name' => 'Этап 2',
                    'href' => $this->url->link('account/curator/level2', 'contestant_id=' . $contestant_id . $filter_string_data, true)
                ],
                'psychologist-test' => [
                    'name' => 'Тест с психологом',
                    'href' => $this->url->link('account/curator/psychotest', 'contestant_id=' . $contestant_id . $filter_string_data, true)
                ],
            ];
            
            $contestant_files = $this->model_account_customer->getCustomerLevelFileListByCustomerId($contestant_id);
            
            $data['contestant_file_list'] = [];
            
            foreach($contestant_files as $contestant_file){
                if(!isset($data['contestant_file_list'][$contestant_file['purpose']])){
                    $data['contestant_file_list'][$contestant_file['purpose']] = [];
                }
                
                $data['contestant_file_list'][$contestant_file['purpose']][] = [
                    'file_id'       => $contestant_file['file_id'],
                    'contestant_id' => $contestant_file['customer_id'],
                    'filename'      => $contestant_file['filename'],
                    'filepath'      => $contestant_file['filepath'],
                    'fullname'      => $contestant_file['filepath'] . '/' . $contestant_file['filename'],
                    'filetype'      => $contestant_file['type'],
                    'purpose'       => $contestant_file['purpose'],
                    'sort_order'    => $contestant_file['sort_order'],
                    'date_added'    => $contestant_file['date_added']
                ];
            }
            
            $data['contestant_data'] = [];
            
            $contestant_data__sound_producer = $this->model_account_customer->getLevel2SoundproducerDataByCustomerId($contestant_id);
            if(!empty($contestant_data__sound_producer)){
                $data['contestant_data']['sound_producer'] = $contestant_data__sound_producer;
            }
            
            $contestant_data__production_in_filmmaking = $this->model_account_customer->getLevel2ProductionInFilmmakingData($contestant_id);
            if(!empty($contestant_data__production_in_filmmaking)){
                $data['contestant_data']['production_in_filmmaking'] = $contestant_data__production_in_filmmaking;
            }
            
            $contestant_data__acting_skills = $this->model_account_customer->getLevel2ActingSkillsData($contestant_id);
            if(!empty($contestant_data__acting_skills)){
                $data['contestant_data']['acting_skills'] = $contestant_data__acting_skills;
            }
            
            $contestant_data__dramaturgy_screenwriter = $this->model_account_customer->getLevel2DramaturgyScreenwriterData($contestant_id);
            if(!empty($contestant_data__dramaturgy_screenwriter)){
                $data['contestant_data']['dramaturgy_screenwriter'] = $contestant_data__dramaturgy_screenwriter;
            }
            
            $contestant_data__film_director = $this->model_account_customer->getLevel2FilmDirectorData($contestant_id);
            if(!empty($contestant_data__film_director)){
                $data['contestant_data']['film_director'] = $contestant_data__film_director;
            }
            
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');
            
            $this->response->setOutput($this->load->view('account/curator_level2', $data));
        }
        
        public function psychotest(){
            if(isset($this->request->get['contestant_id'])){
                $contestant_id = (int)$this->request->get['contestant_id'];
            }
            
            $filter_string_data = '';
            
            if(isset($this->request->get['page'])){
                $page = (int)$this->request->get['page'];
            } else {
                $page = 0;
            }
            
            $filter_string_data .= '&page=' . $page;
            
            if(isset($this->request->get['sort_order'])){
                $filter_string_data .= '&sort_order=' . $this->request->get['sort_order'];
            }
            
            if(isset($this->request->get['sort_order_order'])){
                $filter_string_data .= '&sort_order_order=' . $this->request->get['sort_order_order'];
            }
            
            $data['save_contestant_data'] = $this->url->link('account/curator/psychotest', 'contestant_id=' . $contestant_id . $filter_string_data, true);
            $data['back_to_list'] = $this->url->link('account/curator', $filter_string_data . "#contestant-" . $contestant_id, true);
            $data['logout'] = $this->url->link('account/logout', true);
            
            $data['top_navbar'] = [];
                
            $data['level_navbar'] = [
                'level-1' => [
                    'name' => 'Этап 1',
                    'href' => $this->url->link('account/curator/level1', 'contestant_id=' . $contestant_id . $filter_string_data, true)
                ],
                'level-2' => [
                    'name' => 'Этап 2',
                    'href' => $this->url->link('account/curator/level2', 'contestant_id=' . $contestant_id . $filter_string_data, true)
                ],
                'psychologist-test' => [
                    'name' => 'Тест с психологом',
                    'href' => $this->url->link('account/curator/psychotest', 'contestant_id=' . $contestant_id . $filter_string_data, true)
                ],
            ];

            $this->load->model('account/customer');
            
            // Score data
            $data['contestant_score_data'] = [];
            
            if(isset($this->request->post['score'])){
                $contestant_score_data = $this->request->post['score'];
                
                $score = [];
                
                foreach($contestant_score_data as $score_key => $score_value){
                    $score[$score_key] = (int)$score_value;
                }
                
                $score_data = [
                    'curator_id'    => 0,
                    'level'         => 'psychologist',
                    'contestant_id' => $contestant_id,
                    'score'         => $score
                ];
                
                $this->model_account_customer->saveContestantScoreByLevelAndCustomerId($score_data);
                
                $data['contestant_score_data'] = $score;
            } else {
                $contestant_score_data = [];
            }
            
            if(empty($contestant_score_data)){
                $contestant_score_data = $this->model_account_customer->getContestantScoreByContestantIdAndLevel($contestant_id, 'psychologist');
                
                $score_list = [];
                
                foreach($contestant_score_data as $score){
                    $score_list[$score['score_key']] = (int)$score['score_value'];
                }
                
                $data['contestant_score_data'] = $score_list;
            }
            
            // Checking data
            if(isset($this->request->post['checking_fullname'])){
                $checking_fullname = (string)$this->request->post['checking_fullname'];
                
                $checking_data = [
                    'curator_id'        => (int)0,
                    'contestant_id'     => (int)$contestant_id,
                    'level'             => 'psychologist',
                    'checking_fullname' => $checking_fullname
                ];
                
                $this->model_account_customer->saveCheckingData($checking_data);
                
                $data['checking_data'] = $checking_data;
            } else {
                $checking_data = $this->model_account_customer->getCheckingDataByContestantIdAndLevel($contestant_id, 'psychologist');
                
                $data['checking_data'] = $checking_data;
            }
            
            // Curator recommendation
            $data['curator_recommendation_data'] = [];
            
            if(isset($this->request->post['recommendation'])){
                $curator_recommendation_data = $this->request->post['recommendation'];
                
                $recommendation = [];

                foreach($curator_recommendation_data as $recommendation_key => $recommendation_text){
                    $recommendation[$recommendation_key] = $recommendation_text;
                }

                $recommendation_data = [
                    'curator_id'    => 0,
                    'contestant_id' => $contestant_id,
                    'recommendation' => $recommendation
                ];
                
                $this->model_account_customer->saveCuratorRecommendation($recommendation_data);
                
                $data['curator_recommendation_data'] = $recommendation;
            } else {
                $curator_recommendation_data = [];
            }
            
            if(empty($curator_recommendation_data)){
                $curator_recommendation_data = $this->model_account_customer->getCuratorRecommendationByContestantId($contestant_id);
                
                $recommendation_list = [];
                
                foreach($curator_recommendation_data as $recommendation){
                    $recommendation_list[$recommendation['recommendation_key']] = $recommendation['recommendation_text'];
                }
                
                $data['curator_recommendation_data'] = $recommendation_list;
            }
            
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');
            
            $this->response->setOutput($this->load->view('account/curator_psychotest', $data));
        }
}
