<?php defined('IN_ADMIN') or exit('No permission resources.');?>
<?php include $this->admin_tpl('header', 'admin');?>

<div class="pad-lr-10">
<form name="searchform" action="" method="get" >
<input type="hidden" value="set" name="m">
<input type="hidden" value="set_ll" name="c">
<input type="hidden" value="index" name="a">
<table width="100%" cellspacing="0" class="search-form">
    <tbody>
		<tr>
		<td>
		<div class="explain-col">
        
		</div>
		</td>
		</tr>
    </tbody>
</table>
</form>


<div class="table-list">
<table width="100%" cellspacing="0">
	<thead>
		<tr>
        	<th align="center" width="2%">&nbsp;</th>
            <th align="center" width="5%">编号</th>
            <th align="center" width="5%">数量</th>
			<th align="center">文字</th>
            <th align="center" width="5%">修改人</th>
            <th align="center" width="10%">修改时间</th>
			<th align="center" width="12%">操作</th>
		</tr>
	</thead>

<form name="myform" action="index.php?m=set&c=set_yw&a=delete" method="post">
<tbody>
<?php
	if(is_array($datas)){
	foreach($datas as $k=>$v) {
?>
    <tr>
    	<td align="center">&nbsp;</td>
        <td align="center"><?php echo $v['id']?></td>
        <td align="center"><?php echo $v['num']?></td>
		<td align="center"><?php echo $v['title']?></td>
        <td align="center"><?php echo admin($v['modiuser'],'username')?></td>
        <td align="center"><?php echo date('Y-m-d',$v['moditime'])?></td>
		<td align="center">
            <a href="index.php?m=set&c=set_ll&a=edit&id=<?php echo $v['id']?>">编辑</a>
		</td>
    </tr>
<?php
	}
}?>
</tbody>
</table>

<div class="btn">
</div>

<div id="pages"><?php echo $pages?></div>
</div>
</form>
</div>
</body>
</html>