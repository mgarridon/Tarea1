// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require adminlte/jquery
//= require adminlte/jquery-jvectormap-1.2.2.min
//= require adminlte/jquery-jvectormap-world-mill-en
//= require adminlte/jquery.sparkline
//= require adminlte/jquery.slimscroll
//= require adminlte/jquery.dataTables
//= require adminlte/Chart
//= require adminlte/dashboard2
//= require adminlte/bootstrap
//= require adminlte/dataTables.bootstrap
//= require adminlte/fastclick
//= require adminlte/adminlte
//= require adminlte/demo
//= require adminlte/icheck
//= require jquery3
//= require jquery_ujs
//= require jquery_nested_form
//= require datatables
//= require_tree .
$(document).on('turbolinks:load', function() {
    $("#Enviar").attr("disabled", true);
    $('form').on('click', '.remove_record', function(event) {
        $(this).prev('input[type=hidden]').val('1');
        $(this).closest('tr').remove();
        return event.preventDefault();
    });

    $(document).on('click', '.borrar', function (event) {
        $(this).closest('tr').remove();
        var nFilas = $("#carrito tr").length;
        if(nFilas == 1){
            $("#Enviar").attr("disabled", true);
        }
        else{
            $("#Enviar").attr("disabled", false)
        }
    });

    $("#AgregarProd").click(function(){

        $("#Enviar").attr("disabled", false);
    });

    $("#Contador").click(function(){
        var nFilas = $("#carrito tr").length;
        console.log(nFilas);
    });

    $('form').on('click', '.add_fields', function(event) {
        var regexp, time;
        time = new Date().getTime();
        regexp = new RegExp($(this).data('id'), 'g');
        $('.fields').append($(this).data('fields').replace(regexp, time));
        return event.preventDefault();
    });
