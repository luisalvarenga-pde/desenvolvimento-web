const express = require('express');
const bodyParser = require('body-parser');
const execSQLQuery = require('../BD/db');

//definindo as rotas 
const router = express.Router();

// rota clientes
router.get('/:id?',
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

router.delete('/:id',
    (req, res) => {
        const sqlQry = 'DELETE FROM Clientes WHERE idCliente = ?';
        const values = [parseInt(req.params.id)];

        execSQLQuery(sqlQry, values, res);
    }
);

router.patch('/:id',
    (req, res) => {

        const sqlQry = 'UPDATE Clientes SET nome = ?, email = ? WHERE idCliente = ?';
        const values = [req.body.nome, req.body.email, parseInt(req.params.id)];

        execSQLQuery(sqlQry, values, res);
    }
);

router.post('/',
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

module.exports = router;

