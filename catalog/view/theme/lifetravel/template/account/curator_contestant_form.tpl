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
          <form action="<?php echo $save_contestant_data; ?>" method="post" enctype="multipart/form-data">
                <input type="hidden" name="contestant_id" value="<?php echo $contestant_data['contestant_id']; ?>" />
                <div class="input-wrapper checker-fio">
                    <div class="label-wrapper">
                        <label for="checking_fio">Проверил член жюри</label>
                    </div>
                    <input id="checking_fio" type="text" name="checking_fio" value="<?php echo $contestant_data['checker_fio']['level_1']; ?>" placeholder="ФИО члена жюри" />
                </div>
              
                <div class="contestant-info">
                    <div class="leftside contestant-data">
                        <h3 class="subheading">Информация об учащемся</h3>
                        <div class="input-wrapper">
                            <div class="label-wrapper">
                                <label for="fio">Фамилия, имя, отчество(полностью)</label>
                            </div>
                            <div class="inner-wrapper">
                                <input id="fio" type="text" name="fio" value="<?php echo $contestant_data['fio']; ?>" />
                            </div>
                        </div>
                        <div class="input-wrapper">
                            <div class="label-wrapper">
                                <label for="telephone">Контактный телефон</label>
                            </div>
                            <div class="inner-wrapper">
                                <input id="telephone" type="text" name="telephone" value="<?php echo $contestant_data['telephone']; ?>" />
                            </div>
                        </div>
                        <div class="input-wrapper">
                            <div class="label-wrapper">
                                <label for="email">E-mail</label>
                            </div>
                            <div class="inner-wrapper">
                                <input id="email" type="email" name="email" value="<?php echo $contestant_data['email']; ?>" />
                            </div>
                        </div>
                        <div class="input-wrapper">
                            <div class="label-wrapper">
                                <label for="city">Город проживания</label>
                            </div>
                            <div class="inner-wrapper">
                                <input id="city" type="text" name="city" value="<?php echo $contestant_data['city']; ?>" />
                            </div>
                        </div>
                        <div class="input-wrapper">
                            <div class="label-wrapper">
                                <label for="study-place">Место учебы</label>
                            </div>
                            <div class="inner-wrapper">
                                <input id="study-place" type="text" name="study_place" value="<?php echo $contestant_data['study_place']; ?>" />
                            </div>
                        </div>
                    </div>
                    <div class="rightside contestant-teacher-data">
                        <h3 class="subheading">Информация о педагоге/художественном руководителе(при наличии)</h3>
                        <div class="input-wrapper">
                            <div class="label-wrapper">
                                <label for="teacher-fio">Фамилия, имя, отчество(полностью)</label>
                            </div>
                            <div class="inner-wrapper">
                                <input id="teacher-fio" type="text" name="teacher[fio]" value="<?php echo $contestant_data['teacher']['fio']; ?>" />
                            </div>
                        </div>
                        <div class="input-wrapper">
                            <div class="label-wrapper">
                                <label for="teacher-telephone">Контактный телефон</label>
                            </div>
                            <div class="inner-wrapper">
                                <input type="tel" name="teacher[telephone]" value="<?php echo $contestant_data['teacher']['telephone']; ?>" />
                            </div>
                        </div>
                        <div class="input-wrapper">
                            <div class="label-wrapper">
                                <label for="teacher-email">E-mail</label>
                            </div>
                            <div class="inner-wrapper">
                                <input id="teacher-email" type="text" name="teacher[email]" value="<?php echo $contestant_data['teacher']['email']; ?>" />
                            </div>
                        </div>
                    </div>
                </div>
              
                <div class="contestant-question-data">
                  <div class="leftside">
                    <div class="input-wrapper">
                        <div class="label-wrapper">
                            <label for="favorite-film">Любимый фильм</label>
                        </div>
                        <div class="inner-wrapper">
                            <input id="favorite-film" type="text" name="question[level_1][favorite_film]" value="<?php echo $contestant_data['question']['level_1']['favorite_film']; ?>" />
                            <div class="score-area"></div>
                        </div>
                    </div>
                    <div class="input-wrapper">
                        <div class="label-wrapper">
                            <label for="film-influation">Как повлиял этот фильм на выбор будущей профессии</label>
                        </div>
                        <div class="inner-wrapper">
                            <input id="film-influation" type="text" name="question[level_1][film_influation]" value="<?php echo $contestant_data['question']['level_1']['film_influation']; ?>" />
                            <div class="score-area"></div>
                        </div>
                    </div>
                    <div class="input-wrapper">
                        <div class="label-wrapper">
                            <label for="speciality">Выбранная специальность кинообразования</label>
                        </div>
                        <div class="inner-wrapper">
                            <input id="speciality" type="text" name="question[level_1][speciality]" value="<?php echo $contestant_data['question']['level_1']['speciality']; ?>" />
                            <div class="score-area"></div>
                        </div>
                    </div>
                    <div class="input-wrapper">
                        <div class="label-wrapper">
                            <label for="speciality-opportunities">Что привлекло в этой специальности</label>
                        </div>
                        <div class="inner-wrapper">
                            <input id="speciality-opportunities" type="text" name="question[level_1][speciality_opportunities]" value="<?php echo $contestant_data['question']['level_1']['speciality_opportunities']; ?>" />
                            <div class="score-area">
                                <label for="question-4-score">Набранные балы</label>
                                <input id="question-4-score" type="text" name="score[level_1][question_4_score]" value="<?php echo $contestant_data['score']['level_1']['question_4_score']; ?>" />
                            </div>
                        </div>
                    </div>
                    <div class="input-wrapper">
                        <div class="label-wrapper">
                            <label for="perspective-reasons">Почему считает себя перспективным в выбранной специальности</label>
                        </div>
                        <div class="inner-wrapper">
                            <input id="perspective-reasons" type="text" name="question[level_1][perspective_reasons]" value="<?php echo $contestant_data['question']['level_1']['perspective_reasons']; ?>" />
                            <div class="score-area">
                                <label for="question-5-score">Набранные балы</label>
                                <input id="question-5-score" type="text" name="score[level_1][question_5_score]" value="<?php echo $contestant_data['score']['level_1']['question_5_score']; ?>" />
                            </div>
                        </div>
                    </div>
                  </div>
                  <div class="rightside">
                      <div class="input-wrapper">
                        <div class="label-wrapper">
                            <label for="esse">Творческое задание(эссе)</label>
                            <div class="score-area">
                                <input type="text" name="score[level_1][question_6_score]" value="<?php echo $contestant_data['score']['level_1']['question_6_score']; ?>" />
                                <label for="question-5-score">Набранные балы</label>
                            </div>
                        </div>
                        <textarea id="esse" name="question[level_1][esse]"><?php echo $contestant_data['question']['level_1']['esse']; ?></textarea>
                    </div>
                  </div>
              </div>
              <div class="bottom-area">
                  <div class="input-wrapper allowance-checkbox">
                    <div class="label-wrapper">
                        <label for="level-2-allowance">Допущен на второй этап</label>
                    </div>
                    <?php if($contestant_data['level_2_allowance']){ ?>
                    <input id="level-2-allowance" type="checkbox" name="level_2_allowance" checked />
                    <?php } else { ?>
                    <input id="level-2-allowance" type="checkbox" name="level_2_allowance" />
                    <?php } ?>
                  </div>
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
    });
</script>
