var viewModel;

$(function () {
    var today = new Date();
    var oneWeekFromToday = new Date();
    oneWeekFromToday.setDate(today.getDate() + 7);

    var colors = [], types = [];
    
    $.ajax({
        url: "http://localhost/WidgetStore.Api/api/Type", 
        contentType: "application/json; charset-utf-8",
        dataType: "json",
        async: false,
        success: function (data) {
            var arr = [];
            for (var i = 0; i < data.length; i++) {
                arr.push(data[i].Type);
            }
            types = arr;
        }
    });

    $.ajax({
        url: "http://localhost/WidgetStore.Api/api/Color", 
        contentType: "application/json; charset-utf-8",
        dataType: "json",
        async: false,
        success: function (data) {
            var arr = [];
            for (var i = 0; i < data.length; i++) {
                arr.push(data[i].Color);
            }
            colors = arr;
        }
    });

    viewModel = kendo.observable({
        Quantity: 1,
        Color: "Red",
        DateBy: oneWeekFromToday,
        Type: "Widget",
        UserId: "Admin"
    });

    $("#txtQuantity").kendoNumericTextBox({
        min: 1,
        step: 1,
        format: "#",
        value: 1
    });

    $("#ddlColor").kendoDropDownList({
        dataSource: {
            data: colors
        }
    });

    $("#txtDateBy").kendoDatePicker({
        min: oneWeekFromToday,
        value: oneWeekFromToday,
        change: function () {
            var value = this.value();

            var tt = new Date(value);
            var date = new Date(tt);

            if (date < oneWeekFromToday) {
                this.value(oneWeekFromToday);
            }
        }
    });

    $("#ddlType").kendoDropDownList({
        dataSource: {
            data: types
        }
    });

    $("#submit").click(function () {
        var data = JSON.stringify(viewModel);
        $.ajax({
            url: "http://localhost/WidgetStore.Api/api/Order",
            type: "POST",
            contentType: "application/json; charset-utf-8",
            dataType: "json",
            data: data,
            async: false,
            success: function (data) {
                if (typeof data === "string") {
                    var result = JSON.parse(data);

                    $("ul#errorList li").remove();

                    for (var i = 0; i < result.length; i++) {
                        $("ul#errorList").append("<li>" + result[i].Message + "</li>");
                    }
                } else {
                    var result = data;

                    $("body").append("<div id='orderConfirmation'></div>");
                    $("#orderConfirmation").kendoWindow({
                        content: {
                            template : "<h4>Order Id is " + result.Id 
                                + "</h4><br/><h4>Quantity: " + result.Quantity
                                + "</h4><br/><h4>Color: " + result.Color
                                + "</h4><br /><h4>Earliest Date to receive order: " + kendo.toString(kendo.parseDate(result.DateBy), "d")
                                + "</h4><br /><h4>Type of Widget: " + result.Type
                        },
                        visible: false,
                        title: "Order Confirmation",
                        modal: true,
                        height: "75%",
                        width: "50%"
                    });

                    $("#orderConfirmation").data("kendoWindow").center().open();


                }
            },
            error: function (result) {
                alert('Error');
            }
        });
    });

    kendo.bind($("body"), viewModel);
});