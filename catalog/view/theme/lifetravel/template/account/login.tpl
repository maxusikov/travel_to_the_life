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
      <div class="content-container row">
        <div class="form-wrapper">
          <div class="headings-wrapper">
            <h2 class="authentication active"><?php echo $text_authentication; ?></h2>
            <h2 class="registration"><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></h2>
          </div>
          <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
              <div class="input-wrapper">
                  <input type="email" name="email" value="" placeholder="<?php echo $entry_email; ?>" />
                  <input type="password" name="password" value="" placeholder="<?php echo $entry_password; ?>" />
              </div>
              <a class="submit button" onclick="javascript:$(this).closest('form').submit();"><?php echo $text_submit; ?></a>
          </form>
        </div>
      </div>
      <?php echo $content_bottom; ?>
    </div>
    <?php echo $column_right; ?>
  </div>
  <div id="background-container">
      <img class="background active" src="/catalog/view/theme/lifetravel/image/theme_images/background/1459078271127742859.jpg" />
  </div>
</div>
<?php echo $footer; ?>