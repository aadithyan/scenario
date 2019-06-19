import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { RegisterUser } from 'src/app/models/register.modal';
import { AuthenticationService } from 'src/app/shared/services/authentication.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html'
})
export class RegisterComponent implements OnInit {
  register_data: any = {}
  subscribe: any

  constructor(private registerModal: RegisterUser, private authService: AuthenticationService) {
  }

  ngOnInit() {
    this.register_data = this.registerModal.returnUserRoot();
  }

  register_user(registerForm:NgForm) {
    if(registerForm.valid) {
      this.subscribe = this.authService.createUser(this.register_data).subscribe(data => {
        var status: any = data;
        console.log(status);
      })
    }
    
  }
}
