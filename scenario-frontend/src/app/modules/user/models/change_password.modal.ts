export class ChangePassword {
	returnChangePassword(){
		const data = {
			"user": {
				"current_password": "",
				"new_password": "",
				"password_confirmation": ""
			}
		}
		return data;
  }
}