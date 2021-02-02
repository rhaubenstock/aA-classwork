import React from 'react'
import TodoListItem from './../todo_list/todo_list_item'
import TodoListForm from './../todo_list/todo_form'

class todoList extends React.Component {

  componentDidMount() {
    this.props.dispatchFetchTodos();
  }

  render() {
    const todos = this.props.todos;
    const dispatchRemoveTodo = this.props.dispatchRemoveTodo;
    const dispatchReceiveTodo = this.props.dispatchReceiveTodo;
    const dispatchCreateTodo = this.props.dispatchCreateTodo;
    


    const todoList = todos.map( (todo) => (<TodoListItem key={todo.id} {...{todo, dispatchRemoveTodo, dispatchReceiveTodo}} />))
    return (
      <>
        <ul>
          {todoList}
        </ul>
        <TodoListForm {...{dispatchCreateTodo}} />
      </>
    );
  }

}


export default todoList;



