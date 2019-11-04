import React, { useEffect, useState} from 'react'
import './Game.css'

function SquareButton(props){
    
    const [valueButton, setValueButton]= useState(null);
    

    useEffect(() => {
      if ( props.valueButton === 'x' ) {
        setValueButton('X');
      }
      else if ( props.valueButton === 'o' ) {
        setValueButton('O');
      }
      
    }, [ props.valueButton ] )
    
    const handleClick = () =>{
      props.handleClick(props.id)
    }

    return(

      <button
          className="square button"
          onClick={handleClick}
      >{valueButton}</button>

    )    
}

export default SquareButton;