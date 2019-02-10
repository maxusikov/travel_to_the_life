(function($){
    $.fn.notify = function(notification){
        var _notification_container;
        
        if($('#ajax-response-info').length > 0){
            _notification_container = $('#ajax-response-info');
        } else {
            notification_container_html  = '<div id="ajax-response-info">';
            notification_container_html += '</div>';
            
            _notification_container = $(notification_container_html);
            
            $('body').append(_notification_container);
        }
        
        $(_notification_container).addClass('active');
        
        var notification_block_html  = '  <div class="info-wrapper ' + notification.type + '">';
            notification_block_html += '    <div class="info-content">';
            notification_block_html += '      ' + notification.info + '';
            notification_block_html += '    </div>';
            notification_block_html += '  </div>';
            
        var _notification_block = $(notification_block_html);
        _notification_container.append(_notification_block);
        
        var timeout = setTimeout(function(){
            $(_notification_block).remove();
            
            if(_notification_container.find('.info-wrapper').length <= 0){
                $(_notification_container).removeClass('active');
            }
        }, 3000);
        
        $(_notification_container).click(function(){
            $(this).find('.info-wrapper').remove();
            $(this).removeClass('active');
        });
    }
})(jQuery);

