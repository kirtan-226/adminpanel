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
    for (let i = 0; i < results.length; i++) {
      categories[i] = results[i].category;
      category_id[i] = results[i].id;
    }


    con.query(sql, (err, results) => {
  
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
  let sql =''
  let query =''
  let html = ''
  if(mandal_id!=0)
  {
    sql = 'SELECT * FROM devotee_family WHERE mandal_id=?'
    con.query(sql,[mandal_id],async(err,results)=>{
      html = await ejs.renderFile(path.resolve('./views/pdf.html'),{
        results,
        name,
        phone,
        address,
        mandal_id,
      })
    })
  }

  else if(category_id!=0 && company_nameInput==null && nameInput==null)
  {
    let row_data=[]
    let html_data = []
    sql = 'SELECT * FROM devotee_family WHERE category_id=?'
    con.query(sql,[category_id],async(err,results)=>{
      results.forEach(row =>{
        row_data = {
        name : row.name,
        phone:row.phone,
        address:row.address,
        mandal_id : row.mandal_id
        }
        html_data.push(row_data)
      })
      html = await ejs.renderFile(path.resolve('./views/pdf.html'),{html_data})
    })
  }


  else if(company_nameInput!=null)
  {
    sql = 'SELECT * FROM `devotee_family` WHERE `company_name` LIKE ?';
    con.query(sql,['%' + company_nameInput + '%'],async(err,results)=>{
      html = await ejs.renderFile(path.resolve('./views/pdf.html'),{
        results,
        name,
        phone,
        address,
        mandal_id,
      });
    })
  }

 else if(nameInput!=null) {
    sql = 'SELECT * FROM `devotee_family` WHERE `name` LIKE ?';
    con.query(sql,['%' + nameInput + '%'],async(err,results)=>{
      html = await ejs.renderFile(path.resolve('./views/pdf.html'),{
        results,
        name,
        phone,
        address,
        mandal_id,
      });
    })
  }
 

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