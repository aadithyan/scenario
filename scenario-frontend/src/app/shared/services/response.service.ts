import { Injectable } from '@angular/core';
import { HttpService } from './../../shared/services/http.service';
import { HttpHeaders, HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { EndPoints, UserActions } from '../utilities/endpoints';
import { ToastrService } from 'ngx-toastr';

@Injectable()
export class ResponseService {

  constructor(private httpService: HttpService,
              private http: HttpClient, private toastr: ToastrService) { }

  public errorResponse(response) {
    switch(response.status) {
        case 409:
            this.toastr.error(response.error.message);
            break;
        case 500:
            this.toastr.error(response.statusText);
            break;
        case 404:
            this.toastr.error("Looks like this page is unavailable");
            break;
    }
  }

  public show_messages(messageType, displayMessage) {
      switch(messageType) {
          case 'error':
            this.toastr.error(displayMessage);
            break;
          case 'success':
            this.toastr.success(displayMessage);
            break;
          case 'warning':
            this.toastr.warning(displayMessage);
            break;
          case 'info':
            this.toastr.info(displayMessage);            
      }
  }
}
