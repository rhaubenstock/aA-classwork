import React from 'react'
import TodoListItem from './todo_list_item'

export default (props) => {
  console.log(props)
  const todoList = props.todos.map( (todo) => (<TodoListItem key={todo.id} todo={ todo } />))
  return (
  <ul>
    {todoList}
  </ul>)
}





