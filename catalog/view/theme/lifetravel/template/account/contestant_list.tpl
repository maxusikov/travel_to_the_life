<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="content-container container-row">
    <div id="content" class="">
        <div id="curator-top-navbar" class="top-navbar">
          <div class="level-navbar">
            
          </div>
          <div class="nav-buttons">
            <a href="<?php echo $logout; ?>" class="logout button">Выход</a>
          </div>
        </div>
        <div class="form-wrapper">
            <form method="POST" enctype="multipart/form-data">
                <table class="contestant-list">
                    <thead>
                        <tr>
                            <th rowspan=2 class="contestant-id">
                                <a class="sorting sort-asc" href="<?php echo $column_id_sort_asc; ?>"><span class="arrow"></span></a>
                                <span class="">ID</span>
                                <a class="sorting sort-desc" href="<?php echo $column_id_sort_desc; ?>"><span class="arrow"></span></a>
                            </th>
                            <th rowspan=2 class="contestant-registration-date">
                                <a class="sorting sort-asc" href="<?php echo $column_date_added_sort_asc; ?>"><span class="arrow"></span></a>
                                <span class="">Дата регистрации</span>
                                <a class="sorting sort-desc" class="sorting sort-desc" href="<?php echo $column_date_added_sort_desc; ?>"><span class="arrow"></span></a>
                            </th>
                            <th rowspan=2 class="contestant-fio">
                                <a class="sorting sort-asc" href="<?php echo $column_contestant_fio_sort_asc; ?>"><span class="arrow"></span></a>
                                <span class="">Ф.И.О.</span>
                                <a class="sorting sort-desc" href="<?php echo $column_contestant_fio_sort_desc; ?>"><span class="arrow"></span></a>
                            </th>
                            <th rowspan=2 class="contestant-email">E-mail</th>
                            <th rowspan=2 class="contestant-telephone">Телефон</th>
                            <th rowspan=2 class="contestant-birthdate">Дата рождения</th>
                            <th rowspan=2 class="contestant-cinema-speciality">Специальность кинообразования</th>
                            <th rowspan=2 class="contestant-school">№ школы</th>
                            
                            <th colspan=3>Этап №1</th>
                            
                            <th rowspan=2 class="contestant-level-2-allowance">Допущен на этап №2</th>
                            
                            <th colspan=3>Этап №2</th>
                            
                            <th rowspan=2 class="contestant-action">Действия</th>
                        </tr>
                        <tr>
                            <th class="contestant-level-1-score">Баллы</th>
                            <th class="contestant-level-1-total-score">Сумма</th>
                            <th class="contestant-level-1-checking-curator">Проверил</th>
                            
                            <th class="contestant-level-2-score">
                                <a class="sorting sort-asc" href="<?php echo $column_total_score_sort_asc; ?>"><span class="arrow"></span></a>
                                <span class="">Балл</span>
                                <a class="sorting sort-desc" href="<?php echo $column_total_score_sort_desc; ?>"><span class="arrow"></span></a>
                            </th>
                            <th class="contestant-level-2-selected-speciality">Специальности</th>
                            <th class="contestant-level-2-checking-curator">Проверил</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach($contestants as $contestant){ ?>
                        <tr id="contestant-<?php echo $contestant['contestant_id']; ?>">
                            <td class="contestant-id"><?php echo $contestant['contestant_id']; ?></td>
                            <td class="contestant-registration-date"><?php echo $contestant['registration_date']; ?></td>
                            <td class="contestant-fio"><?php echo $contestant['fio']; ?></td>
                            <td class="contestant-email"><?php echo $contestant['email']; ?></td>
                            <td class="contestant-telephone"><?php echo $contestant['telephone']; ?></td>
                            <td class="contestant-birthdate"><?php echo $contestant['birthdate']; ?></td>
                            <td class="contestant-cinema-speciality"><?php echo $contestant['speciality']; ?></td>
                            <td class="contestant-school"><?php echo $contestant['school']; ?></td>
                            <td class="contestant-level-1-score">
                                <span><?php echo $contestant['question_4_score']; ?></span>/
                                <span><?php echo $contestant['question_5_score']; ?></span>/
                                <span><?php echo $contestant['question_6_score']; ?></span>
                            </td>
                            <td class="contestant-level-1-total-score"><?php echo $contestant['total_score_level_1']; ?></td>
                            <td class="contestant-level-1-checking-curator"><?php echo $contestant['level_1_checking']; ?></td>
                            <td class="contestant-level-2-allowance">
                                <span><?php echo ($contestant['level_2_allowance']) ? 'Да' : 'Нет'; ?></span>
                            </td>
                            <!--td class="contestant-level-2-score"><?php echo $contestant['level_2_score']; ?></td-->
                            <td class="contestant-level-2-score"><?php echo $contestant['all_total_score']; ?></td>
                            <td class="contestant-level-2-selected-speciality"><?php echo $contestant['level_2_selected_speciality']; ?></td>
                            <td class="contestant-level-2-checking-curator"><?php echo $contestant['level_2_checking_fullname']; ?></td>
                            <td class="contestant-action">
                                <a class="edit" href="<?php echo $contestant['edit']; ?>">
                                    <svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 18.651 18.651" xmlns:xlink="http://www.w3.org/1999/xlink" enable-background="new 0 0 18.651 18.651">
                                      <g>
                                        <g>
                                          <path fill="#020400" fill-rule="evenodd" d="m9.324,4.667c-3.759,0-7.112,1.816-9.324,4.659 2.212,2.842 5.565,4.658 9.324,4.658 3.759,0 7.116-1.816 9.327-4.658-2.212-2.843-5.568-4.659-9.327-4.659zm-6.371,4.659c1.501-1.804 3.78-2.955 6.334-2.962-1.631,0.007-2.95,1.33-2.95,2.962 0,1.632 1.32,2.955 2.95,2.962-2.554-0.008-4.833-1.159-6.334-2.962zm5.075,0c0-0.703 0.568-1.272 1.271-1.272 0.7,0 1.268,0.569 1.268,1.272 0,0.699-0.568,1.271-1.268,1.271-0.702-1.77636e-15-1.271-0.572-1.271-1.271zm1.282,2.963c-0.002,0-0.004,0-0.007,0 1.635-0.002 2.96-1.328 2.96-2.963 0-1.636-1.325-2.961-2.96-2.963 0.002,0 0.004,0 0.007,0 2.564,0 4.851,1.154 6.357,2.963-1.506,1.809-3.793,2.963-6.357,2.963z"/>
                                        </g>
                                      </g>
                                    </svg>
                                </a>
                            </td>
                        </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </form>
        </div>
        <div id="pagination">
            <?php echo $pagination; ?>
        </div>
        <!--form action="<?php echo $clearAllAllowance; ?>" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="action" value="clearAllAllowance" />
            <a class="button" onclick="$(this).closest('form').submit();">Очистить все допуски</a>
        </form-->
        <!--form action="<?php echo $submit_notification_to_allowed; ?>" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="action" value="submitNotificationToAllowed" />
            <a class="button" onclick="$(this).closest('form').submit();">Отправить извещения</a>
        </form-->
    </div>
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
<div id="background-container">
    <img class="background background-0 active" src="/catalog/view/theme/lifetravel/image/theme_images/background/1459078271127742859.jpg" />
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
    
    function saveProfileData(){
        var form = $('#profile-form');
        
        $.ajax({
            url: '<?php echo $save_profile_data; ?>',
            method: 'POST',
            enctype: 'multipart/form-data',
            data: form.serialize(),
            success: function(response_data){
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
            },
            error: function(xhr){
                console.log("Request error: ", xhr);
            }
        });
    }
    
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