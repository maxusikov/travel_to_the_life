<?php
class ControllerAccountCurator extends Controller {
	public function index() {
	    $this->getContestantList();
	}
        
        public function getContestantList($page_number=1, $contestants_per_page=10){
            $this->load->model('account/customer');
            
            if(isset($this->request->get['page_number'])){
                $page_number = $this->request->get['page_number'];
            }
            
            if(isset($this->request->get['per_page'])){
                $contestants_per_page = (int)$this->request->get['per_page'];
            }
            
            
            
            $level_score_mapping = [
                'level_1' => [
                    'question_4_score',
                    'question_5_score',
                    'question_6_score'
                ]
            ];
            
            $filter_data = [];
            
            $customers = $this->model_account_customer->getContestantList($filter_data);
                        
            $contestant = [];
            
            $customer_score = [];
            
            foreach($customers as $customer){
                $customer_data = $this->model_account_customer->getCustomerDataById($customer['customer_id']);

                foreach($level_score_mapping as $level => $score_map){
                    $customer_score_data = $this->model_account_customer->getContestantScoreById($customer['customer_id'], $level);
                    
                    foreach($score_map as $score_name){
                        $customer_score[$score_name] = isset($customer_score_data[$score_name]) ? $customer_score_data[$score_name] : 0;
                    }
                }
                
                $contestant[] = [
                    'contestant_id'     => $customer['customer_id'],
                    'registration_date' => $customer['date_added'],
                    'fio'               => isset($customer_data['full_name']) ? $customer_data['full_name'] : '',
                    'email'             => isset($customer_data['email']) ? $customer_data['email'] : $customer['email'],
                    'telephone'         => isset($customer_data['telephone']) ? $customer_data['telephone'] : '',
                    'birthdate'         => isset($customer_data['birthdate']) ? $customer_data['birthdate'] : '',
                    'speciality'        => isset($customer_data['speciality']) ? $customer_data['speciality'] : '',
                    'school'            => isset($customer_data['study_place']) ? $customer_data['study_place'] : '',
                    'question_4_score'  => !empty($customer_score['question_4_score']) ? $customer_score['question_4_score'] : '',
                    'question_5_score'  => !empty($customer_score['question_5_score']) ? $customer_score['question_5_score'] : '',
                    'question_6_score'  => !empty($customer_score['question_6_score']) ? $customer_score['question_6_score'] : '',
                    'total_score_level_1' => $customer_score['question_4_score'] + $customer_score['question_5_score'] + $customer_score['question_6_score'],
                    'level_2_allowance' => isset($customer_score_data['next_level_allowance']) ? $customer_score_data['next_level_allowance'] : false,
                    'checking'          => isset($customer_score_data['curator']) ? $customer_score_data['curator'] : '',
                    'edit'              => $this->url->link('account/curator/getContestantForm', 'contestant_id=' . $customer['customer_id'], true)
                ];
            }
            
            $data['contestants'] = $contestant;
            
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

            $this->response->setOutput($this->load->view('account/contestant_list', $data));
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
                
                if(isset($this->request->post['level_2_allowance'])){
                    $level_2_allowance = true;
                } else {
                    $level_2_allowance = false;
                }
                
                $data['level_2_allowance'] = $level_2_allowance;
                
                //
                $this->load->model('account/customer');
            
                $level_score_mapping = [
                    'level_1' => [
                        'question_4_score',
                        'question_5_score',
                        'question_6_score'
                    ]
                ];
                
                foreach($level_score_mapping as $level_key => $level_score){
                    $score_data = [
                        'contestant_id' => $contestant_id,
                        'curator_id'    => $this->customer->isLogged(),
                        'checking'      => $checking_fio,
                        'score'         => $score[$level_key],
                        'level_2_allowance' => $level_2_allowance
                    ];
                    
                    $this->model_account_customer->saveContestantScore($score_data, $level_key);
                }
            }
            
            $this->getContestantForm();
        }
        
        public function getContestantForm(){
            if(isset($this->request->get['contestant_id'])){
                $contestant_id = (int)$this->request->get['contestant_id'];
            }
            
            $data['save_contestant_data'] = $this->url->link('account/curator/save', 'contestant_id=' . $contestant_id, true);
            
            $this->load->model('account/customer');
            
            $contestant_data = $this->model_account_customer->getCustomerDataById($contestant_id);
            
            $contestant_question_level_1_data = $this->model_account_customer->getCustomerLevel1Data($contestant_id);
            
            $question['level_1'] = [
                'favorite_film'            => $contestant_data['favorite_film'],
                'film_influation'          => $contestant_data['favorite_film_influence'],
                'speciality'               => $contestant_data['profession'],
                'speciality_opportunities' => $contestant_data['profession_opportunities'],
                'perspective_reasons'      => $contestant_question_level_1_data['speciality_perspective'],
                'esse'                     => $contestant_question_level_1_data['esse']
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
                'fio'           => $contestant_data['full_name'],
                'telephone'     => $contestant_data['telephone'],
                'email'         => $contestant_data['email'],
                'city'          => $contestant_data['city'],
                'study_place'   => $contestant_data['study_place'],
                
                'teacher'       => $contestant_data['teacher'] = [
                    'fio'           => $contestant_data['teacher_name'],
                    'telephone'     => $contestant_data['teacher_phone'],
                    'email'         => $contestant_data['teacher_email']
                ],
                'question'      => $question,
                'score'         => $customer_score,
                'checker_fio'       => [
                    'level_1'   => isset($customer_score_data['level_1']['checking']) ? $customer_score_data['level_1']['checking'] : ''
                ],
                'level_2_allowance' => isset($customer_score_data['level_1']['level_2_allowance']) ? $customer_score_data['level_1']['level_2_allowance'] : ''
            ];
            
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');
            
            $this->response->setOutput($this->load->view('account/curator_contestant_form', $data));
        }
}
