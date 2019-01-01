<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div id="navbar" class="navigation-wrapper">
        <h2><?php echo $text_user_navbar; ?></h2>
        <ul class="list-unstyled">
            <li><a onclick="javascript:togglePanel('profile');" class="active"><?php echo $text_my_profile; ?></a></li>
            <li><a onclick="javascript:togglePanel('projects');"><?php echo $text_my_projects; ?></a></li>
            <!-- li><a href="<?php echo $settings; ?>"><?php echo $text_settings; ?></a></li -->
            <!-- li><a href="<?php echo $photo; ?>"><?php echo $text_photo; ?></a></li -->
            <!-- li><a href="<?php echo $change_password; ?>"><?php echo $text_change_password; ?></a></li -->
        </ul>

        <ul class="list-unstyled">
            <li><a href="<?php echo $logout; ?>">Выход</a></li>
        </ul>
      </div>
      <div class="content-wrapper">
        <div id="profile" class="profile panel active">
            <div class="form-wrapper">
                <form action="<?php echo $action; ?>" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="customer_id" value="<?php echo $customer_data['customer_id']; ?>" />
                    <div class="input-wrapper">
                        <div class="label-wrapper">
                            <label for="email">E-mail</label>
                        </div>
                        <span id="email"><?php echo $customer_data['email']; ?></span>
                        <input type="hidden" name="email" value="<?php echo $customer_data['email']; ?>" />
                    </div>
                    <div class="input-wrapper">
                        <div class="label-wrapper">
                            <label for="full_name">Ф.И.О.</label>
                        </div>
                        <span id="full_name"><?php echo $customer_data['full_name']; ?></span>
                        <input type="hidden" name="full_name" value="<?php echo $customer_data['full_name']; ?>" />
                    </div>
                    <div class="input-wrapper">
                        <div class="label-wrapper">
                            <label for="birth_date">Дата рождения</label>
                        </div>
                        <span id="birth_date"><?php echo $customer_data['birth_date']; ?></span>
                        <input type="hidden" name="birth_date" value="<?php echo $customer_data['birth_date']; ?>" />
                    </div>
                    
                    <div class="input-wrapper">
                        <div class="label-wrapper">
                            <label for="city">Город проживания</label>
                        </div>
                        <input id="city" type="text" name="city" value="<?php echo $customer_data['city']; ?>" />
                        <input type="hidden" name="city" value="<?php echo $customer_data['city']; ?>" />
                    </div>
                    <div class="input-wrapper">
                        <div class="label-wrapper">
                            <label for="study_place">Место учебы</label>
                        </div>
                        <input id="study_place" type="text" name="study_place" value="<?php echo $customer_data['study_place']; ?>" />
                    </div>
                    <div class="input-wrapper">
                        <div class="label-wrapper">
                            <label for="telephone">Контактный телефон</label>
                        </div>
                        <input id="telephone" type="tel" name="telephone" value="<?php echo $customer_data['telephone']; ?>" />
                    </div>
                    <div class="input-wrapper">
                        <div class="label-wrapper">
                            <label for="favorite_film">Назовите свой самый любимый кинофильм (если их несколько, перечислите через «;»)?</label>
                        </div>
                        <span id="favorite_film"><?php echo $customer_data['favorite_film']; ?></span>
                        <input type="hidden" name="favorite_film" value="<?php echo $customer_data['favorite_film']; ?>" />
                    </div>
                    <div class="input-wrapper">
                        <div class="label-wrapper">
                            <label for="favorite_film_influence">Повлиял ли этот (эти) фильм(-ы), и как, на выбор будущей профессии?</label>
                        </div>
                        <span id="favorite_film_influence"><?php echo $customer_data['favorite_film_influence']; ?></span>
                        <input type="hidden" name="favorite_film_influence" value="<?php echo $customer_data['favorite_film_influence']; ?>" />
                    </div>
                    <div class="input-wrapper">
                        <div class="label-wrapper">
                            <label for="profession">По какой специальности хотели бы получить кинообразование?</label>
                        </div>
                        <span id="profession"><?php echo $customer_data['profession']; ?></span>
                        <input type="hidden" name="profession" value="<?php echo $customer_data['profession']; ?>" />
                    </div>
                    <div class="input-wrapper">
                        <div class="label-wrapper">
                            <label for="profession_opportunities">Что привлекает именно в этой специальности?</label>
                        </div>
                        <span id="profession_opportunities"><?php echo $customer_data['profession_opportunities']; ?></span>
                        <input type="hidden" name="profession_opportunities" value="<?php echo $customer_data['profession_opportunities']; ?>" />
                    </div>
                    <!-- div class="input-wrapper">
                        <div class="label-wrapper">
                            <label for="teacher_data">Данные преподавателя</label>
                        </div>
                        <span id="teacher_data"><?php echo $customer_data['teacher_data']; ?></span>
                        <input type="hidden" name="teacher_data" value="<?php echo $customer_data['teacher_data']; ?>" />
                    </div -->
                    <div class="input-wrapper">
                        <div class="label-wrapper">
                            <label for="teacher_name">Ф.И.О. преподавателя</label>
                        </div>
                        <span id="teacher_name"><?php echo $customer_data['teacher_name']; ?></span>
                        <input type="hidden" name="teacher_name" value="<?php echo $customer_data['teacher_name']; ?>" />
                    </div>
                    <div class="input-wrapper">
                        <div class="label-wrapper">
                            <label for="teacher_email">E-mail преподавателя</label>
                        </div>
                        <span id="teacher_email"><?php echo $customer_data['teacher_email']; ?></span>
                        <input type="hidden" name="teacher_email" value="<?php echo $customer_data['teacher_email']; ?>" />
                    </div>
                    <div class="input-wrapper">
                        <div class="label-wrapper">
                            <label for="teacher_phone">Телефон преподавателя</label>
                        </div>
                        <span id="teacher_phone"><?php echo $customer_data['teacher_phone']; ?></span>
                        <input type="hidden" name="teacher_phone" value="<?php echo $customer_data['teacher_phone']; ?>" />
                    </div>
                    <div class="input-wrapper">
                        <a class="button submit" onclick="javascript:$(this).closest('form').submit();">Сохранить</a>
                    </div>
                </form>
            </div>
        </div>
        <div id="projects" class="projects panel">
            <ul class="level-tabs">
                <li class="level-1 active">
                    <a onclick="toggleLevelPanel('level-1');">Этап 1</a>
                </li>
                <li class="level-2">
                    <a onclick="toggleLevelPanel('level-2');">Этап 2</a>
                </li>
            </ul>
            <div class="level-area">
                <div id="level-1" class="level-wrapper active">
                    <div class="esse-form form-wrapper">
                        <form id="data-form" method="POST" enctype="multipart/form-data">
                            <input type="hidden" name="level" value="1" />
                            <span class="form-heading">Заполните анкету и выполните творческое задание</span>
                            <div class="input-group textarea-group">
                                <div class="label-wrapper">
                                    <label for="speciality_perspective">Почему считаете для себя перспективным получение образования в выбранной и указанной Вами специальности?</label>
                                </div>
                                <textarea id="speciality_perspective" name="speciality_perspective"><?php echo $customer_level_1_speciality_perspective; ?></textarea>
                            </div>
                            
                            
                            
                            <!-- div id="uploaded-files" class="uploaded_files">
                                <div class="input-group textarea-group">
                                    <div class="label-wrapper">
                                        <label for="portfolio-file">Здесь Вы можете прикрепить файл с Вашими работами или документами.</label>
                                    </div>
                                </div>
                                <h3>Загруженные файлы:</h3>
                                <ul class="files_list">
                                  <?php if($uploaded_files){ ?>
                                    <li class="headings">
                                        <span class="filename">Имя файла</span>
                                        <span class="actions">Действия</span>
                                    </li>
                                    <?php foreach ($uploaded_files as $file){ ?>
                                    <li class="list-item">
                                        <input class="file-id" type="hidden" name="file_id" value="<?php echo $file['file_id']; ?>" />
                                        <span class="filename"><?php echo $file['filename']; ?></span>
                                        <div class="actions">
                                            <a onclick="button" onclick="javascript:removeUploadedFile($(this).closest('.list-item'));">Удалить файл</a>
                                        </div>
                                    </li>
                                    <?php } ?>
                                  <?php } else { ?>
                                    <li class="empty">Не загружено ни одного файла</li>
                                  <?php } ?>
                                  <li id="upload-portfolio-file-container" class="upload-file-row upload-file-container" style="border: 2px solid red;">
                                    <input id="portfolio-file" type="file" name="attached_file" value="" />
                                    <input id="portfolio-file2" type="text" name="attached_file_text" value="" />
                                    <a class="button" onclick="javascript:uploadFile($(this).closest('form'));">Загрузить</a>
                                  </li>
                                </ul>
                            </div -->
                            
                            
                            <div class="input-group textarea-group">
                                <div class="label-wrapper">
                                    <label for="customer-esse">Напишите эссе (сценарий) короткометражного документального фильма о Родном Крае (Владимирская область).</label>
                                </div>
                                <textarea id="customer-esse" name="customer_esse"><?php echo $customer_level_1_esse; ?></textarea>
                            </div>
                            <div class="input-group textarea-group">
                                <div class="label-wrapper">
                                    <label for="film-information">Как бы Вы его сняли и как Вы его видите. Какие сюжеты, места или люди войдут в этот фильм. Какую музыку Вы будете использовать в фильме и т.д.)</label>
                                </div>
                                <textarea id="film-information" name="film_information"><?php echo $customer_level_1_film_information; ?></textarea>
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
                                <a class="button submit" onclick="javascript:saveLevelData($(this));">Сохранить</a>
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
                <div id="level-2" class="level-wrapper">
                    Этап 2 в подготовке
                </div>
            </div>
        </div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<div id="ajax-response-info">
    <div class="info-wrapper">
        <div class="info-content"></div>
    </div>
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
<?php echo $footer; ?> 

