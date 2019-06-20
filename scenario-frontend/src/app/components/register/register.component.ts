import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { RegisterUser } from 'src/app/models/register.modal';
import { AuthenticationService } from 'src/app/shared/services/authentication.service';
import { ResponseService } from 'src/app/shared/services/response.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html'
})
export class RegisterComponent implements OnInit {
  register_data: any = {}
  subscribe: any

  constructor(private registerModal: RegisterUser, private authService: AuthenticationService,
              private responseService: ResponseService) {
  }

  ngOnInit() {
    this.register_data = this.registerModal.returnUserRoot();
  }

  register_user(registerForm: NgForm) {
    if(registerForm.valid) {
      this.subscribe = this.authService.createUser(this.register_data).subscribe(data => {
        this.responseService.show_messages("success", "Successfully registered the user");
      })
    } else {
      this.responseService.show_messages("error", "Required fields are empty.");
    }
    
  }
}
