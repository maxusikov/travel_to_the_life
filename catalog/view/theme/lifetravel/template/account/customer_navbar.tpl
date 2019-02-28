<div id="navbar" class="navigation-wrapper">
    <h2><?php echo $text_user_navbar; ?></h2>
    <ul class="list-unstyled">
      <?php foreach($navbar_items as $item){ ?>
        <?php if($item['active']){ ?>
        <li class="active">
          <a href="<?php echo $item['href']; ?>"><?php echo $item['name']; ?></a>
        </li>
        <?php } else { ?>
        <li>
          <a href="<?php echo $item['href']; ?>"><?php echo $item['name']; ?></a>
        </li>
        <?php } ?>
      <?php } ?>
    </ul>

    <ul class="list-unstyled">
        <li><a href="<?php echo $logout; ?>">Выход</a></li>
    </ul>
</div>