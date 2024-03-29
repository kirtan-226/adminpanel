//for delete and update actions

var express = require('express');
var mysql = require('mysql');
var router = express.Router();
const axios = require('axios');
const qs = require('qs');
const ejs = require('ejs');
const fs = require('fs');

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "project_1"
});//databse connection



router.get('/update/:id', (req, res) => {
  const id = req.params.id;
  
  let data = [];
  let sql = `SELECT df.*, r.name as relation_name, o.name as occupation_name, s.name as study_name FROM devotee_family df 
  LEFT JOIN relation r ON r.id = df.relation_id
  LEFT JOIN occupation o ON o.id = df.occupation_id
  LEFT JOIN STUDY s ON s.id = df.study_id
  LEFT JOIN SHIFT sh ON sh.id = df.shift_id
  LEFT JOIN change_id ch ON ch.id = df.change_id
  LEFT JOIN category ct ON ct.id = df.category_id
  WHERE df.devotee_id = ?`;

  con.query(sql, [id], (err, results) => {
    if (err) throw err;

    results.forEach(async row => {
      // Process each row and add to the html_data array
      let date = row.birthdate
      let birthday = date.getDate()+"-"+date.getMonth()+"-"+date.getFullYear()
      if(row["deleted_at"] == null) {
        data={
          id: row.id,
          name: row.name,
          category: row.category_name,
          birthdate: birthday,
          age: row.age,
          relation: row.relation_name,
          occupation: row.occupation_name,
          company_name: row.company_name,
          shift: row.shift_name,
          change: row.change_name,
          study: row.study_name,
          address: row.address,
          phone_number: row.phone_number
        }
      }
    })

    // Pass the html_data array to the callback function
    console.log(html_data)
    
  });
  const html = fs.readFileSync('index.ejs', 'utf8');
  const renderedHtml = ejs.render(html, { data });
  console.log(renderedHtml);
});


  router.post('/update',async (req,res)=>{
    const {name,id,birthdate,occupation_id,study_id,company_name,address,phone_number} = req.body
    let age = await calculateAge(birthdate);
    console.log(req.body)
    let ts = await new Date();
    let query ="UPDATE devotee_family SET birthdate=?,age=?, occupation_id=?,company_name=?,study_id=?,address=?, phone_number=?,updated_at=? WHERE id =?"
    let sql ="UPDATE devotee SET birthdate=?,age=?, occupation_id=?,company_name=?,study_id=?, address=?, phone_number=?,updated_at=? WHERE name =?"
    con.query(sql,[birthdate,age,occupation_id,company_name,study_id,address,phone_number,ts,name],(err,results)=>{
      if(err) throw err
    })
    con.query(query,[birthdate,age,occupation_id,company_name,study_id,address,phone_number,ts,id],(err,results)=>{
      if(err) throw err;
      console.log(results)
    res.redirect('/dashboard')
  })
  }
    )

  router.get('/delete-mem/:id',async(req,res)=>{
    const id = req.params.id
    let ts = await new Date();
    let sql = "UPDATE devotee_family SET deleted_at=? WHERE id=?"
    con.query(sql,[ts,id], async (err)=>{
      if(err) throw err
    })
    console.log(ts,id)
    res.redirect('/dashboard')}
    )
  

      router.get('/delete-mandal/:id',async(req,res)=>{
    const id = req.params.id
    let ts = await new Date();
    let sql = "UPDATE mandal SET deleted_at=? WHERE id=?"
    con.query(sql,[ts,id], async (err)=>{
      if(err) throw err
    })
    console.log(ts,id)
    res.redirect('/dashboard')}
    )

    router.get('/edit/:id',async(req,res)=>{
      const id = req.params.id
      let ts = await new Date();
      let sql = "UPDATE mandal SET deleted_at=? WHERE id=?"
      con.query(sql,[ts,id], async (err)=>{
        if(err) throw err
      })
      console.log(ts,id)
      res.redirect('/dashboard')}
      )
  



function calculateAge(birthdate){
  const today = new Date();
  const birth = new Date(birthdate);
  let age = today.getFullYear() - birth.getFullYear();
  const monthDiff = today.getMonth() - birth.getMonth();
 if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birth.getDate())) {
 age--;
 return age;
}}

function getRelation(relation_id) {
    con.query('SELECT name FROM relation WHERE id = ?', [relation_id], (err, results) => {
      return (results[0].name)
    });
  };


// function getOccupation(occupation_id) {
//   return new Promise((resolve, reject) => {
//     con.query('SELECT name FROM occupation WHERE id = ?', [occupation_id], (err, results) => {
//       if (err) {
//         reject(err);
//       } else {
//         resolve(results[0].name);
//       }
//     });
//   });
// }

// // Define a helper function to get the study name based on its id
// function getStudy(study_id) {
//   return new Promise((resolve, reject) => {
//     con.query('SELECT name FROM study WHERE id = ?', [study_id], (err, results) => {
//       if (err) {
//         reject(err);
//       } else {
//         resolve(results[0].name);
//       }
//     });
//   });
// }



module.exports = router