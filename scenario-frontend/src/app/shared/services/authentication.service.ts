import { Injectable } from '@angular/core';
import { HttpService } from './../../shared/services/http.service';
import { HttpHeaders, HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { EndPoints, UserActions } from '../utilities/endpoints';

@Injectable()
export class AuthenticationService {

  constructor(private httpService: HttpService,
              private http: HttpClient) { }

  public createUser(data) {
    const url = EndPoints.BASE_URL + UserActions.registerUser;
    return this.httpService.post(url, data);
  }
}
