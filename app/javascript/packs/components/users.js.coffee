import React from 'react'
import ReactDOM from 'react-dom'

@Users = React.createClass
  getInitialState: ->
    users: @props.data
  getDefaultProps: ->
    users: []
  render: ->
    React.DOM.div
      className: 'users'
      React.DOM.h2
        className: 'title'
        'Users'
