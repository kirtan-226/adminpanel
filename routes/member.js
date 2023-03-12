
//to view and add members


var express = require('express');
var mysql = require('mysql');
var router = express.Router();

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "project_1"
});//databse connection

router.get('/:id',(req,res)=>{

    const id = req.params.id;
    let html_data = [];
    let row_data = [];
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
      results.forEach( async row =>{
        // let relation =   getRelation(row.relation_id)
        // let occupation =  getOccupation(row.occupation_id)
          let date = row.birthdate
          let birthday = date.getDate()+"-"+date.getMonth()+"-"+date.getFullYear()
          if(row["deleted_at"]==null){
            row_data={
            family_id:row.devotee_id,
            id:row.id,
            name:row.name,
            category:row.category_id,
            birthdate:birthday,
            age:row.age,
            relation:row.relation_name,
            occupation:row.occupation_name,
            company_name:row.company_name,
            study:row.study_name,
            address:row.address,
            phone_number:row.phone_number}
            html_data.push(row_data);;
        }
          else return;
      })
      console.log(html_data); 
      res.render('member',{html_data, id})
    });}
    );

    router.get('/:id/add-mem/',(req,res)=>{
        const id = req.params.id
        res.render('add-mem',{id})
    })

    router.post('/add-mem',async (req,res)=>{
        let ts =  new Date();
        const { devotee_id,name,category_id, birthdate, relation_id,occupation_id,campany_name,shift_id,change_id,study_id, address, phone_number } = req.body;
        let age = await calculateAge(birthdate)
        console.log(age)
        let query = "INSERT INTO devotee_family (devotee_id, name,category_id ,birthdate,age, relation_id,occupation_id,campany_name,shift_id,change_id,study_id, address, phone_number,created_at) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        con.query(query, [devotee_id, name,category_id, birthdate,age, relation_id,occupation_id,campany_name,shift_id,change_id,study_id, address, phone_number,ts], (err, results) => {
        if (err) throw err;
        res.redirect('/dashboard');
    })
    })

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



module.exports = router