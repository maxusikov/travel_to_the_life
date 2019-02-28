
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
        <div id="projects" class="projects panel active">
            <div class="top-line">
                <ul class="level-tabs">
                    <li class="level-1">
                        <a href="<?php echo $level1; ?>">Этап 1</a>
                    </li>
                    <li class="level-2">
                        <a href="<?php echo $level2; ?>">Этап 2</a>
                    </li>
                    <li class="psychotest active">
                        <a>Тест психолога</a>
                    </li>
                </ul>
                <div class="contestant-score">
                    <span class="level-score">Баллы психолога: <?php echo $psychologist_score; ?></span>
                    <span class="total-score">Всего баллов: <?php echo $total_score; ?></span>
                </div>
            </div>
            <div class="level-area">
                <div id="psychotest" class="level-wrapper active">
                    <div class="form-wrapper">
                        <div class="recommendation">
                            <h3 class="recommendation-heading">Рекоммендация психолога:</h3>
                            <span class="recommendation-text"><?php echo $psychologist_recommendation; ?></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>

<div id="background-container">
    <img class="background background-0 active" src="/catalog/view/theme/lifetravel/image/theme_images/background/1459078271127742859.jpg" />
</div>
<?php echo $footer; ?> 
