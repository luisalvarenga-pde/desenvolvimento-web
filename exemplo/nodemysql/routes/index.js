const express = require('express');

const router = express.Router();

// rota raiz
router.get('/',
    (req, res) => res.json({ message: 'Funcionando!' })
);

module.exports = router;