"use strict";

$(function () {
    $("#main-wrapper").AdminSettings({
        Theme: false, // this can be true or false ( true means dark and false means light ),
        Layout: 'vertical',
        LogoBg: 'skin6', // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6 
        NavbarBg: 'skin1', // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
        SidebarType: 'mini-sidebar', // You can change it full / mini-sidebar / iconbar / overlay
        SidebarColor: 'skin6', // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
        SidebarPosition: true, // it can be true / false ( true means Fixed and false means absolute )
        HeaderPosition: true, // it can be true / false ( true means Fixed and false means absolute )
        BoxedLayout: false, // it can be true / false ( true means Boxed and false means Fluid ) 
    });

    cdp_load_countries("_origin");
    cdp_load_countries("_destiny");
    cdp_load_states("_destinystates");
    cdp_load_cities("_destinycities");
});

function cdp_load_countries(from) {
    $("#country" + from).select2({
        ajax: {
            url: "ajax/select2_countries.php",
            dataType: 'json',

            delay: 250,
            data: function (params) {
                return {
                    q: params.term // search term
                };
            },
            processResults: function (data) {
                return {
                    results: data
                };
            },
            cache: true
        },
        minimumInputLength: 2,
        placeholder: "Search country",
        allowClear: true
    });
}

function cdp_load_states(from) {
    $("#state" + from).select2({
        ajax: {
            url: "ajax/select3_states.php",
            dataType: 'json',

            delay: 250,
            data: function (params) {
                return {
                    q: params.term // search term
                };
            },
            processResults: function (data) {
                return {
                    results: data
                };
            },
            cache: true
        },
        minimumInputLength: 2,
        placeholder: "Search state",
        allowClear: true
    });
}


function cdp_load_cities(from) {
    $("#city" + from).select2({
        ajax: {
            url: "ajax/select3_cities.php",
            dataType: 'json',

            delay: 250,
            data: function (params) {
                return {
                    q: params.term // search term
                };
            },
            processResults: function (data) {
                return {
                    results: data
                };
            },
            cache: true
        },
        minimumInputLength: 2,
        placeholder: "Search city",
        allowClear: true
    });
}

$("#save_data").on('submit', function (event) {
    var parametros = $(this).serialize();
    $.ajax({
        type: "POST",
        url: "ajax/tools/ship_tariffs/ship_tariffs_add_ajax.php",
        data: parametros,
        beforeSend: function (objeto) {
            $("#resultados_ajax").html("Please wait...");
        },
        success: function (datos) {
            $("#resultados_ajax").html(datos);

            $('html, body').animate({
                scrollTop: 0
            }, 600);
        }
    });
    event.preventDefault();

})

document.getElementById("initial_range").addEventListener("keypress", onlyValidNumber);

document.getElementById("final_range").addEventListener("keypress", onlyValidNumber);

document.getElementById("tariff_price").addEventListener("keypress", onlyValidNumber);

function onlyValidNumber(event) {
    if (event.charCode < 46 || event.charCode > 57) {
        event.preventDefault();
    }
}

