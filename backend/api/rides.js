const express = require('express');
const router = express.Router()
const connection = require('../config/sql_config');
const util = require('util');

var dbQuery;

dbQuery = util.promisify(connection.query).bind(connection);

router.post('/requestrides', async (req, res) => {

    const { user_id, from_lat, to_lat, from_lng, to_lng, from_address, to_address, status, car_type } = req.body;

    var rides = await dbQuery('INSERT INTO rides (user_id,from_lat,to_lat,from_lng,to_lng,from_address,to_address,status,car_type,create_time) VALUES (?,?,?,?,?,?,?,?,?,CURRENT_TIMESTAMP)', [user_id, from_lat, to_lat, to_lng, from_lng, from_address, to_address, status, car_type]);

    var r = await dbQuery('SELECT * FROM rides WHERE id = ?', [rides.insertId]);

    res.status(200).json({ "status": "success", "data": r[0] });

});

module.exports = router;