import {connect} from 'react-redux'
import TodoList from './todo_list'
import allTodos from './../../reducers/selectors'
import {receiveTodo} from './../../actions/todo_actions'

function mapStateToProps(state) {
  return {
    todos: allTodos(state)
  }
}

function mapDispatchToProps () {
  return {
    receiveTodo: todo => dispatch(receiveTodo(todo))
  }
}


export default connect(mapStateToProps, mapDispatchToProps)(TodoList)
