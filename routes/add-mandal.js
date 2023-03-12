
//to add mandal

var express = require('express');
var mysql = require('mysql');
var router = express.Router();

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "project_1"
});//databse connection

router.get('/',(req,res)=>{
      res.render('add-mandal');}
  )

router.post('/', (req,res)=>{
      const {entered_name} = req.body;
      let ts =  new Date();
      let sql = "INSERT INTO mandal (name,created_at) VALUES(?,?)"
      con.query(sql,[entered_name,ts],(err,results)=>{
          res.redirect('/dashboard')
      })
    
  })

  module.exports = router;