
// first page to mandal list

var express = require('express');
var mysql = require('mysql');
var router = express.Router();
const bodyParser = require('body-parser');


var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "project_1"
});//databse connection


router.use(bodyParser.urlencoded({ extended: false }));


router.get('/', async (req, res, next)=> {
  let html_data = [];
  let row_data = [];
   con.query('SELECT * FROM mandal', (err, results) => {
    if (err) throw err;
    results.forEach(row => {
      if (row.deleted_at == null) {
        row_data = {
          id: row.id,
          name: row.name,
        };
        html_data.push(row_data);
      }
    });
    res.render('dashboard', { html_data });
  });
});


router.post('/', (req,res)=>{
  const { fm1: entered_name } = req.body;

  let ts =  new Date();
  let sql = "INSERT INTO mandal (name,created_at) VALUES(?,?)"
  con.query(sql,[entered_name,ts],(err,results)=>{
      res.redirect('/dashboard')
  })
  console.log(entered_name)
})

router.post('/search',(req,res) => {
  const name = req.body.mandal
  let html_data=[]
  let sql = 'SELECT * FROM devotee WHERE name LIKE ?'
  con.query(sql,[`%${name}%`], (err, results) => {
    if (err) throw err;
    results.forEach(row => {
        row_data = {
        id: row.id,
        name: row.name,
      };
      html_data.push(row_data);
    });

    console.log(html_data)
    res.render('dashboard', { html_data });
  });
})

router.get('/logout', (req, res) => {
  res.cookie('loggedIn', null, { expires: new Date(0) });
  res.redirect('/login');
});

module.exports = router;
