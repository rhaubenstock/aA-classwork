import {connect} from 'react-redux'
import TodoList from './todo_list'
import allTodos from './../../reducers/selectors'
import {receiveTodo, removeTodo, fetchTodos, createTodo } from './../../actions/todo_actions'

function mapStateToProps(state) {
  return {
    todos: allTodos(state)
  }
}

function mapDispatchToProps (dispatch) {
  return {
    dispatchReceiveTodo: (todo) => dispatch(receiveTodo(todo)),
    dispatchRemoveTodo: (id) => dispatch(removeTodo(id)), // it takes in an ID rather than the object itself.
    dispatchFetchTodos: () => dispatch(fetchTodos()),
    dispatchCreateTodo: (todo) => dispatch(createTodo(todo)),

  }
}


export default connect(mapStateToProps, mapDispatchToProps)(TodoList)
