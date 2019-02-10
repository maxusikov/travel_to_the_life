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
  <div class="container-row"><?php echo $column_left; ?>
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
        </ul>

        <ul class="list-unstyled">
            <li><a href="<?php echo $logout; ?>">Выход</a></li>
        </ul>
      </div>
      <div class="content-wrapper">
        <div id="profile" class="profile panel">
            <div class="form-wrapper">
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
                        <a class="button submit" onclick="javascript:saveProfileData();">Сохранить</a>
                    </div>
                </form>
            </div>
        </div>
        <div id="projects" class="projects panel active">
            <ul class="level-tabs">
                <li class="level-1">
                    <a onclick="toggleLevelPanel('level-1');">Этап 1</a>
                </li>
                <li class="level-2 active">
                    <a onclick="toggleLevelPanel('level-2');">Этап 2</a>
                </li>
            </ul>
            <div class="level-area">
                <div id="level-1" class="level-wrapper">
                    <div class="esse-form form-wrapper">
                        <div class="score">
                            <?php if(!empty($score['level_1']['level_2_allowance'])) { ?>
                            <h2>Допущен ко второму этапу</h2>
                            <?php } ?>
                        </div>
                        <form id="data-form" action="<?php echo $save_level_1_data; ?>" method="POST" enctype="multipart/form-data">
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
                <div id="level-2" class="level-wrapper active">
                  <div class="form-wrapper">
                      <form id="level-2-data-form" action="<?php echo $save_contestant_level_2_data; ?>" method="POST" enctype="multipart/form-data">
                      <p class="form-heading">До 15.02.2019 ответьте на вопросы или выполните задания в разделе той специальности, которую Вы выбрали для себя или которая Вам наиболее интересна.</p>
                      <div class="speciality-selection">
                          <ul class="selection-list">
                              <li class="item active">
                                <a onclick="javascript:level_2_chooseSpecialityTab(1);">Оператор-постановщик</a>
                              </li>
                              <li class="item">
                                <a onclick="javascript:level_2_chooseSpecialityTab(2);">Художник-постановщик</a>
                              </li>
                              <li class="item">    
                                <a onclick="javascript:level_2_chooseSpecialityTab(3);">Кинорежиссер</a>
                              </li>
                              <li class="item">
                                <a onclick="javascript:level_2_chooseSpecialityTab(4);">Драматургия(сценарист)</a>
                              </li>
                              <li class="item">
                                <a onclick="javascript:level_2_chooseSpecialityTab(5);">Продюсерство в кинопроизводстве</a>
                              </li>
                              <li class="item">
                                <a onclick="javascript:level_2_chooseSpecialityTab(6);">Актерское мастерство</a>
                              </li>
                              <li class="item">
                                <a onclick="javascript:level_2_chooseSpecialityTab(7);">Звукорежиссер</a>
                              </li>
                          </ul>
                      </div>
                      <div id="question-list" class="question-list">
                          <div id="level-2-tab-1" class="level-2-question-tab active">
                              <h3 class="tab-heading">
                                <span class="heading-text">Оператор-постановщик</span>
                              </h3>
                              <div class="input-wrapper">
                                  <div class="label-wrapper">
                                    <label for="operator--file-upload">Загрузите 15 фотографий, которые Вы снимали лично по любым жанрам.  В формате JPG.</label>
                                  </div>
                                  <div class="file-uploading-form">
                                    <ul class="uploaded-file-list image">
                                      <?php if(isset($customer_files['level_2_operator'])){ ?>
                                        <?php foreach($customer_files['level_2_operator'] as $key => $customer_file){ ?>
                                            <?php if($customer_file['filetype'] == 'image'){ ?>
                                            <li class="list-item img">
                                                <a class="image-link">
                                                  <img class="customer-image" src="<?php echo $customer_file['fullname']; ?>" alt="<?php echo $customer_file['filename']; ?>" title="<?php echo $customer_file['filename']; ?>" />
                                                </a>

                                                <a class="button remove-button" onclick="javascript:removeUploadedFile($(this).closest('.file-uploading-form'), <?php echo $customer_file['file_id']; ?>);">
                                                    <svg viewBox="0 0 30 30" xmlns="http://www.w3.org/2000/svg">
                                                        <line x1="0" y1="0" x2="30" y2="30" stroke="gray" />
                                                        <line x1="0" y1="30" x2="30" y2="0" stroke="gray" />
                                                    </svg>
                                                </a>
                                                <div class="sort-buttons">
                                                        <a class="sort-button button back" onclick="javascript:sortFileItem($(this).closest('.file-uploading-form'), <?php echo $customer_file['file_id']; ?>, false);" title="Передвинуть назад">
                                                        <span class="arrow"></span>
                                                    </a>
                                                    <a class="sort-button button forward" onclick="javascript:sortFileItem($(this).closest('.file-uploading-form'), <?php echo $customer_file['file_id']; ?>, true);" title="Передвинуть вперед">
                                                        <span class="arrow"></span>
                                                    </a>
                                                </div>
                                            </li>
                                            <?php } ?> 
                                            <?php if($customer_file['filetype'] == 'word_doc') { ?>
                                            <li class="list-item word-doc">
                                                <a class="download" href="<?php echo $customer_file['fullname']; ?>">
                                                    <img class="icon" src="catalog/view/theme/lifetravel/image/theme_images/Microsoft_Word_2013_logo.png" title="<?php echo $customer_file['filename']; ?>" alt="<?php echo $customer_file['filename']; ?>" />
                                                    <span class="filename"><?php echo $customer_file['filename']; ?></span>
                                                </a>

                                                <a class="button remove-button" onclick="javascript:removeUploadedFile($(this).closest('.file-uploading-form'), <?php echo $customer_file['file_id']; ?>);">
                                                    <svg viewBox="0 0 30 30" xmlns="http://www.w3.org/2000/svg">
                                                        <line x1="0" y1="0" x2="30" y2="30" stroke="gray" />
                                                        <line x1="0" y1="30" x2="30" y2="0" stroke="gray" />
                                                    </svg>
                                                </a>
                                                <div class="sort-buttons">
                                                        <a class="sort-button button back" onclick="javascript:sortFileItem($(this).closest('.file-uploading-form'), <?php echo $customer_file['file_id']; ?>, false);" title="Передвинуть назад">
                                                        <span class="arrow"></span>
                                                    </a>
                                                    <a class="sort-button button forward" onclick="javascript:sortFileItem($(this).closest('.file-uploading-form'), <?php echo $customer_file['file_id']; ?>, true);" title="Передвинуть вперед">
                                                        <span class="arrow"></span>
                                                    </a>
                                                </div>
                                            </li>
                                            <?php } ?>
                                        <?php } ?>
                                      <?php } ?>
                                    </ul>
                                    <div class="upload-line">
                                        <input type="hidden" name="level" value="level_2" />
                                        <input type="hidden" name="purpose" value="level_2_operator" />
                                        <input type="hidden" name="filetype" value="image" />
                                        <a class="button upload-button" onclick="javascript:uploadFile($(this).closest('.file-uploading-form'));">Загрузить</a>
                                    </div>
                                  </div>
                              </div>
                          </div>
                          <div id="level-2-tab-2" class="level-2-question-tab">
                              <h3 class="tab-heading">
                                <span class="heading-text">Художник-постановщик</span>
                              </h3>
                              <div class="input-wrapper">
                                  <div class="label-wrapper">
                                      <label for="level-2-production-designer">Создайте цветную историю в картинках. 10 изображений в формате А-4: живопись, рисунок, композиция, сюжет. Загрузите сканы изображений в формате JPG.</label>
                                  </div>
                                  <div class="file-uploading-form">
                                    <ul class="uploaded-file-list image">
                                      <?php if(isset($customer_files['level_2_production_designer_image_story'])){ ?>
                                        <?php foreach($customer_files['level_2_production_designer_image_story'] as $customer_file){ ?>
                                            <?php if($customer_file['filetype'] == 'image'){ ?>
                                            <li class="list-item img">
                                                <a onclick="">
                                                  <img class="customer-image" src="<?php echo $customer_file['fullname']; ?>" alt="" title="" />
                                                </a>

                                                <a class="button remove-button" onclick="javascript:removeUploadedFile($(this).closest('.file-uploading-form'), <?php echo $customer_file['file_id']; ?>);">
                                                    <svg viewBox="0 0 30 30" xmlns="http://www.w3.org/2000/svg">
                                                        <line x1="0" y1="0" x2="30" y2="30" stroke="gray" />
                                                        <line x1="0" y1="30" x2="30" y2="0" stroke="gray" />
                                                    </svg>
                                                </a>
                                                <div class="sort-buttons">
                                                        <a class="sort-button button back" onclick="javascript:sortFileItem($(this).closest('.file-uploading-form'), <?php echo $customer_file['file_id']; ?>, false);" title="Передвинуть назад">
                                                        <span class="arrow"></span>
                                                    </a>
                                                    <a class="sort-button button forward" onclick="javascript:sortFileItem($(this).closest('.file-uploading-form'), <?php echo $customer_file['file_id']; ?>, true);" title="Передвинуть вперед">
                                                        <span class="arrow"></span>
                                                    </a>
                                                </div>
                                            </li>
                                            <?php } ?> 
                                            <?php if($customer_file['filetype'] == 'word_doc') { ?>
                                            <li class="list-item word-doc">
                                                <a class="download" href="<?php echo $customer_file['fullname']; ?>">
                                                    <img class="icon" src="catalog/view/theme/lifetravel/image/theme_images/Microsoft_Word_2013_logo.png" title="<?php echo $customer_file['filename']; ?>" alt="<?php echo $customer_file['filename']; ?>" />
                                                    <span class="filename"><?php echo $customer_file['filename']; ?></span>
                                                </a>

                                                <a class="button remove-button" onclick="javascript:removeUploadedFile($(this).closest('.file-uploading-form'), <?php echo $customer_file['file_id']; ?>);">
                                                    <svg viewBox="0 0 30 30" xmlns="http://www.w3.org/2000/svg">
                                                        <line x1="0" y1="0" x2="30" y2="30" stroke="gray" />
                                                        <line x1="0" y1="30" x2="30" y2="0" stroke="gray" />
                                                    </svg>
                                                </a>
                                                <div class="sort-buttons">
                                                        <a class="sort-button button back" onclick="javascript:sortFileItem($(this).closest('.file-uploading-form'), <?php echo $customer_file['file_id']; ?>, false);" title="Передвинуть назад">
                                                        <span class="arrow"></span>
                                                    </a>
                                                    <a class="sort-button button forward" onclick="javascript:sortFileItem($(this).closest('.file-uploading-form'), <?php echo $customer_file['file_id']; ?>, true);" title="Передвинуть вперед">
                                                        <span class="arrow"></span>
                                                    </a>
                                                </div>
                                            </li>
                                            <?php } ?>
                                        <?php } ?>
                                      <?php } ?>
                                    </ul>
                                    <div class="upload-line">
                                        <input type="hidden" name="level" value="level_2" />
                                        <input type="hidden" name="purpose" value="level_2_production_designer_image_story" />
                                        <input type="hidden" name="filetype" value="image" />
                                        <a class="button upload-button" onclick="javascript:uploadFile($(this).closest('.file-uploading-form'));">Загрузить</a>
                                    </div>
                                  </div>
                              </div>
                              <div class="text-after">
                                <span class="">Оригиналы пришлите почтой России по адресу:</span>
                                <span class="text-from">КОМУ</span>
                                123060, город Москва, улица Маршала Рыбалко, дом 3.  АНО " Агентство по международным проектам в области культуры, образования и спорта" программа Путевка в жизнь (ХУДОЖНИК-ПОСТАНОВЩИК)
                                <span class="text-to">ОТ КОГО</span>
                                Ф.И.О. участника, адрес и телефон
                              </div>
                          </div>
                          <div id="level-2-tab-3" class="level-2-question-tab">
                              <h3 class="tab-heading">
                                <span class="heading-text">Кинорежиссер</span>
                              </h3>
                              <div class="input-wrapper">
                                  <div class="label-wrapper">
                                      <label for="level-2-film-director-case-of-life">Напишите рассказ "Случай из жизни". Ярко и зрелищно опишите эпизод, свидетелем которого были Вы сами. Загрузите файл в формате Word, 3 страницы.</label>
                                  </div>
                                  <textarea id="level-2-film-director-case-of-life" name="level_2[film_director][case_of_life]"><?php echo isset($level_2['film_director']['case_of_life']) ? $level_2['film_director']['case_of_life'] : ''; ?></textarea>
                                  
                                  <div class="file-uploading-form">
                                    <ul class="uploaded-file-list doc">
                                      <?php if(isset($customer_files['level_2_film_director'])){ ?>
                                        <?php foreach($customer_files['level_2_film_director'] as $customer_file){ ?>
                                            <?php if($customer_file['filetype'] == 'image'){ ?>
                                            <li class="list-item img">
                                                <a onclick="">
                                                  <img class="customer-image" src="<?php echo $customer_file['fullname']; ?>" alt="" title="" />
                                                </a>

                                                <a class="button remove-button" onclick="javascript:removeUploadedFile($(this).closest('.file-uploading-form'), <?php echo $customer_file['file_id']; ?>);">
                                                    <svg viewBox="0 0 30 30" xmlns="http://www.w3.org/2000/svg">
                                                        <line x1="0" y1="0" x2="30" y2="30" stroke="gray" />
                                                        <line x1="0" y1="30" x2="30" y2="0" stroke="gray" />
                                                    </svg>
                                                </a>
                                                <div class="sort-buttons">
                                                        <a class="sort-button button back" onclick="javascript:sortFileItem($(this).closest('.file-uploading-form'), <?php echo $customer_file['file_id']; ?>, false);" title="Передвинуть назад">
                                                        <span class="arrow"></span>
                                                    </a>
                                                    <a class="sort-button button forward" onclick="javascript:sortFileItem($(this).closest('.file-uploading-form'), <?php echo $customer_file['file_id']; ?>, true);" title="Передвинуть вперед">
                                                        <span class="arrow"></span>
                                                    </a>
                                                </div>
                                            </li>
                                            <?php } ?> 
                                            <?php if($customer_file['filetype'] == 'word_doc') { ?>
                                            <li class="list-item word-doc">
                                                <a class="download" href="<?php echo $customer_file['fullname']; ?>">
                                                    <img class="icon" src="catalog/view/theme/lifetravel/image/theme_images/Microsoft_Word_2013_logo.png" title="<?php echo $customer_file['filename']; ?>" alt="<?php echo $customer_file['filename']; ?>" />
                                                    <span class="filename"><?php echo $customer_file['filename']; ?></span>
                                                </a>

                                                <a class="button remove-button" onclick="javascript:removeUploadedFile($(this).closest('.file-uploading-form'), <?php echo $customer_file['file_id']; ?>);">
                                                    <svg viewBox="0 0 30 30" xmlns="http://www.w3.org/2000/svg">
                                                        <line x1="0" y1="0" x2="30" y2="30" stroke="gray" />
                                                        <line x1="0" y1="30" x2="30" y2="0" stroke="gray" />
                                                    </svg>
                                                </a>
                                                <div class="sort-buttons">
                                                        <a class="sort-button button back" onclick="javascript:sortFileItem($(this).closest('.file-uploading-form'), <?php echo $customer_file['file_id']; ?>, false);" title="Передвинуть назад">
                                                        <span class="arrow"></span>
                                                    </a>
                                                    <a class="sort-button button forward" onclick="javascript:sortFileItem($(this).closest('.file-uploading-form'), <?php echo $customer_file['file_id']; ?>, true);" title="Передвинуть вперед">
                                                        <span class="arrow"></span>
                                                    </a>
                                                </div>
                                            </li>
                                            <?php } ?>
                                        <?php } ?>
                                      <?php } ?>
                                    </ul>
                                    <div class="upload-line">
                                        <input type="hidden" name="level" value="level_2" />
                                        <input type="hidden" name="purpose" value="level_2_film_director" />
                                        <input type="hidden" name="filetype" value="doc" />
                                        <a class="button upload-button" onclick="javascript:uploadFile($(this).closest('.file-uploading-form'));">Загрузить</a>
                                    </div>
                                  </div>

                              </div>
                          </div>
                          <div id="level-2-tab-4" class="level-2-question-tab">
                              <h3 class="tab-heading">
                                <span class="heading-text">Драматургия(сценарист)</span>
                              </h3>
                              <div class="input-wrapper">
                                  <div class="label-wrapper">
                                      <label>Напишите законченное произведение с началом, серединой и концом. На одну из выбранных тем. Формат Word, шрифт Times, 12 размер шрифта, интервал- 1,5 см, 3-5 страниц. Страницы пронумерованы.</label>
                                  </div>
                                  <div class="label-wrapper">
                                    <label for="level-2-dramaturgy-screenwriter-theme-1" class="sub-label">Тема 1</label>
                                    <label for="level-2-dramaturgy-screenwriter-theme-1">Ты превратился в муху. Летишь. Случайно слышишь разговор двоих. Узнаешь что-то очень важное. Кто они? О чем они говорят? Напиши диалог.</label>
                                  </div>
                                  <textarea id="level-2-dramaturgy-screenwriter-theme-1" name="level_2[dramaturgy_screenwriter][theme_1]"><?php echo isset($level_2['dramaturgy_screenwriter']['theme_1']) ? $level_2['dramaturgy_screenwriter']['theme_1'] : ''; ?></textarea>
                                  
                                  <div class="label-wrapper">
                                    <label for="level-2-dramaturgy-screenwriter-theme-2" class="sub-label">Тема 2</label>
                                    <label for="level-2-dramaturgy-screenwriter-theme-2">Запертая шкатулка, в которой что-то шуршало, и, казалось, пело, внезапно она сама открылась.  Ты в нее заглянул...Напиши, что в ней было и что случилось дальше.</label>
                                  </div>
                                  <textarea id="level-2-dramaturgy-screenwriter-theme-2" name="level_2[dramaturgy_screenwriter][theme_2]"><?php echo isset($level_2['dramaturgy_screenwriter']['theme_2']) ? $level_2['dramaturgy_screenwriter']['theme_2'] : ''; ?></textarea>
                                  <div class="label-wrapper">
                                    <label for="level-2-dramaturgy-screenwriter-theme-3" class="sub-label">Тема 3</label>
                                    <label for="level-2-dramaturgy-screenwriter-theme-3">Вы с другом отправились в лес. Друг потерялся. Ты нашел его следы. Они вели?... Что было дальше?</label>
                                  </div>
                                  <textarea id="level-2-dramaturgy-screenwriter-theme-3" name="level_2[dramaturgy_screenwriter][theme_3]"><?php echo isset($level_2['dramaturgy_screenwriter']['theme_3']) ? $level_2['dramaturgy_screenwriter']['theme_3'] : ''; ?></textarea>
                                  
                                  <div class="file-uploading-form">
                                    <ul class="uploaded-file-list doc">
                                      <?php if(isset($customer_files['level_2_dramaturgy_screenwriter'])){ ?>
                                        <?php foreach($customer_files['level_2_dramaturgy_screenwriter'] as $customer_file){ ?>
                                            <?php if($customer_file['filetype'] == 'image'){ ?>
                                            <li class="list-item img">
                                                <a onclick="">
                                                  <img class="customer-image" src="<?php echo $customer_file['fullname']; ?>" alt="" title="" />
                                                </a>

                                                <a class="button remove-button" onclick="javascript:removeUploadedFile($(this).closest('.file-uploading-form'), <?php echo $customer_file['file_id']; ?>);">
                                                    <svg viewBox="0 0 30 30" xmlns="http://www.w3.org/2000/svg">
                                                        <line x1="0" y1="0" x2="30" y2="30" stroke="gray" />
                                                        <line x1="0" y1="30" x2="30" y2="0" stroke="gray" />
                                                    </svg>
                                                </a>
                                                <div class="sort-buttons">
                                                        <a class="sort-button button back" onclick="javascript:sortFileItem($(this).closest('.file-uploading-form'), <?php echo $customer_file['file_id']; ?>, false);" title="Передвинуть назад">
                                                        <span class="arrow"></span>
                                                    </a>
                                                    <a class="sort-button button forward" onclick="javascript:sortFileItem($(this).closest('.file-uploading-form'), <?php echo $customer_file['file_id']; ?>, true);" title="Передвинуть вперед">
                                                        <span class="arrow"></span>
                                                    </a>
                                                </div>
                                            </li>
                                            <?php } ?> 
                                            <?php if($customer_file['filetype'] == 'word_doc') { ?>
                                            <li class="list-item word-doc">
                                                <a class="download" href="<?php echo $customer_file['fullname']; ?>">
                                                    <img class="icon" src="catalog/view/theme/lifetravel/image/theme_images/Microsoft_Word_2013_logo.png" title="<?php echo $customer_file['filename']; ?>" alt="<?php echo $customer_file['filename']; ?>" />
                                                    <span class="filename"><?php echo $customer_file['filename']; ?></span>
                                                </a>

                                                <a class="button remove-button" onclick="javascript:removeUploadedFile($(this).closest('.file-uploading-form'), <?php echo $customer_file['file_id']; ?>);">
                                                    <svg viewBox="0 0 30 30" xmlns="http://www.w3.org/2000/svg">
                                                        <line x1="0" y1="0" x2="30" y2="30" stroke="gray" />
                                                        <line x1="0" y1="30" x2="30" y2="0" stroke="gray" />
                                                    </svg>
                                                </a>
                                                <div class="sort-buttons">
                                                        <a class="sort-button button back" onclick="javascript:sortFileItem($(this).closest('.file-uploading-form'), <?php echo $customer_file['file_id']; ?>, false);" title="Передвинуть назад">
                                                        <span class="arrow"></span>
                                                    </a>
                                                    <a class="sort-button button forward" onclick="javascript:sortFileItem($(this).closest('.file-uploading-form'), <?php echo $customer_file['file_id']; ?>, true);" title="Передвинуть вперед">
                                                        <span class="arrow"></span>
                                                    </a>
                                                </div>
                                            </li>
                                            <?php } ?>
                                        <?php } ?>
                                      <?php } ?>
                                    </ul>
                                    <div class="upload-line">
                                        <input type="hidden" name="level" value="level_2" />
                                        <input type="hidden" name="purpose" value="level_2_dramaturgy_screenwriter" />
                                        <input type="hidden" name="filetype" value="doc" />
                                        <a class="button upload-button" onclick="javascript:uploadFile($(this).closest('.file-uploading-form'));">Загрузить</a>
                                    </div>
                                  </div>

                              </div>
                          </div>
                          <div id="level-2-tab-5" class="level-2-question-tab">
                              <h3 class="tab-heading">
                                <span class="heading-text">Продюсерство в кинопроизводстве</span>
                              </h3>
                              <div class="input-wrapper">
                                  <div class="label-wrapper">
                                    <label for="level-2-production-in-filmmaking-question-1">1. Почему я выбрал профессию продюсера?</label>
                                  </div>
                                  <input id="level-2-production-in-filmmaking-question-1" type="text" name="level_2[production_in_filmmaking][question_1]" value="<?php echo isset($level_2['production_in_filmmaking']['question_1']) ? $level_2['production_in_filmmaking']['question_1'] : ''; ?>" />
                              </div>
                              <div class="input-wrapper">
                                  <div class="label-wrapper">
                                    <label for="level-2-production-in-filmmaking-question-2">2. Почему я хочу учиться именно в этом киновузе?</label>
                                  </div>
                                  <input id="level-2-production-in-filmmaking-question-2" type="text" name="level_2[production_in_filmmaking][question_2]" value="<?php echo isset($level_2['production_in_filmmaking']['question_2']) ? $level_2['production_in_filmmaking']['question_2'] : ''; ?>" />
                              </div>
                              <div class="input-wrapper">
                                  <div class="label-wrapper">
                                      <label for="level-2-production-in-filmmaking-question-3">3. Какой фильм я, как продюсер, хотел бы создать (жанр, аудитория, бюджет)?</label>
                                  </div>
                                  <input id="level-2-production-in-filmmaking-question-3" type="text" name="level_2[production_in_filmmaking][question_3]" value="<?php echo isset($level_2['production_in_filmmaking']['question_3']) ? $level_2['production_in_filmmaking']['question_3'] : ''; ?>" />
                              </div>
                              <div class="input-wrapper">
                                  <div class="label-wrapper">
                                     <label for="level-2-production-in-filmmaking-question-4">4. Какое литературное произведение Вас потрясло, и какой герой этого произведения заслуживает подражания?</label>
                                  </div>
                                  <input id="level-2-production-in-filmmaking-question-4" type="text" name="level_2[production_in_filmmaking][question_4]" value="<?php echo isset($level_2['production_in_filmmaking']['question_4']) ? $level_2['production_in_filmmaking']['question_4'] : ''; ?>" />
                              </div>
                              <div class="input-wrapper">
                                  <div class="label-wrapper">
                                      <label for="level-2-production-in-filmmaking-question-5">5. Какое музыкальное произведение (классика) Вы бы использовали при съёмках (сказки, комедии, драмы и т.п.)?</label>
                                  </div>
                                  <input id="level-2-production-in-filmmaking-question-5" type="text" name="level_2[production_in_filmmaking][question_5]" value="<?php echo isset($level_2['production_in_filmmaking']['question_5']) ? $level_2['production_in_filmmaking']['question_5'] : ''; ?>" />
                              </div>
                              <div class="input-wrapper">
                                  <div class="label-wrapper">
                                      <label for="level-2-production-in-filmmaking-question-6">6. При съёмках какого фильма (жанр) Вы бы обратились к произведениям изобразительного искусства?</label>
                                  </div>
                                  <input id="level-2-production-in-filmmaking-question-6" type="text" name="level_2[production_in_filmmaking][question_6]" value="<?php echo isset($level_2['production_in_filmmaking']['question_6']) ? $level_2['production_in_filmmaking']['question_6'] : ''; ?>" />
                              </div>
                              <div class="input-wrapper">
                                  <div class="label-wrapper">
                                     <label for="level-2-production-in-filmmaking-question-7">7. Если бы у Вас была машина времени, к какому режиссёру-классику Вы бы хотели попасть на съёмочную площадку?</label>
                                  </div>
                                  <input id="level-2-production-in-filmmaking-question-7" type="text" name="level_2[production_in_filmmaking][question_7]" value="<?php echo isset($level_2['production_in_filmmaking']['question_7']) ? $level_2['production_in_filmmaking']['question_7'] : ''; ?>" />
                              </div>
                          </div>
                          <div id="level-2-tab-6" class="level-2-question-tab">
                              <h3 class="tab-heading">
                                <span class="heading-text">Актерское мастерство</span>
                              </h3>
                              <div class="input-wrapper">
                                  <div class="label-wrapper">
                                      <label for="level-2-acting-skills-video-url">1. Запишите на видео, где Вы читаете стихотворение - Б. Пастернака «Быть знаменитым некрасиво» и прозу: для девушек- монолог Катерины из пьесы А.Н. Островского "Гроза": «Я говорю, отчего люди не летают так, как птицы ?...», для юношей - Монолог Печорина княжне Мери из М. Лермонтова «Герой нашего времени»: « Да, такова была моя участь с самого детства…».</label>
                                  </div>
                                  <div class="label-wrapper">
                                      <label for="level-2-acting-skills-video-url">Вставьте ссылку на видео:</label>
                                  </div>
                                  <input id="level-2-acting-skills-video-url" type="text" name="level_2[acting_skills][video_url]" value="<?php echo isset($level_2['acting_skills']['video_url']) ? $level_2['acting_skills']['video_url'] : ''; ?>" />
                              </div>
                          </div>
                          <div id="level-2-tab-7" class="level-2-question-tab">
                              <h3 class="tab-heading">
                                <span class="heading-text">Звукорежиссер</span>
                              </h3>
                              <div class="input-wrapper">
                                  <div class="label-wrapper">
                                      <label>Укажите, какое произведение или композицию Вы бы использовали для озвучивания:</label>
                                  </div>
                                  <div class="label-wrapper">
                                      <label for="level-2-soundproducer-detective" class="sub-label">1. Детективного фильма:</label>
                                  </div>
                                  <input id="level-2-soundproducer-detective" type="text" name="level_2[soundproducer][detective]" value="<?php echo isset($level_2['soundproducer']['detective']) ? $level_2['soundproducer']['detective'] : ''; ?>" />
                                  <div class="label-wrapper">
                                      <label for="level-2-soundproducer-melodrama" class="sub-label">2. Мелодрамы:</label>
                                  </div>
                                  <input id="level-2-soundproducer-melodrama" type="text" name="level_2[soundproducer][melodrama]" value="<?php echo isset($level_2['soundproducer']['melodrama']) ? $level_2['soundproducer']['melodrama'] : ''; ?>" />
                                  <div class="label-wrapper">
                                      <label for="level-2-soundproducer-comedy" class="sub-label">3. Комедии:</label>
                                  </div>
                                  <input id="level-2-soundproducer-comedy" type="text" name="level_2[soundproducer][comedy]" value="<?php echo isset($level_2['soundproducer']['comedy']) ? $level_2['soundproducer']['comedy'] : ''; ?>" />
                                  <div class="label-wrapper">
                                      <label for="level-2-soundproducer-triller" class="sub-label">4. Триллера:</label>
                                  </div>
                                  <input id="level-2-soundproducer-triller" type="text" name="level_2[soundproducer][triller]" value="<?php echo isset($level_2['soundproducer']['triller']) ? $level_2['soundproducer']['triller'] : ''; ?>" />
                                  <div class="label-wrapper">
                                      <label for="level-2-soundproducer-fantasy" class="sub-label">5. Фэнтези:</label>
                                  </div>
                                  <input id="level-2-soundproducer-fantasy" type="text" name="level_2[soundproducer][fantasy]" value="<?php echo isset($level_2['soundproducer']['fantasy']) ? $level_2['soundproducer']['fantasy'] : ''; ?>" />
                                  <div class="label-wrapper">
                                      <label for="level-2-soundproducer-drama" class="sub-label">6. Драмы:</label>
                                  </div>
                                  <input id="level-2-soundproducer-drama" type="text" name="level_2[soundproducer][drama]" value="<?php echo isset($level_2['soundproducer']['drama']) ? $level_2['soundproducer']['drama'] : ''; ?>" />
                              </div>
                          </div>
                      </div>
                      <div class="buttons">
                        <a class="button submit-button" onclick="javacript:$(this).closest('#level-2-data-form').submit();">Сохранить</a>
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
    
    function saveLevelData(){
        var form = $(event.target).closest('form');
        
        $.ajax({
            url: '<?php echo $save_customer_level_data; ?>',
            method: 'POST',
            data: form.serialize(),
            success: function(response_data){
                var response_data = JSON.parse(response_data);
                
                $(document).notify(response_data);
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
        
        $('.file-uploading-form .uploaded-file-list.image').each(function(index, element){
            console.log(element);

            $(element).imageSlider();
        });
    });
</script>
