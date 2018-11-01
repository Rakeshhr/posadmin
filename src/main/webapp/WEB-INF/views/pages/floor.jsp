<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		
                  <c:if test="${param.error != null}">
								<div class="alert alert-success">
									<p>Insertion successfully created.</p>
								</div>
				  </c:if>		
		
		<div class="col-12">
                  <div class="card">
                    <div class="card-body">
                      <h3 >Add Floor</h3><br><br>
		<form:form class="forms-sample" modelAttribute="FloorFormBean" action="floor.html" method="post">
		<div class="col-sm-9" >
			<h4>Select Establishment name</h4><br>
 			<form:select path="estId" class="form-control">
				<form:option value="NONE" label="--- Select ---"/>
			    <form:options items="${ESTABLISHMENTMAP}"/>
			    
			</form:select> 
		</div>
		<br>
		<div class="col-sm-9">
            <h4>Enter floor name</h4><br>
             <form:input path = "name" class="form-control"  placeholder="Enter Floor Name" />
        </div>
        <br>
        <br>
		<input type="submit" class="btn btn-success mr-2" value="Submit">

		</form:form>
 					</div>
                  </div>
                </div>