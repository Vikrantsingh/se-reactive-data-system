
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript" >
$(function() 
{
$(".delete").click(function(){
var element = $(this);
var I = element.attr("id");
$('li#list'+I).fadeOut('slow', function() {$(this).remove();
if( I.indexOf("last")!=-1 ) {
	document.getElementById(I.substring(1,3)).remove();
}

});		
return false;
});
});
</script>  
<style type="text/css">

.fb_anchor{
	color:#20558a;
	text-decoration:none;
	}
	a:hover{
	color:#20558a;
	text-decoration:none;
	}
	#bar
	{
	background:url(bar.png) #dedede; height:39px
	}
	.link
	{
	float:left;height:39px; padding:4px; font-size:13px; font-weight:bold; margin-left:10px; 
	}
	.feed
	{
	float:right; padding-top:8px; margin-right:20px; font-size:12px; font-weight:bold;
	}
	.demo
	{
	float:right; padding:4px; margin-top:5px; margin-right:30px; background-color:#FFCC99; color:#982800; border:#982800 solid 2px;
	}
	*{margin:0;padding:0;}
	#dragme
	{
	width:229px; height:129px; background:url(dragmelogo.png) no-repeat; border:4px solid #666666
	
	}

#fb_side_suggest{
	height:120px;
	width:200px;
	overflow:hidden;
	
	margin-left:0px;
	

	
	padding:2px 2px 2px 2px;
}
#fb_side_suggest li{
	border:0; margin:0; padding:0; list-style:none;
}

	#fb_side_suggest li{
		height:60px;
		padding:1px;
		list-style:none;
		
	}
		#fb_side_suggest a{
			color:#000000;
			text-decoration:none;
			
		}
		#fb_side_suggest .user-title{
			display:block;
			font-weight:bold;
			margin-bottom:4px;
			font-size:11px;
			color:#36538D;
		}
		#fb_side_suggest .addas{
			display:block;
			font-size:11px;
			color:#666666;
		}
		#fb_side_suggest img{
			float:left;
			margin-right:5px;
			padding:1px;
			
		}
		#fb_side_suggest .del
		{
		float:right; font-weight:bold; color:#666666
		}
		#fb_side_suggest .del a
		{
		color:#000000;			
		}
		#fb_side_suggest .del a:hover
		{
		background-color:#36538D;
		padding-left:1px;
		padding-right:1px;
		color:#ffffff;
		}
</style>  





<div  class="fb_anchor"  id="s1" >
<span class="label label-info">Colleges For You</span>   
<ul id="fb_side_suggest">
	<li id="list_s1_1">
		<img src="img/img1.gif" /> <span class="del"><a href="#" class="delete" title="Delete this user " id="_s1_1">X</a></span>
		<a href="" class="user-title">Hari Prasad</a>
		<span class="addas">Add as Friend</span>
	</li>
	<li id="list_s1_2">
		<img src="img/img2.jpg" /> <span class="del"><a href="#" class="delete" title="Delete this user " id="_s1_2" >X</a></span>
		<a href="" class="user-title">Srujana</a>
		<span class="addas">Add as Friend</span>
	</li>
	<li id="list_s1_3">
		<img src="img/img3.jpg" /> <span class="del"><a href="#" class="delete" title="Delete this user " id="_s1_3">X</a></span>
		<a href="" class="user-title">Sudha</a>
		<span class="addas">Add as Friend</span>
	</li>
	<li id="list_s1_4_last">
		<img src="img/img4.gif" /> <span class="del"><a href="#" class="delete" title="Delete this user " id="_s1_4_last">X</a></span>
		<a href="" class="user-title">Chiranjeevi</a>
		<span class="addas">Add as Friend</span>
	</li>		
</ul>
<hr/>

</div>

<div  align="left" class="fb_anchor" id="s2" >
<span class="label label-info">Students You May Like</span>
<ul id="fb_side_suggest"> 
	<li id="list_s2_11">
		 <img src="img/img1.gif" /> <span class="del"><a href="#" class="delete" title="Delete this user " id="_s2_11">X</a></span>
		<a href="" class="user-title">Hari Prasad</a>
		<span class="addas">Add as Friend</span>
	</li>
	<li id="list_s2_22">
		<img src="img/img2.jpg" /> <span class="del"><a href="#" class="delete" title="Delete this user " id="_s2_22" >X</a></span>
		<a href="" class="user-title">Srujana</a>
		<span class="addas">Add as Friend</span>
	</li>
	<li id="list_s2_33">
		<img src="img/img3.jpg" /> <span class="del"><a href="#" class="delete" title="Delete this user " id="_s2_33">X</a></span>
		<a href="" class="user-title">Sudha</a>
		<span class="addas">Add as Friend</span>
	</li>
	<li id="list_s2_44_last">
		<img src="img/img4.gif" /> <span class="del"><a href="#" class="delete" title="Delete this user " id="_s2_44_last">X</a></span>
		<a href="" class="user-title">Chiranjeevi</a>
		<span class="addas">Add as Friend</span>
	</li>		
</ul>
<hr/>
</div>
