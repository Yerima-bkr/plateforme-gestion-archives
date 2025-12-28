<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<%@ include file="header.jsp" %>

<div class="hero">
    <h1>Gestion des documents</h1>
    <c:if test="${not empty message}">
        <div class="alert alert-success">${message}</div>
    </c:if>
</div>

<div class="admin-form">
    <h2>${empty editDoc ? 'Nouveau document' : 'Modifier : ' + editDoc.titre}</h2>
    <form method="POST" action="admin">
        <input type="hidden" name="id" value="${editDoc.id}">
        <input type="hidden" name="action" value="save">
        
        <div class="form-group">
            <label>Titre </label>
            <input type="text" name="titre" value="${editDoc.titre}" required>
        </div>
        
        <div class="form-row">
           
            <div class="form-group">
                <label>URL fichier</label>
                <input type="url" name="fichierUrl" value="${editDoc.fichierUrl}">
            </div>
        </div>
        
        <div class="form-group">
            <label>Description</label>
            <textarea name="description" rows="4">${editDoc.description}</textarea>
        </div>
        
        <div class="form-actions">
            <button type="submit" class="btn btn-success"> Enregistrer</button>
            <a href="admin.jsp" class="btn btn-secondary">Annuler</a>
        </div>
    </form>
</div>

<div class="admin-table">
    <h2>Documents (${fn:length(documents)})</h2>
    <c:choose>
        <c:when test="${empty documents}">
            <p>Aucun document. <a href="#form" class="btn btn-primary btn-sm">Ajoutez-en un !</a></p>
        </c:when>
        <c:otherwise>
            <table>
                <thead>
                    <tr>
                        <th>Titre</th>
                        <th>Date</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="doc" items="${documents}">
                        <tr>
                            <td>${doc.titre}</td>
                            <td>${doc.dateAjout.toString().substring(0,10)}</td>
                            <td>
                                <a href="detail.jsp?id=${doc.id}" class="btn btn-sm btn-primary">Voir</a>
                                <a href="admin.jsp?action=edit&id=${doc.id}" class="btn btn-sm btn-warning">Edit</a>
                                <form method="POST" action="admin" style="display:inline;">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="id" value="${doc.id}">
                                    <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Supprimer ?')">Suppr</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:otherwise>
    </c:choose>
</div>

<%@ include file="footer.jsp" %>
ml>