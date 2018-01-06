<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="description" content="JQuery">
    <meta name="author" content="SitePoint">
    <title>JQuery Example</title>
    <style>
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            overflow: auto;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }
        .dropdown-content a {
            color: black;
            padding: 1px 10px;
            text-decoration: none;
            display: block;
        }
        .dropdown-content a:hover {background-color: #f1f1f1}
        .show {display:block;}
    </style>
    <!-- include jQuery library into HTML from Content Delivery Network (CDN). -->
    <!-- JQuery must be the first script imported on your page -->
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script type="text/javascript" language="javascript">
        $(document).ready(function() {

            var timeoutID = null;

            function myFunction(array) {
                // remove all <a>
                var myNode = document.getElementById("myDropdown");
                while (myNode.firstChild) {
                    myNode.removeChild(myNode.firstChild);
                }

                // append new <a>
                array.forEach(function(entry) {
                    var node = document.createElement("A");
                    node.setAttribute("href", entry.href);
                    node.innerHTML = entry.display;
                    document.getElementById("myDropdown").appendChild(node);
                });
//                $('#myDropdown').children('a').each(function () {
//                    this.innerHTML = "facebook";
//                    this.setAttribute('href', "http://facebook.com");
//                });
                document.getElementById("myDropdown").classList.add("show");
            }

            function findMember() {
                $.post( "/search_while_typing_keyup", { id: 2044, content: $('#target').val() }, function( data, status ) {
                    console.log("data: " + data);
                    var jsonObj = $.parseJSON('[' + data + ']');
                    myFunction(jsonObj[0].response);
                });
            }

            $('#target').keydown(function(e) {

                var code = (e.keyCode ? e.keyCode : e.which);
                if(code == 13) { //Enter keycode
                    //window.location.href = 'http://www.google.com';
                    alert("enter pressed");
                }

                clearTimeout(timeoutID);
                timeoutID = setTimeout(findMember.bind(undefined), 500);
            });

        });

        // Close the dropdown if the user clicks outside of it
        window.onclick = function(event) {
            if (!event.target.matches('.dropbtn')) {

                var dropdowns = document.getElementsByClassName("dropdown-content");
                var i;
                for (i = 0; i < dropdowns.length; i++) {
                    var openDropdown = dropdowns[i];
                    if (openDropdown.classList.contains('show')) {
                        openDropdown.classList.remove('show');
                    }
                }
            }
        }
    </script>
</head>
<body>
<div class="dropdown">
    <input type="text" id="target" />
    <div id="myDropdown" class="dropdown-content">
        <%--<a href="#home">Home</a>--%>
        <%--<a href="#about">About</a>--%>
        <%--<a href="#contact">Contact</a>--%>
        <%--<a href="#home">Home</a>--%>
        <%--<a href="#about">About</a>--%>
        <%--<a href="#contact">Contact</a>--%>
        <%--<a href="#home">Home</a>--%>
        <%--<a href="#about">About</a>--%>
        <%--<a href="#contact">Contact</a>--%>
        <%--<a href="#home">Home</a>--%>
        <%--<a href="#about">About</a>--%>
        <%--<a href="#contact">Contact</a>--%>
    </div>
</div>
<h1>SEARCH WHILE TYPING</h1>
<h1>SEARCH WHILE TYPING</h1>
<h1>SEARCH WHILE TYPING</h1>
<h1>SEARCH WHILE TYPING</h1>
<h1>SEARCH WHILE TYPING</h1>
<h1>SEARCH WHILE TYPING</h1>
<h1>SEARCH WHILE TYPING</h1>
<h1>SEARCH WHILE TYPING</h1>
</body>
</html>