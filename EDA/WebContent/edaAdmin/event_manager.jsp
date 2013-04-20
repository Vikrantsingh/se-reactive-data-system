

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.sql.*"%>
<%@page import="eda.connection.DB_Config"%>
<%@page import="eda.listener.*"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta charset="utf-8" />
<meta name="Author" content="vikrantsingh.it@gmail.com" />
<%@ include file="include/headtag.jsp"%>
</head>
<body>
	<%@ include file="include/header.jsp"%>


	<%@ include file="include/sidebar.jsp"%>

	<div id="main">

		<div class="module">

			<h2>
				<span> <!--
    <?php if(isset($_REQUEST['t'])&&(validate_url()==true) ) echo get_decrypt_url($_REQUEST['t']); else echo "Home";?> : 
    --> Event Manager
				</span>
			</h2>

			<div class="module-body">

				<%@ include file="include/alert.jsp"%>


				<%@ include file="include/page.jsp"%>








				<ul class="tabs">
					<li><a href="#tab1">Step-I New Database Info</a></li>
					<li><a href="#tab2">Step-II New Event</a></li>
					<li><a href="#tab3">Step-III Reaction Type - Database</a></li>
					<li><a href="#tab4">Step-IV Reaction Type - External Function Call
					</a></li>


				</ul>


				<div class="tab_container">
					<div id="tab1" class="tab_content">

						<form action="db_save_database_info.jsp" method="post">
							<table width="100%" border="1">
								<tr class="odd">
									<td colspan="2">New Database Info</td>
								</tr>
								<tr>
									<td width="40%">Database Name</td>
									<td> <input type="text" name="db_name"	id="db_name" />
								</td>
								</tr>
								<tr>
									<td>Hostname</td>
									<td><input type="text" name="host" id="host" /></td>
								</tr>
								<tr>
									<td>Port</td>
									<td><input type="number" name="port" id="port" /></td>
								</tr>
								<tr>
									<td>Username</td>
									<td><input type="text" name="username" id="username" /></td>
								</tr>
								<tr>
									<td>Password</td>
									<td><input type="text" name="password" id="password" /></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>
										<button type="submit" class="btn btn-primary">
											Save <i class="icon-ok icon-white"></i>
										</button>
									</td>
								</tr>
							</table>
						</form>
					</div>
					<!-- end of #tab1 -->

					<div id="tab2" class="tab_content">
						<form action="db_save_database_info.jsp" method="post">
							<table width="100%" border="1">
								<tr class="odd">
									<td colspan="2">New Event</td>
								</tr>
								<tr>
									<td width="40%">Event Name</td>
									<td> <input type="text" name="eventname"
											id="eventname" />
									</td>
								</tr>
								<tr>
									<td>Database</td>
									<td>  <select	name="database">
											<%
												try {
													DB_Config db = new DB_Config();
													Connection con = db.registerDB();
													String query = "select * from  database_info";
													Statement st = con.createStatement();
													ResultSet rs = st.executeQuery(query);
													while(rs.next())
													{
														out.print("<option value="+rs.getString("database_id")+">"+rs.getString("database_name")+"</option>");
														
													}
												} catch (Exception ex) {
													System.out.print(ex.toString());

												}
											%>
									</select>
									</td>
								</tr>
								<tr>
									<td>Table</td>
									<td><input type="text" name="table" id="table" /></td>
								</tr>
								<tr>
									<td>Surrogate Key</td>
									<td><input type="text" name="surrogatekey"
										id="surrogatekey" /></td>
								</tr>
								<tr>
									<td>Constraints</td>
									<td><input type="text" name="constraints" id="constraints" /></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>
										<button type="submit" class="btn btn-primary">
											Save <i class="icon-ok icon-white"></i>
										</button>
									</td>
								</tr>
							</table>
						</form>


					</div>
					<!-- end of #tab2 -->

					<div id="tab3" class="tab_content">
						<form action="db_save_db_reaction_info.jsp" method="post">
							<table width="100%" border="1">
								<tr class="odd">
									<td colspan="2">Fire SQL on Database</td>
								</tr>
								<tr>
									<td width="40%">Event</td>
									<td><select	name="event_id">
											<%
												try {
													DB_Config db = new DB_Config();
													Connection con = db.registerDB();
													String query = "select * from  events";
													Statement st = con.createStatement();
													ResultSet rs = st.executeQuery(query);
													while(rs.next())
													{
														out.print("<option value="+rs.getString("event_id")+">"+rs.getString("event_name")+"</option>");
														
													}
												} catch (Exception ex) {
													System.out.print(ex.toString());

												}
											%>
									</select></td>
								</tr>
								<tr>
									<td>Reaction Name</td>
									<td><input type="text" name="reaction_name"
										id="reaction_name" /></td>
								</tr>
								<tr>
									<td>Query</td>
									<td><input type="text" name="query"
										id="query" /></td>
								</tr>
						 
								<tr>
									<td>&nbsp;</td>
									<td>
<button type="submit" class="btn btn-primary">
											Save <i class="icon-ok icon-white"></i>
										</button>
</td>
								</tr>
							</table>

						</form>

					</div>
					<!-- end of #tab3 -->


					<div id="tab4" class="tab_content">
						<form action="db_save_func_reaction_info.jsp" method="post">
							<table width="100%" border="1">
								<tr class="odd">
									<td colspan="2">External Function Call</td>
								</tr>
								<tr>
									<td width="40%">Event</td>
							 
									<td><select	name="event_id">
											<%
												try {
													DB_Config db = new DB_Config();
													Connection con = db.registerDB();
													String query = "select * from  events";
													Statement st = con.createStatement();
													ResultSet rs = st.executeQuery(query);
													while(rs.next())
													{
														out.print("<option value="+rs.getString("event_id")+">"+rs.getString("event_name")+"</option>");
														
													}
												} catch (Exception ex) {
													System.out.print(ex.toString());

												}
											%>
									</select>
</td>
								</tr>
								<tr>
									<td>Reaction Name</td>
									<td><input type="text" name="reaction_name"
										id="reaction_name" /></td>
								</tr>
								<tr>
									<td>Fully Qualified Name</td>
									<td><input type="text" name="function_name"
										id="function_name" /></td>
								</tr>
						 
								<tr>
									<td>&nbsp;</td>
									<td>

<button type="submit" class="btn btn-primary">
											Save <i class="icon-ok icon-white"></i>
										</button>
</td>
								</tr>
							</table>

						</form>
					</div>
					<!-- end of #tab4 -->


				</div>
				<!-- end of .tab_container -->












			</div>

		</div>

	</div>
	<%@ include file="include/footer.jsp"%>

</body>
</html>
