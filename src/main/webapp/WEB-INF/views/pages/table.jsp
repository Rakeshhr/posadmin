<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
function tablehelper() {
	var v2 = document.getElementById("tablebtnLink").value;
	//alert(v2);
	document.getElementById("tableformid").submit();
}


function  establishfun()
{
	var v1 = document.getElementById("mId").value;
	//alert(v1);
	   document.getElementById("formid").submit();
}
	
	

</script>


		<div class="col-12">
                  <div class="card">
                    <div class="card-body">
                      <h3 >Add Establishment</h3><br><br>
		<form class="forms-sample" id="formid" action="tablepost.html"
				method="post">
	
		
		<h3 >Add Establishment</h3><br><br>
		
		<div class="col-sm-9" >
			<h4>Select Establishment name</h4><br>
 			<form:select path="TableFormBean" class="form-control" id = "mId"  name = "mId" onchange="establishfun()"> 
				<form:option value="NONE" label="--- Select ---"/>
			    <form:options items="${ESTABLISHMENTMAP}"/>
			    
			</form:select> 
		</div>
		
		
			</form>
		<br><br><br>
				
				<form action="tablehelper.html" method="post" id="tableformid">
				
				<div class="col-sm-9">
					<h4>Select Floor name</h4>
					<br>
						<form:select path="TableFormBean" class="form-control"  id="tablebtnLink"
						name="tablebtnLink" onchange="tablehelper()">
							<form:option value="0" label="--- Select ---" />
							<form:options items="${FLOORMAP}" />
						</form:select>
					</div>
				<br>
				</form>
				
			<form:form class="forms-sample" 
				modelAttribute="TableFormBean" action="table.html" method="post">

				<div class="col-sm-9">
                   <h4>Enter Table name</h4><br>
                   <form:input path = "tableName" class="form-control"  placeholder="Enter table Name"  />
                </div>
				<br>
				  <div class="col-sm-9">
            <h4>Enter Maximum Capacity </h4><br>
             <form:input path = "maxNo" class="form-control"  placeholder="Enter Maximum Capacity"  />
        </div>
        <br>
		 <input type="submit" class="btn btn-success mr-2" value="Submit">

			</form:form>
				
			
			
			<br>
			<c:if test="${not empty TABLELIST}">
				<div class="col-lg-12 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-dark">
									<thead>
										<tr>
											<th>Table Name</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="s" items="${TABLELIST}">
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
			</c:if>
		
			</div>
		</div>
		</div>
