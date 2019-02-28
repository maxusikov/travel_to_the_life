<?php echo $header; ?>
<div class="container">
  <div class="container-row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <?php echo $customer_navbar; ?>
      <div class="content-wrapper">
        <div id="projects" class="projects panel active">
            <div class="top-line">
                <ul class="level-tabs">
                    <li class="level-1 active">
                        <a>Этап 1</a>
                    </li>
                    <li class="level-2">
                        <a href="<?php echo $level2; ?>">Этап 2</a>
                    </li>
                    <li class="psychotest">
                        <a href="<?php echo $psychotest; ?>">Тест психолога</a>
                    </li>
                </ul>
                <div class="contestant-score">
                    <span class="level-score">Баллы по этапу: <?php echo $level_score; ?></span>
                    <span class="total-score">Всего баллов: <?php echo $total_score; ?></span>
                </div>
            </div>
            <div class="level-area">
                <div id="level-1" class="level-wrapper active">
                    <div class="esse-form form-wrapper">
                        <div class="score">
                            <?php if(!empty($score['level_1']['level_2_allowance'])) { ?>
                            <h2>Допущен ко второму этапу</h2>
                            <?php } ?>
                        </div>
                        <form id="data-form" action="<?php echo $level1; ?>" method="POST" enctype="multipart/form-data">
                            <input type="hidden" name="level" value="1" />
                            <span class="form-heading">Заполните анкету и выполните творческое задание</span>
                            <div class="input-group textarea-group">
                                <div class="label-wrapper">
                                    <label for="speciality_perspective">Почему считаете для себя перспективным получение образования в выбранной и указанной Вами специальности?</label>
                                </div>
                                <input id="speciality_perspective" type="text" name="speciality_perspective" value="<?php echo $customer_level_1_speciality_perspective; ?>" />
                            </div>
                            
                            <div class="input-group textarea-group">
                                <div class="label-wrapper">
                                    <label for="customer-esse">Если бы Вы снимали короткометражный документальный фильм о Владимирской области, какие сюжеты, места, музыку или людей Вы бы включили в этот фильм? Напишите Ваше видение этого фильма:</label>
                                </div>
                                <textarea id="customer-esse" name="customer_esse"><?php echo $customer_level_1_esse; ?></textarea>
                            </div>
                            
                            <div class="parent-area">
                                <span class="parent-area-heading">Информация о родителе/законном представителе (для несовершеннолетних)</span>
                                <div class="input-group">
                                    <div class="label-wrapper">
                                        <label for="parent-name">Фамилия, имя, отчество (полностью)</label>
                                    </div>
                                    <input id="parent-name" type="text" name="parent[name]" value="<?php echo $customer_representer['name'] ;?>" />
                                </div>
                                <div class="input-group">
                                    <div class="label-wrapper">
                                        <label for="parent-phone">Контактный телефон</label>
                                    </div>
                                    <input id="parent-phone" type="tel" name="parent[phone]" value="<?php echo $customer_representer['phone']; ?>" />
                                </div>
                                <div class="input-group">
                                    <div class="label-wrapper">
                                        <label for="parent-email">E-mail</label>
                                    </div>
                                    <input id="parent-email" type="email" name="parent[email]" value="<?php echo $customer_representer['email']; ?>" />
                                </div>
                            </div>
                            
                            <div class="input-wrapper">
                                <a class="button submit" onclick="javascript:$(this).closest('form').submit();">Сохранить</a>
                            </div>
                            <div class="input-wrapper agreement-area">
                                <input id="agreement" type="hidden" name="agreement" value="0" />
                                <a class="checkbox" onclick="javascript:toggleAgreement();">
                                    <span class="check"></span>
                                </a>
                                <label for="agreement" class="attention"><a onclick="javascript:toggleAgreement();"><h3>Отправляя из данной формы, созданные мной материалы, я даю согласие на подписание Договора на отчуждение исключительных прав.</h3></a></label>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<div id="preloader">
    <div class="preloader-wrapper big active">
      <div class="spinner-layer spinner-blue">
        <div class="circle-clipper left">
          <div class="circle"></div>
        </div><div class="gap-patch">
          <div class="circle"></div>
        </div><div class="circle-clipper right">
          <div class="circle"></div>
        </div>
      </div>

      <div class="spinner-layer spinner-red">
        <div class="circle-clipper left">
          <div class="circle"></div>
        </div><div class="gap-patch">
          <div class="circle"></div>
        </div><div class="circle-clipper right">
          <div class="circle"></div>
        </div>
      </div>

      <div class="spinner-layer spinner-yellow">
        <div class="circle-clipper left">
          <div class="circle"></div>
        </div><div class="gap-patch">
          <div class="circle"></div>
        </div><div class="circle-clipper right">
          <div class="circle"></div>
        </div>
      </div>

      <div class="spinner-layer spinner-green">
        <div class="circle-clipper left">
          <div class="circle"></div>
        </div><div class="gap-patch">
          <div class="circle"></div>
        </div><div class="circle-clipper right">
          <div class="circle"></div>
        </div>
      </div>
    </div>
