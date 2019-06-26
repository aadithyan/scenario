import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { LoginUser } from 'src/app/models/login.modal';
import { AuthenticationService } from 'src/app/shared/services/authentication.service';
import { ResponseService } from 'src/app/shared/services/response.service';
import { Router } from '@angular/router';
import { SessionService } from 'src/app/shared/services/session.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html'
})
export class LoginComponent implements OnInit {
  login_modal_data: any = {}
  subscribe: any
  constructor(private loginModal: LoginUser, private authService: AuthenticationService, 
              private responseService: ResponseService,
              private sessionService: SessionService,
              private route: Router) { }

  ngOnInit() {
    this.login_modal_data = this.loginModal.returnUserRoot();
  }

  login_user(loginForm:NgForm){
    if(loginForm.valid){
      this.subscribe = this.authService.loginUser(this.login_modal_data).subscribe(data => {
        this.sessionService.generateSession(data);
        this.responseService.show_messages("success", "Successfully Logged In");
        this.route.navigate(['/dashboard'])
      });
    } else {
      this.responseService.show_messages("error", "Required Fields are empty");
    }
  }

}
