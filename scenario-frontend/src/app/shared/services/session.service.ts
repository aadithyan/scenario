import { Injectable } from '@angular/core';
import { HttpService } from './../../shared/services/http.service';
import { HttpHeaders, HttpClient } from '@angular/common/http';
import { EndPoints, UserActions } from '../utilities/endpoints';
import { Router } from '@angular/router';
import { ResponseService } from './response.service';


@Injectable()
export class SessionService {

  constructor(private httpService: HttpService,
              private http: HttpClient,
              private router: Router,
              private responseService: ResponseService) { }

  
  generateSession(response){
    sessionStorage.setItem("user", JSON.stringify(response));
  }

  removeSession(){
    sessionStorage.removeItem("user");
  }

  getCurrentSession() {
    return JSON.parse(sessionStorage.getItem("user"));
  }

  logout(){
    sessionStorage.removeItem("user");
    this.responseService.show_messages("success", "Successfully Logged Out");
    this.router.navigate(['/login']);
  }
}