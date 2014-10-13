<g:each in="${results}">
<a href="#" class="list-group-item">
<h4 class="list-group-item-heading">${it.lastName }, ${it.firstName } ${it.initial? it.initial+' ':'' }(${it.salutation })</h4>
<p class="list-group-item-text">${it.address }</p>
<input type="hidden" name="personId" id="personId" value="${it.id}"/>
<input type="hidden" name="address" id="address" value="${it.address.address1}${it.address.address2? ', '+it.address.address2:''}"/>
<input type="hidden" name="town" id="town" value="${it.address.town}"/>
<input type="hidden" name="county" id="county" value="${it.address.county}"/>
<input type="hidden" name="postcode" id="postcode" value="${it.address.postCode}"/>
<input type="hidden" name="country" id="country" value="${it.address.country}"/>
</a>
</g:each>