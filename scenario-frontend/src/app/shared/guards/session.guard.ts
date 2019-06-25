import { Injectable } from "@angular/core";
import { CanActivate, Router, RouterStateSnapshot, ActivatedRouteSnapshot } from '@angular/router';

@Injectable()

export class SessionGuard implements CanActivate {

    constructor(private router: Router){}

    canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot) {
        console.log('in guard');
        console.log(JSON.parse(sessionStorage.getItem("user")));
        if(sessionStorage.getItem("user")){
            return true;
        }
        this.router.navigate(['/login'], {queryParams: { returnUrl: state.url}});
        return false;
    }
}