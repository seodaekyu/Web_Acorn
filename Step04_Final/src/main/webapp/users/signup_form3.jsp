<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form2.jsp</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<style>
	textarea{
		width: 768px;
		height: 300px;
	}
	html {
	  position: relative;
	  min-height: 100%;
	  padding-bottom:160px;
	}
	body {
	  margin-bottom: 160px;
	}
	footer {
	  position: absolute;
	  bottom: 0;
	  width: 100%;
	  height: 160px;
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<%-- navbar 포함 --%>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="signupForm" name="thisPage"/>
	</jsp:include>
	<div class="container mt-3" id = "app">
		<h3><strong>회원가입 폼 입니다.</strong></h3>
		<form action="signup.jsp" method="post" id="signupForm">
			<div class="mt-3">
				<label v-bind:class="{'control-label':true, 'is-valid':isvalid, 'is-invalid':isinvalid}" for="id">아이디</label>
				<input class="form-control" type="text" name="id" v-model="id" @input="inputId($event)"/>
				<div class="valid-feedback">사용 가능한 아이디 입니다.</div>
				<div class="invalid-feedback">사용할 수 없는 아이디입니다.</div>
			</div>
		</form>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
	
	<script>
		let app = new Vue({
			el:"#app",
			data:{
				id:"",
				isvalid:false,
				isinvalid:false
			},
			methods:{
				inputId(event){
					this.isvalid=true;
					this.isinvalid=false;
					
					
				}
			}
		})
	</script>
	
	<!-- <script>
		let isIdValid = false;
		let isPwdValid = false;
		let isEmailValid = false;
	
		 // id 를 입력 할때 마다 호출되는 함수 등록 
	      $("#id").on("input", function(){
	         //input 요소의 참조값을 self 에 미리 담아 놓기 
	         const self=this;
	         //일단 2개의 클래스를 모두 제거 한다음 
	         $(self).removeClass("is-valid is-invalid");
	         
	         //1. 입력한 아이디를 읽어와서
	         const inputId=$(self).val();
	         
	         //2. 서버에 페이지 전환없이 전송을 하고 응답을 받는다.
	         // jquery에서 사용할 수 있는 $는 함수이기도 하고, object이기도 함.
	         $.ajax({
	        	 url:"checkid.jsp?inputId="+inputId,
	        	 success:function(data){
	        		 console.log(data);
	 	             if(data.isExist){
	 	               $(self).addClass("is-invalid");
	 	               isIdValid=false;
	 	             }else{
	 	               $(self).addClass("is-valid");
	 	               isIdValid=true;
	 	            }
	        	 }
	         });
	      });
		
		});
		
	</script>
	-->
</body>
</html>