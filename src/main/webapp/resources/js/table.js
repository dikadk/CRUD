$(document).ready(function() {
    $('#example').DataTable( {
        "ajax": {
            url: "http://localhost:8080/usersjon",
            datatype: "jsonp",
            dataSrc: ""
        },
        columns : [
            {"data": "id"},
            {"data": "name"},
            {"data": "age"},
            {"data": "isAdmin"},
            {"data": "createdDate"},

        ],
    });
});