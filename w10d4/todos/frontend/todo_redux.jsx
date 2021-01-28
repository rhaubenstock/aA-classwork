import Redux from 'redux';
import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store'
import { receiveTodo, receiveTodos } from './actions/todo_actions'

document.addEventListener("DOMContentLoaded", ()=>{
  const root = document.getElementById("content");
  ReactDOM.render(<h1>Todos App</h1>, root);
  window.store = configureStore();
  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
});







