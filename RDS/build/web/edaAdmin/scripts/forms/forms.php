		
		<h4 class="alert_info">Welcome to the free MediaLoot admin panel template, this could be an informative message.</h4>
		
		<div class="clear"></div>
		

			<h3>Post New Article</h3>
			<form>

							<label>Post Title</label>
							<input type="text"    >
							<label>Content</label>
                                <?php
								  require_once("scripts/forms/limitTextArea.php");
								  //limitTextArea(name,size,rows,col);
								  limitTextArea("Content",100,5,40); ///Pass Name and size of textarea
								?>
  
                             <label>Date</label>
                                <?php
								  require_once("scripts/date/date.php");
								  datepopup("cal"); ///Pass Name for textbox
								?>
  
							<label>Category</label>
							<select style="width:92%;">
								<option>Articles</option>
								<option>Tutorials</option>
								<option>Freebies</option>
							</select>
							<label>Tags</label>
							<input type="text"  >
							<label>file</label>
							<input type="file"  >
<label>Tags</label>
					<select>
						<option>Draft</option>
						<option>Published</option>
					</select>
                                <input class="submit-green" type="submit" value="Submit" /> 
                                <input class="submit-gray" type="reset" value="Clear Form" />
</form>
		<div class="spacer"></div>
