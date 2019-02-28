<?php
class ControllerLandingNews extends Controller {
    public function index() {
        $this->document->addScript('/catalog/view/javascript/presentation.slider.standard/js/jssor.slider-27.5.0.min.js');
        
        $data = [];
        
        return $this->load->view('landing/news', $data);
    }
    
    public function curatorGetNewsList(){
        
    }
    
    public function curatorGetNewsForm(){
        
    }
}