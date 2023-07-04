const express = require('express');
const router = express.Router()
const connection = require('../config/sql_config');
const util = require('util');
const crypto = require('crypto');

var dbQuery;

dbQuery = util.promisify(connection.query).bind(connection);

async function generateRandomString(length) {
    return new Promise((resolve, reject) => {
        crypto.randomBytes(length, (err, buffer) => {
            if (err) {
                reject(err);
            }
            resolve(buffer.toString('hex'));
        });
    });
}

async function generateAuthKey() {
    const authKey = await generateRandomString(64);
    return authKey;
}

router.post('/login', async (req, res) => {

    const phoneNumber = req.body.phone_number;
    const password = req.body.password;

    var user = await dbQuery('SELECT * FROM users WHERE phone_number = ? AND password = ?', [phoneNumber, password]);

    if (user.length > 0) {
        const { password, ...userWithoutPassword } = user[0];
        res.status(200).json({ "status": "success", "data": userWithoutPassword });
    } else {
        res.status(401).json({ "status": "failed", "message": "Invalid credentials" });
    }
});

router.post('/register', async (req, res) => {

    const phoneNumber = req.body['phone_number'];
    const role = 1;

    var user = await dbQuery('SELECT * FROM users WHERE phone_number = ?', [phoneNumber]);

    if (user.length > 0) {
        res.status(200).json({ "status": "failed", "message": "User Already exists" });
    } else {
        var authKey = await generateAuthKey();
        authKey = 'Bearer ' + authKey;

        var users = await dbQuery('INSERT INTO users (phone_number,role_id,auth_key,create_time) VALUES (?,?,?,CURRENT_TIMESTAMP)', [phoneNumber, role, authKey]);
        var u = await dbQuery('SELECT * FROM users WHERE phone_number = ?', [phoneNumber]);
        const { password, ...userWithoutPassword } = u[0];

        res.status(200).json({ "status": "success", "data": userWithoutPassword });
    }
});

router.put('/changepassword/:userId', async (req, res) => {

    const { userId } = req.params;
    const { new_password, current_password } = req.body;

    if (current_password != null) {
        var user = await dbQuery('SELECT * FROM users WHERE id = ? AND password = ?', [userId, current_password]);
        if (user.length > 0) {
            await dbQuery('UPDATE users SET password = ? WHERE id = ?', [new_password, userId]);
            res.status(200).json({ "status": "success", "data": "Password updated succesfully" });
        } else {
            res.status(401).json({ "status": "failed", "message": "Invalid user" });
        }
    } else {
        await dbQuery('UPDATE users SET password = ? WHERE id = ?', [new_password, userId]);
        res.status(200).json({ "status": "success", "data": "Password updated succesfully" });
    }
});

router.post('/searchuser', async (req, res) => {

    const { phone_number } = req.body;

    var user = await dbQuery('SELECT * FROM users WHERE phone_number = ?', [phone_number]);

    if (user.length > 0) {
        const { password, ...userWithoutPassword } = user[0];
        res.status(200).json({ "status": "success", "data": userWithoutPassword });
    } else {
        res.status(401).json({ "status": "failed", "message": "Invalid user" });
    }
});

module.exports = router;