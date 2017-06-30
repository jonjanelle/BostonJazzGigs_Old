// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
function deleteSong() {
  alert("hello!");
  console.log("hi");
}

/*
  Find musician by last name
  findAll : Boolean, true -> get all musicians, false -> search by lastname
  lastname located in a text input with id musician_lastname
*/
function findMusician(findAll) {
  var lastName = document.getElementById("musician_lastname");
  var nameSearch = findAll ? 'show_all' : lastName.value;
  $.ajax({
    type: 'POST',
    url: '/musicians/search',
    data: { lastname: nameSearch},
    success: function(data){
      var root = $("#musician_search_results");
      root.empty();
      for (var i=0; i<data.length; i++){
        var open = "<tr class='musician-row' data-toggle='modal' data-target='#addModal'>";
        var c0 = "<td style='display:none;'>"+data[i].id+"</td>";
        var c1 = "<td>"+data[i].lastname+"</td>";
        var c2 = "<td>"+data[i].firstname+"</td>";
        var c3 = "<td>"+data[i].instrument+"</td>";
        var close = "</tr>";
        root.append(open+c0+c1+c2+c3+close);
      }
      $(".musician-row").click(function() {
        $("#modal-musician-name").empty();
        var musician_id = $(this).closest("tr").find('td:eq(0)').text();
        var firstName = $(this).closest("tr").find('td:eq(2)').text();
        var lastName = $(this).closest("tr").find('td:eq(1)').text();
        $("#modal-musician-name").html(firstName+" "+lastName);
        $("#modal-musician-id").html(musician_id);
      });
      return false;
    }
  });
}

//Create a band-musician pairing
function createBandMusician() {
  var mid = $("#modal-musician-id").text();
  var bid = $("#modal-band-id").text();
  $.ajax({
    type: 'POST',
    url: '/bands/'+bid+'/addmusician',
    data: { band_id: bid, musician_id: mid},
    success: function(data){}
  });
}

//Bubble sort table by column.
function sortTable(sortCol) {
  var table, rows, switching, i, x, y, shouldSwitch;
  table = document.getElementById("musician-table");
  switching = true;
  /*Make a loop that will continue until
  no switching has been done:*/
  while (switching) {
    //start by saying: no switching is done:
    switching = false;
    rows = table.getElementsByTagName("TR");
    /*Loop through all table rows (except the
    first, which contains table headers):*/
    for (i = 1; i < (rows.length - 1); i++) {
      //start by saying there should be no switching:
      shouldSwitch = false;
      /*Get the two elements you want to compare,
      one from current row and one from the next:*/
      x = rows[i].getElementsByTagName("TD")[sortCol];
      y = rows[i + 1].getElementsByTagName("TD")[sortCol];
      //check if the two rows should switch place:
      if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
        //if so, mark as a switch and break the loop:
        shouldSwitch= true;
        break;
      }
    }
    if (shouldSwitch) {
      /*If a switch has been marked, make the switch
      and mark that a switch has been done:*/
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
    }
  }
}
