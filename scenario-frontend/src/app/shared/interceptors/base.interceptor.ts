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
import { ResponseService } from '../services/response.service';

@Injectable()

export class BaseInterceptor implements HttpInterceptor {
	authToken: any;
	userSession: any;

	constructor(private router: Router, private responseService: ResponseService) {
		this.userSession = JSON.parse(sessionStorage.getItem("user"));
		if(this.userSession) {
			this.authToken = "Bearer " + this.userSession.data.authentication_token;
		}else {
			this.authToken = "";		
		}
	}

	intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
		const fromPage = request.headers.has('Component-Page');

		request = request.clone({setHeaders: { 'Content-Type': 'application/json', Authorization: this.authToken } });
		return next.handle(request).pipe(
			map((event: HttpEvent<any>) => {
				if (event instanceof HttpResponse) {
					const strmsg = event.body;
				}
				return event;
			}),
			catchError((error: HttpErrorResponse) => {
				this.responseService.errorResponse(error);								
				return throwError(error);
			})
		);
	}
}
