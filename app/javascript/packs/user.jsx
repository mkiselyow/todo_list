import React from 'react'
import ReactDOM from 'react-dom'
export default class User extends React.Component {
  constructor(props) {
    super(props);
    this.users = JSON.parse(this.props.users);
    console.log(this.users);
  }

  render(){
    return (
      <ul>
        {this.users.map(function(user){
            return <li key={user.id}>{user.first_name}</li>
          })}
      </ul>
      );
  }
}