<%@ page language="java" pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="rms" uri="/WEB-INF/tags/implicit.tld" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="uri" value="${req.requestURI}" />
<c:set var="baseurl" value="${ fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath }"/>
