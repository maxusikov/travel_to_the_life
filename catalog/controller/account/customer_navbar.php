<?php
class ControllerAccountCustomerNavbar extends Controller{
    public function index(){
        return $this;
    }
    
    public function getNavbar($current){
        if(empty($current)){
            $current = 'profile';
        }
        
        $data['text_user_navbar'] = 'Меню пользователя';

        $data['navbar_items'] = [
            'my_profile' => [
                'name' => "Мой профиль",
                'href' => $this->url->link('account/account/profile', true),
                'active' => ($current == 'profile') ? true : false
            ],
            'my_projects' => [
                'name' => "Мои проекты",
                'href' => $this->url->link('account/account/level1', true),
                'active' => ($current == 'project') ? true : false
            ]
        ];
        
        $data['logout'] = $this->url->link('account/logout');
        
        return $this->load->view('account/customer_navbar', $data);
    }
}