</div>
<div id="background-container">
    <img class="background background-0 active" src="/catalog/view/theme/lifetravel/image/theme_images/background/1459078271127742859.jpg" />
</div>
<?php echo $footer; ?> 

<script type="text/javascript">
    $(document).ajaxStart(function(){
        $('#preloader').addClass('active');
    });
    $(document).ajaxStop(function(){
        $('#preloader').removeClass('active');
    });
    $(document).ajaxComplete(function(event, xhr, data_object){
        if(typeof(xhr.responseJSON.notification) != 'undefined'){
            $(document).notify(xhr.responseJSON.notification);
        }
    });
    
    function saveProfileData(){
        var form = $('#profile-form');
        
        $.ajax({
            url: '<?php echo $save_profile_data; ?>',
            method: 'POST',
            enctype: 'multipart/form-data',
            data: form.serialize(),
            success: function(response_data){
                var response_data = JSON.parse(response_data);
                
                $(document).notify(response_data);
            },
            error: function(xhr){
                console.log("Request error: ", xhr);
            }
        });
    }
</script>

<script type="text/javascript">
    function toggleAgreement(){
        var agreement = $('#agreement');
        var agreement_area = agreement.closest('.agreement-area');
        var is_agree = agreement.val();
        
        if(is_agree == '1'){
            agreement_area.find('a.checkbox').removeClass('checked');
            $(agreement).val('0');
        } else {
            agreement_area.find('a.checkbox').addClass('checked');
            $(agreement).val('1');
        }
    }
</script>

<script type="text/javascript">
    function level_2_chooseSpecialityTab(tab_number){
        var _item_list = $('.speciality-selection li');
        var _question_list = $('#question-list');

        if((_item_list.index($('.speciality-selection li.active')) + 1) != tab_number) {
            $('.speciality-selection li.active').removeClass('active');
            _item_list.eq(tab_number - 1).addClass('active');
            //
            $(_question_list).find('.level-2-question-tab.active').removeClass('active');
            $(_question_list).find('#level-2-tab-' + tab_number).addClass('active');
        }
    }
</script>
                               