<script type="text/javascript">
    function togglePanel(panel_id){
        var current_panel_id = $('.content-wrapper .panel.active').id;
        
        if (panel_id != current_panel_id) {
            $('.content-wrapper .panel.active').removeClass('active');
            $('.content-wrapper #' + panel_id).addClass('active');
            
            $('#navbar ul.list-unstyled li a.active').removeClass('active');
            $(event.target).addClass('active');
        }
    }
</script>

<script type="text/javascript">
    function toggleLevelPanel(level){
        var current_level_panel = $('#projects .level-area .level-wrapper.active').id;
        
        if (level != current_level_panel) {
            $('#projects .level-area .level-wrapper.active').removeClass('active');
            $('#projects .level-area #' + level).addClass('active');
            
            $('#projects .level-tabs li.active').removeClass('active');
            $('#projects .level-tabs li.' + level).addClass('active');
        }
    }
</script>

<script type="text/javascript">
    $(document).ajaxStart(function(){
        $('#preloader').addClass('active');
    });
    $(document).ajaxStop(function(){
        $('#preloader').removeClass('active');
    });
    
    function saveLevelData(){
        var form = $(event.target).closest('form');
        
        $.ajax({
            url: '<?php echo $save_customer_level_data; ?>',
            method: 'POST',
            data: form.serialize(),
            success: function(response_data){
                console.log("1: ", response_data);
                var response_data = JSON.parse(response_data);
                var response_info = $('#ajax-response-info');
                response_info.addClass(response_data.result + ' active');
                response_info.find('.info-content').html(response_data.info);
                
                $('#ajax-response-info').click(function(){
                    $(this).removeClass(response_data.result + ' active');
                });
               
                var timeout = (response_data.timeout) ? response_data.timeout : 1000;
                setTimeout(function(){
                    response_info.removeClass(response_data.result + ' active');
                }, timeout);
            }
        });
    }
