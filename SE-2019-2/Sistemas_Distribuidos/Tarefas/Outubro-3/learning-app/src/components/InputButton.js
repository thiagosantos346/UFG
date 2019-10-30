import React from 'react'

function inputButton(props){
    return(
        <input 
            value={props.value}
            type={props.type}
        />
    )
}


export default inputButton;