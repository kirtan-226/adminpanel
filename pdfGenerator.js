const fs =require("fs")
const PDFDocument = require('pdfkit-table');
const mysql = require('mysql');


const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'project_1'
});

const generatePDF = (id, callback) => {
  // fetch data from the database based on the ID
  let data = [];
  connection.query("SELECT * FROM devotee_family WHERE devotee_id = ?", [id], (err, results) => {
    if (err) {
      if (callback) {  // check if the callback function is defined
        callback(err);
      }
    } else {
      results.forEach(element => {
        data.push([element.name, element.age]);
      });

      // create a new PDF document
      const doc = new PDFDocument({margin:30, size:'A4'});

      doc.pipe(fs.createWriteStream('./document.pdf'));

      ;(async function createTable(){
    
      const table = {
        title:'',
        subtitle:'table',
        headers:["name ","age"],
        rows:[],
      };

      // push each row to the table.rows array
      data.forEach(row => {
        table.rows.push(row);
      });
      await doc.table(table, { 
        width: 300,
      });
      
    })();

      doc.end();

      if (callback) {  // check if the callback function is defined
        callback(null, 'PDF generated successfully');
      }
    }
  });
};



module.exports = {
  generatePDF
};
