<script type="text/javascript" src="scripts/forms/showhide/showhide.js"></script>
<h1>Show and Hide Form</h1>
<form id="form1" name="form1" method="post" action="">
      <table   align="center">
        <tr class="odd">
          <td>Name</td>
          <td><label>
            <input type="text" name="textfield" />
          </label></td>
        </tr>
        <tr>
          <td>Buisness</td>
          <td> <input name="radiobutton" type="radio" rel="none" value="radiobutton" />          no            <input name="radiobutton" type="radio" rel="yesbusiness" value="radiobutton" />            yes </td>
        </tr>
        <tr rel="yesbusiness">
          <td>Kind</td>
          <td> 
            <input type="text" name="textfield2" />      </td>
        </tr>
        
        <tr class="odd">
          <td colspan="2" align="center"><label>
            <input type="submit" name="Submit" value="Submit" />
          </label></td>
        </tr>
      </table>
</form>