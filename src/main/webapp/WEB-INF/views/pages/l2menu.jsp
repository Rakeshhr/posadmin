<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">

	function myfun(){
		var v1 = document.getElementById("mmId").value;
		   document.getElementById("formid").submit();
	}
	
	function hideLink() {
	  var x = document.getElementById('myLink');
	  var b = document.getElementById('btnLink');


	  if (x.style.display !== 'block') {
	    x.style.display = 'block';
	    b.childNodes[0].nodeValue = "Add";

	  } else {
	    x.style.display = 'none';
	    b.childNodes[0].nodeValue = "Add";
	  }
	}
	

</script>
<div class="col-12">
	<div class="card">
		<div class="card-body">
			<h3>Add L2 Menu</h3>
			<br>
			<br>
			<form class="forms-sample" id="formid" action="l2menupost.html"
				method="post">
				<div class="col-sm-9">
					<h4>Select Menu Master name</h4>
					<br>
					<form:select path="l2FormBean" class="form-control" id="mmId"
						name="mmId" onchange="myfun()">
						<form:option value="NONE" label="--- Select ---" />
						<form:options items="${MENUMASTERMAP}" />

					</form:select>
				</div>
			</form>
			<br>
			<form:form class="forms-sample" id="formid"
				modelAttribute="l2FormBean" action="l2menu.html" method="post">


				<div class="col-sm-9">
					<h4>Select L1 Menu name</h4>
					<br>
					<form:select path="l1mmId" class="form-control">
						<form:option value="NONE" label="--- Select ---" />
						<form:options items="${L1MENULIST}" />

					</form:select>
				</div>
				<br>
				<div class="col-sm-9">
					<h4>Enter L2 menu name</h4>
					<br>
					<form:input path="l2MenuName" class="form-control"
						placeholder="Enter L2 Menu Name" />
				</div>
				<br>
				<div class="col-sm-9">
					<h4>Enter Price</h4>
					<br>
					<form:input path="price" class="form-control"
						placeholder="Enter Price" />
				</div>
				<br>
				<div class="col-sm-9">
					<h4>Select Tax from list</h4>
					<br>
					<form:select path="taxId" class="form-control">
						<form:option value="0" label="--- Select ---" />
						<form:options items="${TAXMAP}" />
					</form:select>
				</div>
				<br>
				<br>
				<input type="submit" class="btn btn-success mr-2" value="Submit"
				 >

			</form:form>
			<br>
			<br> <input type="submit" class="btn btn-success mr-2"
				value="Show List of L2Menu" id="btnLink" onclick="hideLink()">

			<div class="col-lg-12 grid-margin stretch-card" id="myLink">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title" id="target">L2 Menu Table</h4>

						<div class="table-responsive">
							<table class="table table-dark">
								<thead>
									<tr>
										<th>L2Menu Name</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="s" items="${L2MENULIST}">
										<tr>
											<td><c:out value="${s.name}" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>