<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>index</title>

<style>
<%@include file="/WEB-INF/resources/css_table_test.css"%>
</style>

<!-- CSS -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<!-- AJAX -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- MODAL -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
<!-- VALIDATE -->
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.19.2/jquery.validate.min.js"></script>




<script>

GetUser();

function btnEdit() {
    $('.editbtn').on('click', function () {
        $('#editmodal').modal('show');
        $tr = $(this).closest('tr');;
        var data = $tr.children("td").map(function () {
            return $(this).text();
        }).get();
        $('#hopo').val(data[0]);
        $('#flti').val(data[1]);
        $('#alc').val(data[2]);
        $('#counter').val(data[3].trim());
    });
}

function btnDelete() {
    $('.deletebtn').on('click', function () {
    	var c = confirm("Do you want to delete?");
		if (c == true) {
	        $tr = $(this).closest('tr');
	        var data = $tr.children("td").map(function () {
	            return $(this).text();
	        }).get();     
	        var hopo = data[0]; 
	        var flti = data[1]; 
	        var alc = data[2];
	        $.ajax({
				type: "DELETE",
				url:"/counter/remove",
				contentType: "application/json; charset=utf-8",
				data:JSON.stringify({id: {"hopo":hopo,"flti":flti,"alc":alc}}),
				success: function (data) {
				 	GetUser()
				}
			});     
		}                 
	});
}


$(document).ready(function() {
    $('.createbtn').on('click', function () {
    	$.ajax({
    		type: "GET",
    		url:"/airport/all",
    		success: function (result) {
    			const data = JSON.stringify(result);
    			var obj = jQuery.parseJSON(data);
    			if(obj != '') {
    				$("#create_hopo").empty();
    			      var options = '';
    			      $.each(obj, function(i, item) {
    			          options += '<option>'+item["apc"]+'</option>';
    			      });
    			      $("#create_hopo").html(options);
    			}
    		}
    	});
    	$.ajax({
    		type: "GET",
    		url:"/airline/all",
    		success: function (result) {
    			const data = JSON.stringify(result);
    			var obj = jQuery.parseJSON(data);
    			if(obj != '') {
    				$("#create_alc_list").empty();
    			      var options = '';
    			      $.each(obj, function(i, item) {
    			          options += '<option value='+item["alc"]+'>'+item["alc"]+'</option>';
    			      });
    			      $("#create_alc_list").html(options);
    			}
    			
    			var create_alc = document.getElementById("create_alc");
    			var create_alc_list = document.getElementById("create_alc_list");
    			
    			create_alc.addEventListener("input", function() {
					if(create_alc.value.length<2){
						create_alc_list.style.display = 'block';
					} else {
						create_alc_list.style.display = 'none';
					}
    			});
    			create_alc.addEventListener("focus", function() {
    				if(create_alc.value.length<2){
						create_alc_list.style.display = 'block';
					} else {
						create_alc_list.style.display = 'none';
					}
    			});

    			for (let option of create_alc_list.options) {
      				option.onclick = function() {
      			    	create_alc.value = option.value;
      			    	create_alc_list.style.display = 'none';
      			    	create_alc.focus();
      			    	create_alc.blur()
      			  }
      			};

    			document.addEventListener("click", function (event) {
    				if (!create_alc.contains(event.target)) {
    					create_alc_list.style.display = 'none';
    				}
    			});
	
    			create_alc.oninput = function() {
    			  	currentFocus = -1;
    			  	var text = create_alc.value.toUpperCase();
    			  	for (let option of create_alc_list.options) {
    			    if (option.value.toUpperCase().indexOf(text) > -1) {
    			      option.style.display = "block";
    			    } else {
    			      option.style.display = "none";
    			    }
    			  }
    			}
    			
    			var currentFocus = -1;
    			create_alc.onkeydown = function(e) {
    			  if (e.keyCode == 40) {
    			    currentFocus++
    			    addActive(create_alc_list.options);
    			  } else if (e.keyCode == 38) {
    			    currentFocus--
    			    addActive(create_alc_list.options);
    			  } else if (e.keyCode == 13) {
    			    e.preventDefault();
    			    if (currentFocus > -1) {
    			      /*and simulate a click on the "active" item:*/
    			      if (create_alc_list.options) create_alc_list.options[currentFocus].click();
    			    }
    			  }
    			}
    			
    			function addActive(x) {
    			  if (!x) return false;
    			  removeActive(x);
    			  if (currentFocus >= x.length) currentFocus = 0;
    			  if (currentFocus < 0) currentFocus = (x.length - 1);
    			  x[currentFocus].classList.add("active");
    			}

    			function removeActive(x) {
    			  for (var i = 0; i < x.length; i++) {
    			    x[i].classList.remove("active");
    			  }
    			}

    		}
    	});
    	$('#create_alc').val("");
		$('#create_counter').val("");  
		$('#createmodal').modal('show');
    });
});

