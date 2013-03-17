<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>

<%@ include file="include/headtag.jsp"%>
</head>

<body>

	<div id="main">

		<!-- Header -->
		<div id="header">
			<%@ include file="include/header.jsp"%>

		</div>
		<!-- /header -->



		<!-- 2 columns (content + sidebar) -->
		<div id="cols" class="box">
			<div id="nav11">
				<%@ include file="include/navigation.jsp"%>

			</div>
			<!-- Content -->
			<div id="content">




				<hr class="noscreen" />

				<%
 				if(session.getAttribute("message") != null && !session.getAttribute("message").equals(""))
				{
 				%>
				<div class="alert alert-success" style="margin: 10px">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<h4>Message</h4>
					<% out.print(session.getAttribute("message"));
						session.setAttribute("message","");
 					%>
				</div>
				<% }%>
				<%
 				if(session.getAttribute("error_message") != null && !session.getAttribute("error_message").equals(""))
				{
 				%>
				<div class="alert alert-error" style="margin: 10px">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<h4>Message</h4>
					<% out.print(session.getAttribute("error_message"));
						session.setAttribute("error_message","");
 					%>
				</div>
				<% }%>
				<%
 				if(session.getAttribute("warning_message") != null && !session.getAttribute("warning_message").equals(""))
				{
 				%>
				<div class="alert alert-block" style="margin: 10px">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<h4>Message</h4>
					<% out.print(session.getAttribute("warning_message"));
						session.setAttribute("warning_message","");
 					%>
				</div>
				<% }%>

				<div id="content-in">
						
					<%@ include file="index_data.jsp"%>
				</div>
				<!-- /content-in -->

			</div>
			<!-- /content -->

			<hr class="noscreen" />

			<!-- Sidebar -->
			<div id="aside">
				<%@ include file="include/sidebar.jsp"%>
			</div>
			<!-- /aside -->

		</div>
		<!-- /cols -->



		<hr class="noscreen" />

		<!-- Footer -->
		<div id="footer">

			<%@ include file="include/footer.jsp"%>

		</div>
		<!-- /footer -->

	</div>
	<!-- /main -->
	<!-- regModal -->
	<div id="regModal" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="regModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">Modal header</h3>
		</div>
		<div class="modal-body">
			<p>One fine body</p>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
			<button class="btn btn-primary">Save changes</button>
		</div>
	</div>





	<!-- Modal -->
	<script src="formValidation/jqBootstrapValidation.js"></script>
	<script>
		$(function() {
			$("input,select,textarea").not("[type=submit]")
					.jqBootstrapValidation();
		});
	</script>


	<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<form class="form-horizontal" method="post" action="db_register.jsp"
			novalidate>
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">x</button>
				<h3 id="myModalLabel">Pre-Registration Form</h3>
			</div>
			<div class="modal-body">

				<!-- Email Address -->
				<div class="control-group">
					<label class="control-label" for="email">Email address</label>
					<div class="controls">
						<input type="email" name="email" id="email" required>
							<p class="help-block">Email address we can contact you on</p>
					</div>
				</div>
				<!-- Password -->
				<div class="control-group">
					<label class="control-label" for="password">Password</label>
					<div class="controls">
						<input type="password" name="password" id="password" minlength="5"
							maxlength="20" required>
							<p class="help-block">Enter Complex Password</p>
					</div>
				</div>
				<!-- Confirm Password -->
				<div class="control-group">
					<label class="control-label" for="confirmpassword">Confirm
						Password</label>
					<div class="controls">
						<input type="password" data-validation-matches-match="password"
							data-validation-matches-message="Must match password entered above"
							id="confirmpassword" name="confirmpassword" minlength="5"
							maxlength="20" required>
							<p class="help-block">And again, to check for speeling
								miskates</p>
					</div>
				</div>

				<!-- Acc Type -->
				<div class="control-group">
					<label class="control-label" for="type">Account Type</label>
					<div class="controls">
						<select name="type">
							<option value="student">Student</option>
							<option value="institute">Institute</option>
						</select>
						<p class="help-block"></p>
					</div>
				</div>

				<!-- I Agree -->
				<div class="control-group">
					<label class="control-label" for="terms-and-conditions">Legal</label>
					<div class="controls">
						<label class="checkbox"> <input type="checkbox"
							id="terms-and-conditions" name="terms-and-conditions" required
							data-validation-required-message="You must agree to the terms and conditions">
								I agree to the <a href="#">terms and conditions</a></label>
						<p class="help-block"></p>
					</div>
				</div>

			</div>
			<div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
				<!--  <button class="btn btn-primary">Save changes</button> -->
				<button type="submit" class="btn btn-primary">
					Register Now <i class="icon-ok icon-white"></i>
				</button>
				<br />
			</div>

		</form>

	</div>
	<!-- Modal -->
</body>
</html>
