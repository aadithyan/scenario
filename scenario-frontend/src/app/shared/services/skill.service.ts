import { Injectable } from '@angular/core';
import { HttpService } from './http.service';
import { HttpHeaders, HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { EndPoints, UserActions } from '../utilities/endpoints';

@Injectable()
export class SkillService {

  constructor(private httpService: HttpService,
              private http: HttpClient) { }

  public listSkills() {
    const url = EndPoints.BASE_URL + UserActions.listSkills;
    return this.httpService.get(url);
  }

  public saveSkills(data, userId) {
    const url = EndPoints.BASE_URL + UserActions.createUserSkills + '/?id=' + userId; 
    return this.httpService.post(url, data);
  }
}
