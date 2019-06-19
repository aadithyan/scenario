import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { LoginUser } from 'src/app/models/login.modal';
import { AuthenticationService } from 'src/app/shared/services/authentication.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html'
})
export class LoginComponent implements OnInit {
  login_modal_data: any = {}
  subscribe: any
  constructor(private loginModal: LoginUser, private authService: AuthenticationService) { }

  ngOnInit() {
    this.login_modal_data = this.loginModal.returnUserRoot();
  }

  login_user(loginForm:NgForm){
    if(loginForm.valid){
      this.subscribe = this.authService.loginUser(this.login_modal_data).subscribe(data => {
        var status: any = data;
        console.log(status);
      })
    }
  }

}
