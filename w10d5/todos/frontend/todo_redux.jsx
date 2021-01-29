import Redux from 'redux';
import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store'
import { receiveTodo, receiveTodos } from './actions/todo_actions'
import { receiveSteps, receiveStep, removeStep } from './actions/step_actions.js'
import Root from './components/root';

document.addEventListener("DOMContentLoaded", ()=>{
  const root = document.getElementById("content");
  window.store = configureStore();


  ReactDOM.render(<Root store={ window.store } />, root);


  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
  window.receiveStep = receiveStep;
  window.receiveSteps = receiveSteps;
  window.removeStep = removeStep;
});







