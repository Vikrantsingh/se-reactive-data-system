<script type="text/javascript" src="autocomplete/js/bsn.AutoSuggest_2.1.3.js" charset="utf-8"></script>
<link rel="stylesheet" href="autocomplete/css/autosuggest_inquisitor.css" type="text/css" media="screen" charset="utf-8" /> 


<div style="float:right; margin:0;padding:0">
<form method="get" action="#" align="right"  style="float:right; margin:3px;padding:0" >
	<div class="input-append">
  <input class="span2" id="appendedInputButton" type="text" style="width:240px" name="query"  placeholder="Search..." >
  
  <button class="btn" type="submit">Go!</button>
</div>
</form>
</div>
<small style="visibility:hidden"> <input type="text" id="testid" value="" disabled="disabled" /></small>
<script type="text/javascript">	
	var options_xml = {/////////////change path
		script: function (input) { return "autocomplete/test.jsp?input="+input+"&testid="+document.getElementById('testid').value; },
		varname:"input"
	};
	var as_xml = new bsn.AutoSuggest('appendedInputButton', options_xml);
</script>