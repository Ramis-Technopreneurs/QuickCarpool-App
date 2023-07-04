const express = require("express");
const app = express();
const util = require('util');
const cors = require('cors');
const bodyParser = require('body-parser');
const connection = require('./config/sql_config');
const auth = require('./api/auth');
const user = require('./api/user');
const ride = require('./api/rides');


var dbQuery;

dbQuery = util.promisify(connection.query).bind(connection);

const Authorization = async function (req, res, next) {
    if (req.originalUrl === "/api/login" || req.originalUrl === "/api/register" || req.originalUrl.startsWith("/uploads/") || req.originalUrl === "/api/searchuser") {
        next();
        return;
    }

    if (req.headers.authorization) {
        const authId = req.headers.authorization;

        const userExist = await dbQuery('SELECT * FROM users WHERE auth_key = ?', [authId]);

        if (userExist.length > 0) {
            req.user = userExist[0];
            next();
            return;
        }
    }

    res.status(401).send({ "code": "unauthorized" });
}

app.use(express.json());
app.use(Authorization);
app.use(bodyParser.urlencoded({ extended: false }));//Its use for mobile app data
app.use(bodyParser.json());
app.use(cors());// Its use for web app data

app.use('/uploads', express.static('uploads'));

app.use('/api', auth);
app.use('/api', user);
app.use('/api', ride);

app.listen(3000, () => {
    console.log("Server running on port 3000");
});