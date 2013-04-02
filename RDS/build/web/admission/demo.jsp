<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"  type="text/css" href="bootstrap/css/bootstrap.css" />
 <link rel="stylesheet"   type="text/css" href="bootstrap/css/bootstrap-responsive.css" />


</head>
<body>
<!-- Bootstrap trigger to open modal -->
<a data-toggle="modal" href="#rating-modal">Write a Review</a>
 
<div class="hide fade modal" id="rating-modal">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal">×</button>
    <h2>Your Review</h2>
  </div>
 
  <div class="modal-body">
    <!-- The async form to send and replace the modals content with its response -->
    <form class="form-horizontal well" data-async data-target="#rating-modal" action="/some-endpoint" method="POST">
      <fieldset>
        <!-- form content -->
      </fieldset>
    </form>
  </div>
 
  <div class="modal-footer">
    <a href="#" class="btn" data-dismiss="modal">Cancel</a>
  </div>
</div>
<script src="http://code.jquery.com/jquery-latest.js"></script>
 <script src="bootstrap/js/bootstrap-modal.js"></script>
 <script >
 jQuery(function($) {
	    $('form[data-async]').live('submit', function(event) {
	        var $form = $(this);
	        var $target = $($form.attr('data-target'));
	 
	        $.ajax({
	            type: $form.attr('method'),
	            url: $form.attr('action'),
	            data: $form.serialize(),
	 
	            success: function(data, status) {
	                $target.html(data);
	            }
	        });
	 
	        event.preventDefault();
	    });
	});
 </script>
</body>
</html>