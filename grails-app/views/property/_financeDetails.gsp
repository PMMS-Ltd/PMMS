<%@ page import="uk.org.pmms.Property"%>

<table class="table-condensed">
	<tbody>
		<tr>
			<th>Property</th>
			<td>${propertyInstance?.propertyId }</td>
		</tr>
		<tr>
			<th>Owner</th>
			<td>${propertyInstance?.owner }</td>
		</tr>
		<tr>
			<th>Service Charge</th>
			<td><g:formatNumber type="currency" number="${propertyInstance?.serviceChargeType?.currentCharge()?.serviceCharge }" currency="GBP" currencySymbol="£"/></td>
		</tr>
		<tr>
			<th>Ground Rent</th>
			<td><g:formatNumber type="currency" number="${propertyInstance?.serviceChargeType?.currentCharge()?.groundRent }" currency="GBP" currencySymbol="£"/></td>
		</tr>
		<tr>
			<th>Service Charge Type</th>
			<td>${propertyInstance?.serviceChargeType} - ${propertyInstance?.serviceChargeType?.description}</td>
		</tr>
	</tbody>
</table>
	<a  href="${request.contextPath }/property/svcStatement/${propertyInstance.id}" class="btn btn-success btn-sm" data-toggle="modal" data-target=".svcStatementModal"><i class="fa fa-fw fa-file"></i>
	View Statement</a>
	<div class="modal fade svcStatementModal" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-lg">
    <div class="modal-content"></div>
  </div>
</div>
