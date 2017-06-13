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
            return (
                <div key={user.id}>
                  <li key={user.first_name}>{user.first_name}</li>
                  <li key={user.last_name}>{user.last_name}</li>
                </div>
              )
          })}
      </ul>
      );
  }
}