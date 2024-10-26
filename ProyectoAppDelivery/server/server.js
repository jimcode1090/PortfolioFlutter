const express = require("express");
require("dotenv").config();
const http = require("http");
const logger = require("morgan");
const cors = require("cors");
const morgan = require("morgan");
const passport = require("passport");
const userRoutes = require("./routes/userRoutes");

const app = express();
const env = process.env;
const server = http.createServer(app);

const port = env.SERVER_PORT || 3000;
const hostname = env.SERVER_HOSTNAME || 'localhost';
const API = env.API_URL

app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(morgan("dev"));

app.use(cors());
app.options("*", cors());

app.use(passport.initialize());
app.use(passport.session());
require("./config/passport")(passport);

app.disabled("x-powered-by");
app.set("port", port);

app.get("/", (req, res) => {
    res.send("Hola Mundo");
});

// Llamamos a las rutas
app.use(`${API}/users`, userRoutes);

app.use((err, req, res, next) => {
    res.status(err.status || 500).send(err.stack);
})

server.listen(port, hostname, () => {
    console.log(`Aplicación de NodeJS ${process.pid} Iniciada....`);
    console.log(`Server running at http://${hostname}:${port}`);
});