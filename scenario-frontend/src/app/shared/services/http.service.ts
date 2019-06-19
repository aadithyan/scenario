import { Injectable } from '@angular/core';
import 'rxjs/Rx';
import { HttpClient, HttpHeaders, HttpRequest, HttpEvent } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable()
export class HttpService {

    public currentError: any;
    constructor( private http: HttpClient ) {}
    get(url): Observable<any> {
        return this.http.get(url);
    }
    post(url, dataarr): Observable<any> {
        const body = JSON.stringify(dataarr);
        console.log(body);
        return this.http.post(url, body);
    }
    put(url, dataarr): Observable<any> {
        const body = JSON.stringify(dataarr);
        console.log(url);
        console.log(body);
        return this.http.put(url, body);
    }
    delete(url): Observable<any> {
        return this.http.delete(url);
    }
}
