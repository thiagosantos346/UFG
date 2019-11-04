import React, { useEffect, useState} from 'react'
import './Game.css'
import virus from './pictures/icons/png/028-virus.png'
import antivirus from './pictures/icons/png/024-shield.png'

function SquarePicture(props){
    
    const [picture, setpicture]= useState(null);
    

    useEffect(() => {
      if ( props.valuePicture === 'x' ) {
        setpicture(virus);
      }
      else if ( props.valuePicture === 'o' ) {
        setpicture(antivirus);
      }
      
    }, [ props.valuePicture ] )
    
    const handleClick = () =>{
      props.handleClick(props.id)
    }

    return(
      <img 
        alt={props.valuePicture}
        onClick={handleClick}
        className="square"
        src={picture}/>
    )    
}

export default SquarePicture;