<%@ page language="java" pageEncoding="UTF-8" session="false"
%><%@ include file="/WEB-INF/jsp/common/directive.jsp" %>

<tiles:insertDefinition name="error.layout">

<tiles:putAttribute name="content">

            <p class="txt2">500 INTERNAL SERVER ERROR</p>
            <p class="txtKo2">문제가 발생하여 페이지를 표시할 수 없습니다.</p>

</tiles:putAttribute>

</tiles:insertDefinition>
