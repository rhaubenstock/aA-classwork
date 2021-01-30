import React from 'react'
import TodoListItem from './../todo_list/todo_list_item'
import TodoListForm from './../todo_list/todo_form'

export default ({todos, dispatchReceiveTodo, dispatchRemoveTodo}) => {
  //cool trick for passing down props with same key name and variable name
  // {...{varname}}
  // from: https://stackoverflow.com/questions/51148064/reacts-props-with-the-same-name-as-their-value
  const todoList = todos.map( (todo) => (<TodoListItem key={todo.id} {...{todo, dispatchRemoveTodo, dispatchReceiveTodo}} />))
  return (
    <>
      <ul>
        {todoList}
      </ul>
      <TodoListForm dispatchReceiveTodo={dispatchReceiveTodo} />
    </>
  );
}





