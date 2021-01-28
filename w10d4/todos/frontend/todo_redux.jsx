import Redux from "redux";
import React from 'react';
import ReactDOM from 'react-dom';

document.addEventListener("DOMContentLoaded", ()=>{
  const root = document.getElementById("content");
  ReactDOM.render(<h1>Todos App</h1>, root);
});

state = {
  "todos": {
    1: {
      id: 1,
      title: 'wash car',
      body: 'with soap',
      done: false
    },
    2: {
      id: 2,
      title: 'wash dog',
      body: 'with shampoo',
      done: true
    },
  }
}