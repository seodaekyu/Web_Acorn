<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 수정할 글 번호를 읽어온다.
	int num = Integer.parseInt(request.getParameter("num"));
	// 2. DB에서 수정할 글 정보를 읽어온다.
	CafeDto dto = CafeDao.getInstance().getData(num);
	// 3. 글 수정 폼을 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/updateform</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
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
</head>
<body>
	<%-- navbar 포함 --%>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="" name="thisPage"/>
	</jsp:include>
	<div class="container">
		<h3 class="mt-3"><strong>글 수정 폼입니다.</strong></h3>
		<form action="update.jsp" method="post">
			<!-- 수정 반영할 때 글 번호도 필요하기 때문에 input type="hidden"으로 전송되도록 한다. -->
			<input type="hidden" name="num" value="<%=dto.getNum() %>" />
			<div class="mb-3 col-6">
				<label class="form-label mt-3" for="title">제목</label>
				<input class="form-control" type="text" name="title" id="title" value="<%=dto.getTitle()%>"/>
			</div>
			<div class="mb-3">
				<label class="form-label mt-3" for="content">내용</label>
				<textarea name="content" id="content"><%=dto.getContent() %></textarea>
			</div>
			<button class="btn btn-dark" type="submit" onclick="submitContents(this)">수정확인</button>
			<button class="btn btn-danger" type="reset">취소</button>
		</form>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
	<!-- SmartEditor 에서 필요한 javascript 로딩  -->
   <script src="${pageContext.request.contextPath }/SmartEditor/js/HuskyEZCreator.js"></script>
   <script>
      var oEditors = [];
      
      //추가 글꼴 목록
      //var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];
      
      nhn.husky.EZCreator.createInIFrame({
         oAppRef: oEditors,
         elPlaceHolder: "content",
         sSkinURI: "${pageContext.request.contextPath}/SmartEditor/SmartEditor2Skin.html",   
         htParams : {
            bUseToolbar : true,            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,      // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true,         // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            //aAdditionalFontList : aAdditionalFontSet,      // 추가 글꼴 목록
            fOnBeforeUnload : function(){
               //alert("완료!");
            }
         }, //boolean
         fOnAppLoad : function(){
            //예제 코드
            //oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
         },
         fCreator: "createSEditor2"
      });
      
      function pasteHTML() {
         var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
         oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
      }
      
      function showHTML() {
         var sHTML = oEditors.getById["content"].getIR();
         alert(sHTML);
      }
         
      function submitContents(elClickedObj) {
         //SmartEditor 에 의해 만들어진(작성한글) 내용이 textarea 의 value 가 되도록 한다. 
         oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);   // 에디터의 내용이 textarea에 적용됩니다.
         
         // 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
         
         try {
            //폼 제출하기 
            elClickedObj.form.submit();
         } catch(e) {}
      }
      
      function setDefaultFont() {
         var sDefaultFont = '궁서';
         var nFontSize = 24;
         oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
      }
   </script>   
</body>
</html>