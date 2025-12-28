<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ include file="header.jsp" %>

<c:choose>
    <c:when test="${not empty document}">
        <div class="detail-card">
            <div class="detail-header">
                <h1>${document.titre}</h1>
                <div class="doc-info">
                    <span class="date">${document.dateAjout.toString().substring(0,10)}</span>
                </div>
            </div>
            
            <div class="detail-content">
                <div class="description">
                    <h2>Description</h2>
                    <p>${document.description}</p>
                </div>
                
                <c:if test="${not empty document.fichierUrl}">
                    <div class="download-section">
                        <a href="${document.fichierUrl}" class="download-btn" target="_blank">
                            Télécharger (${document.fichierUrl.substring(document.fichierUrl.lastIndexOf('/')+1)})
                        </a>
                    </div>
                </c:if>
            </div>
            
            <div class="detail-actions">
                <a href="index.jsp" class="btn btn-secondary">Retour documents</a>
                <a href="admin.jsp?action=edit&id=${document.id}" class="btn btn-warning">Modifier</a>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <div class="card" style="text-align:center; padding:4rem;">
            <h2>Document non trouvé</h2>
            <a href="index.jsp" class="btn btn-primary">Retour documents</a>
        </div>
    </c:otherwise>
</c:choose>

<%@ include file="footer.jsp" %>
