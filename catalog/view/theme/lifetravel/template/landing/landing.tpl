<?php echo $header; ?>
<div class="landing-page">
    <?php echo $navbar; ?>
    <div id="headline" class="screen-container screen-1">
        <div class="container-row">
            <div class="logos">
                <div class="logo-wrapper">
                    <img class="logo foundation" src="/catalog/view/theme/lifetravel/image/theme_images/logo/grant_foundation.png" title="Фонд президентских грантов" alt="Фонд президентских грантов" />
                </div>
                <div class="logo-wrapper">
                    <img class="logo ipces" src="/catalog/view/theme/lifetravel/image/theme_images/logo/_ipces_tr_BIG.png" title="IPCES production" alt="IPCES production" />
                </div>
            </div>
            <h2 class="heading">Проект поддержки талантливых детей в рамках<br />
                Санкт-Петербургского международного кинофестиваля «МИРОВОЙ»</h2>
           <h1 class="heading-2">«ПУТЕВКА В ЖИЗНЬ»<br />ВАШ СТАРТ В КИНО</h1>
           <h3 class="heading-dates">ноябрь 2018 - июнь 2020</h3>
           <a href="<?php echo $registration; ?>" class="registration-link">Регистрация</a>
           <?php if(isset($registration_end_date)){ ?>
           <span class="registration-end-date">до <?php echo $registration_end_date; ?></span>
           <?php } ?>
        </div>
    </div>

    <div id="program-description" class="screen-container screen-2">
        <div class="container-row">
            <div class="top-area">
                <div class="left-side">
                    <h2 class="heading">«Путевка в жизнь» -<br />программа для подростков, <br />обладающих желанием и способностями<br />к обретению творческих специальностей <br />в сфере киноискусства.</h2>
                    <a class="detailed-link" onclick="javascript:$(this).closest('.container-row').find('.detailed-text').toggleClass('active');">Подробнее...</a>
                </div>
                <div class="right-side">
                    <div class="video">
                        <iframe width="789" height="444" src="https://www.youtube.com/embed/WqTbsH4tFkE" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    </div>
                    <a href="<?php echo $registration; ?>" class="registration-link">Регистрация</a>
                </div>
            </div>
            <div class="detailed-text">
                Программа «Путёвка в жизнь» проводится в рамках Санкт-Петербургского международного кинофестиваля «Мировой» и поможет талантливым детям-подросткам 14-18 лет из всех регионов РФ определиться в вопросе выбора профессии и реализации себя в сфере кинопроизводства. 
