
<!-- News -->

<h4 class="title">Updates</h4>
<div class="aside-in">
	<div class="aside-box">

		<%
			if (session.getAttribute("email") != null
					&& !session.getAttribute("email").equals("")) {
		%>

		<%@ include file="side_suggest.jsp"%>

		<%
			}
		%>
		<dl id="news">
			<dt>
				<a href="#">Lorem ipsum dolor sit amet</a>
			</dt>
			<dd>
				<span class="date">15. 01.</span> Lorem ipsum dolor sit amet estame
				consectetue adipiscing eliti. Sedem suscipit, pede et lobortis es.
			</dd>

			<dt>
				<a href="#">Lorem ipsum amet</a>
			</dt>
			<dd>
				<span class="date">15. 01.</span> Lorem ipsum dolor sit amet estame
				consectetue adipiscing eliti. Sedem suscipit, pede et lobortis es.
			</dd>

			<dt>
				<a href="#">Lorem ipsum dolor sit amet</a>
			</dt>
			<dd>
				<span class="date">15. 01.</span> Lorem ipsum dolor sit amet estame
				consectetue adipiscing eliti. Sedem suscipit, pede et lobortis es.
			</dd>
		</dl>

	</div>
	<!-- /aside-box -->
</div>
<!-- /aside-in -->

<!-- Contact -->
<h4 class="title">Contact</h4>

<div class="aside-in">
	<div class="aside-box">

		<address>
			<strong>Your website name</strong><br /> Some street 123, Some city<br />
			<a href="#">your@email.com</a>
		</address>

	</div>
	<!-- /aside-box -->
</div>
<!-- /aside-in -->

