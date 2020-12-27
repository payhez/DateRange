<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>DatePicker</title>
    
    <link rel="stylesheet" href="global/css/bootstrap.min.css">
	<link rel="stylesheet" href="global/css/jquery.dataTables.min.css" />
	<link href="global/css/gijgo.min.css" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	
	<script src="global/js/jquery-3.5.1.js"></script>
	<script src="global/js/jquery.dataTables.min.js"></script>
	<script src="global/js/bootstrap.min.js"></script>
    <script src="global/js/gijgo.min.js"></script>
    
</head>
<body>
	<br>
    <div class="container">
        Baslangic Tarihi: <input id="startDate" width="276" /> 
        <br>
        Bitis Tarihi: <input id="endDate" width="276" />
    </div>
    <br>
    <table id="table" class="display" style="width:100%">
        <thead>
            <tr>
                <th>E-Defter</th>
                <th>Vergi Kodu</th>
                <th>Sirket Kodu</th>
                <th>Sirket Adi</th>
                <th>Sayi</th>
                <th>Invstat</th>
            </tr>
        </thead>
    </table>	
</body>
</html>
<script>

	var today = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate());
	
	
	$('#startDate').datepicker({
	    uiLibrary: 'bootstrap4',
	    iconsLibrary: 'fontawesome',
	    maxDate: function () {
	        return $('#endDate').val();
	    }
	});
	
	$('#endDate').datepicker({
	    uiLibrary: 'bootstrap4',
	    iconsLibrary: 'fontawesome',
	    minDate: function () {
	        return $('#startDate').val();
	    }
	});
	
	
	var dt=null;
  	 
	$(document).ready(function() {
		
		$('#startDate').val(new Date(1970, 1, 1));
	    $('#endDate').val(today);
		
		load_table();
		
		function load_table(){
			var jsonreq = new Object();
	        jsonreq.startDate=formatDate($("#startDate").val());
	     	jsonreq.endDate=formatDate($("#endDate").val());
			sendAjax(jsonreq);
		}
		
		function sendAjax(jsonreq){
			$.ajax({
			    url: "${pageContext.request.contextPath}/DateRangeServlet",
			    type: "POST",
			    dataType: "json",
			    data: JSON.stringify(jsonreq),
			    contentType: "application/json",
			    mimeType: 'application/json',
			    async: true,
			    success: function(data) {
			    	
		    		if(dt==null){
			    		dt = $('#table').DataTable( {	
			    			"language": {
			                    "url": "//cdn.datatables.net/plug-ins/1.10.22/i18n/Turkish.json"
			                },
			        		data:data,
			        		columns: [
			                    { data: "edef"},
			                    { data: "aspTaxId"},
			                    { data: "comp"},
			                    { data: "kunv"},
			                    { data: "countASPTaxId"},
			                    { data: "invstat"},
			                   ],
			                   order: [[1, 'asc']]
			        	});
		    		}else{
		    			dt.clear().draw();
		    			dt.rows.add(data); // Add new data
		    			dt.columns.adjust().draw(); // Redraw the DataTable
		    			return false;
		    		}
			    }
			});
		}
	     
	    // Event listener to the two range filtering inputs to redraw on input
	    $('#startDate, #endDate').change( function() {
	    	load_table();
	    } );
	} );
	
	function formatDate(date) {
	    var d = new Date(date),
	        month = '' + (d.getMonth() + 1),
	        day = '' + d.getDate(),
	        year = d.getFullYear();
	
	    if (month.length < 2) 
	        month = '0' + month;
	    if (day.length < 2) 
	        day = '0' + day;
	
	    return [year, month, day].join('-');
	}	
</script>