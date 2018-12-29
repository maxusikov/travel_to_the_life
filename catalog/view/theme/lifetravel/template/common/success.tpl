<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row">
    <div id="content">
      <div class="content-wrapper">
        <div class="inner-wrapper">
          <h1 class="heading"><?php echo $heading_title; ?></h1>
          <div class="message"><?php echo $text_message; ?></div>
          <div class="buttons">
            <a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a>
          </div>
        </div>
      </div>
    </div>
</div>
<div id="background-container">
  <img class="background active" src="/catalog/view/theme/lifetravel/image/theme_images/background/1459078271127742859.jpg" />
</div>
<?php echo $footer; ?>