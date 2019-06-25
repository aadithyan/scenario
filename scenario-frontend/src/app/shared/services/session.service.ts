import { Injectable } from '@angular/core';
import { HttpService } from './../../shared/services/http.service';
import { HttpHeaders, HttpClient } from '@angular/common/http';
import { EndPoints, UserActions } from '../utilities/endpoints';
import { Router } from '@angular/router';


@Injectable()
export class SessionService {

  constructor(private httpService: HttpService,
              private http: HttpClient,
              private router: Router) { }

  
  generateSession(response){
    sessionStorage.setItem("user", JSON.stringify(response));
  }

  logout(){
    sessionStorage.removeItem("user");
    this.router.navigate(['/login'])
  }
}