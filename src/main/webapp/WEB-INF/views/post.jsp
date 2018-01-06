<%--
  Created by IntelliJ IDEA.
  User: marcus.chiu
  Date: 2017-08-29
  Time: 12:45 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="description" content="JQuery">
    <meta name="author" content="SitePoint">

    <title>JQuery Example</title>

    <!-- include jQuery library into HTML from Content Delivery Network (CDN). -->
    <!-- JQuery must be the first script imported on your page -->
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

    <script type="text/javascript" language="javascript">
        $(document).ready(function(){
            $("button").click(function(){
                $.post( "/post", { id: 2044, content: "Hello, World!" }, function( data, status ) {
                    alert("Data: " + data + "\nStatus: " + status);
                });
            });
        });
    </script>

</head>

<body>
<button>Send an HTTP POST request to a page and get the result back</button>
</body>
</html>

