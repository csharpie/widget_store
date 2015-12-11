<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WidgetStore.Web.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Widget Store</title>
    <meta charset="utf-8" />

    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Styles/Kendo/2014.1.528/kendo.common.min.css" rel="stylesheet" />
    <link href="Styles/Kendo/2014.1.528/kendo.metro.min.css" rel="stylesheet" />
    <script src="Scripts/Kendo/2014.1.528/jquery.min.js"></script>
    <script src="Scripts/Kendo/2014.1.528/kendo.all.min.js"></script>
    <script src="Scripts/app/index.js"></script>
</head>
<body>
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">Widget Store</a>
            </div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="Index.aspx">My Orders</a></li>
                <li><a href="PlaceOrder.aspx">Place an Order</a></li>
            </ul>
        </div>
    </nav>
    <form id="form1" runat="server">
        <div id="grid" style="height: 520px">
        </div>
    </form>
</body>
</html>
