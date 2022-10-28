<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>
.uploadResult {
	width: 100%;
	background-color: gray;
}
.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}
.uploadResult ul li {
	list-style: none;
	padding: 10px;
}
.uploadResult ul li img {
	width: 20px;
}
.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
}
.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}
.bigPicture img {
  width: 600px;
}
</style>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Product Register</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Product Register</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form action="/product/register" method="post" role="form">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<div class="form-group">
						<label>상품 제목</label> <input class="form-control" name="title">
					</div>
					<div class="form-group">
						<label>상품 설명</label>
						<textarea rows="3" class="form-control" name="description"></textarea>
					</div>
					<div class="form-group">
						<label>시작 가격</label> 
						<input class="form-control" name="start_price" >
					</div>
					<button type="submit" class="btn btn-default">Submit Button</button>
					<button type="reset" class="btn btn-default">Reset Button</button>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">
      <div class="panel-heading">File Attach</div><!-- /.panel-heading -->
      <div class="panel-body">
        <div class="form-group uploadDiv">
            <input type="file" name='uploadFile' multiple>
        </div>
        <div class='uploadResult'> 
          <ul>
          </ul>
        </div>
      </div><!--  end panel-body -->
    </div><!--  end panel-body -->
  </div><!-- end panel -->
</div><!-- /.row -->