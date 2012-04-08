<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
    <head>
        <title>Mobile Site</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="${ctx}/css/mobile/ui-mobile.min.css" />
        <link rel="stylesheet" href="${ctx}/css/mobile/jquery.mobile.structure-1.0.1.min.css" />
        <script src="${ctx}/js/jquery-1.7.1.min.js"></script>
        <script src="${ctx}/js/jquery.mobile-1.0.1.min.js"></script>
    </head>
    <body>
        <div data-role="page" data-theme="a">
            <div data-role="content">
                <a href="${currentUrl}?site_preference=normal" data-role="button" data-icon="star" data-theme="a">I Prefer Normal View</a>
                <p></p>
                <div data-role="collapsible">
                    <h3>Basic Info</h3>
                    <p>
                        <table>
                            <tr>
                                <td>Device ID:</td>
                                <td><c:out value="${device.id}" /></td>
                            </tr>
                            <tr>
                                <td>Mobile:</td>
                                <td><c:out value="${device.mobile}" /></td>
                            </tr>
                        </table>
                    </p>
                </div>
                <div data-role="collapsible">
                    <h3>User Agent</h3>
                    <p><c:out value="${device.userAgent}" /></p>
                </div>
                <div data-role="collapsible">
                    <h3>Markup</h3>
                    <p><c:out value="${device.markUp}" /></p>
                </div>
                <div data-role="collapsible">
                    <h3>Capabilities</h3>
                    <p>
                        <table>
                            <c:forEach var="item" items="${device.capabilities}">
                                <tr>
                                    <td><c:out value="${item.key}" /></td>
                                    <td><c:out value="${item.value}" /></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </p>
                </div>
            </div>
        </div>
    </body>
</html>
