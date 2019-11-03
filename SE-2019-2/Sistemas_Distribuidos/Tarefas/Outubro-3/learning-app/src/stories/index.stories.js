import React from 'react';
import { storiesOf } from '@storybook/react';
import Conversor from '../components/Conversor';


storiesOf('Testes', module)
    .add(
        'Conversor de Moedas'
        ,()=> < Conversor className="conversor" moedaA="BRL" moedaB="USD" />
    )