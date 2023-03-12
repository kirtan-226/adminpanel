var express = require('express');
var mysql = require('mysql');
var router = express.Router();
const pdfGenerator = require('../pdfGenerator');

mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "project_1"
});//databse connection

router.get('/:id', (req, res) => {
    const id = req.params.id;
    pdfGenerator.generatePDF(id, (error, data) => {
      if (error) {
        res.status(500).send(error);
      } else {
        res.contentType("application/pdf");
        res.send(data);
      }
    // res.redirect('/member/:id')
    });
  });


module.exports = router