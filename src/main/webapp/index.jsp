
<%@ include file="header.jsp" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>

<div class="hero">
    <h1> Documents en Informatique</h1>
    <p><strong>${fn:length(documents)}</strong> documents disponibles</p>
</div>

<div class="documents-grid">
    <c:choose>
        <c:when test="${empty documents}">
            <div class="card" style="text-align:center; padding:4rem;">
                <h2>Aucun document</h2>
                <p>La filière n'a pas encore de documents archivés.</p>
                <a href="admin.jsp" class="btn btn-primary">Ajouter le premier</a>
            </div>
        </c:when>
        <c:otherwise>
            <c:forEach var="doc" items="${documents}">
                <div class="card">
                    <h3 class="doc-title">${doc.titre}</h3>
                    <p class="doc-desc">${doc.description}</p>
                    <div class="doc-meta">
                        <span class="badge">
                            ${not empty doc.auteur ? doc.auteur : 'Non spécifié'}
                        </span>
                        <span class="date">
                            ${doc.dateAjout.toString().substring(0,10)}
                        </span>
                    </div>
                    <a href="detail.jsp?id=${doc.id}" class="btn btn-primary">
                        Voir détails
                    </a>
                </div>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</div>

<%@ include file="footer.jsp" %>
