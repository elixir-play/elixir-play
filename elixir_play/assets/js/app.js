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
import 'brace/theme/monokai'

const editor = ace.edit('playground-code')
editor.getSession().setMode('ace/mode/elixir')
editor.setTheme('ace/theme/monokai')

const runButton = document.getElementById('run-button')
runButton.addEventListener('click', (event) => {
  event.preventDefault()
  const snipped = {code: editor.getValue()}
  fetch("/run", {
    method: "post",
    body: JSON.stringify(snipped),
    headers: {
      'content-type': "application/json",
    },
  })
    .then((response) => response.json())
    .then(({output}) => {
      const outputElement = document.getElementById('code-output')
      outputElement.innerText = output
    })
})

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"