function GetUser(){		
	$.ajax({
		type: "GET",
		url:"/counter/all",
		success: function (result) {
			const data = JSON.stringify(result);
			var obj = jQuery.parseJSON(data);
			if(obj != '') {
				$("#myBody").empty();
				$.each(obj, function(key, val) {
					var tr = "<tr>";
					tr = tr + "<td>" + val.id.hopo + "</td>";
					tr = tr + "<td>" + val.id.flti + "</td>";
					tr = tr + "<td>" + val.id.alc + "</td>";
					tr = tr + "<td>" + val["counter"] + "</td>";
					tr = tr + '<td><button type="button" class="btn btn-primary editbtn">EDIT</button></td>';
					tr = tr + '<td><button type="button" class="btn btn-danger deletebtn">DELETE</button></td>';
					tr = tr + "</tr>";
					$('#customers > tbody:last').append(tr);
				})
			}
			btnEdit();
			btnDelete();
		}
	});
}

$.validator.addMethod("commaAfterEveryCharacter", function(value, element) {
	if (value.includes(",")) {
		const items = value.split(",");
		for (let i = 0; i < items.length; i++) {
			if (items[i].length === 0 || items[i].length > 1 || (items[i].length === 1 && items[i + 1] && items[i + 1].length !== 1)) {
				return false;
			}
			if (items.indexOf(items[i]) !== i) {
				return false;
			}
		}
		return !value.endsWith(",");
	} else {
		return value.length <= 1;
	}
}, "Input cannot contain empty items or duplicate characters separated by comma.");


$.validator.addMethod("alcCheck", function(value, element) {
    var options = $('#create_alc_list option');
    for (var i = 0; i < options.length; i++) {
        if (options[i].value === value.toUpperCase()) {
            return true;
        }
    }
    return false;
}, "Please specify a valid ALC2.");

$(document).ready(function() {
    $("#form_create").validate({
		errorClass: 'errors',
        rules: {
        	create_alc_list:{
                required: true,
                alcCheck: true
                },
       		create_counter: {
       	        required: true,
       	        commaAfterEveryCharacter: true
       	        }
        },
        messages: {
            create_alc:{
                required: "Please specify ALC2."
                    },
        	create_counter:{
                required: "Please specify COUNTER."
            },
        }
    });
});

$(document).ready(function(){
	$('#update').click(function(){ 
		if($("#form_edit").valid()){
			var hopo=$('#hopo').val();
			var flti=$('#flti').val();
			var alc=$('#alc').val();
	   		var counter=$('#counter').val().toUpperCase();
	   		if (counter!=""){
	   	 	    $.ajax({
		   	 	    type: "PUT",
		 			url:"/counter/edit",
		 			contentType: "application/json; charset=utf-8",
		 			data: JSON.stringify({id: {"hopo":hopo,"flti":flti,"alc":alc},"counter":counter}),
	   	 	 		success: function (data) {
	   	  	 	          	GetUser();
	   	  	 	           	$('#editmodal').modal('hide'); 
	   	  	 	      		$('#search_hopo').val("");
	   	  					$('#search_flti').val("");
							$('#search_alc').val("");
							$('#search_counter').val("");
	   	 	     	}
	   	 		}); 
	   	   	} 
		}   	   	                    
 	});
});

$(document).ready(function() {
    $("#form_edit").validate({
    	errorClass: 'errors',
        rules: {
        	counter:{
        		required: true,
       	        commaAfterEveryCharacter: true
            }
        },
        messages: {
        	counter:{
                required: "Please specify COUNTER."
            }
        }
    })
});

$(document).ready(function(){
	$('#create').click(function(){  
		if($("#form_create").valid()){
			var hopo=$('#create_hopo').val();
			var flti=$('#create_flti').val();
			var alc=$('#create_alc').val().toUpperCase();
			var counter=$('#create_counter').val().toUpperCase();
	   		if (counter!="" && alc!=""){
		 		$.ajax({
		 			type: "POST",
		 			url:"/counter/create",
		 			contentType: "application/json; charset=utf-8",
		 			data: JSON.stringify({id: {"hopo":hopo,"flti":flti,"alc":alc},"counter":counter}),
		 			success: function (data) {
			 			if(data){
			 				GetUser();
						 	$('#createmodal').modal('hide');
				 			}
			 			else{
			 				alert("Duplicate information");
				 			}
			 			
					 	}
				});   
	   		}
		}
	});
});

