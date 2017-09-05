<?php defined('IN_ADMIN') or exit('No permission resources.');?>
<?php include $this->admin_tpl('header', 'admin');?>

<div class="pad-lr-10">
<form name="searchform" action="" method="get" >
<input type="hidden" value="set" name="m">
<input type="hidden" value="set" name="c">
<input type="hidden" value="index" name="a">
<table width="100%" cellspacing="0" class="search-form">
    <tbody>
		<tr>
		<td>
		<div class="explain-col">
        标题			
            <input name="title" type="text" value="<?php if(isset($_GET['title'])) {echo $_GET['title'];}?>" class="input-text" />
            <input type="submit" name="search" class="button" value="搜索" />
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
        	<th  align="center" width="2%"><input type="checkbox" value="" id="check_box" onclick="selectall('id[]');"></th>
            <th align="center" width="5%">排序</th>
			<th align="center">标题</th>
            <th align="center" width="5%">发布人</th>
            <th align="center" width="5%">修改人</th>
            <th align="center" width="10%">添加时间</th>
            <th align="center" width="10%">修改时间</th>
			<th align="center" width="12%">操作</th>
		</tr>
	</thead>

<form name="myform" action="index.php?m=set&c=set&a=delete" method="post" onsubmit="checkuid();return false;">
<tbody>
<?php
	if(is_array($datas)){
	foreach($datas as $k=>$v) {
?>
    <tr>
    	<td align="center"><input type="checkbox" value="<?php echo $v['id']?>" name="id[]"></td>
        <td align="center"><?php echo $v['paixu']?></td>
		<td align="center"><?php echo $v['title']?></td>
        <td align="center"><?php echo admin($v['adduser'],'username')?></td>
        <td align="center"><?php echo admin($v['modiuser'],'username')?></td>
        <td align="center"><?php echo date('Y-m-d',$v['addtime'])?></td>
        <td align="center"><?php echo date('Y-m-d',$v['moditime'])?></td>
		<td align="center">
            <a href="index.php?m=set&c=set&a=edit&id=<?php echo $v['id']?>">编辑</a> |
            <a href="index.php?m=set&c=set&a=delete&id=<?php echo $v['id']?>" onclick="return confirm('您确定删除吗？？')">删除</a>
		</td>
    </tr>
<?php
	}
}?>
</tbody>
</table>

<div class="btn">
<label for="check_box">全选/取消</label><input type="hidden" name="hid" value="1"/> <input type="submit" class="button" name="dosubmit" value="删除" onclick="return confirm('您确定删除吗？？')"/>
</div>

<div id="pages"><?php echo $pages?></div>
</div>
</form>
</div>
<script>
function checkuid() {
	var ids='';
	$("input[name='id[]']:checked").each(function(i, n){
		ids += $(n).val() + ',';
	});
	if(ids=='') {
		window.top.art.dialog({content:'请至少选择一项',lock:true,width:'300',height:'80',time:3},function(){});
		return false;
	} else {
		myform.submit();
	}
}
</script>
</body>
</html>