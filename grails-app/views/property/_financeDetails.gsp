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
			<td><g:formatNumber type="currency" number="${propertyInstance?.serviceChargeType?.serviceCharge }" currency="GBP"/></td>
		</tr>
		<tr>
			<th>Ground Rent</th>
			<td><g:formatNumber type="currency" number="${propertyInstance?.serviceChargeType?.groundRent }" currency="GBP"/></td>
		</tr>
		<tr>
			<th>Service Charge Type</th>
			<td>${propertyInstance?.serviceChargeType} - ${propertyInstance?.serviceChargeType?.description}</td>
		</tr>
	</tbody>
</table>
<a class="btn btn-success btn-sm"><i class="fa fa-fw fa-file"></i>
	View Statement</a>