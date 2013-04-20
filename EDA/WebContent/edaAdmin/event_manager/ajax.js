var xmlhttp
var server
function square(num)
{
//alert("hi");

xmlhttp=GetXmlHttpObject();

if (xmlhttp==null)
  {
	alert ("Your browser does not support XMLHTTP!");
	return;
  }
	//creating url
	var url="findsquare.php";
	url=url+"?num="+num;
	url=url+"&sid="+Math.random();
	
	///
	xmlhttp.onreadystatechange=stateChanged;
	xmlhttp.open("GET",url,true);
	xmlhttp.send(null);
}

function stateChanged()
{
	if (xmlhttp.readyState==4)
	{
		
		document.getElementById('result').innerHTML=xmlhttp.responseText;
		
		//document.getElementById('sub').type='submit';
		//document.getElementById('sub').value='Save';
		document.getElementById('sub').innerHTML='<input name="sub" type="submit"  value="Save"    >';
		///
		//document.getElementById('reg').action='vikrant.php';
		//document.getElementById('reg').submit();
	}
	else
	{
	
		document.getElementById('result').innerHTML="<img src='3.gif' />";
	}
}

function GetXmlHttpObject()
{
	if (window.XMLHttpRequest)
	{
	// code for IE7+, Firefox, Chrome, Opera, Safari
		return new XMLHttpRequest();
	}
	if (window.ActiveXObject)
	{
	// code for IE6, IE5
		return new ActiveXObject("Microsoft.XMLHTTP");
	}
	return null;
}
