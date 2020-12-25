<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>DatePicker</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div class="container">
        Start Date: <input id="startDate" width="276" />
        End Date: <input id="endDate" width="276" />
    </div>
    
    <table id="table" class="display" style="width:100%">
        <thead>
            <tr>
                <th>EDEF</th>
                <th>ASPTaxID</th>
                <th>Comp</th>
                <th>KUNV</th>
                <th>Count(asptaxId)</th>
                <th>InvStat</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>EDEF</th>
                <th>ASPTaxID</th>
                <th>Comp</th>
                <th>KUNV</th>
                <th>Count(asptaxId)</th>
                <th>InvStat</th>
            </tr>
        </tfoot>
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
       	        //table.draw();
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