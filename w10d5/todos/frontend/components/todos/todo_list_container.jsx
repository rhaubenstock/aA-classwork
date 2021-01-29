import {connect} from 'react-redux'
import TodoList from './todo_list'
import allTodos from './../../reducers/selectors'
import {receiveTodo, removeTodo} from './../../actions/todo_actions'

function mapStateToProps(state) {
  return {
    todos: allTodos(state)
  }
}

function mapDispatchToProps (dispatch) {
  return {
    receiveTodo: (todo) => dispatch(receiveTodo(todo)),
    removeTodo: (id) => dispatch(removeTodo(id)) // it takes in an ID rather than the object itself.
  }
}


export default connect(mapStateToProps, mapDispatchToProps)(TodoList)
