#!/usr/bin/env node

const {
  exec
} = require('child_process')
console.log(__dirname.replace("/scripts", ""))


const usage = `
  cloudKi -h | --help
  cloudKi start
  cloudKi restart
  cloudKi stop
  cloudKi save
`

const arg = process.argv[2]
switch (arg) {
  case "start":
    start()
    break
  case "restart":
    console.log(arg)
    break
  case "stop":
    console.log(arg)
    break;
  case "-h":
  case "--help":
    console.log("cloudKi", (arg === undefined) ? "usage" : arg)
    console.log(usage)
    break
  default:
    console.log("Invalid argument " + process.argv[2])
    console.log("cloudKi Usage")
    console.log(usage)
}


function start() {
  console.log("installing...")
  exec(`${__dirname}/start-modules.sh`, {shell: "/bin/bash"}, (err, stdout, stderr) => {
      if (err) {
        console.error(`exec error: ${err}`)
        return;
      }
      console.log(`${stdout}`)
    })
  }