Первый этап программы «Путёвка в жизнь» стал победителем конкурса Фонда президентских грантов и проводится во Владимирской области с 21.11.2018 по 31.03.2018.
            Подобно одноимённому фильму Николая Экка, «Путевка в жизнь» даст возможность талантливым детям, в том числе детям, нуждающимся в социальной поддержке, найти своё место в жизни и откроет им путь в большой кинематограф.  
	Подростки узнают больше о кинопрофессиях, попробуют себя в роли участников съемочной группы, реализуют свой творческий потенциал. Ребята убедятся, что получение специальности в сфере кино для них доступно и не является преимуществом избранных. 
	В сопровождении профессионалов участники программы создадут фильм о Родном Крае, который будет представлен на международном кинофестивале «Мировой». А самые талантливые ребята получат гранты на обучение в лучших киновузах России. 
	Благодаря программе «Путевка в жизнь» в нашей стране в будущем появятся кинематографисты, которые смогут поднять отечественное киноискусство на новый уровень.
            </div>
            <span class="free-price-text">Участие в программе бесплатное.</span>
        </div>
    </div>

    <div id="levels" class="screen-container screen-3">
        <div class="container-row">
            <div class="slider levels-slider">
                <div id="slideshow0" class="carousel-slideshow">
                    <div class="visible-area">
                        <ul class="slides-container">
                            <li class="item slide level level-1 level-steps">
                                <h3 class="slide-heading">Первый этап программы</h3>
                                <a class="registration-link" href="<?php echo $registration; ?>">Пройдите регистрацию</a>
                                <span>Подтвердите регистрацию по электронной почте</span>
                                <span>Получите доступ к Вашему Личному кабинету для дальнейшего участия в программе</span>
                                <!-- span>Регистрация осуществляется до 31.12.2018 включительно (дату можно менять)<br />
                 с 01.01.2019 00:01 появляется красным надпись: «Регистрация завершена»</span -->
                            </li>
                            <li class="item slide level level-2">
                                <span class="text-line-1">Напишите эссе (сценарий) и ответьте развернуто на несколько вопросов в <a href="<?php echo $personal_account; ?>" class="personal-account-link">Вашем Личном кабинете</a></span>
                                <span class="text-line-2">Получите оценку <a href="#expert-jury" class="expert-jury-link">Экспертного Жюри</a> и приглашение для участия во Втором этапе программы «Путевка в жизнь»</span>
                                <a class="detailed-link" onclick="javascript:$(this).closest('.level').find('.detailed-text').toggleClass('active');">Подробнее...</a>
                                <span class="detailed-text">
                                    До 20.01.2019 включительно зарегистрировавшиеся Участники Первого этапа программы «Путевка в жизнь» выполняют творческое задание – написание эссе-сценария короткометражного документального фильма о Родном Крае (Владимирская область, один из городов области, любимое место, интересный случай или история, связанные с Владимирской областью и т.п.). Участникам нужно написать, каким они видят фильм и как хотели бы его снять, какие сюжеты, места или люди войдут в этот фильм, какую музыку предполагают использовать в фильме и т.д.  
                                    Участники отправляют готовый сценарий через <a href="<?php echo $personal_account; ?>" class="personal-account-link">Личный кабинет</a> и ожидают оценку <a href="#expert-jury" class="expert-jury-link">Жюри</a>.
    После проверки работ выставленные Оценки отображаются в Личном кабинете Участников.
    В личном кабинете Участников, которые прошли во Второй этап, появится надпись: «Победитель Этапа 1» и откроется Доступ к участию в «Этап 2».
    По итогам конкурса 500 лучших Участников будут приглашены на Второй этап программы
                                </span>
                            </li>
                            <li class="item slide level level-3">
                                <h3 class="slide-heading">Второй этап программы</h3>
                                <span>Примите участие в однодневной выездной обучающей сессии</span>
                                <span>Послушайте лекции и пообщайтесь с лучшими преподавателями ведущих российских киноВУЗов</span>
                                <span>Пройдите тестирование по профориентации</span>
                                <span>Узнайте, какая профессия в кино принесет вам наибольший успех</span>
                                <a class="detailed-link" onclick="javascript:$(this).closest('.level').find('.detailed-text').toggleClass('active');">Подробнее...</a>
                                <span class="detailed-text">Участники, успешно преодолевшие Первый этап программы, будут приглашены на один день образовательной сессии в город Суздаль, чтобы прослушать вводный экскурс в профессии киноискусства и пройти тест по профориентации.
                                    Сессия пройдет в большом зале ГТК «Суздаль». Участники послушают профессоров ВГИКа и зададут интересующие вопросы лекторам. В Программу этого дня войдут мастер-классы, обучающие фильмы, интервью и подготовленные учебные материалы. 
                                    Завершит образовательную сессию тестирование на профориентацию в сфере кино. Результаты тестов будут собраны и отправлены для обработки и оценки специалистам. Все участники получат рекомендации, в какой специальности они наилучшим образом могут реализовать свои способности. Участники получат комплекты с информационными и учебными материалами, которые помогут узнать, как и где получить выбранное образование и подготовиться к поступлению. 
                                    Все участники Второго этапа получат сертификаты о прохождении обучающей сессии и подарки. Молодые люди, набравшие наибольшее количество баллов по результатам двух этапов, получат право на участие в Третьем этапе.
                                    <br />Дата проведения обучающей сессии: 30.01 2019
                                    <br />Место проведения: ГТК «Суздаль» (г. Суздаль, Владимирская область)
                                </span>
                            </li>
                            <li class="item slide level level-4">
                                <h3 class="slide-heading">Третий этап программы</h3>
                                <span class="">Снимите свой первый короткометражный фильм вместе с профессиональной съемочной группой!</span>
                                <a class="detailed-link" onclick="javascript:$(this).closest('.level').find('.detailed-text').toggleClass('active');">Подробнее...</a>
                                <span class="detailed-text">Участники третьего этапа (около 20 человек) пройдут практику через участие в съемке короткометражного фильма о Родном Крае. 
                                    Вместе с профессиональной съемочной командой: 
                                    <ul class="level-steps">
                                        <li>- поработают со своими эссе (сценариями) и напишут окончательный сценарий; </li>
                                        <li>- разработают режиссерский сценарий и экспликации; </li>
                                        <li>- определят места съемок;</li>
                                        <li>- снимут фильм;</li>
                                        <li>- сделают монтаж фильма.</li>
                                    </ul>                            
                                    Отснятый фильм войдет в Российский государственный архив кинофотодокументов и кинофонд Владимирской области. Материалы фильма войдут в полнометражный документальный фильм о России, премьера которого состоится на Санкт-Петербургском международном кинофестивале «Мировой» в июле 2020 года.
                                </span>
                            </li>
                            <li class="item slide level level-5">
                                <h3 class="slide-heading">Финальный этап программы</h3>
                                <span>Станьте победителем Программы в своем регионе и примите участие в Санкт-Петербургском международном кинофестивале «Мировой»</span>
                                <a class="detailed-link" onclick="javascript:$(this).closest('.level').find('.detailed-text').toggleClass('active');">Подробнее...</a>
                                <span class="detailed-text">Участники, прошедший в финальный Четвертый этап Программы, будут приглашены на Санкт-Петербургский международный кинофестиваль «Мировой», где пройдут 8-дневный обучающий курс-интенсив и                                      
                                    будут участвовать во всех мероприятиях фестиваля:
                                    <ul class="level-steps">
                                        <li>просмотре фильмов внеконкурсной программы;</li>
                                        <li>открытых уроках и мастер-классах известных кинематографистов;</li>
                                        <li>тематических круглых столах-конференциях;</li>
                                        <li>церемониях открытия-закрытия фестиваля и т. д.</li>
                                    </ul>
                                    В завершение кинофестиваля Участники финального Четвертого этапа будут премированы грантом Губернатора своего региона на место в КиноВУЗе, в котором они смогут получить кинообразование. 
                                </span>
                            </li>
                        </ul>
                    </div>
                    <div class="controls">
                        <div class="direction-arrows">
                            <span class="arrow arrow-left"></span>
                            <span class="arrow arrow-right"></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="expert-jury" class="screen-container screen-4">
        <div class="container-row">
            <h3 class="screen-heading">Экспертное жюри программы «Путевка в жизнь» </h3>
            <ul class="jury-list">
                <li>
                    <img class="jury-photo" src="/catalog/view/theme/lifetravel/image/theme_images/jury/vasilchenko.jpg" alt="Васильченко Виталий Николаевич" title="Васильченко Виталий Николаевич" />
                    <div class="jury-info-wrapper">
                        <span class="jury-position">Куратор специальности «ИСПОЛНИТЕЛЬНЫЙ ПРОДЮСЕР»</span>
                        <span class="jury-name">Васильченко Виталий Николаевич</span>
                        <span class="jury-description">Профессор, руководитель мастерской «Исполнительный продюсер» на Высших курсах кино и телевидения Всероссийского государственного института кинематографии имени С. А. Герасимова (ВК КиТ ВГИК). Почетный кинематографист России. Член Правления Союза кинематографистов России. Член Правления Гильдии организаторов производства и прокатов фильмов.</span>
                    </div>
                </li>
                <li>
                    <img class="jury-photo" src="/catalog/view/theme/lifetravel/image/theme_images/jury/marievskaya.png" alt="Мариевская Наталья Евгеньевна" title="Мариевская Наталья Евгеньевна" />
                    <div class="jury-info-wrapper">
                        <span class="jury-position">Куратор специальности «КИНОДРАМАТУРГ (СЦЕНАРИСТ)»</span>
                        <span class="jury-name">Мариевская Наталья Евгеньевна</span>
                        <span class="jury-description">Профессор, доктор искусствоведения, доцент, зам. заведующего кафедрой драматургии кино Всероссийского государственного института кинематографии имени С. А. Герасимова (ВГИК), обладатель специальных призов российских и международных кинофестивалей.</span>
                    </div>
                </li>
                <li>
                    <img class="jury-photo" src="/catalog/view/theme/lifetravel/image/theme_images/jury/skuybin.jpg" alt="Скуйбин Николай Владимирович" title="Скуйбин Николай Владимирович" />
                    <div class="jury-info-wrapper">
                        <span class="jury-position">Куратор специальности «РЕЖИССЁР-ПОСТАНОВЩИК»</span>
                        <span class="jury-name">Скуйбин Николай Владимирович</span>
                        <span class="jury-description">Профессор, декан режиссёрского факультета Всероссийского государственного института кинематографии имени С. А. Герасимова (ВГИК), руководитель мастерской на режиссёрском факультете ВГИК.</span>
                    </div>
                </li>
                <li>
                    <img class="jury-photo" src="/catalog/view/theme/lifetravel/image/theme_images/jury/agranovich.jpg" alt="Агранович Михаил Леонидович" title="Агранович Михаил Леонидович" />
                    <div class="jury-info-wrapper">
                        <span class="jury-position">Куратор специальности «ОПЕРАТОР-ПОСТАНОВЩИК»</span>
                        <span class="jury-name">Агранович Михаил Леонидович</span>
                        <span class="jury-description">Профессор, заслуженный деятель искусств РСФСР, заведующий кафедрой кинооператорского мастерства Всероссийского государственного института кинематографии имени С. А. Герасимова (ВГИК), руководитель мастерской на кинооператорском факультете ВГИК.</span>
                    </div>
                </li>
                <li>
                    <img class="jury-photo" src="/catalog/view/theme/lifetravel/image/theme_images/jury/arhipov.jpg" alt="Архипов Валерий Валентинович" title="Архипов Валерий Валентинович" />
                    <div class="jury-info-wrapper">
                        <span class="jury-position">Куратор специальности «ХУДОЖНИК-ПОСТАНОВЩИК»</span>
                        <span class="jury-name">Архипов Валерий Валентинович</span>
                        <span class="jury-description">Профессор, заслуженный художник России, декан художественного факультета Всероссийского государственного института кинематографии имени С. А. Герасимова (ВГИК), член Московского Союза художников, художник-постановщик киностудии «Мосфильм».</span>
                    </div>
                </li>
                <li>
                    <img class="jury-photo" src="/catalog/view/theme/lifetravel/image/theme_images/jury/kalina_svetlana.jpg" alt="Калина Светлана Андреевна" title="Калина Светлана Андреевна" />
                    <div class="jury-info-wrapper">
                        <span class="jury-position">Психолог</span>
                        <span class="jury-name">Калина Светлана Андреевна</span>
                        <span class="jury-description">Клинический психолог, Системный семейный консультант, действительный член
                            Профессиональной Психотерапевтической Лиги, ассистент кафедры психотерапии
                            РНИМУ им. Н.И.Пирогова.</span>
                    </div>
                </li>
                <li>
                    <img class="jury-photo" src="/catalog/view/theme/lifetravel/image/theme_images/jury/gurn.jpg" alt="Гурницкая Ирина Александровна" title="Гурницкая Ирина Александровна" />
                    <div class="jury-info-wrapper">
                        <span class="jury-position">Руководитель программы «Путевка в жизнь»</span>
                        <span class="jury-name">Гурницкая Ирина Александровна</span>
                        <span class="jury-description">Генеральный директор АНО "Агентство по международным проектам в области культуры, образования и спорта"</span>
                    </div>
                </li>
                <li>
                    <img class="jury-photo" src="/catalog/view/theme/lifetravel/image/theme_images/jury/nurmatova.jpg" alt="Нурматова Ирина Юрьевна" title="Нурматова Ирина Юрьевна" />
                    <div class="jury-info-wrapper">
                        <span class="jury-position">Административный директор программы «Путевка в жизнь»</span>
                        <span class="jury-name">Нурматова Ирина Юрьевна</span>
                        <span class="jury-description">Исполнительный директор АНО " Агентство по международным проектам в области культуры, образования и спорта"</span>
                    </div>
                </li>
                <li>
                    <img class="jury-photo" src="/catalog/view/theme/lifetravel/image/theme_images/jury/sidler.jpg" alt="Сидлер Мария Ильинична" title="Сидлер Мария Ильинична" />
                    <div class="jury-info-wrapper">
                        <span class="jury-position">Технический директор программы «Путевка в жизнь»</span>
                        <span class="jury-name">Сидлер Мария Ильинична</span>
                        <span class="jury-description">Ведущий менеджер по работе с партнерами АНО " Агентство по международным проектам в области культуры, образования и спорта"</span>
                    </div>
                </li>
                <li>
                    <img class="jury-photo" src="/catalog/view/theme/lifetravel/image/theme_images/jury/karina_gurnitskaya.jpg" alt="Карина Гурницкая" title="Карина Гурницкая" />
                    <div class="jury-info-wrapper">
                        <span class="jury-position">Координатор программы «Путевка в жизнь»</span>
                        <span class="jury-name">Карина Гурницкая</span>
                        <span class="jury-description"></span>
                    </div>
                </li>
            </ul>
            <a href="" class="detailed-link">Подробнее...</a>
        </div>
    </div>

    <div id="teaching-session" class="screen-container screen-5">
        <div class="container-row">
            <h3 class="screen-heading">Обучающая сессия </h3>
            <ul class="session-location-points">
                <li class="session-point">
                    <span class="session-date">Дата проведения обучающей сессии: 20.01 2019 </span>
                    <span class="session-location">Место проведения: ГТК «Суздаль» ( Владимирская область, город Суздаль, улица Коровники 45)</span>
                    <!-- span class="session-program">Программа сессии: <a href="" class="detailed-link">Подробнее...</a></span -->
                    <div class="locations">
                        <div class="map">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2206.1671691760266!2d40.42553381603327!3d56.43041784699306!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x414c8ca95bde6445%3A0x661ba621eca3abe8!2sGtk+Suzdal!5e0!3m2!1sen!2sua!4v1546399160577" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
                        </div>
                        <div class="photo">
                            <img src="/catalog/view/theme/lifetravel/image/theme_images/address_map_1.jpg" alt="ГТК «Суздаль»" title="ГТК «Суздаль»" />
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>

    <div id="organizer" class="screen-container screen-6">
        <div class="container-row">
            <h3 class="screen-heading">Организатор и инициатор программы 
                <a class="" href="https://www.ipces-production.com/">Автономная некоммерческая организация «Агентство по международным проектам в области культуры, образования и спорта» (IPCES PRODUCTION)</a>
            </h3>
            <span class="sub-heading">Реализует проекты на территории РФ и за рубежом с 2008 года.</span>
            <span class="sub-heading">Программа "Путевка в жизнь" реализуется при финансовой поддержке:</span>
            <div class="logos">
                <div class="logo logo-foundation">
                    <img class="" src="/catalog/view/theme/lifetravel/image/theme_images/logo/grant_foundation.png" alt="Фонд президентских грантов" title="Фонд президентских грантов" />
                </div>
                <div class="logo ipces-logo">
                    <img class="" src="/catalog/view/theme/lifetravel/image/theme_images/logo/_ipces_tr_BIG.png" title="IPCES" alt="IPCES" />
                </div>
            </div>
            <span class="assistance-heading">При поддержке:</span>
            <div class="logo-carousel-wrapper">
                <div class="logo-carousel">
                    <div class="carousel-item">
                        <img class="carousel-item-image" src="/catalog/view/theme/lifetravel/image/theme_images/logo/administraciya_vladimirskoy_oblasti.png" alt="Администрация Владимирской области" title="Администрация Владимирской области" />
                    </div>
                    <div class="carousel-item">
                        <img class="carousel-item-image" src="/catalog/view/theme/lifetravel/image/theme_images/logo/mosfilm_logo.jpg" alt="Мосфильм" title="Мосфильм" />
                    </div>
                    <div class="carousel-item">
                        <img class="carousel-item-image" src="/catalog/view/theme/lifetravel/image/theme_images/logo/lenfilm_logo.png" alt="Ленфильм" title="Ленфильм" />
                    </div>
                    <div class="carousel-item">
                        <img class="carousel-item-image" src="/catalog/view/theme/lifetravel/image/theme_images/logo/gosduma_logo.jpg" alt="Государственная дума РФ" title="Государственная дума РФ" />
                    </div>
                    <div class="carousel-item">
                        <img class="carousel-item-image" src="/catalog/view/theme/lifetravel/image/theme_images/logo/nevafilm_logo.png" alt="Невафильм" title="Невафильм" />
                    </div>
                    <div class="carousel-item">
                        <img class="carousel-item-image" src="/catalog/view/theme/lifetravel/image/theme_images/logo/logo-mincult.png" alt="Министерство культуры РФ" title="Министерство культуры РФ" />
                    </div>
                    <div class="carousel-item">
                        <img class="carousel-item-image" src="/catalog/view/theme/lifetravel/image/theme_images/logo/moskov_culture_department.jpg" alt="Департамент культуры Москвы" title="Департамент культуры Москвы" />
                    </div>
                    <div class="carousel-item">
                        <img class="carousel-item-image" src="/catalog/view/theme/lifetravel/image/theme_images/logo/vladimir_region_culture_department.jpg" alt="Департамент культуры Владимирской области" title="Департамент культуры Владимирской области" />
                    </div>
                    <div class="carousel-item">
                        <img class="carousel-item-image" src="/catalog/view/theme/lifetravel/image/theme_images/logo/logo-departament_vo.png" alt="Департамент образования Владимирской области" title="Департамент образования Владимирской области" />
                    </div>
                    <div class="carousel-item">
                        <img class="carousel-item-image" src="/catalog/view/theme/lifetravel/image/theme_images/logo/russian_geo.jpg" alt="Русское географическое ощество" title="Русское географическое ощество" />
                    </div>
                    <div class="carousel-item">
                        <img class="carousel-item-image" src="/catalog/view/theme/lifetravel/image/theme_images/logo/rostex.jpg" alt="Госкорпорация РОСТЕХ" title="Госкорпорация РОСТЕХ" />
                    </div>
                    <div class="carousel-item">
                        <img class="carousel-item-image" src="/catalog/view/theme/lifetravel/image/theme_images/logo/АВК.jpg" alt="Ассоциация владельцев кинотеатров России" title="Ассоциация владельцев кинотеатров России" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="background-container">
        <img class="background background-0 active" src="/catalog/view/theme/lifetravel/image/theme_images/background/1459078271127742859.jpg" />
        <img class="background background-1" src="/catalog/view/theme/lifetravel/image/theme_images/background/filmstrip_91434_960_720.jpg" />
        <img class="background background-2" src="/catalog/view/theme/lifetravel/image/theme_images/background/proekt-znimaemo-kino.8@2x.jpg" />
        <img class="background background-3" src="/catalog/view/theme/lifetravel/image/theme_images/background/Киноплёнка. Иллюстрация к материалу ИА REGNUM.jpg" />
        <img class="background background-4" src="/catalog/view/theme/lifetravel/image/theme_images/background/Киносъёмка. Иллюстрация к материалу ИА REGNUM.JPG" />
        <img class="background background-5" src="/catalog/view/theme/lifetravel/image/theme_images/background/Кинотеатр. Иллюстрация к материалу ИА REGNUM.JPG" />
        <img class="background background-6" src="/catalog/view/theme/lifetravel/image/theme_images/background/ТРК Суздаль _зал на 500 мест_2 этап.jpg" />
    </div>
