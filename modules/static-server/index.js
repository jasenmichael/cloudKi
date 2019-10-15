const host = process.env.HOST || '0.0.0.0'
const port = process.argv[2] || 8080

const consola = require('consola')
const express = require('express')
const app = express()

app.use(express.static(__dirname + '/public'))

app.get('/', (req, res) => {
    res.sendFile(path.join(public, 'index.html'))
})

// app.listen(8080, () => console.log('app running on port 8080'))
app.listen(port, host)
consola.ready({
    message: `Server listening on http://${host}:${port}`,
    badge: true
})