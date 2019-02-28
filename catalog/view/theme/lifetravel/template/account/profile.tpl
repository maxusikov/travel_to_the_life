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
        <div id="profile" class="profile panel">
            <div class="form-wrapper active">
                <form id="profile-form" action="<?php echo $action; ?>" method="POST" enctype="multipart/form-data">
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
    $(document).ready(function(){
        $(document).scrollTop(0);
        
        $('.file-uploading-form .uploaded-file-list.image').each(function(index, element){

            $(element).imageSlider();
        });
        
        <?php if(isset($error_agreement)){ ?>
        console.log("TEST");
        $(document).notify(<?php echo $error_agreement; ?>);
        <?php } ?>
    });
</script>
