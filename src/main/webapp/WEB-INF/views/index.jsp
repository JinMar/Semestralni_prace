<%@page contentType="text/html" pageEncoding="windows-1250" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>

<html>
<head>
    <title>Semestr�ln� projekt</title>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <spring:url value="/css/main.css" var="coreCss"/>
    <spring:url value="/img/logo-fm.png" var="logo"/>
    <link href="${coreCss}" rel="stylesheet" media="all"/>
</head>
<body>
<header>
    <div id="Logo">
        <h1><a href="#">Semestr�ln� projekt</a></h1>
    </div>

</header>
<section id="Preview">

    <div class="img_Border"><a href="www.fm.tul.cz"><img class="def" src=${url} alt=""/></a></div>
</section>
<section>
    <article class="cont">

        <header>
            <h2>V�tejte na str�nk�ch semestr�ln� pr�ce z p�edm�tu Pokro�il� programov�n� na platform� Java</h2>
        </header>
        <div class="rating">
        <form:form method="GET" action="/likeimg/id=${current}&next=${next}&prv=${previous}">
            <input type="submit" value="Like: ${likes} "/>
        </form:form>
        <form:form method="GET" action="/dislikeimg/id=${current}&next=${next}&prv=${previous}">
            <input type="submit" value="Dislike: ${dislikes}"/>
        </form:form>
</div>
        <div class="buts">
            <p>${infodata}</p>
            <div class="left-but">
                <form:form method="GET" action="/previous/id=${previous}">
                    <input type="submit" value="P�EDCHOZ�"/>
                </form:form>
            </div>
            <div class="right-but">
                <form:form method="GET" action="/next/id=${next}">
                    <input type="submit" value="DAL��"/>
                </form:form>
            </div>
        </div>
        <div class="comments">
            <ul >
                <c:forEach items="${comemnt}" var="post">



                <li class="heg">
                    <div class="item">
                        <div class="rating">
                            <form:form method="GET" action="/like/id=${current}&com=${post.id}&next=${next}&prv=${previous}">
                                <input type="submit" value="Like"/>
                            </form:form>
                            <form:form method="GET" action="/dislike/id=${current}&com=${post.id}&next=${next}&prv=${previous}">
                                <input type="submit" value="Dislike"/>
                            </form:form>
                            <ul class="rtg">
                                <li>pocet liku : ${post.likes}</li>
                                <li>pocet dislike :  ${post.dislikes}</li>
                            </ul>
                        </div>
                        <p>${post.text}</p>
                    </div> <div class="clr"></div>
                </li>
                </c:forEach>
            </ul>
            <form:form method="POST" modelAttribute="mybox" action="/saveComment/id=${current}&next=${next}&prv=${previous}">

                <form:textarea path="text"/>


                <input type="submit" value="GET"/>
            </form:form>
        </div>

    </article>


</section>
<footer>
    <p>&copy; Semestr�ln� projekt 2016. All rights reserved. Design by Marek Jindr�k.</p>
</footer>

</body>
</html>
