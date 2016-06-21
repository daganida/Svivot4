<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApiAssignment.aspx.cs" Inherits="WebRole1.ApiAssignment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
   
    <script src="Scripts/jquery-1.10.2.js"></script>
    <link href="bootstrap.css" rel="stylesheet"/>
    <link href="bootstrap.min.css" rel="stylesheet" />
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>


</head>
<body>
    <form class="form-group-lg" style="margin-left:50px;margin-top:50px;" id="form1" runat="server">

         <h2 class="page-header">Just look for the name of the movie/series, and we will give the rest.</h2>
          &nbsp;<button id="btn2" style="visibility:visible" type="button" onclick="loadXMLDoc()">Search</button> <asp:TextBox ID="txb1" runat="server"></asp:TextBox><br />
              
       &nbsp; <asp:ListBox ID="lstbx1" runat="server"></asp:ListBox>
        <asp:ListBox ID="lstbx2" runat="server"></asp:ListBox>
        <br />
        <span class="text-danger" ">Mark the Radio Button options, and we will not  return the movie, if the year or plot does not match..&nbsp;&nbsp; <asp:CheckBox ID="r1" runat="server" /><br /><br /></span>


        <br />
        <span  style="font-weight:bold">Thank you and have fun!</span>
        <p id="p"></p>

           


    </form>
</body>
</html>

<script>
    var ShouldPrintDetails = false;



    function loadXMLDoc() {
        var myList;
        var ans = false;;
        if (document.getElementById('r1').checked) {
            ans = true;
        }
        var xmlhttp;

        var mySearch = document.getElementById("txb1");
        var yearIndex = document.getElementById("lstbx2").selectedIndex;
        var yearOption = document.getElementById("lstbx2").options;
        var plotIndex = document.getElementById("lstbx1").selectedIndex;
        var plotOption = document.getElementById("lstbx1").options;

        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        }
        else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange =
                function () {


                    //alert(xmlhttp.readyState);
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        json = $.parseJSON(xmlhttp.responseText);
                        if (yearIndex != -1) {
                            if (ans == true && json.Year != yearOption[yearIndex].value) {
                                ShouldPrintDetails = false;
                                getJson(xmlhttp.responseText);

                            }
                            else {
                                ShouldPrintDetails = true;

                                getJson(xmlhttp.responseText);

                            }
                        }


                        else {
                            ShouldPrintDetails = true;
                            getJson(xmlhttp.responseText);

                        }

                    
                    }
                }
        if (yearIndex != -1 && plotIndex != -1) {
            xmlhttp.open("GET", "http://www.omdbapi.com/?t=" + mySearch.value + "&y=" + yearOption[yearIndex] + "&plot=" + plotOption[plotIndex] + "&r=json");
        }
        else if (yearIndex != -1) {
            xmlhttp.open("GET", "http://www.omdbapi.com/?t=" + mySearch.value + "&y=" + yearOption[yearIndex] + "&plot=&r=json");

        }
        else {
            xmlhttp.open("GET", "http://www.omdbapi.com/?t=" + mySearch.value + "&y=&plot=&&r=json");

        }
        xmlhttp.send();
    }
                              
    
    
    
    
    function getJson(json) {
        document.getElementById("p").innerText = "";

        json = $.parseJSON(json);
        if (ShouldPrintDetails) {

            $("#p").append("<span style="+"font-weight:bold;"+">Movie Title : </span>" + json.Title);
            $("#p").append("</br>");
            $("#p").append("<span style=" + "font-weight:bold;" + ">Year : </span>" + json.Year);
            $("#p").append("</br>");
            $("#p").append("<span style=" + "font-weight:bold;" + ">SCORE : </span>" + json.Rated);
            $("#p").append("</br>");
            $("#p").append("<span style=" + "font-weight:bold;" + ">Date Released : </span>" + json.Released);
            $("#p").append("</br>");
            $("#p").append("<span style=" + "font-weight:bold;" + ">RunTime : </span>" + json.Runtime);
            $("#p").append("</br>");
            $("#p").append("<span style=" + "font-weight:bold;" + ">Genre : </span>" + json.Genre);
            $("#p").append("</br>");
            $("#p").append("<span style=" + "font-weight:bold;" + ">Director : </span>" + json.Director);
            $("#p").append("</br>");
            $("#p").append("<span style=" + "font-weight:bold;" + ">Actor : </span>" + json.Actors);
            $("#p").append("</br>");
            $("#p").append("<span style=" + "font-weight:bold;" + ">Plot : </span>" + json.Plot);
            $("#p").append("</br>");
            $("#p").append("<span style=" + "font-weight:bold;" + ">Language : </span>" + json.Language);
            $("#p").append("</br>");
            $("#p").append("<span style=" + "font-weight:bold;" + ">Country : </span>" + json.Country);
            $("#p").append("</br>");

            $("#p").append("<span style=" + "font-weight:bold;" + ">Awards : </span>" + json.Awards);
            $("#p").append("</br>");

            $("#p").append("<span style=" + "font-weight:bold;" + ">MetaScore : </span>" + json.MetaScore);
            $("#p").append("</br>");
            $("#p").append("<span style=" + "font-weight:bold;" + ">Imdb Ratings : </span>" + json.imdbRating);
            $("#p").append("</br>");
            $("#p").append("<span style=" + "font-weight:bold;" + ">Imdb Votes : </span>" + json.imdbVotes);
        }
        else {
            $("#p").append("<span class="+"text-danger"+">"+"No Matches found for that movie,Maybe your'e missing a character?"+"</span>");
        }




    }





</script>
