import { RECEIVE_TODO, RECEIVE_TODOS, REMOVE_TODO } from './../actions/todo_actions';


const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  }
};


const todosReducer = (state = initialState, action) => {
  // debugger
  state = Object.assign({}, state);
  switch (action.type) {
    case RECEIVE_TODO:
      state[action.todo.id] = action.todo;
      return state;

    case RECEIVE_TODOS:
      let newState = {}
      action.todos.forEach( todo => {
        newState[todo.id] = todo;
      });
      return newState;

    case REMOVE_TODO :
      delete state[action.id];
      return state;

    default:
      return state;
      
  }
};

export default todosReducer;



