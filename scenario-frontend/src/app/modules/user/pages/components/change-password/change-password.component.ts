import { Component, OnInit } from '@angular/core';
import { ChangePassword } from '../../../models/change_password.modal';
import { ResponseService } from 'src/app/shared/services/response.service';
import { Router } from '@angular/router';
import { NgForm } from '@angular/forms';
import { UserService } from 'src/app/shared/services/user.service';
import { SessionService } from 'src/app/shared/services/session.service';

@Component({
  selector: 'app-change-password',
  templateUrl: './change-password.component.html',
  styleUrls: ['./change-password.component.scss']
})
export class ChangePasswordComponent implements OnInit {
  change_modal_data: any = {};
  subscribe: any;
  user: any;
  constructor(private passwordModal: ChangePassword,
              private responseService: ResponseService,
              private route: Router,
              private sessionService: SessionService,
              private userService: UserService) { }

  ngOnInit() {
    this.change_modal_data = this.passwordModal.returnChangePassword();
    this.user = this.sessionService.getCurrentSession();
  }

  changePassword(changePasswordForm:NgForm){
    if(changePasswordForm.valid){
      this.subscribe = this.userService.changePassword(this.change_modal_data, this.user.data.id).subscribe(data => {
        this.responseService.show_messages("success", "Successfully changed your password");
        this.route.navigate(['/dashboard'])
      });
    } else {
      this.responseService.show_messages("error", "Required Fields are empty");
    }
  }

}
