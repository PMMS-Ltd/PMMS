<g:if test="${results.size() > 0}">
<g:each var="hit" in="${results}">
<a href="#" class="list-group-item">
<h4 class="list-group-item-heading">${hit.name }</h4>
<p class="list-group-item-text">${hit.address }</p>
<input type="hidden" name="supplierId" id="supplierId" value="${hit.id}"/>
<input type="hidden" name="address" id="address" value="${hit.address.address1}${hit.address.address2? ', '+hit.address.address2:''}"/>
<input type="hidden" name="town" id="town" value="${hit.address.town}"/>
<input type="hidden" name="county" id="county" value="${hit.address.county}"/>
<input type="hidden" name="postcode" id="postcode" value="${hit.address.postCode}"/>
<input type="hidden" name="country" id="country" value="${hit.address.country}"/>
</a>
</g:each>
</g:if>
<g:else>
<h4 class="text-muted">No Results Found</h4>
</g:else>