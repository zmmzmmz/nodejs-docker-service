const express = require('express');
const app = express();
const ip = require('ip');

const port = process.env.port || 3333;

app.get('/', function (req, res) {
  const addr = ip.address();
  res.send(`Aloha at host(${addr})`);
});

app.listen(port, () => {
  console.log('Server start at port %s', port);
});
