export class RegisterUser {
    returnUserRoot(){
        const data = {
            "user": {
                "first_name": "",
                "middle_name": "",
                "last_name": "",
                "email": "",
                "password": "",
                "user_name": ""    
            }
        }
        return data;
    }
}