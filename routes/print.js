var express = require('express');
var mysql = require('mysql');
var router = express.Router();
const bodyParser = require("body-parser");
const puppeteer = require('puppeteer');
const ejs = require('ejs');
const path = require('path');
// const pdfGenerator = require('../pdfGenerator');

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "project_1"
});//databse connection

router.use(bodyParser.urlencoded({ extended: false }));

router.get('/', (req, res) => {
  let mandals = [];
  let mandal_id = [];
  let categories = [];
  let category_id = [];
  let sql = 'SELECT * FROM mandal';
  let query = 'SELECT * FROM category';
  
  con.query(query, (err, results) => {
    if (err) {
      console.error(err);
      return res.status(500).send('Error retrieving categories');
    }

    // Retrieve category data
    for (let i = 0; i < results.length; i++) {
      categories[i] = results[i].name;
      category_id[i] = results[i].id;
    }

    con.query(sql, (err, results) => {
      if (err) {
        console.error(err);
        return res.status(500).send('Error retrieving mandals');
      }

      // Retrieve mandal data
      for (let i = 0; i < results.length; i++) {
        mandals[i] = results[i].name;
        mandal_id[i] = results[i].id;
      }

      res.render('print', {
        mandals: mandals,
        mandal_id: mandal_id,
        categories: categories,
        category_id: category_id
      });
    });
  });
});





router.post('/', async (req, res) => {
  const { mandal_id,category_id,name,nameInput,company_nameInput,company_name,phone,address } = req.body;
  console.log(phone, address);
  let sql =''
  let query =''
  let html = ''
  let sql_query = 'SELECT * FROM devotee_family';
  let where_cond = '';
  let row_data=[];
  let html_data = [];
  let column_array = [];
  column_array["phone"] = ((typeof phone !== 'undefined') ? '1' : '0');
  column_array["address"] = ((typeof address !== 'undefined') ? '1' : '0');

  if(mandal_id != 0)
  {
    where_cond += 'mandal_id="'+mandal_id+'" ';
  }

  if(category_id != 0){
    if(where_cond != ''){
      where_cond += 'AND ';
    }
    where_cond += 'category_id="'+category_id+'" ';
  }

  if(company_nameInput != ''){
    if(where_cond != ''){
      where_cond += 'AND ';
    }
    where_cond += '`company_name` LIKE "%'+company_nameInput+'%" ';
  }
  
  if(nameInput != '') {
    if(where_cond != ''){
      where_cond += 'AND ';
    }
    where_cond += '`name` LIKE "%'+nameInput+'%" ';
  }
 
  if(where_cond != ''){
    sql_query = sql_query+" WHERE "+where_cond;
  }
  // console.log(sql_query);
  // return false;
  con.query(sql_query,async(err,results)=>{
    results.forEach(row =>{
      row_data = {
      name : row.name,
      phone:row.phone_number,
      address:row.address,
      mandal_id : row.mandal_id
      }
      html_data.push(row_data)
    });

    console.log(column_array);
    html = await ejs.renderFile(path.resolve('./views/pdf.html'),{html_data, column_array})
  });


  console.log(html)
    // Generate PDF
    const browser = await puppeteer.launch();
    const page = await browser.newPage();
    await page.setContent(html);
    const pdf = await page.pdf({ format: 'A4' });
    await browser.close();

    // Send PDF as response
    res.contentType('application/pdf');
    res.send(pdf);
});


module.exports = router