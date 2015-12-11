<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlaceOrder.aspx.cs" Inherits="WidgetStore.Web.PlaceOrder" %>

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
    <script src="Scripts/app/placeOrder.js"></script>
</head>
<body>
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">Widget Store</a>
            </div>
            <ul class="nav navbar-nav">
                <li><a href="Index.aspx">My Orders</a></li>
                <li class="active"><a href="PlaceOrder.aspx">Place an Order</a></li>
            </ul>
        </div>
    </nav>

    <ul id="errorList" style="color: red;">
    </ul>

    <br />

    <div class="k-edit-form-container">
        <div class="k-edit-label">
            <label for="txtQuantity">How many widgets would you like?</label>
        </div>
        <div data-container-for="txtQuantity" class="k-edit-field">
            <input id="txtQuantity" type="text" name="txtQuantity" required="required" data-bind="value: Quantity" />
        </div>
        <div class="k-edit-label">
            <label for="ddlColor">Select the color of the widget(s)</label>
        </div>
        <div data-container-for="ddlColor" class="k-edit-field">
            <select id="ddlColor" name="ddlColor" required="required" data-bind="value: Color"></select>
        </div>
        <div class="k-edit-label">
            <label for="txtDateBy">Select the date to receive the widget(s) by</label>
        </div>
        <div data-container-for="txtDateBy" class="k-edit-field">
            <input id="txtDateBy" type="text" name="txtDateBy" required="required" data-bind="value: DateBy" />
        </div>
        <div class="k-edit-label">
            <label for="ddlType">Which type of widget would you like?</label>
        </div>
        <div data-container-for="ddlType" class="k-edit-field">
            <select id="ddlType" name="ddlType" required="required" data-bind="value: Type"></select>
        </div>
        <div class="k-edit-label">
            <button id="submit" class="k-button">Submit</button>
        </div>
    </div>
</body>
</html>
