
// first page to mandal list

var express = require('express');
var mysql = require('mysql');
var router = express.Router();

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "project_1"
});//databse connection

router.get('/', async (req, res, next)=> {
  let html_data = [];
  let row_data = [];
   con.query('SELECT * FROM mandal', (err, results) => {
    if (err) throw err;
    results.forEach(row => {
        row_data = {
        id: row.id,
        name: row.name,
      };
      html_data.push(row_data);
    });
    res.render('dashboard', { html_data });
  });
});



router.get('/logout', (req, res) => {
  res.cookie('loggedIn', null, { expires: new Date(0) });
  res.redirect('/login');
});

module.exports = router;
