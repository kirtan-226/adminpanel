const fs =require("fs")
const PDFDocument = require('pdfkit-table');
const mysql = require('mysql');


var phantom = require('phantom');   

phantom.create().then(function(ph) {
    ph.createPage().then(function(page) {
        page.open("http://www.google.com").then(function(status) {
            page.render('google.pdf').then(function() {
                console.log('Page Rendered');
                ph.exit();
            });
        });
    });
});



module.exports = phantom;