<script type="text/javascript">
    function refreshUploadedFileList(_upload_container){
        var _file_list_container = $(_upload_container).find('.uploaded-file-list');
        $(_file_list_container).find('.list-item').remove();

        var form_data = new FormData();
        var purpose = $(_upload_container).find('input[name=\'purpose\']').val();
        form_data.append('purpose', purpose);

        $.ajax({
            url: '<?php echo $get_uploaded_file_list; ?>',
            type: 'post',
            dataType: 'json',
            data: form_data,
            cache: false,
            contentType: false,
            processData: false,
            success: function(response_data) {
                response_data.filelist.forEach(function(element, index){
                    var item_element_html  = '';
                        if(element.filetype == 'image'){
                            item_element_html += '<div class="list-item img">';
                            item_element_html += '  <a class="image-link" onclick="javascript:getBigImage(' + element.file_id + ', ' + index + ');">';
                            item_element_html += '    <img class="customer-image" src="' + element.fullname + '" alt="Добавлен ' + element.date_added + '" title="Добавлен ' + element.date_added + '" />';
                            item_element_html += '  </a>';
                        }

                        if(element.filetype == 'word_doc'){
                            item_element_html += '<div class="list-item word-doc">';
                            item_element_html += '  <a class="download" href="' + element.fullname + '">';
                            item_element_html += '    <img class="icon" src="catalog/view/theme/lifetravel/image/theme_images/Microsoft_Word_2013_logo.png" title="' + element.filename + '" alt="' + element.filename + '" />';
                            item_element_html += '    <span class="filename">' + element.filename + '</span>';
                            item_element_html += '  </a>';
                        }

                            item_element_html += '  <a class="button remove-button" onclick="javascript:removeUploadedFile($(this).closest(\'.file-uploading-form\'), ' + element.file_id + ');">';
                            item_element_html += '    <svg viewBox="0 0 30 30" xmlns="http://www.w3.org/2000/svg">';
                            item_element_html += '      <line x1="0" y1="0" x2="30" y2="30" stroke="gray" />';
                            item_element_html += '      <line x1="0" y1="30" x2="30" y2="0" stroke="gray" />';
                            item_element_html += '    </svg>';
                            item_element_html += '  </a>';

                            item_element_html += '  <div class="sort-buttons">';
                            item_element_html += '    <a class="sort-button button back" onclick="javascript:sortFileItem($(this).closest(\'.file-uploading-form\'), ' + element.file_id + ', false);" title="Передвинуть назад"><span class="arrow"></span></a>';
                            item_element_html += '    <a class="sort-button button forward" onclick="javascript:sortFileItem($(this).closest(\'.file-uploading-form\'), ' + element.file_id + ', true);" title="Передвинуть вперед"><span class="arrow"></span></a>';
                            item_element_html += '  </div>';
                            item_element_html += '</div>';

                    var _item_element = $(item_element_html);

                    $(_file_list_container).append(_item_element);
                });
            },
            error: function(xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }

        });
    }
</script>

