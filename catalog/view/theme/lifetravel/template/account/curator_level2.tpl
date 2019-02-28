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
        <div id="level-2" class="form-wrapper">
          <form action="<?php echo $save_contestant_data; ?>" method="post" enctype="multipart/form-data">
              <input type="hidden" name="contestant_id" value="<?php echo $contestant_data['contestant_id']; ?>" />
              <div class="input-wrapper checker-fio">
                <div class="label-wrapper">
                    <label for="checking_fullname">Проверил член жюри</label>
                </div>
                <input id="checking_fullname" type="text" name="checking_fullname" value="<?php echo isset($checking_data['checking_fullname']) ? $checking_data['checking_fullname'] : ''; ?>" placeholder="ФИО члена жюри" />
              </div>
              
              <div class="contestant-question-data">
                <?php if(empty($contestant_data) && empty($contestant_file_list)){ ?>
                <h3>Нет ни одного ответа конкурсанта по данному этапу</h3>
                <?php } else { ?>
                  <?php if(!empty($contestant_file_list['level_2_operator'])){ ?>
                  <div id="contestant-speciality--operator" class="contestant-question-wrapper">
                    <h2 class="speciality-heading">
                      <span class="heading-text">Оператор</span>
                      <div class="speciality-score">
                        <label>Набранные балы</label>
                        <input type="number" min=0 name="score[operator]" value="<?php echo $contestant_score_data['operator']; ?>" placeholder="Баллы" />
                      </div>
                    </h2>
                    <h3 class="speciality-question">Загрузите 15 фотографий, которые Вы снимали лично по любым жанрам. В формате JPG.</h3>
                    <div class="speciality-answer">
                      <ul class="uploaded-file-list image">
                        <?php foreach($contestant_file_list['level_2_operator'] as $contestant_file){ ?>
                        <li class="list-item">
                          <a class="image-link">
                            <img class="customer-image" src="<?php echo $contestant_file['fullname']; ?>" alt="<?php echo $contestant_file['filename']; ?>" title="<?php echo $contestant_file['filename']; ?>" />
                          </a>
                        </li>
                        <?php } ?>
                      </ul>
                    </div>
                    <div class="curator-recommendation">
                        <h3 class="recommendation-heading">Рекомендация</h3>
                        <textarea name="recommendation[operator]"><?php echo isset($curator_recommendation_data['operator']) ? $curator_recommendation_data['operator'] : ''; ?></textarea>
                    </div>
                  </div>
                  <?php } ?>
                  
                  <?php if(!empty($contestant_file_list['level_2_production_designer'])){ ?>
                  <div id="contestant-speciality--production-designer" class="contestant-question-wrapper">
                    <h2 class="speciality-heading">
                      <span class="heading-text">Художник-постановщик</span>
                      <div class="speciality-score">
                        <label>Набранные балы</label>
                        <input type="number" min=0 name="score[production_designer]" value="<?php echo $contestant_score_data['production_designer']; ?>" placeholder="Баллы" />
                      </div>
                    </h2>
                    <h3 class="speciality-question">Создайте цветную историю в картинках. 10 изображений в формате А-4: живопись, рисунок, композиция, сюжет. Загрузите сканы изображений в формате JPG.</h3>
                    <div class="speciality-answer">
                      <ul class="uploaded-file-list image">
                        <?php foreach($contestant_file_list['level_2_production_designer'] as $contestant_file){ ?>
                        <li class="list-item">
                          <a class="image-link">
                            <img class="customer-image" src="<?php echo $contestant_file['fullname']; ?>" alt="<?php echo $contestant_file['filename']; ?>" title="<?php echo $contestant_file['filename']; ?>" />
                          </a>
                        </li>
                        <?php } ?>
                      </ul>
                    </div>
                    <div class="curator-recommendation">
                        <h3 class="recommendation-heading">Рекомендация</h3>
                        <textarea name="recommendation[production_designer]"><?php echo isset($curator_recommendation_data['production_designer']) ? $curator_recommendation_data['production_designer'] : ''; ?></textarea>
                    </div>
                  </div>
                  <?php } ?>
                  
                  <?php if(!empty($contestant_data['film_director']) || !empty($contestant_file_list['film_director'])){ ?>
                  <div id="contestant-speciality--film-director" class="contestant-question-wrapper">
                    <h2 class="speciality-heading">
                      <span class="heading-text">Кинорежиссер</span>
                      <div class="speciality-score">
                        <label>Набранные балы</label>
                        <input type="number" min=0 name="score[film_director]" value="<?php echo $contestant_score_data['film_director']; ?>" placeholder="Баллы" />
                      </div>
                    </h2>
                    <h3 class="speciality-question">Напишите рассказ "Случай из жизни". Ярко и зрелищно опишите эпизод, свидетелем которого были Вы сами. Загрузите файл в формате Word, 3 страницы.</h3>
                    <?php if(!empty($contestant_data['film_director'])){ ?>
                    <div class="speciality-answer">
                      <span class="answer"><?php echo $contestant_data['film_director']['case_of_life']; ?></span>
                    </div>
                    <?php } ?>
                    <?php if(!empty($contestant_file_list['level_2_film_director'])){ ?>
                    <div class="speciality-answer">
                      <ul class="uploaded-file-list doc">
                        <?php foreach($contestant_file_list['level_2_film_director'] as $contestant_file){ ?>
                        <li class="list-item word-doc">
                          <a class="download" href="<?php echo $contestant_file['fullname']; ?>">
                            <img class="icon" src="catalog/view/theme/lifetravel/image/theme_images/Microsoft_Word_2013_logo.png" title="<?php echo $contestant_file['filename']; ?>" alt="<?php echo $contestant_file['filename']; ?>" />
                            <span class="filename"><?php echo $contestant_file['filename']; ?></span>
                          </a>
                        </li>
                        <?php } ?>
                      </ul>
                    </div>
                    <?php } ?>
                    <div class="curator-recommendation">
                        <h3 class="recommendation-heading">Рекомендация</h3>
                        <textarea name="recommendation[film_director]"><?php echo isset($curator_recommendation_data['film_director']) ? $curator_recommendation_data['film_director'] : ''; ?></textarea>
                    </div>
                  </div>
                  <?php } ?>
                
                  <?php if(!empty($contestant_data['dramaturgy_screenwriter']) || !empty($contestant_file_list['dramaturgy_screenwriter'])){ ?>
                  <div id="contestant-speciality--dramaturgy-screenwriter" class="contestant-question-wrapper">
                    <h2 class="speciality-heading">
                      <span class="heading-text">Драматургия(сценарист)</span>
                      <div class="speciality-score">
                        <label>Набранные балы</label>
                        <input type="number" min=0 name="score[dramaturgy_screenwriter]" value="<?php echo $contestant_score_data['dramaturgy_screenwriter']; ?>" placeholder="Баллы" />
                      </div>
                    </h2>
                    <?php if(!empty($contestant_data['dramaturgy_screenwriter'])){ ?>
                    <h3 class="speciality-question">Напишите законченное произведение с началом, серединой и концом. На одну из выбранных тем. Формат Word, шрифт Times, 12 размер шрифта, интервал- 1,5 см, 3-5 страниц. Страницы пронумерованы.</h3>
                    <div class="speciality-answer">
                        <ul class="sub-answers">
                            <li>
                              <span class="question-heading">Тема 1</span>
                              <span class="question">Ты превратился в муху. Летишь. Случайно слышишь разговор двоих. Узнаешь что-то очень важное. Кто они? О чем они говорят? Напиши диалог.</span>
                              <span class="answer"><?php echo $contestant_data['dramaturgy_screenwriter']['theme_1']; ?></span>
                            </li>
                            <li>
                              <span class="question-heading">Тема 2</span>
                              <span class="question">Запертая шкатулка, в которой что-то шуршало, и, казалось, пело, внезапно она сама открылась. Ты в нее заглянул...Напиши, что в ней было и что случилось дальше.</span>
                              <span class="answer"><?php echo $contestant_data['dramaturgy_screenwriter']['theme_2']; ?></span>
                            </li>
                            <li>
                              <span class="question-heading">Тема 3</span>
                              <span class="question">Вы с другом отправились в лес. Друг потерялся. Ты нашел его следы. Они вели?... Что было дальше?</span>
                              <span class="answer"><?php echo $contestant_data['dramaturgy_screenwriter']['theme_3']; ?></span>
                            </li>
                        </ul>
                    </div>
                    <?php } ?>
                    <?php if(!empty($contestant_file_list['level_2_dramaturgy_screenwriter'])){ ?>
                    <div class="speciality-answer">
                      <ul class="uploaded-file-list doc">
                        <?php foreach($contestant_file_list['level_2_dramaturgy_screenwriter'] as $contestant_file){ ?>
                        <li class="list-item word-doc">
                          <a class="download" href="<?php echo $contestant_file['fullname']; ?>">
                            <img class="icon" src="catalog/view/theme/lifetravel/image/theme_images/Microsoft_Word_2013_logo.png" title="<?php echo $contestant_file['filename']; ?>" alt="<?php echo $contestant_file['filename']; ?>" />
                            <span class="filename"><?php echo $contestant_file['filename']; ?></span>
                          </a>
                        </li>
                        <?php } ?>
                      </ul>
                    </div>
                    <?php } ?>
                    <div class="curator-recommendation">
                        <h3 class="recommendation-heading">Рекомендация</h3>
                        <textarea name="recommendation[dramaturgy_screenwriter]"><?php echo isset($curator_recommendation_data['dramaturgy_screenwriter']) ? $curator_recommendation_data['dramaturgy_screenwriter'] : ''; ?></textarea>
                    </div>
                  </div>
                  <?php } ?>
                  
                  
                  <?php if(!empty($contestant_data['production_in_filmmaking'])){ ?>
                  <div id="contestant-speciality--production-in-filmmaking" class="contestant-question-wrapper">
                    <h2 class="speciality-heading">
                      <span class="heading-text">Продюсерство в кинопроизводстве</span>
                      <div class="speciality-score">
                        <label>Набранные балы</label>
                        <input type="number" min=0 name="score[production_in_filmmaking]" value="<?php echo $contestant_score_data['production_in_filmmaking']; ?>" placeholder="Баллы" />
                      </div>
                    </h2>
                    <div class="speciality-answer">
                      <ul class="sub-answers">
                        <li>
                          <span class="question">1. Почему я выбрал профессию продюсера?</span>
                          <span class="answer"><?php echo $contestant_data['production_in_filmmaking']['question_1']; ?></span>
                        </li>
                        <li>
                          <span class="question">2. Почему я хочу учиться именно в этом киновузе?</span>
                          <span class="answer"><?php echo $contestant_data['production_in_filmmaking']['question_2']; ?></span>
                        </li>
                        <li>
                          <span class="question">3. Какой фильм я, как продюсер, хотел бы создать (жанр, аудитория, бюджет)?</span>
                          <span class="answer"><?php echo $contestant_data['production_in_filmmaking']['question_3']; ?></span>
                        </li>
                        <li>
                          <span class="question">4. Какое литературное произведение Вас потрясло, и какой герой этого произведения заслуживает подражания?</span>
                          <span class="answer"><?php echo $contestant_data['production_in_filmmaking']['question_4']; ?></span>
                        </li>
                        <li>
                          <span class="question">5. Какое музыкальное произведение (классика) Вы бы использовали при съёмках (сказки, комедии, драмы и т.п.)?</span>
                          <span class="answer"><?php echo $contestant_data['production_in_filmmaking']['question_5']; ?></span>
                        </li>
                        <li>
                          <span class="question">6. При съёмках какого фильма (жанр) Вы бы обратились к произведениям изобразительного искусства?</span>
                          <span class="answer"><?php echo $contestant_data['production_in_filmmaking']['question_6']; ?></span>
                        </li>
                        <li>
                          <span class="question">7. Если бы у Вас была машина времени, к какому режиссёру-классику Вы бы хотели попасть на съёмочную площадку?</span>
                          <span class="answer"><?php echo $contestant_data['production_in_filmmaking']['question_7']; ?></span>
                        </li>
                      </ul>
                    </div>
                    <div class="curator-recommendation">
                        <h3 class="recommendation-heading">Рекомендация</h3>
                        <textarea name="recommendation[production_in_filmmaking]"><?php echo isset($curator_recommendation_data['production_in_filmmaking']) ? $curator_recommendation_data['production_in_filmmaking'] : ''; ?></textarea>
                    </div>
                  </div>
                  <?php } ?>
                
                  <?php if(!empty($contestant_data['acting_skills'])){ ?>
                  <div id="contestant-speciality--acting-skills" class="contestant-question-wrapper">
                    <h2 class="speciality-heading">
                      <span class="heading-text">Актерское мастерство</span>
                      <div class="speciality-score">
                        <label>Набранные балы</label>
                        <input type="number" min=0 name="score[acting_skills]" value="<?php echo $contestant_score_data['acting_skills']; ?>" placeholder="Баллы" />
                      </div>
                    </h2>
                    <h3 class="speciality-question">1. Запишите на видео, где Вы читаете стихотворение - Б. Пастернака «Быть знаменитым некрасиво» и прозу: для девушек- монолог Катерины из пьесы А.Н. Островского "Гроза": «Я говорю, отчего люди не летают так, как птицы ?...», для юношей - Монолог Печорина княжне Мери из М. Лермонтова «Герой нашего времени»: « Да, такова была моя участь с самого детства…»<br />
                        Вставьте ссылку на видео:</h3>
                    <div class="speciality-answer">
                        <span class="answer"><a href="<?php echo $contestant_data['acting_skills']['video_url']; ?>"><?php echo $contestant_data['acting_skills']['video_url']; ?></a></span>
                    </div>
                    <div class="curator-recommendation">
                        <h3 class="recommendation-heading">Рекомендация</h3>
                        <textarea name="recommendation[acting_skills]"><?php echo isset($curator_recommendation_data['acting_skills']) ? $curator_recommendation_data['acting_skills'] : ''; ?></textarea>
                    </div>
                  </div>
                  <?php } ?>
                  
                  <?php if(!empty($contestant_data['sound_producer'])){ ?>
                  <div id="contestant-speciality--sound-producer" class="contestant-question-wrapper">
                    <h2 class="speciality-heading">
                      <span class="heading-text">Звукорежиссер</span>
                      <div class="speciality-score">
                        <label>Набранные балы</label>
                        <input type="number" min=0 name="score[sound_producer]" value="<?php echo $contestant_score_data['sound_producer']; ?>" placeholder="Баллы" />
                      </div>
                    </h2>
                    <h3 class="speciality-question">Укажите, какое произведение или композицию Вы бы использовали для озвучивания:</h3>
                    <div class="speciality-answer">
                      <ul class="sub-answers">
                        <li>
                          <span class="question">1. Детективного фильма:</span>
                          <span class="answer"><?php echo $contestant_data['sound_producer']['detective']; ?></span>
                        </li>
                        <li>
                          <span class="question">2. Мелодрамы:</span>
                          <span class="answer"><?php echo $contestant_data['sound_producer']['melodrama']; ?></span>
                        </li>
                        <li>
                          <span class="question">3. Комедии:</span>
                          <span class="answer"><?php echo $contestant_data['sound_producer']['comedy']; ?></span>
                        </li>
                        <li>
                          <span class="question">4. Триллера:</span>
                          <span class="answer"><?php echo $contestant_data['sound_producer']['triller']; ?></span>
                        </li>
                        <li>
                          <span class="question">5. Фэнтези:</span>
                          <span class="answer"><?php echo $contestant_data['sound_producer']['fantasy']; ?></span>
                        </li>
                        <li>
                          <span class="question">6. Драмы:</span>
                          <span class="answer"><?php echo $contestant_data['sound_producer']['drama']; ?></span>
                        </li>
                      </ul>
                    </div>
                    <div class="curator-recommendation">
                        <h3 class="recommendation-heading">Рекомендация</h3>
                        <textarea name="recommendation[sound_producer]"><?php echo isset($curator_recommendation_data['sound_producer']) ? $curator_recommendation_data['sound_producer'] : ''; ?></textarea>
                    </div>
                  </div>
                  <?php } ?>
                  
                <?php } ?>
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
