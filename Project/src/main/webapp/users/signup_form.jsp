<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form2.jsp</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container mt-3">
		<h3><strong>회원가입 폼 입니다.</strong></h3>
		<form v-on:submit="onSubmit" action="signup.jsp" method="post" id="signupForm">
			<div class="mt-3">
				<label class="control-label" for="id">아이디</label>
				<input 
					v-on:input="onIdInput" 
					v-model="id" 
					v-bind:class="{'is-valid':isIdValid, 'is-invalid':!isIdValid && isIdDirty}"
					class="form-control" type="text" name="id" id="id"/>
				<small class="form-text text-muted">영문자 소문자로 시작하고 5글자~10글자 이내로 입력하세요.</small>
				<div class="valid-feedback">사용 가능한 아이디 입니다.</div>
				<div class="invalid-feedback">사용할 수 없는 아이디입니다.</div>
			</div>
			<div>
				<label class="control-label" for="pwd">비밀번호</label>
				<input
					v-on:input="onPwdInput" 
					v-model="pwd" 
					v-bind:class="{'is-valid':isPwdValid, 'is-invalid':!isPwdValid && isPwdDirty}"
				 	class="form-control" type="password" name="pwd" id="pwd"/>
				<small class="form-text text-muted">특수 문자를 하나 이상 조합하세요.</small>
				<div class="invalid-feedback">비밀 번호를 확인하세요.</div>
			</div>
			<div>
				<label for="pwd2" class="control-label">비밀번호 확인</label>
				<input 
					v-on:input="onPwdInput"
					v-model="pwd2"
				 	type="password" class="form-control" name="pwd2" id="pwd2"/>
			</div>
			<div>
				<label class="control-label" for="email">이메일</label>
				<input 
					v-on:input="onEmailInput" 
					v-model="email"
					v-bind:class="{'is-valid':isEmailValid, 'is-invalid':!isEmailValid && isEmailDirty}"
					class="form-control" type="email" name="email" id="email"/>
				<div class="invalid-feedback">이메일 형식에 맞게 입력하세요.</div>
			</div>
			<button v-bind:disabled="!isFormValid" class="btn btn-dark mt-3" type="submit">가입</button> 
		</form>
	</div>
	
	<script>
	    new Vue({
	        el:"#signupForm",
	        data:{
	           isIdValid:false,
	           isPwdValid:false,
	           isEmailValid:false,
	           id:"",
	           email:"",
	           pwd:"",
	           pwd2:"",
	           isIdDirty:false,
	           isEmailDirty:false,
	           isPwdDirty:false,
	        },
	        // 모델을 활용한 계산된 값을 얻어내고 싶을 때, 모델처럼 사용하기 위해서
			computed:{
				isFormValid(){
					// 모델을 활용해서 얻어낼 값이 있으면 얻어낸다.
					let result = this.isIdValid && this.isPwdValid && this.isEmailValid;
					// 함수에서 리턴해주는 값을 모델처럼 사용하면 됨.
					return result;
				}	
			},
	        methods:{
	        	onPwdInput(){
	        		this.isPwdDirty=true;
	    			//비밀번호를 검증할 정규 표현식
	    	         const reg=/[\W]/;
	    	         //만일 정규표현식 검증을 통과 하지 못했다면
	    	         if(!reg.test(this.pwd)){
	    	            this.isPwdValid=false;
	    	            return; //함수를 여기서 끝내라 
	    	         }
	    			
	    			// 만일 비밀번호 입력란과 확인란이 같다면
	    			if(this.pwd== this.pwd2 ){
	    				this.isPwdValid = true;
	    	
	    			}else{// 다르다면
	    				this.isPwdValid = false;
	    			}
	        	},
	        	
	        	onEmailInput(){
		        	this.isEmailDirty=true;
	   	         	
	   	         	//이메일을 검증할 정규 표현식  
	   	         	const reg=/^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$/;
	   	         	// 만일 입력한 이메일이 정규 표현식 검증을 통과하지 못했다면
	   	         	if(!reg.test(this.email)){
	   	            	this.isEmailValid = false;
	   	         	}else{// 통과 했다면
	   	            	this.isEmailValid = true;
	   	         	}
	        	},
	        
	           onIdInput(){
	        	   // 아이디를 한번이라도 입력하면 아이디가 더럽혀졌는지 여부를 true로 바꿔준다.
	        	   this.isIdDirty=true;
	              // 아이디를 검증할 정규표현식
	              const reg=/^[a-z].{4,9}$/;
	              // 입력한 아이디가 정규표현식과 매칭이 되는지(통과 되는지) 확인한다. 
	              const isMatch=reg.test(this.id);
	              // 만일 매칭되지 않는다면
	              if(!isMatch){
	                 this.isIdValid=false;
	                 return; //함수를 여기서 끝내라
	              }
	              
	              // Vue 객체의 참조값을 self에 담기
	              const self = this;
	              
		           // 2. 서버에 페이지 전환없이 전송을 하고, 응답을 받는다.
		  			fetch("checkid.jsp?inputId="+this.id)
		  			.then(function(response){
		  				return response.json();
		  			})
		  			.then(function(data){
		  				// 3. 사용가능한지 여부에 따라 아이디 입력란에 is-valid or is-invalid 클래스를 적절히 추가, 제거를 한다. 
		  				if(data.isExist){
		  					// 여기서 this는 fetch를 가르킴
		  					self.isIdValid = false;
		  				}else{
		  					self.isIdValid = true;
		  				}
		  			});
	           },
	           
	           onSubmit(e){
		        	// 아래의 코드는 아이디, 비밀번호, 이메일 유효성 검증 결과를 고려해서 조건부로 실행되도록 해야한다.
		   			// 폼 전체의 유효성 여부
		   			// const isFormValid = this.isIdValid && this.isPwdValid && this.isEmailValid;
		   			// 만일 폼이 유효하지 않으면
		   			if(!this.isFormValid){
		   				e.preventDefault(); // 폼 전송 막기
		   			}
	           }
	        
	        }
	     });
	</script>
</body>
</html>