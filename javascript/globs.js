//define functions and global variables here...
var siteloc = "http://myeskwela.msuiit.edu.ph/test";
var scriptloc = "/scripts/"

function fetchgradesheet()
{
  $.ajax({
      url: siteloc + scriptloc + "getgradesheet.py",
      data: {course:$("#subject").val(),
             section:$("#section").val(),
             semid:$("#semester").val()},
      dataType: 'json',
      success: function (res) {
                  console.log(res);
                  if(res[0][0] != "None")
                  {
				      table = '<div class="table-responsive">';
					  table += '<table class="table table-condensed">';
					  table += '<thead>' +
					           '<tr>' +
							     '<th>ID No.</th>' +
								 '<th>Prelim</th>' +
								 '<th>Midterm</th>' +
								 '<th>Finals</th>' +
							   '</tr>' +
					           '</thead>';
					  table += "<tbody>";		   
					  for (i = 0; i < res.length; i++)
					  {
						  row = res[i];
						  table += "<tr>";
						  for (j = 0; j < row.length; j++)
						  {
							  table += "<td>" + row[j] + "</td>";
						  }
						  table += "</tr>";
					  }
					  table += "</tbody>";
					  table += "</table>";
					  table += "</div>";
					  $("#target").html(table); 
				  } // end if
              }
    });
}

