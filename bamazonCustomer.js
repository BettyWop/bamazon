//npm install inquires, mysql, console.table, i
var inquirer = require("inquirer");
var mysql = require("mysql");
require('console.table');

//connect to database mysql
var connection = mysql.createConnection({
    host: "localhost",
    port: 3306,
    user: "root",
    password: "password",
    database: "bamazon_db"
});
//
var balance = 0;
connection.connect(function (err) {
    if (err) throw err;
    console.log("connected as id " + connection.threadId + "\n");
    showItems();
});

function showItems() {
    connection.query("SELECT item_id, product_name, department_name, price, stock_quantity FROM ??", ["products"], (err, data) => {
        if (err) throw err;
        console.table(data);
        custOrder();
    });
}

function custOrder() {
    inquirer.prompt([
        {//ask item id they want to buy
            name: "item_id",
            message: "Which item would you like to purchase?",
            type: "input",
        }, {// How many they would like to buy
            name: "stock_quantity",
            message: "How many would you like to buy?",
            type: "input"
        }
    ]).then((answer) => {
        connection.query("SELECT stock_quantity FROM products WHERE item_id = ?", [answer.item_id], (err, data) => {
            if (err) throw err;
            if (data[0].stock_quantity > answer.stock_quantity) {
                //show total for client after purchase
                //having trouble showing the total...everything else seems to work
                balance = (answer.stock_quantity * data[0].price);
                console.log(`You have completed your purchse! Your total is ${balance}`);
                var stock_quantity = (data[0].stock_quantity - answer.stock_quantity);
                connection.query(`UPDATE products SET stock_quantity = ? WHERE item_id = ?;`, [stock_quantity, answer.item_id], (err, data) => {
                    if (err) throw err;
                    else {
                        custOrder();
                    }
                });

            } else if (data[0].stock_quantity < answer.stock_quantity) {
                console.log(`Insufficient quantity! We only have ${data[0].stock_quantity} left in stock.`)
                custOrder();
            }

        })

    })
}