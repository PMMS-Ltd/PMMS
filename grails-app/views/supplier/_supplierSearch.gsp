<g:each var="hit" in="${results.hits}">
<a href="#" class="list-group-item">
<h4 class="list-group-item-heading">${hit.data.name }</h4>
<p class="list-group-item-text">${hit.data.address }</p>
<input type="hidden" name="supplierId" id="supplierId" value="${hit.data.id}"/>
<input type="hidden" name="address" id="address" value="${hit.data.address.address1}${hit.data.address.address2? ', '+hit.data.address.address2:''}"/>
<input type="hidden" name="town" id="town" value="${hit.data.address.town}"/>
<input type="hidden" name="county" id="county" value="${hit.data.address.county}"/>
<input type="hidden" name="postcode" id="postcode" value="${hit.data.address.postCode}"/>
<input type="hidden" name="country" id="country" value="${hit.data.address.country}"/>
</a>
</g:each>