$(document).ready(function(){
	$("#search_hopo, #search_flti, #search_alc, #search_counter").keyup(function(){
		var hopo=$('#search_hopo').val().toUpperCase();
		var flti=$('#search_flti').val().toUpperCase();
		var alc=$('#search_alc').val().toUpperCase();
		var counter=$('#search_counter').val().toUpperCase();
		if (hopo!="" || flti!="" || alc!="" || counter!=""){
			$.ajax({
	 			type: "GET",
	 			url:"/counter/search",
	 			data:{"hopo":hopo, "flti":flti, "alc":alc, "counter":counter},
	 			success: function (result) {
	 				const data = JSON.stringify(result);
	 				var obj = jQuery.parseJSON(data);
	 				if(obj != '') {
	 					$("#myBody").empty();
	 					$.each(obj, function(key, val) {
	 						var tr = "<tr>";
	 						tr = tr + "<td>" + val.id.hopo + "</td>";
	 						tr = tr + "<td>" + val.id.flti + "</td>";
	 						tr = tr + "<td>" + val.id.alc + "</td>";
	 						tr = tr + "<td>" + val["counter"] + "</td>";
	 						tr = tr + '<td><button type="button" class="btn btn-primary editbtn">EDIT</button></td>';
	 						tr = tr + '<td><button type="button" class="btn btn-danger deletebtn">DELETE</button></td>';
	 						tr = tr + "</tr>";
	 						$('#customers > tbody:last').append(tr);
	 					});
	 					btnEdit();
		 				btnDelete();
	 				} else {
	 					$("#myBody").empty();
	 					btnEdit();
		 				btnDelete();
					}
				}
	 		});   
		} else {
			GetUser();
		}
	});
});
</script>
</head>
<body>
	<div class="container mt-2 pb-2 border ">
		<h1>Counter Information</h1>
		<div>
		<table id="customers">
			<thead>
				<tr>
					<th>
	  					<input type="text" class="form-control" id="search_hopo" placeholder="Search HOPO" maxlength="3" >
	  				</th>
					<th>
	  					<input type="text" class="form-control" id="search_flti" placeholder="Search FLTI" maxlength="1" >
	  				</th>
					<th>
	  					<input type="text" class="form-control" id="search_alc" placeholder="Search ALC2" maxlength="2" >
	  				</th>
					<th>
	  					<input type="text" class="form-control" id="search_counter" placeholder="Search COUNTER" >
	  				</th>
	  				<th colspan="2">
	  					<button type="button" class="btn btn-info my-1 btn-block createbtn">CREATE</button>
  					</th>
				</tr>
<!-- 				style="text-transform:uppercase" -->
				<tr>
					<th>HOPO</th>
					<th>FLTI</th>
					<th>ALC2</th>
					<th>COUNTER</th>
					<th>EDIT</th>
					<th>DELETE</th>
				</tr>
				</thead>
				<tbody id="myBody">	
				</tbody>
		</table>
	</div>
</div>
	<!-- EDIT POP UP FORM (Bootstrap MODAL) -->
    <div class="modal fade" id="editmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"> Edit Data </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <form id="form_edit" name="form_edit">

                    <div class="modal-body">

                        <input type="hidden" name="update_id" id="update_id">

                        <div class="form-group">
                            <label> HOPO </label>
                            <input type="text" name="hopo" id="hopo" class="form-control"
                                placeholder="Enter HOPO" maxlength="3" disabled="disabled">
                        </div>

                        <div class="form-group">
                            <label> FLTI </label>
                            <input type="text" name="flti" id="flti" class="form-control"
                                placeholder="Enter FLTI" maxlength="1" disabled="disabled">
                        </div>

                        <div class="form-group">
                            <label> ALC2 </label>
                            <input type="text" name="alc" id="alc" class="form-control"
                                placeholder="Enter ALC2" maxlength="2" disabled="disabled">
                        </div>
                        
                        <div class="form-group">
                            <label> COUNTER </label>
                            <input type="text" name="counter" id="counter" class="form-control"
                                placeholder="Enter COUNTER" maxlength="14">
                        </div>
                       
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" id="update" name="updatedata" class="btn btn-primary">Update Data</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
    
    <!-- CREATE POP UP FORM (Bootstrap MODAL) -->
    <div class="modal fade" id="createmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"> Create Data </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <form id="form_create" name="form_create" autocomplete="off">

                    <div class="modal-body">


						<div class="form-group">
						    <label> HOPO </label>
						    <select class="form-control" id="create_hopo"></select>
						  </div>


						<div class="form-group">
						    <label> FLTI </label>
						    <select class="form-control" id="create_flti">
						      <option>I</option>
						      <option>D</option>
						    </select>
						  </div>

                        <div class="form-group">
                            <label> ALC2 </label>
                            <input type="text" name="create_alc_list" id="create_alc" class="form-control" placeholder="Enter ALC2" maxlength="2">
                            <datalist id="create_alc_list">
                            </datalist>
                        </div>
                        
                        <div class="form-group">
                            <label> COUNTER </label>
                            <input type="text" name="create_counter" id="create_counter" class="form-control"
                                placeholder="Enter COUNTER" maxlength="14">
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" id="create" name="createdata" class="btn btn-primary">Create Data</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
</body>
</html>