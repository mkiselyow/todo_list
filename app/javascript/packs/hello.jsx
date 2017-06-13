import React from 'react'
import ReactDOM from 'react-dom'
document.addEventListener('DOMContentLoaded', () => {
  var root = document.getElementById('hello-page');
  ReactDOM.render(
    <Hello {...(root.dataset)} />,
    root
  )
    return (
        <div key={hellopage}>
          <li key={hello}>{'hello'}</li>
          <li key={page}>{'page'}</li>
        </div>
      )
})