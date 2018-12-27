<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
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
      <h1 class="heading"><?php echo $heading_title; ?></h1>
      <p class="already-registered-text"><?php echo $text_account_already; ?></p>

      <div  class="registration-form-wrapper">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
            <div class="input-group">
                <div class="label-wrapper">
                    <label for="user_login">E-mail(Логин)</label>
                    <?php if(isset($error_email)) { ?>
                    <span class="error"><?php echo $error_email; ?></span>
                    <?php } ?>
                </div>
                <input id="user_login" type="email" name="email" value="<?php echo $email; ?>" placeholder="" />
            </div>
            <div class="input-group">
                <div class="label-wrapper">
                    <label for="full_name">Ф.И.О.</label>
                    <?php if(isset($error_full_name)) { ?>
                    <span class="error"><?php echo $error_full_name; ?></span>
                    <?php } ?>
                </div>
                <input id="full_name" type="text" name="full_name" value="<?php echo $full_name; ?>" placeholder="" />
            </div>
            <div class="input-group">
                <div class="label-wrapper">
                    <label for="birth_date">Дата рождения (к участию принимаются подростки в возрасте от 14 лет)</label>
                    <?php if(isset($error_birth_date)) { ?>
                    <span class="error"><?php echo $error_birth_date; ?></span>
                    <?php } ?>
                </div>
                <input id="birth_date" type="date" name="birth_date" value="<?php echo $birth_date; ?>" placeholder="" />
            </div>            
            <div class="input-group">
                <div class="label-wrapper">
                    <label for="city">Город проживания</label>
                    <?php if(isset($error_city)) { ?>
                    <span class="error"><?php echo $error_city; ?></span>
                    <?php } ?>
                </div>
                <input id="city" type="text" name="city" value="<?php echo $city; ?>" placeholder="" />
            </div>
            <div class="input-group">
                <div class="label-wrapper">
                    <label for="study_place">Место учебы: № Школы, класс обучения</label>
                    <?php if(isset($error_study_place)) { ?>
                    <span class="error"><?php echo $error_study_place; ?></span>
                    <?php } ?>
                </div>
                <input id="study_place" type="text" name="study_place" value="<?php echo $study_place; ?>" placeholder="" />
            </div>
            <div class="input-group">
                <div class="label-wrapper">
                    <label for="telephone">Номер контактного телефона</label>
                    <?php if(isset($error_telephone)) { ?>
                    <span class="error"><?php echo $error_telephone; ?></span>
                    <?php } ?>
                </div>
                <input id="telephone" type="tel" name="telephone" value="<?php echo $telephone; ?>" placeholder="" />
            </div>

            <span class="teacher-information-text">Информация о педагоге/художественном руководителе (при наличии)</span>

            <div class="input-group">
                <div class="label-wrapper">
                    <label for="teacher_name">Фамилия, имя, отчество педагога (полностью)</label>
                    <?php if(isset($error_teacher_name)) { ?>
                    <span class="error"><?php echo $error_teacher_name; ?></span>
                    <?php } ?>
                </div>
                <input id="teacher_name" type="text" name="teacher_name" value="<?php $teacher_name; ?>" placeholder="" />
            </div>
            <div class="input-group">
                <div class="label-wrapper">
                    <label for="teacher_phone">Контактный телефон педагога</label>
                    <?php if(isset($error_teacher_phone)) { ?>
                    <span class="error"><?php echo $error_teacher_phone; ?></span>
                    <?php } ?>
                </div>
                <input id="teacher_phone" type="tel" name="teacher_phone" value="<?php echo $teacher_phone; ?>" placeholder="" />
            </div>
            <div class="input-group">
                <div class="label-wrapper">
                    <label for="teacher_email">E-mail педагога</label>
                    <?php if(isset($error_teacher_email)) { ?>
                    <span class="error"><?php echo $error_teacher_email; ?></span>
                    <?php } ?>
                </div>
                <input id="teacher_email" type="email" name="teacher_email" value="<?php echo $teacher_email; ?>" placeholder="" />
            </div>
            <div class="input-group">
                <div class="label-wrapper">
                    <label for="favorite_film">Назовите свой самый любимый кинофильм (если их несколько, перечислите через «;»)?</label>
                    <?php if(isset($error_favorite_film)) { ?>
                    <span class="error"><?php echo $error_favorite_film; ?></span>
                    <?php } ?>
                </div>
                <input id="favorite_film" type="text" name="favorite_film" value="<?php echo $favorite_film; ?>" placeholder="" />
            </div>
            <div class="input-group">
                <div class="label-wrapper">
                    <label for="favorite_film_influence">Повлиял ли этот (эти) фильм(-ы), и как, на выбор будущей профессии?</label>
                    <?php if(isset($error_favorite_film_influence)) { ?>
                    <span class="error"><?php echo $error_favorite_film_influence; ?></span>
                    <?php } ?>
                </div>
                <input id="favorite_film_influence" type="text" name="favorite_film_influence" value="<?php echo $favorite_film_influence; ?>" placeholder="" />
            </div>
            <div class="input-group">
                <div class="label-wrapper">
                    <label for="profession">По какой специальности хотели бы получить кинообразование?</label>
                    <?php if(isset($error_profession)) { ?>
                    <span class="error"><?php echo $error_profession; ?></span>
                    <?php } ?>
                </div>
                <input id="profession" type="text" name="profession" value="<?php echo $profession; ?>" placeholder="" />
            </div>
            <div class="input-group">
                <div class="label-wrapper">
                    <label for="profession_opportunities">Что привлекает именно в этой специальности?</label>
                    <?php if(isset($error_profession_opportunities)) { ?>
                    <span class="error"><?php echo $error_profession_opportunities; ?></span>
                    <?php } ?>
                </div>
                <input id="profession_opportunities" type="text" name="profession_opportunities" value="<?php echo $profession_opportunities; ?>" placeholder="" />
            </div>
            <div class="input-group">
                <div class="label-wrapper">
                    <label for="password">Введите пароль</label>
                    <?php if(isset($error_password)) { ?>
                    <span class="error"><?php echo $error_password; ?></span>
                    <?php } ?>
                </div>
                <input id="password" type="password" name="password" value="<?php echo $password; ?>" placeholder="" />
            </div>
            <div class="input-group">
                <div class="label-wrapper">
                    <label for="confirm">Повторно пароль</label>
                    <?php if(isset($error_confirm)) { ?>
                    <span class="error"><?php echo $error_confirm; ?></span>
                    <?php } ?>
                </div>
                <input id="confirm" type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="" />
            </div>

            <div class="input-group">
                <div class="label-wrapper">
                    <label class="readed-conditions-text" for="agree">Я прочитал(а) условия регистрации и согласен с ними</label>
                    <?php if(isset($error_agree)) { ?>
                    <span class="error"><?php echo $error_agree; ?></span>
                    <?php } ?>
                </div>
                <input id="agree" type="checkbox" name="agree" <?php echo ($agree) ? 'checked' : ''; ?> />
            </div>
            <div class="input-group submit-area">
                <a class="submit button" onclick="javascript:$(this).closest('form').submit();">Отправить</a>
            </div>
        </form>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
    <div id="background-container">
        <img class="background background-0 active" src="/catalog/view/theme/lifetravel/image/theme_images/background/1459078271127742859.jpg" />
    </div>
</div>
<?php echo $footer; ?>
