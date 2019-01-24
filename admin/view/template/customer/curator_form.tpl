<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-curator" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-curator" class="form-horizontal">
            <input type="hidden" name="action" value="<?php echo $form_action; ?>" />
            <div class="form-wrapper">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-comment"><?php echo $entry_curator_name; ?></label>
                <div class="col-sm-10">
                    <input type="text" name="curator_name" value="<?php echo $curator_name; ?>" placeholder="<?php echo $entry_curator_name; ?>" />
                </div>
              </div>
                 
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-comment"><?php echo $entry_curator_email; ?></label>
                <div class="col-sm-10">
                    <input type="text" name="curator_email" value="<?php echo $curator_email; ?>" placeholder="<?php echo $entry_curator_email; ?>" />
                </div>
              </div>
                 
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-comment"><?php echo $entry_password; ?></label>
                <div class="col-sm-10">
                    <input type="password" name="curator_password" value="" placeholder="<?php echo $entry_password; ?>" />
                </div>
              </div>
                 
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-comment"><?php echo $entry_password_confirm; ?></label>
                <div class="col-sm-10">
                    <input type="password" name="curator_password_confirm" value="" placeholder="<?php echo $entry_password_confirm; ?>" />
                </div>
              </div>
            </div>
        </form>
      </div>
    </div>
  </div>
  </div>
<?php echo $footer; ?>
