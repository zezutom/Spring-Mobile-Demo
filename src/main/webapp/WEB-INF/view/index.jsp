<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title>Normal Site</title>
</head>
<body>
<div style="padding-top:10px;width:80%;margin-left:auto;margin-right:auto;">
    <a href="${currentUrl}?site_preference=mobile">I Prefer Mobile View</a>

    <h3>Basic Info</h3>

    <div>
        <table>
            <tr>
                <td>Device ID:</td>
                <td><c:out value="${device.id}"/></td>
            </tr>
            <tr>
                <td>Mobile:</td>
                <td><c:out value="${device.mobile}"/></td>
            </tr>
        </table>
    </div>
    <h3>User Agent</h3>

    <div><c:out value="${device.userAgent}"/></div>
    <h3>Markup</h3>

    <div><c:out value="${device.markUp}"/></div>
    <h3>Capabilities</h3>

    <div>
        <table>
            <c:forEach var="item" items="${device.capabilities}">
                <tr>
                    <td><c:out value="${item.key}"/></td>
                    <td><c:out value="${item.value}"/></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>
