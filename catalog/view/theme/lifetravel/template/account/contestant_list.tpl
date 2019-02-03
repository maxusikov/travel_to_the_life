<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="content-container container-row">
    <div id="content" class="">
        <div class="form-wrapper">
            <form method="POST" enctype="multipart/form-data">
                <div class="contestant-list-heading">
                    <span class="contestant-list-heading-item contestant-registration-date">Дата регистрации</span>
                    <span class="contestant-list-heading-item contestant-fio">Ф.И.О.</span>
                    <span class="contestant-list-heading-item contestant-email">E-mail</span>
                    <span class="contestant-list-heading-item contestant-telephone">Телефон</span>
                    <span class="contestant-list-heading-item contestant-birthdate">Дата рождения</span>
                    <span class="contestant-list-heading-item contestant-cinema-speciality">Специальность кинообразования</span>
                    <span class="contestant-list-heading-item contestant-school">№ школы</span>
                    <span class="contestant-list-heading-item contestant-question-4-score">Бал вопроса №4</span>
                    <span class="contestant-list-heading-item contestant-question-5-score">Бал вопроса №5</span>
                    <span class="contestant-list-heading-item contestant-question-6-score">Бал вопроса №6</span>
                    <span class="contestant-list-heading-item contestant-total-score">Сумма баллов</span>
                    <span class="contestant-list-heading-item contestant-level-2-allowance">Допущен на Этап II</span>
                    <span class="contestant-list-heading-item contestant-checking-curator">Проверил</span>
                    <span class="contestant-list-heading-item contestant-action">Действия</span>
                </div>
                <?php foreach($contestants as $contestant){ ?>
                <div id="contestant-<?php echo $contestant['contestant_id']; ?>" class="contestant-list-item">
                    <span class="contestant-list-item-item contestant-registration-date"><?php echo $contestant['contestant_id']; ?></span>
                    <span class="contestant-list-item-item contestant-registration-date"><?php echo $contestant['registration_date']; ?></span>
                    <span class="contestant-list-item-item contestant-fio"><?php echo $contestant['fio']; ?></span>
                    <span class="contestant-list-item-item contestant-email"><?php echo $contestant['email']; ?></span>
                    <span class="contestant-list-item-item contestant-telephone"><?php echo $contestant['telephone']; ?></span>
                    <span class="contestant-list-item-item contestant-birthdate"><?php echo $contestant['birthdate']; ?></span>
                    <span class="contestant-list-item-item contestant-cinema-speciality"><?php echo $contestant['speciality']; ?></span>
                    <span class="contestant-list-item-item contestant-school"><?php echo $contestant['school']; ?></span>
                    <span class="contestant-list-item-item contestant-question-4-score"><?php echo $contestant['question_4_score']; ?></span>
                    <span class="contestant-list-item-item contestant-question-5-score"><?php echo $contestant['question_5_score']; ?></span>
                    <span class="contestant-list-item-item contestant-question-6-score"><?php echo $contestant['question_6_score']; ?></span>
                    <span class="contestant-list-item-item contestant-total-score"><?php echo $contestant['total_score_level_1']; ?></span>
                    <span class="contestant-list-item-item contestant-level-2-allowance">
                        <?php echo ($contestant['level_2_allowance']) ? 'Да' : 'Нет'; ?>
                    </span>
                    <span class="contestant-list-item-item contestant-checking-curator"><?php echo $contestant['checking']; ?></span>
                    <span class="contestant-list-item-item contestant-actions"><a href="<?php echo $contestant['edit']; ?>">Редактировать</a></span>
                </div>
                <?php } ?>
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