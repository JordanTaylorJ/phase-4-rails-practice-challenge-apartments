
import './App.css';
import React, {useState} from 'react';

function App() {

  const [tenants, setTenants] = useState([]);

  const handleClick = () => {
    fetch('/tenants/four', {      
      headers: {
      'Content-Type' : 'application/json'
      }
    })
    .then(res => {
      if (res.ok) {
        res.json().then(res => setTenants(res))
      }
    })
  }
  /*
  .then(res => {
    if (res.ok){
      res.json().then(currentUser => setUser(currentUser))
    }
  })
  */

  console.log('tenants', tenants)
  return (
   <div>
    <header> Checking my shit </header>
    <button onClick={handleClick}>Button</button>
   </div>
  );
}

export default App;

/*
, {
      method: 'GET',
      headers: {
        'Content-Type' : 'application/json'
      }
    })
*/