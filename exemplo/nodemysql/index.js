const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const port = 3000; //porta padrão 

const mysql = require('mysql');


//configurando o body parser para tratar o metodo POST
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

//configurando os Headers HTTP para o response
app.use(function (req, res, next) {
    //Enabling CORS 
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Methods", "GET,HEAD,OPTIONS,POST,PUT");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, contentType,Content-Type, Accept, Authorization");
    next();
});

//definindo as rotas 
const router = express.Router();

// rota raiz
router.get('/',
    (req, res) => res.json({ message: 'Funcionando!' })
);

app.use('/', router);

// rota clientes
router.get('/clientes/:id?',
    (req, res) => {
        let sqlQry = 'SELECT * FROM Clientes ';
        let values = [];

        if (req.params.id) {
            sqlQry += 'WHERE idCliente = ?';
            values = [parseInt(req.params.id)];
        }

        execSQLQuery(sqlQry, values, res);

    }
);

router.delete('/clientes/:id',
    (req, res) => {
        const sqlQry = 'DELETE FROM Clientes WHERE idCliente = ?';
        const values = [parseInt(req.params.id)];

        execSQLQuery(sqlQry, values, res);
    }
);

router.patch('/clientes/:id',
    (req, res) => {

        const sqlQry = 'UPDATE Clientes SET nome = ?, email = ? WHERE idCliente = ?';
        const values = [req.body.nome, req.body.email, parseInt(req.params.id)];

        execSQLQuery(sqlQry, values, res);
    }
);

router.post('/clientes',
    (req, res) => {

        const nome = req.body.nome;
        const email = req.body.email;
        const senha = req.body.senha;
        const rua = req.body.rua;
        const bairro = req.body.bairro;
        const cidade = req.body.cidade;
        const cep = req.body.cep;
        const estado = req.body.estado;

        const sqlQry = 'INSERT INTO loja.clientes (nome, email, senha, rua, bairro, cidade, cep, estado) VALUES (?)';
        const values = [[nome, email, senha, rua, bairro, cidade, cep, estado]];

        execSQLQuery(sqlQry, values, res);
    }
);


//iniciar o servidor
app.listen(port);
console.log('Servidor iniciado e aguardando conexões na porta 3000');


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
