import React from 'react';

const TabItem = ({title, updateState, isBold}) => {
  return (
    <li>
      <h1 onClick={updateState} className={ isBold ? "bold" : ""}>{title}</h1>
    </li>
  )
}

export default TabItem;