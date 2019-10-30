import React from 'react';
import ReactDOM from 'react-dom'

const numbers = [];

function List(props){
    const numbers = props.numbers;
    const listItems = numbers.map((number) =>
      <li key={number.toString()}>
        {number}
      </li>
    );
    return (
      <ul>{listItems}</ul>
    );
}


ReactDOM.render(
    <List numbers={numbers} />,
    document.getElementById('root')
);

export default List;