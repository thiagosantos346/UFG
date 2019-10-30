import React from 'react';

function InputText(props){
    return(
        <input
            type={props.type}
            value={props.value}
            placeholder={props.placeHolder}
        />
    )
}

export default InputText;