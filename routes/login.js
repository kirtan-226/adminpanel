//login

var express = require('express');
var mysql = require('mysql');
var router = express.Router();
const bodyParser = require('body-parser');
router.use(bodyParser.urlencoded({ extended: true }));

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "project_1"
});//databse connection

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('login', { title: 'login' });
});

router.post("/",(req,res)=>{
  const {username,password} = req.body;
  let sql = `SELECT * FROM admin WHERE username = ? AND password= ?`
  con.query(sql,[username,password],(err,results)=>{
      if(err) throw err;
      if(results.length>0)
      {
        // req.session.authenticated = true;
        res.redirect('/dashboard');
      }
      else{
        res.send('enter valid password')
      }
  })
});

module.exports = router;
