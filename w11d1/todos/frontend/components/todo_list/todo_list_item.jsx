import React from 'react'

export default ({todo, dispatchRemoveTodo, dispatchReceiveTodo}) => {
  const localRemoveTodo = function(e) {
    e.preventDefault();
    // console.log(todo)
    dispatchRemoveTodo(todo.id)
  }

  const todoStatus = function() {
    if (todo.done) {
      return "Mark as unfinished"
    } else {
      return "Mark as finished"
    }
  }


  const toggleStatus = function(e) {
    e.preventDefault();
    todo.done = !todo.done
    dispatchReceiveTodo(todo)

  }

  return (
    <li>{todo.title}:{todo.body}:{(todo.done) ? ("Done") : ("Not Done")} 
     <button onClick={localRemoveTodo}>delete</button>
    <button onClick={toggleStatus}>{todoStatus()}</button>
    
    </li>
  )
}


