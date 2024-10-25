const bcrypt = require("bcryptjs");
const db = require("../config/mysql");

const User = {};

User.findById = (id, result) => {

    const sql = `
        SELECT
            id,
            email,
            name,
            lastname,
            image,
            password
        FROM
            users
        WHERE
            id = ?
    `;

    db.query
    (
        sql,
        [id],
        (err, res) => {
            if (err) {
                console.log("error: ", err);
                result(err, null);
            } else {
                result(null, res);
            }
        }
    );
}

User.findByEmail = (id, result) => {

    const sql = `
        SELECT
            id,
            email,
            name,
            lastname,
            image,
            password
        FROM
            users
        WHERE
            email = ?
    `;

    db.query
    (
        sql,
        [email],
        (err, res) => {
            if (err) {
                console.log("error: ", err);
                result(err, null);
            } else {
                result(null, res);
            }
        }
    );
}

User.create = async (user, result) => {

    const hash = await bcrypt.hash(user.password, 10);
    const sql = `
        INSERT INTO
            users(
                email,
                name,
                lastname,
                phone,
                image,
                password,
                created_at,
                updated_at
            )
        VALUES(?,?,?,?,?,?,?,?)
    `;

    db.query
    (
        sql,
        [
            user.email,
            user.name,
            user.lastname,
            user.phone,
            user.image,
            hash,
            new Date(),
            new Date()
        ],
        (err, res) => {
            if (err) {
                console.log("error: ", err);
                result(err, null);
            } else {
                result(null, { id: res.insertId, ...user });
            }
        }
    );
}

module.exports = User;