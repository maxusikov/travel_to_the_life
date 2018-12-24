<div class="navbar">
  <ul>
    <?php foreach($navbar as $navbar_item){ ?>
    <li>
        <a href="<?php echo $navbar_item['href']; ?>"><?php echo $navbar_item['text']; ?></a>
    </li>
    <?php } ?>
  </ul>
</div>
