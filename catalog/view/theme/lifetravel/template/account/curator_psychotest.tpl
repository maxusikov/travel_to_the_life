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
            <?php foreach($level_navbar as $level_key => $level_value){ ?>
            <a class="button <?php echo $level_key; ?>" href="<?php echo $level_value['href']; ?>"><?php echo $level_value['name']; ?></a>
            <?php } ?>
          </div>
          <div class="nav-buttons">
            <a href="<?php echo $back_to_list; ?>" class="back button">Назад к списку</a>
            <a href="<?php echo $logout; ?>" class="logout button">Выход</a>
          </div>
        </div>
        <div id="psychotest" class="form-wrapper">
          <form action="<?php echo $save_contestant_data; ?>" method="post" enctype="multipart/form-data">
              <div class="input-wrapper checker-fio">
                <div class="label-wrapper">
                  <label for="checking-fullname">Проверил член жюри</label>
                </div>
                <input id="checking-fullname" type="text" name="checking_fullname" value="<?php echo isset($checking_data['checking_fullname']) ? $checking_data['checking_fullname'] : ''; ?>" placeholder="ФИО члена жюри" />
              </div>
              
              <div class="psychologist-test-data">
                <div class="input-wrapper">
                  <div class="label-wrapper">
                    <label for="psychologist-test-score">Оценка психолога</label>
                  </div>
                  <input type="number" min=0 name="score[psychologist]" value="<?php echo isset($contestant_score_data['psychologist']) ? $contestant_score_data['psychologist'] : ''; ?>" placeholder="Баллы" />
                </div>
                
                <div class="input-wrapper psychologist-recommendation">
                  <div class="label-wrapper">
                    <label for="psychologist-recommendation">Рекоммендация психолога</label>
                  </div>
                  <textarea id="psychologist-recommendation" name="recommendation[psychologist]" placeholder="Рекоммендация психолога"><?php echo isset($curator_recommendation_data['psychologist']) ? $curator_recommendation_data['psychologist'] : ''; ?></textarea>
                </div>
              </div>
              
              <div class="bottom-area">
                  <div class="buttons">
                      <button class="submit-button button" type="submit">Сохранить</button>
                  </div>
              </div>
          </form>
        </div>
      </div>
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
        
        $('.uploaded-file-list.image').each(function(index, element){
            console.log(element);

            $(element).imageSlider();
        });
    });
</script>
