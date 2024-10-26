const User = require("../models/user");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const keys = require("../config/keys");


module.exports = {

    login(req, res) {
        const email = req.body.email;
        const password = req.body.password;

        User.findByEmail(email, async (err, result) => {
            if (err) {
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un error con la búsqueda del usuario',
                    error: err
                })
            }

            if (!result) {
                return res.status(404).json({
                    success: false,
                    message: 'No se encontró el usuario'
                })
            }

            const isPasswordValid = await bcrypt.compare(password, result.password)
            if (!isPasswordValid ) {
                return res.status(401).json({
                    success: false,
                    message: 'Contraseña incorrecta'
                })
            }

            const token = jwt.sign({id: result.id,email: result.email}, keys.secretOrKey, {});
            const data = {
                id: result.id,
                name: result.name,
                lastname: result.lastname,
                email: result.email,
                phone: result.phone,
                image: result.image,
                sessiontoken: `JWT ${token}`
            }

            return res.status(200).json({
                success: true,
                message: 'El login fue exitoso',
                data: data
            })
        });

    },

    register(req, res) {
        const user = req.body;
        console.log(user);

        User.create(user, (err, result) => {
            if (err) {
                return res.status(501).json({
                    success: false,
                    message: 'Hubo un error con el registro del usuario',
                    error: err
                })
            }

            return res.status(201).json({
                success: true,
                message: 'El registro fue exitoso',
                data: result
            })
        });
    }
}