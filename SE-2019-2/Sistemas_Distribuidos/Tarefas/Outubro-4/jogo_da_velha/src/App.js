import React from 'react';
import Board from './components/Board';
import BoardPicture from './components/BoardPicture';
import BoardButton from './components/BoardButton';

function App() {
  return (
    <>
    <Board 
      squares={[
        null, null, null, 
        null, null, null, 
        null, null, null
    ]} />
    <BoardPicture valuePictures={[
                    null, null, null, 
                    null, null, null, 
                    null, null, null]}/>
    <BoardButton buttons={[
                    null, null, null, 
                    null, null, null, 
                    null, null, null
                ]}/>
    </> 
  );
}

export default App;
