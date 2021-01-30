import React from 'react'
import TodoListItem from './../todo_list/todo_list_item'
import TodoListForm from './../todo_list/todo_form'

export default ({todos, dispatchReceiveTodo, dispatchRemoveTodo}) => {
  const todoList = todos.map( (todo) => (<TodoListItem dispatchRemoveTodo={dispatchRemoveTodo} dispatchReceiveTodo={dispatchReceiveTodo} key={todo.id} todo={ todo } />))
  return (
    <>
      <ul>
        {todoList}
      </ul>
      <TodoListForm dispatchReceiveTodo={dispatchReceiveTodo} />
    </>
  );
}