</script>

<script type="text/javascript">
    function uploadFile(file_container){
        var form = $('#data-form');
        
        $.ajax({
            url: '<?php echo $upload_file; ?>',
            method: "POST",
            dataType: 'json',
            enctype: 'multipart/form-data',
            data: form.serialize(),
            crossDomain: true,
            beforeSend: function(xhr, obj){
                console.log("BS xhr: ", xhr);
                console.log("BS obj:", obj);
            },
            success: function(response_data){
                var response_data = JSON.parse(response_data);
                var list_container = $('#uploaded-files');
                
                var response_info = $('#ajax-response-info');
                response_info.addClass(response_data.result + ' active');
                response_info.find('.info-content').html(response_data.info);
                
                var timeout = (response_data.timeout) ? response_data.timeout : 1000;
                
                setTimeout(function(){
                    response_info.removeClass(response_data.result + ' active');
                }, timeout);
            },
            error:function(xhr){
                console.log("Error: ", xhr);
            }
        });
    }
    
    function removeUploadedFile(file_container){
        var file_id = file_container.find('.file-id').val();
        
        $.ajax({
            url: '<?php echo $delete_file; ?>',
            method: "POST",
            enctype: 'multipart/form-data',
            dataType: 'json',
            data: {
                file_id: file_id
            },
            success: function(response_data){
                var response_data = JSON.parse(response_data);
                var response_info = $('#ajax-response-info');
                response_info.addClass(response_data.result + ' active');
                response_info.find('.info-content').html(response_data.info);
                
                setTimeout(function(){
                    response_info.removeClass(response_data.result + ' active');
                }, 1000);
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
    $(document).ready(function(){
        $(document).scrollTop(0);
    });
</script>