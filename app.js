require('dotenv').config({ path: './.env' })

const express = require('express')
const app = express()
const port = process.env.PORT || 3000

const generate = require("./methods/generate")

app.use(express.json({ limit: '50mb' }));
app.use(express.urlencoded({ limit: '50mb' }));

process.on('uncaughtException', function (err) {
  console.error(err);
});

app.get('/', (req, res) => {
  res.send('Hello World!')
})

app.post('/generate', async (req, res) => {
  generate(req.body).then(result => {
    res.json(result);
  })
})


app.listen(port, () => {
  console.log(`app listening on port ${port}`)
})