</div>
<?php echo $footer; ?>

<script type="text/javascript">
    $(document).ready(function(){
        $('.logo-carousel').slick({
            infinite: true,
            slidesToShow: 5,
            slidesToScroll: 5,
            arrows: true,
            adaptiveHeight: true
        });
        
        var _carousel = $('.logo-carousel');
        _carousel.find('.slick-arrow').html('');
    });
</script>

<script type="text/javascript">
    $(document).ready(function(){
        window._background_container = $('#background-container');
        window._doc_height = $(document).height();
        window._bg_length = _background_container.find('.background').length;
        window._scroll_bg_height = window._doc_height / window._bg_length;
        window._current_bg = 1;
    });

    $(document).scroll(function(){
        var top_pos = $(document).scrollTop();
        var bg_screen = (top_pos == 0) ? 0 : Math.round(top_pos / window._scroll_bg_height);
        
        if (bg_screen != window._current_bg) {
            window._background_container.find('.active').removeClass('active');
            window._background_container.find('.background-' + bg_screen).addClass('active');
            
            window._current_bg = bg_screen;
        }
    });
</script>

<script type="text/javascript">
    <?php $module = 0; ?>
    var slideshow0_current_slide = 0;
    
    $(document).ready(function () {
        var _carousel = $('#slideshow<?php echo $module; ?>');
        var _width   = _carousel.find('.visible-area').width();
        var _height  = _carousel.find('.visible-area').height();
        var _length  = _carousel.find('.visible-area .slides-container .item').length;
        
        _carousel.find('.slides-container .item').each(function(){
            $(this).css('width', _width + 'px');
            $(this).css('height', _height + 'px');
        });
        
        // Init current button
        slideshow_<?php echo $module; ?>_GoToSlide(_carousel, window.slideshow<?php echo $module; ?>_current_slide);
        
        // Init arrows
        _carousel.find('.controls .direction-arrows .arrow-left').click(function(){
            if (window.slideshow<?php echo $module; ?>_current_slide <= 0) {
                window.slideshow<?php echo $module; ?>_current_slide = _length - 1;
            } else {
                window.slideshow<?php echo $module; ?>_current_slide--;
            }
            
            slideshow_<?php echo $module; ?>_GoToSlide(_carousel, window.slideshow<?php echo $module; ?>_current_slide);
        });
        
        _carousel.find('.controls .direction-arrows .arrow-right').click(function(){
            if (window.slideshow<?php echo $module; ?>_current_slide >= _length - 1) {
                window.slideshow<?php echo $module; ?>_current_slide = 0;
            } else {
                window.slideshow<?php echo $module; ?>_current_slide++;
            }
            
            slideshow_<?php echo $module; ?>_GoToSlide(_carousel, window.slideshow<?php echo $module; ?>_current_slide);
        });
        
        // Init pagination buttons
        _carousel.find('.controls .pagination > a').each(function(index, element){
            $(this).click(function(){
                window.slideshow<?php echo $module; ?>_current_slide = index;
                slideshow_<?php echo $module; ?>_GoToSlide(_carousel, window.slideshow<?php echo $module; ?>_current_slide);
            });
        });
        
        // Init autoscroll
        setInterval(function(){
            if (window.slideshow<?php echo $module; ?>_current_slide >= _length - 1) {
                window.slideshow<?php echo $module; ?>_current_slide = 0;
            } else {
                window.slideshow<?php echo $module; ?>_current_slide++;
            }
            
            slideshow_<?php echo $module; ?>_GoToSlide(_carousel, window.slideshow<?php echo $module; ?>_current_slide);
        }, 50000);
    });
    
    function slideshow_<?php echo $module; ?>_GoToSlide(carousel, slideNumber) {
        // Pagination
        carousel.find('.controls .pagination .current').removeClass('current');
        carousel.find('.controls .pagination .slideshow<?php echo $module; ?>__button_slide_' + slideshow<?php echo $module; ?>_current_slide).addClass('current');
        
        // Slide scroll
        var _width = carousel.find('.visible-area').width();
        carousel.find('.slides-container').css('left', 0 - (slideNumber * _width));
    }
</script>
