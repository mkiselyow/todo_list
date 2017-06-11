import React from 'react'
import ReactDOM from 'react-dom'

@Users = React.createClass
  render: ->
    React.DOM.div
      className: 'users'
      React.DOM.h2
        className: 'title'
        'Users'