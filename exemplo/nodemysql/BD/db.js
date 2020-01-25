const mysql = require('mysql');

var uriConnection = {
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: '123456',
    database: 'LOJA'
};

function execSQLQuery(sqlQry, values, res) {

    const connection = mysql.createConnection(uriConnection);

    connection.query(sqlQry, values,
        function (error, results, fields) {
            if (error)
                res.json(error);
            else
                res.json(results);
            connection.end();
            console.log('Executou: [sqlQry = ' + sqlQry + '] - [values = ' + values + ']');
        }
    );
}

module.exports = execSQLQuery;