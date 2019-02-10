(function($){
    $.fn.imageSlider = function(){
        var _list_container = $(this);
        
        $(this).find('.list-item').each(function(index){
            $(this).find('.image-link').click(function(){
                var _big_image_container;
        
                if($('#big-image-container').length <= 0){
                    var big_image_container_html  = '<div id="big-image-container">';
                        big_image_container_html += '</div>';

                    var _big_image_container = $(big_image_container_html);
                    $('body').append(_big_image_container);
                }

                _big_image_container = $('#big-image-container');
                _big_image_container.find('.big-image-wrapper').remove();
                
                var big_image_wrapper_html  = '<div class="big-image-wrapper">';
                    big_image_wrapper_html += '  <img src="' + $(this).find('img').attr('src') + '" />';
                    big_image_wrapper_html += '  <a class="close-button button" onclick="javascript:$(\'#big-image-container\').remove();">Закрыть</a>';
                    big_image_wrapper_html += '  <div class="scroll-buttons">';
                    big_image_wrapper_html += '    <a class="scroll-button scroll-prev button" onclick="javascript:scrollBigImagePrev(' + index + ');">&laquo;</a>';
                    big_image_wrapper_html += '    <a class="scroll-button scroll-next button" onclick="javascript:scrollBigImageNext(' + index + ');">&raquo;</a>';
                    big_image_wrapper_html += '  </div>';
                    big_image_wrapper_html += '</div>';

                var _big_image_wrapper = $(big_image_wrapper_html);

                _big_image_wrapper.find('.scroll-button.scroll-prev').click(function(){
                    if(index > 0){
                        $(_list_container).find('.list-item').eq(index - 1).find('.image-link').trigger('click');
                    } else {
                        var max_index = $(_list_container).find('.list-item').length - 1;
                        $(_list_container).find('.list-item').eq(max_index).find('.image-link').trigger('click');
                    }
                });
                
                _big_image_wrapper.find('.scroll-button.scroll-next').click(function(){
                    var max_index = $(_list_container).find('.list-item').length - 1;
                    
                    if(index < max_index){
                        $(_list_container).find('.list-item').eq(index + 1).find('.image-link').trigger('click');
                    } else {
                        $(_list_container).find('.list-item').eq(0).find('.image-link').trigger('click');
                    }
                });

                _big_image_container.append(_big_image_wrapper);
            });
        });
    }
})(jQuery);