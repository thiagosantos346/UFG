import React from 'react';
import Board from './components/Board';

function App() {
  return (
    <Board 
      squares={[
        null, null, null, 
        null, null, null, 
        null, null, null
    ]} /> 
  );
}

export default App;
