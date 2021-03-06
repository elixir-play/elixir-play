// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.scss"

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
import AnsiToHTML from 'ansi-to-html'
import xssFilters from 'xss-filters'

const editor = ace.edit('playground_code')
const ansiConverter = new AnsiToHTML()
const runButton = document.getElementById('run_btn')
const formatButton = document.getElementById('format_btn')
const runningMessage = document.getElementById('running_message')
const outputElement = document.getElementById('code_output')
const elixirVersion = document.getElementById('playground_elixir_version')

const previousCode = localStorage.getItem("play:code")

editor.getSession().setMode('ace/mode/elixir')
editor.setTheme('ace/theme/dracula')
editor.session.setOptions({tabSize: 2, useSoftTabs: true})
editor.$blockScrolling = Infinity

if (previousCode) {
  editor.setValue(previousCode)
  editor.clearSelection()
}

runButton.addEventListener('click', clickRun)
formatButton.addEventListener('click', clickFormat)

function toggleRunningMessage({code} = {code: true}) {
  if (runningMessage.classList.contains('hidden')) {
    if (code) {
      outputElement.classList.add('hidden')
    }
    runningMessage.classList.remove('hidden')
    runButton.classList.add('disabled')
    formatButton.classList.add('disabled')
  } else {
    if (code) {
      outputElement.classList.remove('hidden')
    }
    runningMessage.classList.add('hidden')
    runButton.classList.remove('disabled')
    formatButton.classList.remove('disabled')
  }
}

function clickRun(event) {
  event.preventDefault()
  const url = event.target === runButton ? "/run" : "/format";
  const code = {source: editor.getValue(), elixir_version: elixirVersion.value}
  toggleRunningMessage()
  fetch('/run', {
    method: "post",
    body: JSON.stringify({code}),
    headers: {
      'content-type': "application/json",
    },
  })
  .then((response) => response.json())
  .then(({output, error}) => {
    localStorage.setItem('play:code', editor.getValue())
    toggleRunningMessage()
    const safeOutput = xssFilters.inHTMLData(output)
    outputElement.innerHTML = ansiConverter.toHtml(safeOutput)
  })
}

function clickFormat(event) {
  event.preventDefault()
  const code = {source: editor.getValue()}
  toggleRunningMessage({code: false})
  fetch('/format', {
    method: "post",
    body: JSON.stringify({code}),
    headers: {
      'content-type': "application/json",
    },
  })
  .then((response) => response.json())
  .then(({output, error}) => {
    if (output) {
      localStorage.setItem('play:code', editor.getValue())
      const position = editor.getCursorPosition()
      editor.setValue(output)
      editor.clearSelection()
      editor.moveCursorToPosition(position)
      toggleRunningMessage({code: false})
    } else {
      toggleRunningMessage()
      const safeOutput = xssFilters.inHTMLData(error)
      outputElement.innerHTML = ansiConverter.toHtml(safeOutput)
    }
  })
}

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"
