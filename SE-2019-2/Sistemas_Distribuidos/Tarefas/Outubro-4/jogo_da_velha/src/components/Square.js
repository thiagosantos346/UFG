import React, { useEffect, useRef } from 'react'
import './Game.css'

function Square(props){
    
    const canvasRef = useRef()

    useEffect(() => {
      const ctx = canvasRef.current.getContext('2d')
      ctx.font = '25px arial'
      if ( props.value === 'x' ) {
        ctx.fillText('x', 15, 30)
      }
      else if ( props.value === 'o' ) {
        ctx.fillText('o', 15, 30)
      }  
    }, [props.value])
    
    const handleClick = () =>{
      props.handleClick(props.id)
    }

    return(
        <canvas
            className="square"
            onClick={handleClick}
            ref={canvasRef}
            width ={props.width}
            height={props.height}
            style ={{backgroundColor: props.color}}
        />
    )    
}

export default Square;