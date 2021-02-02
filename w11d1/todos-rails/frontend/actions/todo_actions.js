export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";
// export const FETCHTODOS = "FETCHTODOS"
import * as APIUtil from './../util/todo_api_util'
import {receiveErrors} from './error_actions'



export const receiveTodos = (todos) => {
  return {
    type: RECEIVE_TODOS,
    todos,
  };
};

export const receiveTodo = (todo) => {
  return {
    type: RECEIVE_TODO,
    todo
  };
};

export const removeTodo = (id) => {
  return {
    type: REMOVE_TODO,
    id
  };
};

export const fetchTodos = () => {
  return (dispatch) => {return APIUtil.fetchTodos().then(result => { dispatch(receiveTodos(result))})};
}

//createTodo - is a thunk action creator
// which means it returns a function that takes in dispatch
// we want it to do an API request and then update store based on response

// export const createTodo = (todo) => {
//   return (dispatch) => {
//     return APIUtil.addTodo(todo)
//             .then(result => dispatch(receiveTodo(result)));
//   }
// }


export const createTodo = todo => {
  return dispatch => {
    return APIUtil.addTodo(todo)
      .then(
        todo => {
          debugger
          return dispatch(receiveTodo(todo))},
        err => {
          return dispatch(receiveErrors(err.responseJSON))
        }
      )
  }
};