<script type="text/javascript">
    function uploadFile(_upload_container){
        $('#form-upload').remove();

        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file[]" value="" multiple="multiple" /></form>');

        $('#form-upload input[name=\'file[]\']').trigger('click');

        if (typeof timer != 'undefined') {
            clearInterval(timer);
        }

        timer = setInterval(function() {
            if ($('#form-upload input[name=\'file[]\']').val() != '') {
                clearInterval(timer);

                var form_data = new FormData($('#form-upload')[0]);
                var purpose   = $(_upload_container).find('input[name=\'purpose\']').val();
                var filetype  = $(_upload_container).find('input[name=\'filetype\']').val();
                var level     = $(_upload_container).find('input[name=\'level\']').val();
                form_data.append('purpose', purpose);
                form_data.append('filetype', filetype);
                form_data.append('level', level);

                $.ajax({
                        url: '<?php echo $upload_file; ?>',
                        type: 'post',
                        dataType: 'json',
                        data: form_data,
                        cache: false,
                        contentType: false,
                        processData: false,
                        beforeSend: function() {},
                        complete: function() {},
                        success: function(response_data) {
                            refreshUploadedFileList($(_upload_container));
                            
                            if(response_data.status == 'warning'){
                                response_data.processed_files.forEach(function(item){
                                    if(typeof(item.notification) != 'undefined'){
                                        $(document).notify(item.notification);
                                    }
                                });
                            }
                            
                        },
                        error: function(xhr, ajaxOptions, thrownError) {
                                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                });
            }
        }, 500);
    }
</script>

<script type="text/javascript">
    function removeUploadedFile(_upload_container, file_id){
        $.ajax({
            url: '<?php echo $delete_file; ?>',
            method: "POST",
            enctype: 'multipart/form-data',
            dataType: 'json',
            data: {
                file_id: file_id
            },
            success: function(response_data){
                console.log("Success: ", response_data);
                
                if(response_data.status == 'success'){
                    refreshUploadedFileList($(_upload_container));
                }
            },
            error: function(xhr){
                console.log("Delete file error: ", xhr);
            }
        });
    }
</script>

<script type="text/javascript">
    function getBigImage(_image_list_container, file_id, index){
        var data = {
            file_id: file_id,
            index_in_list: index
        };
    
        $.ajax({
            url: '<?php echo $get_file; ?>',
            method: 'POST',
            data: data,
            dataType: 'json',
            success: function(response_data){
                // response_data = JSON.parse(response_data);
                console.log(response_data);
                
                if(response_data.status == 'success'){
                    var _big_image_container;
                    
                    if($('#big-image-container').length <= 0){
                        var big_image_container_html  = '<div id="big-image-container" class="">';
                            big_image_container_html += '</div>';

                        var _big_image_container = $(big_image_container_html);
                        $('body').append(_big_image_container);
                    }
                    
                    _big_image_container = $('#big-image-container');
                    _big_image_container.find('.big-image-wrapper').remove();
                    
                    var big_image_wrapper_html  = '<div class="big-image-wrapper">';
                        big_image_wrapper_html += '  <img src="' + response_data.filedata.fullname + '" alt="' + response_data.filedata.filename + '" title="' + response_data.filedata.filename + '" />';
                        big_image_wrapper_html += '  <a class="close-button button" onclick="javascript:$(\'#big-image-container\').remove();">Закрыть</a>';
                        big_image_wrapper_html += '  <div class="scroll-buttons">';
                        big_image_wrapper_html += '    <a class="scroll-button scroll-prev button" onclick="javascript:scrollBigImagePrev(' +_img_list_container[0] + ', ' + index + ');">&laquo;</a>';
                        big_image_wrapper_html += '    <a class="scroll-button scroll-next button" onclick="javascript:scrollBigImageNext(' + $(_image_list_container) + ', ' + index + ');">&raquo;</a>';
                        big_image_wrapper_html += '  </div>';
                        big_image_wrapper_html += '</div>';
                        
                    var _big_image_wrapper = $(big_image_wrapper_html);
                    
                    _big_image_container.append(_big_image_wrapper);
                }
            },
            error: function(xhr){
                console.log("getBigImage error: ", xhr);
            }
        });
    }
    
    function scrollBigImagePrev(_image_list_container, current_index){
        //$(_image_list_container).find('li').eq(current_index - 1).find('.image_link').trigger('click');
    }
    
    function scrollBigImageNext(_image_list_container, current_index){
        $(_image_list_container).find('li').eq(current_index + 1).find('.image_link').trigger('click');
    }
</script>
                               
<script type="text/javascript"><!--
    function sortFileItem(_upload_container, file_id, move_forward = false){
        var form_data = {};
        form_data.file_id = file_id;
        
        if(move_forward){
            form_data.forward = true;
        }
        
        $.ajax({
            url: '<?php echo $sort_file; ?>',
            method: "POST",
            enctype: 'multipart/form-data',
            dataType: 'json',
            data: form_data,
            success: function(response_data){
                if(response_data.status == 'success'){
                    refreshUploadedFileList($(_upload_container));
                }
                
                console.log("TQ: ", response_data);
            },
            error: function(xhr){
                console.log("Sort file error: ", xhr);
            }
        });
    }
--></script>

<script type="text/javascript">
    $(document).ready(function(){
        $(document).scrollTop(0);
        
        <?php if(isset($error_agreement)){ ?>
        $(document).notify(<?php echo $error_agreement; ?>);
        <?php } ?>
    });
</script>
