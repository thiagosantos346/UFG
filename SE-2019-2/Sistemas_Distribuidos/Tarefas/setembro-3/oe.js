
const values = {
    addres: {
        address: 'Rua Samambaia',
        state: 'Goías',
        city: 'Goiânia',
        country: 'Brasil'
        ,toString(){
            console.log(`address : ${this.address}\nstate : ${this.state}\n city : ${this.country}`);
        }
        ,toStringNew(_element) { 
            Object.keys(_element).forEach(element => {
                let value = element[key];
                console.log(`${key}: ${value}`)
            });
        }
    },
    user: {
        name: 'Marina',
        lastName: 'Pires',
        age: '28',
        email: 'people@mail.com',
        phone: '8987-8525'
        ,toString(){
            console.log(`name : ${this.name}\nlastName : ${this.lastName}\nage : ${this.age}\nemail : ${this.email}\nphone : ${this.phone}`);
        }
        ,toStringNew(_element) { 
            Object.keys(_element).forEach(element => {
                let value = element[key];
                console.log(`${key}: ${value}`)
            });
        }
    }
    ,toString(){
        this.addres.toString();
        this.addres.toStringNew();
        this.user.toString();
        this.user.toStringNew();
    }   
    
}

values.toString();


