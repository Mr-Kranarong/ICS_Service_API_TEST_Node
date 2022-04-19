const express = require("express");
const mysql = require("mysql");
const app = express();
const port = 8080;

const db = mysql.createConnection({
    host: "db4free.net",
    user: "icstesto",
    password: "icstesto",
    database: "icstesto"
    // host: "127.0.0.1",
    // user: "root",
    // password: "",
    // database: "icstesto"
});

db.connect((err)=>{
    if (err) console.log("Failed to connect to DB.");
    console.log("Connected to DB.");
});

app.use(express.json());
app.listen(port, () => console.log(`APIs Running`));


//GET - Product List
/* 
    Request by param count
    Filter by query Sex, Category, Size
    CHnage offset by query page
*/
app.get("/product/:count", (req, res) => {
    var count = req.params.count;

    var sex = req.query.sex;
    var category = req.query.category;
    var size = req.query.size;
    var page = req.query.page;
    var total, offset;

    if (sex == 0 || sex == null) sex = '%';
    if (category == 0 || category == null) category = '%';
    if (size == 0 || size == null) size = '%';

    if (page == 0 || page == null) page = 1;

    offset = (page * count) - count;
    if (offset != 0 & offset != null){
        offset = ` OFFSET ${offset}`;
    }else{
        offset = '';
    }
    

    db.query(`select count(*) as number FROM product p LEFT JOIN shirt s ON p.ShirtID = s.ShirtID LEFT JOIN sex sx ON p.SexID = sx.SexID LEFT JOIN category c ON p.CategoryID = c.CategoryID LEFT JOIN size sz ON p.SizeID = sz.SizeID WHERE p.SexID LIKE ? AND p.CategoryID LIKE ? AND p.SizeID LIKE ?`,[sex, category, size], (err, result)=>{
        total = result[0].number;
    });
    
    db.query( `SELECT productid, title, sex, category, size, stock, price FROM product p LEFT JOIN shirt s ON p.ShirtID = s.ShirtID LEFT JOIN sex sx ON p.SexID = sx.SexID LEFT JOIN category c ON p.CategoryID = c.CategoryID LEFT JOIN size sz ON p.SizeID = sz.SizeID WHERE p.SexID LIKE ? AND p.CategoryID LIKE ? AND p.SizeID LIKE ? LIMIT ${count}`+offset,[sex, category, size], (err, result)=>{
        if(err) throw err;
        //res.send(result);
        res.json({
            selected_product: total,
            currently_displaying: result.length,
            total_page: Math.ceil(total/count),
            current_page: page,
            data: result
        });
    });
  });


//POST - Order Create
/*
    Post order
*/
app.post("/order/create", async (req, res) => {
    var address = req.body.address;
    var products = req.body.products;

    db.query(`INSERT INTO order_status (StatusID,Address)
    VALUES (1,?)`,[address]);

    var lastid = db.query(`SELECT LAST_INSERT_ID() as id`, (err,result)=>{
        lastid = result[0].id;

        let i = 0;
        while(products[i]){
            db.query(`INSERT INTO order_product (OrderID,ProductID,Quantity)
            VALUES (${lastid},${products[i].productid},${products[i].quantity})`);
            i++;
        }
    });

    res.sendStatus(200);
});



  //GET - Order List
  /*
        Request by param count
        Filter by query start, end, status
        CHnage offset by query page
  */
app.get("/order/:count", (req, res) => {
    var count = req.params.count;

    var start = req.query.start;
    var end = req.query.end;
    var status = req.query.status;
    var page = req.query.page;
    var total, offset;

    if (start == 0 || start == null) start = '00000000';
    if (end == 0 || end == null) end = '99991231';
    if (status == 0 || status == null) status = '%';
    if (page == 0 || page == null) page = 1;

    offset = (page * count) - count;
    if (offset != 0 & offset != null){
        offset = ` OFFSET ${offset}`;
    }else{
        offset = '';
    }
    
    db.query(`select distinct count(*) as number FROM order_status os 
    LEFT JOIN order_product op ON os.OrderID = op.OrderID
    LEFT JOIN status s ON os.StatusID = s.StatusID
    WHERE PaidDate BETWEEN ? AND ? AND os.statusid like ?`, [start, end, status], (err, result)=>{
        total = result[0].number;
    });
    
    db.query( `SELECT DISTINCT os.OrderID as orderid, s.Status as status, os.PaidDate as paiddate, os.Address as address FROM order_status os 
    LEFT JOIN order_product op ON os.OrderID = op.OrderID
    LEFT JOIN status s ON os.StatusID = s.StatusID
    WHERE PaidDate BETWEEN ? AND ? AND os.statusid like ? LIMIT ${count}`+offset, [start, end, status], (err, result)=>{
        if(err) throw err;

        //res.send(result);
        res.json({
            selected_order: total,
            currently_displaying: result.length,
            total_page: Math.ceil(total/count),
            current_page: page,
            data: result
        });
    });
  });