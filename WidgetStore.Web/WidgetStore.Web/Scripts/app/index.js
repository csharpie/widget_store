$(function () {
    var today = new Date();
    var oneWeekFromToday = new Date();
    oneWeekFromToday.setDate(today.getDate() + 7);

    $("#grid").kendoGrid({
        columns: [
            { field: "Id" },
            { field: "Quantity" },
            { field: "Color" },
            { field: "DateBy", title: "Earliest Date to Receive Order", template: "#= kendo.toString(kendo.parseDate(DateBy), 'MM/dd/yyyy') #" },
            { field: "Type" }
        ],
        dataSource: new kendo.data.DataSource({
            transport: {
                read: {
                    url: "http://localhost/WidgetStore.Api/api/Order",
                    dataType: "json"
                }
            },
            schema: {
                model: {
                    id: "Id"
                },
                data: function (response) {
                    return response;
                },
                total: function (response) {
                    return response.length;
                }
            },
            type: "json"
        })
    });
});