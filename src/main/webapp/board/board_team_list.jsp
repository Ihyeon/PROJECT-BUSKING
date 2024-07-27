<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<%@ include file="../include/header.jsp" %>
    
<section id="board_team_list_wrap">  
 
	<nav class="board_nav">
	    <div id="board_nav_wrap">
	        <h1>BOARD</h1>
	        <ul class="menu">
	            <li class="nth1"><strong><a href="board_list.boardTeam">TEAM</a></strong></li>
	            <li class="nth2"><strong><a href="board_list.boardFree">자유게시판</a></strong></li>
	            <li class="nth3 active"><strong><a href="board_list.boardTeam">팀원 모집</a></strong></li>
	            <li class="nth4"><strong><a href="board_list.boardAsk">Q & A</a></strong></li>
	        </ul>
	    </div>
	</nav>

        <div class="wrap_board_team">              
            <div class="wrap_board_team_list">
                <div class="add">
                    <div class="wrap_board_team_list_title">
                        <div><strong>팀원 모집</strong></div>
                    </div>
                    
                    
                    <div class="board_team_list_box">
                        <table class="board_team_list_content">
                        <thead>
                            <tr>
                                <th class="nth1">글 번호</th>
                                <th class="nth2">작성자</th>
                                <th class="nth3">제목</th>
                                <th class="nth4">날짜</th>
                                <th class="nth5">모집 인원</th>
                                <th class="nth6">모집 상태</th>
                            </tr>
                        </thead>
                        <tbody>
	                        <!--데이터 받아오기-->
	                        <c:forEach var="dto" items="${teamList }">
								<tr>
									<td>${dto.teamNum }</td>
									<td>${dto.teamWriter }</td>
									<td><a href="board_content.boardTeam?bno=${dto.teamNum }">${dto.teamTitle }</a></td>
									<td><fmt:formatDate value="${dto.teamRegdate }" pattern="yy.MM.dd"/></td>
									<td>
										<c:choose>
											<c:when test="${dto.teamCount == 6 }">기타</c:when>
											<c:otherwise>${dto.teamCount }명</c:otherwise>
										</c:choose>
									</td>
									<td>
										${dto.teamResult == 'T' ? '모집중' : '모집완료' }
									</td>
								</tr>
							</c:forEach>

                        </tbody>
                    </table> 
                </div>
                
                    <div class="page_nav">
                        <ul class="center">
	                	<c:choose>
		                	<c:when test="${!pageVO.first }">
								<li id="page_first">
									<a href="board_list.boardTeam">
										<i class="fa-solid fa-angles-left"></i>
									</a>
								</li>
							</c:when>
							<c:otherwise>
								<li id="page_first">
									<div class="page_link">
										<i class="fa-solid fa-angles-left" style="color: #daeede;"></i>
									</div>
								</li>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${!pageVO.first }">
								<li id="page_prev">
									<a href="board_list.boardTeam?page=${pageVO.pageNum - 1 }">
										<i class="fa-solid fa-angle-left"></i>
									</a>
								</li>
							</c:when>
							<c:otherwise>
								<li id="page_prev">
									<div class="page_link">
										<i class="fa-solid fa-angle-left" style="color: #daeede;"></i>
									</div>
								</li>
							</c:otherwise>
						</c:choose>
						
						<c:forEach var="i" begin="${pageVO.startPage }" end="${pageVO.endPage }" step="1">
							<li class="page_li" data-page="${i }">
								<a href="board_list.boardTeam?page=${i }" title="1페이지">${i }</a>
							</li>
						</c:forEach>
						
						<c:choose>
		                	<c:when test="${!pageVO.last }">
								<li id="page_next">
									<a href="board_list.boardTeam?page=${pageVO.pageNum + 1}">
										<i class="fa-solid fa-angle-right"></i>
									</a>
								</li>
							</c:when>
							<c:otherwise>
								<li id="page_next">
									<div class="page_link">
										<i class="fa-solid fa-angle-right" style="color: #daeede;"></i>
									</div>
								</li>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${!pageVO.last }">
								<li id="page_last">
									<a href="board_list.boardTeam?page=${pageVO.realEndPage }">
										<i class="fa-solid fa-angles-right"></i>
									</a>
								</li>
							</c:when>
							<c:otherwise>
								<li id="page_last">
									<div class="page_link">
										<i class="fa-solid fa-angles-right" style="color: #daeede;"></i>
									</div>
								</li>
							</c:otherwise>
						</c:choose>
					</ul>
                        <form action="board_write.boardTeam" class="right">
                            <button value="글쓰기">작성</button>  
                        </form>    
                    </div>                     
                <div class="board_team_search">
                    <select class="board_team_search_box">
                        <option value="notice">전체</option>
                        <option value="writer">작성자</option>
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                    <input placeholder="검색어를 입력해 주세요" type="text">
                    <span>
                        <button class="btn" onclick="실행할JS함수/검색기능" type="submit">검색</button>
                    </span>
                </div>
                </div>                
            </div>
        </div>
    </section>
    
	<script src="${pageContext.request.contextPath }/resources/js/board/board_list.js"></script>

<%@ include file="../include/footer.jsp" %>
