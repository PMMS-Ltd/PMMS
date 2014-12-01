<%@ page import="uk.org.pmms.Client" %>

<h3>Accounts</h3>
<table class="table table-condensed table-bordered">
<thead>
	<tr>
		<th class="col-xs-3">Account No.</th>
		<th class="col-xs-2">Type</th>
		<th>Account Name</th>
		<th></th>
	</tr>
</thead>
<tbody >
<g:each in="${clientInstance.accounts }" var="acc">
<tr>
<td>
	${acc.accNo}
</td>
<td>
	${acc.type}
</td>
<td>
	${acc.name}
</td>
<td class="text-center">
	<g:remoteLink action="removeAccount" class="btn btn-sm btn-danger" params="[clientId:clientInstance.id, id:acc.id]" update="accountsTable"><i class="fa fa-fw fa-trash-o"></i> Remove</g:remoteLink>
</td>
</tr>
</g:each>
</tbody>
</table>
<g:formRemote class="form-inline" role="form" name="accountsForm" url="[controller:'client', action:'addAccount']" update="accountsTable">
<div class="form-group">
 	<input type="text" name="account.accNo" placeholder="Account No." class="form-control input-sm" size="15" maxlength="10"/>
 </div>
 <div class="form-group">
 	<g:select from="${uk.org.pmms.accounts.BankAccount.constraints.type.inList }" name="account.type" class="form-control input-sm"/>
 </div>
 <div class="form-group">
 	<input type="text" name="account.name" placeholder="Account Name" class="form-control input-sm" size="30"/>
 </div>
 <div class="form-group">
  <button type="submit" class="btn btn-default btn-sm btn-success"><i class="fa fa-fw fa-plus"></i> Add</button>
  </div>
  <input type="hidden" name="clientId" value="${clientInstance.id }"/>
</g:formRemote>