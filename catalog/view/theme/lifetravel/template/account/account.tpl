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
      <div class="navigation-wrapper">
        <h2><?php echo $text_user_navbar; ?></h2>
        <ul class="list-unstyled">
            <li><a onclick="javascript:togglePanel('profile');"><?php echo $text_my_profile; ?></a></li>
            <!-- li><a href="<?php echo $my_projects; ?>"><?php echo $text_my_projects; ?></a></li -->
            <!-- li><a href="<?php echo $settings; ?>"><?php echo $text_settings; ?></a></li -->
            <!-- li><a href="<?php echo $photo; ?>"><?php echo $text_photo; ?></a></li -->
            <!-- li><a href="<?php echo $change_password; ?>"><?php echo $text_change_password; ?></a></li -->
        </ul>

        <ul class="list-unstyled">
            <li><a href="<?php echo $logout; ?>">Logout</a></li>
        </ul>
      </div>
      <div class="content-wrapper">
        <div id="profile" class="profile panel">
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
                        <a class="button submit" onclick="javascript:$(this).closest('form').submit();">Отправить</a>
                    </div>
                </form>
            </div>
        </div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?> 