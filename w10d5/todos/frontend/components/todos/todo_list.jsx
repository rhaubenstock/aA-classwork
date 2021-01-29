import React from 'react'
import TodoListItem from './../todo_list/todo_list_item'
import TodoListForm from './../todo_list/todo_form'

export default ({todos, receiveTodo}) => {
  const todoList = todos.map( (todo) => (<TodoListItem receiveTodo={receiveTodo} key={todo.id} todo={ todo } />))
  return (
    <>
      <ul>
        {todoList}
      </ul>
      <TodoListForm receiveTodo={receiveTodo} />
    </>
  );
}





