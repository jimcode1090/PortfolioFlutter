const express = require("express");
require('dotenv/config');

const app = express();
const env = process.env;

app.use();

app.get('/', (req, res) => {
    
})

const hostname = env.HOSTNAME;
const port = env.PORT;

app.listen(port, () => {
    console.log(`Server running at http://${hostname}:${port}`);
});