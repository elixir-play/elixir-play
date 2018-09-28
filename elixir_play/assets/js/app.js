// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"
import * as ace from 'brace'
import 'brace/mode/elixir'
import 'brace/theme/dracula'

const editor = ace.edit('playground-code')
const runButton = document.getElementById('run-button')
const runningMessage = document.getElementById('running-message')
const outputElement = document.getElementById('code-output')

editor.getSession().setMode('ace/mode/elixir')
editor.setTheme('ace/theme/dracula')

runButton.addEventListener('click', (event) => {
  event.preventDefault()
  const snipped = {code: editor.getValue()}
  toggleRunningMessage()
  fetch("/run", {
    method: "post",
    body: JSON.stringify(snipped),
    headers: {
      'content-type': "application/json",
    },
  })
    .then((response) => response.json())
    .then(({output}) => {
      toggleRunningMessage()
      outputElement.innerText = output
    })
})

function toggleRunningMessage() {
  if (runningMessage.classList.contains('hidden')) {
    runningMessage.classList.remove('hidden')
    outputElement.classList.add('hidden')
    runButton.classList.add('disabled')
  } else {
    runningMessage.classList.add('hidden')
    runButton.classList.remove('disabled')
    outputElement.classList.remove('hidden')
  }
}

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"
