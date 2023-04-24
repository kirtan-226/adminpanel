
// to view and family

var express = require('express');
var mysql = require('mysql');
var router = express.Router();

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "project_1"
});//databse connection

/* GET users listing. */

  router.get('/:id',(req,res,next)=>{
    const id = req.params.id;
    let html_data = [];
    let row_data = [];
    
    let sql =`SELECT d.*, r.name as relation_name, o.name as occupation_name, s.name as study_name FROM devotee d 
    LEFT JOIN relation r ON r.id = d.relation_id
    LEFT JOIN occupation o ON o.id = d.occupation_id
    LEFT JOIN STUDY s ON s.id = d.study_id
    WHERE d.mandal_id = ?`;
    con.query(sql, [id], (err, results) => {
      if (err) throw err;
      
      results.forEach(row => {
          if(row["deleted_at"]==null){
          row_data={
            id: row.id ,
            name: row.name,
            address: row.address,
            phone_number : row.phone_number
          };
          html_data.push(row_data);
          }
          else return;
       }
      )
     
      res.render('family', { html_data ,id});
  })
  }) 


  router.get('/:id/add-family/',(req,res)=>{
    const id = req.params.id
    res.render('add-family',{id})
  }
  
  )

  function calculateAge(birthdate){
    const today = new Date();
    const birth = new Date(birthdate);
    let age = today.getFullYear() - birth.getFullYear();
    const monthDiff = today.getMonth() - birth.getMonth();
   if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birth.getDate())) {
   age--;
 }
 
   return age;
   };
  
   router.post('/add-family', async (req, res) => {
    const { mandal_id, name, birthdate, category_id, change_id, shift_id, company_name, occupation_id, study_id, phone_number, address } = req.body;
  
    // Parse birthdate string to Date object
    const birthdayDate = new Date(birthdate);
  
    // Calculate age from birthdate
    const age = await calculateAge(birthdayDate);
  
    // Get current date and time
    const now = new Date();
  
    const sql = "INSERT INTO devotee ( `mandal_id`, `name`, `category_id`,`birthdate`, `age`, `occupation_id`,`company_name`,`shift_id`,`change_id`, `study_id`, `phone_number`, `address`, `created_at`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
    const query = "INSERT INTO devotee_family ( `devotee_id`,`mandal_id`, `name`,`category_id`, `birthdate`, `age`, `occupation_id`,`company_name`,`shift_id`,`change_id`, `study_id`, `phone_number`, `address`, `created_at`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
  
    con.query(sql, [mandal_id, name,category_id, birthdayDate, age, occupation_id,company_name,shift_id,change_id, study_id, phone_number, address, now], (err, results) => {
      if (err) throw err;
    });
  
    con.query("SELECT id FROM devotee WHERE name=?", [name], (err, results) => {
      const id = results[0].id;
  
      con.query(query, [id,mandal_id, name,category_id, birthdayDate, age, occupation_id,company_name,shift_id,change_id, study_id, phone_number, address, now], (err, results) => {
        if (err) throw err;
      });
  
      console.log(birthdayDate);
  
      res.redirect(`/family/${mandal_id}`);
    });
  });


  router.post('/search',(req,res) => {
    const name = req.body.name;
   const id = req.body.id
    let html_data = [];
    let row_data = [];
    console.log(name)
    let sql =`SELECT * FROM devotee WHERE name LIKE ?`;
  con.query(sql, [`%${name}%`], (err, results) => {
      if (err) throw err;
      results.forEach(row => {
          if(row["deleted_at"]==null){
          row_data={
            id: row.id ,
            name: row.name,
            address: row.address,
            phone_number : row.phone_number
          };
          html_data.push(row_data);
          }
          else return;
       }
      )
     console.log(html_data)
      res.render('family', { html_data ,id});
    });
  })

  
  router.get('/logout', (req, res) => {
    res.cookie('loggedIn', null, { expires: new Date(0) });
    res.redirect('/login');
  });


  router.get('/delete/:id',async (req,res)=>{
  
    const id = req.params.id
    let devotee_id = id
    let ts = await new Date();
    // let query = "DELETE FROM devotee WHERE id=?"
    // let sql = "DELETE FROM devotee_family WHERE devotee_id=?"
    let sql2 = "UPDATE devotee_family SET deleted_at=? WHERE devotee_id=?"
    let query2 ="UPDATE devotee SET deleted_at=? WHERE id=?"
    // con.query(query,[id],(err)=>{
    //   if(err) throw err
    // })
    // con.query(sql,[devotee_id],(err)=>{
    //   if(err) throw err
    // })
    con.query(query2,[ts,id],(err)=>{
      if(err) throw err
      con.query(sql2,[ts,devotee_id],(err)=>{
        if(err) throw err
    })
    res.redirect('/dashboard');
  })
})
module.exports = router;
