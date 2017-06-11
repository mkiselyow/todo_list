import React from 'react'
import ReactDOM from 'react-dom'
import User from './user'
document.addEventListener('DOMContentLoaded', () => {
  var root = document.getElementById('index-page');
  ReactDOM.render(
    <User {...(root.dataset)} />,
    root
  )
})