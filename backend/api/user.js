const express = require('express');
const router = express.Router()
const connection = require('../config/sql_config');
const util = require('util');
const config = require('../config/config');
const multer = require('multer');
const path = require('path');

var dbQuery;

dbQuery = util.promisify(connection.query).bind(connection);

router.get('/users', async (req, res) => {

    var users = [];

    var user = await dbQuery('SELECT * FROM users');

    if (user.length > 0) {
        user.forEach(element => {
            const { password, ...userWithoutPassword } = element;
            users.push(userWithoutPassword);
        });
        res.status(200).json({ "status": "success", "data": users });
    } else {
        res.status(401).json({ "status": "failed", "message": "Invalid user" });
    }
});

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, path.join(__dirname, '../uploads/profile_picture'.replace(/ /g, '_')))
    },
    filename: function (req, file, cb) {
        const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9) + path.extname(file.originalname);
        cb(null, uniqueSuffix)
    }
});

const upload = multer({ storage: storage });

router.put('/users/:id', upload.single('image'), async (req, res) => {

    const { id } = req.params;
    const { fullName, gender, country, email, pass, isEdit } = req.body;

    let photoUrl = null;
    let profilePicture = null;
    const file = req.file;

    if (file) {
        profilePicture = file.filename;
        photoUrl = `${config.hostAddress}/uploads/profile_picture/${profilePicture}`;
    }

    var user = await dbQuery('SELECT * FROM users WHERE id = ?', [id]);

    if (user.length > 0) {
        console.log(isEdit);
        if (isEdit == true) {
            await dbQuery('UPDATE users SET full_name = ?, email = ?, gender = ?, country = ?, image = ? WHERE id = ?', [fullName, email, gender, country, photoUrl, id]);
        } else {
            await dbQuery('UPDATE users SET full_name = ?, email = ?, gender = ?, country = ?, password = ?,image = ? WHERE id = ?', [fullName, email, gender, country, pass, photoUrl, id]);
        }
        var updatedUser = await dbQuery('SELECT * FROM users WHERE id = ?', [id]);
        const { password, ...userWithoutPassword } = updatedUser[0];
        res.status(200).json({ "status": "success", "data": userWithoutPassword });
    } else {
        res.status(401).json({ "status": "failed", "message": "Invalid user" });
    }
});

router.get('/users/:id', async (req, res) => {

    const { id } = req.params;

    var user = await dbQuery('SELECT * FROM users WHERE id = ?', [id]);

    if (user.length > 0) {

        const { password, ...userWithoutPassword } = user[0];

        res.status(200).json({ "status": "success", "data": userWithoutPassword });

    } else {
        res.status(401).json({ "status": "failed", "message": "Invalid user" });
    }
});

module.exports = router;