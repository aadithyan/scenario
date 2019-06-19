import { Injectable } from '@angular/core';
import { Observable, throwError, from } from 'rxjs';
import { map, catchError } from 'rxjs/operators';
import {
	HttpRequest,
	HttpHandler,
	HttpEvent,
	HttpInterceptor,
	HttpResponse,
	HttpErrorResponse
} from '@angular/common/http';
import { Router } from '@angular/router';

@Injectable()

export class BaseInterceptor implements HttpInterceptor {
	authToken: any;
	cyncCookie: any;
	authorizationHeader: any;

	constructor(private router: Router) {}

	intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
		const fromPage = request.headers.has('Component-Page');
		request = request.clone({setHeaders: { 'Content-Type': 'application/json'} });
		return next.handle(request).pipe(
			map((event: HttpEvent<any>) => {
				if (event instanceof HttpResponse) {
					const strmsg = event.body;
				}
				return event;
			}),
			catchError((error: HttpErrorResponse) => {
				if( error.status === 401 ) {
				}else{
				}				
				return throwError(error);
			})
		);
	}
}
