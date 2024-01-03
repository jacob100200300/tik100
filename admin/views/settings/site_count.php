<div class="col-md-8">
  <div class="panel panel-default">
    <div class="panel-body">
<h1>Fake Orders</h1><a href="<?php echo site_url("admin/settings/site_count/service_enable_disable");?>" style="float:right;margin-top:-45px;" class="btn btn-primary btn-sm"><?php if($settings["fake_order_service_enabled"] == 0){ echo "Enable Service";} else { echo  "Disable Service";}?></a>
<center>
<p><i>Use this settings to accelerate panel orders.</i></p></center>
<form class="form  <?php if($settings["fake_order_service_enabled"] == 0){ echo "disabledDiv"; }?>" action="" method="post">
<div class="form-group">
<label class="">Minimum number of fake orders</label>
<input class="form-control" type="number" name="min_count" value="<?php if(is_numeric($settings["fake_order_min"])){
echo $settings["fake_order_min"];}?>">
</div>
<div class="form-group">
<label class="">Maximum number of fake orders</label>
<input class="form-control" type="number" name="max_count" value="<?php if(is_numeric($settings["fake_order_max"])){
echo $settings["fake_order_max"];}?>">
</div>
<div class="alert alert-info">Leave empty to choose randomly.</div>
<div class="form-group">
<button class="btn btn-primary" type="submit">Update Settings</button>
</div>
</form>
<div class="alert alert-info">
Note : When enabled, orders are incremented every 5 minutes.</div>


<center><h1>OR</h1></center>

<div class="form-group">
<label class="">NEXT ORDER ID</label>
<input class="form-control" type="number" id="next_order_id_value" value="<?=$settings["panel_orders"] + 1?>">
<small class="text-muted">
Must be greater than <?=$settings["panel_orders"]?>.
</small>
</div>
<div class="form-group">
<button type="button" id="next_order_id_value_btn" class="btn btn-primary">Submit</button>
</div>
<div class="alert alert-info">

Note : The above setting will create a fake order with the entered order ID. The next order ID will start from that entered order ID.<br>Example, ORDER ID : 2000<br>NEXT ORDER ID : 2001</div>

</div>
</div></div>