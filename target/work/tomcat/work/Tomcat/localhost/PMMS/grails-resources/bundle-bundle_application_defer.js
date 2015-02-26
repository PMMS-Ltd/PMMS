if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}

function getTableHeaders(tableId){
	var cols = $("#"+tableId+" thead tr th").map(function(){return $(this).text()});
 	var headers = cols.splice(0,8);
 	return headers;
};
function getTableData(tableId, headers){
	var checked = $("#"+tableId+" tbody tr input:checked");
 	var output = [];
 	
 	checked.each(function(index){
 		$(this).parent().parent().map(function(i){
 			var row = {};
 			$(this).find('td').each(function(i){
	      var rowName = headers[i];
	      row[rowName] = $(this).text();
	    });
	  output.push(row);
	 });
 	});
 	return output
};


