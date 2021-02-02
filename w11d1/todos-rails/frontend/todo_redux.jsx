import Redux from 'redux';
import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store'
import { receiveTodo, receiveTodos, fetchTodos, createTodo } from './actions/todo_actions'
import { receiveSteps, receiveStep, removeStep } from './actions/step_actions.js'
import Root from './components/root';
import allTodos from './reducers/selectors';
import {addTodo} from './util/todo_api_util'

// console.log('Working!!!!!!!!!')

document.addEventListener("DOMContentLoaded", ()=>{
  const root = document.getElementById("root");
  window.store = configureStore();


  ReactDOM.render(<Root store={ window.store } />, root);


  window.fetchTodos = fetchTodos;
  window.createTodo = createTodo;
  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
  window.receiveStep = receiveStep;
  window.receiveSteps = receiveSteps;
  window.removeStep = removeStep;
  window.allTodos = allTodos;
  window.addTodo = addTodo;
});







