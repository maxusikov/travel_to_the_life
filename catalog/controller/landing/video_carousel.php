<?php
class ControllerLandingVideoCarousel extends Controller {
    public function index(){
        $this->document->addScript('/catalog/view/javascript/carousel-slider.slider.standard/js/jssor.slider-27.5.0.min.js');
        
        $data = [];
        
        return $this->load->view('landing/video_carousel', $data);
    }
}