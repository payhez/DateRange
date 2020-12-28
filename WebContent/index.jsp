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
    <script src="global/js/gijgo.min.js" type="text/javascript"></script>
  	<script src="https://unpkg.com/gijgo@1.9.13/js/messages/messages.tr-tr.js" type="text/javascript"></script>
    
</head>
<body>
	<br>
    <div class="container" style="text-align: -webkit-center;">
        <b>Baslangic Tarihi:</b> <input id="startDate" width="276" />
        <br>
        <b>Bitis Tarihi:</b> <input id="endDate" width="276" />
    </div>
    <br>
    <div class="container" style="background: whitesmoke;">
    	<br>
	    <table id="table" class="display" style="width:100%">
	        <thead>
	            <tr>
	                <th>Yetkili</th>
	                <th>Vergi Kodu</th>
	                <th>Sirket Kodu</th>
	                <th>Sirket Adi</th>
	                <th>Sayi</th>
	                <th>Durum</th>
	            </tr>
	        </thead>
	    </table>
	 </div>	
</body>
</html>
<script>

	var today = new Date();
	var defaultStartDate = new Date(2000, 1, 1);
	
	$('#startDate').datepicker({
		locale : 'tr-tr',
		format: 'yyyy-mm-dd',
	    uiLibrary: 'bootstrap4',
	    iconsLibrary: 'fontawesome',
	    maxDate: function () {
	        return $('#endDate').val();
	    }
	});
	
	$('#endDate').datepicker({
		locale : 'tr-tr',
		format: 'yyyy-mm-dd',
	    uiLibrary: 'bootstrap4',
	    iconsLibrary: 'fontawesome',
	    minDate: function () {
	        return $('#startDate').val();
	    }
	});
	
	var dt= null; // Datatable is created
  	 
	$(document).ready(function() {
		
		$('#startDate').val(defaultStartDate.getFullYear()+"-"+defaultStartDate.getMonth()+"-"+defaultStartDate.getDate()); // Default start date is set to (1.1.2000)
	    $('#endDate').val(today.getFullYear()+"-"+(today.getMonth()+1)+"-"+today.getDate()); // Default end date is set to recent date
	    
	    
		load_table();
		
		function load_table(){
			var theRequestedDates = new Object(); // An object with startDate and endDate attributes
			theRequestedDates.startDate=$("#startDate").val();
			theRequestedDates.endDate=$("#endDate").val();
			sendAjax(theRequestedDates);
		}
		
		function sendAjax(theRequestedDates){
			$.ajax({
			    url: "${pageContext.request.contextPath}/DateRangeServlet",
			    type: "POST",
			    dataType: "json",
			    data: JSON.stringify(theRequestedDates),
			    contentType: "application/json",
			    mimeType: 'application/json',
			    async: true,
			    success: function(data) {
			    	
		    		if(dt==null){
			    		dt = $('#table').DataTable( {	
			    			"language": {
			                    "url": "global/Turkish.json"
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
		    			dt.clear();
		    			dt.rows.add(data); // Add new data
		    			dt.columns.adjust().draw(); // Redraw the DataTable
		    		}
			    }
			});
		}
	     
	    // Event listener to the two range filtering inputs to redraw on input
	    $('#startDate, #endDate').change( function() {
	    	load_table();
	    } );
	} );
</script>