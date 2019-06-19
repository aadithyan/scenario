import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { RegisterComponent } from './components/register/register.component';
import { HttpService } from './shared/services/http.service';
import { AuthenticationService } from './shared/services/authentication.service';
import { RegisterUser } from './models/register.modal';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { BaseInterceptor } from './shared/interceptors/base.interceptor';
import { LoginComponent } from './components/login/login.component';
import { LoginUser } from './models/login.modal';

@NgModule({
  declarations: [
    AppComponent,
    RegisterComponent,
    LoginComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule
  ],
  providers: [HttpService, 
              AuthenticationService, 
              RegisterUser,
              LoginUser,
              {
                provide: HTTP_INTERCEPTORS,
                useClass: BaseInterceptor,
                multi: true
              },],
  bootstrap: [AppComponent]
})
export class AppModule { }
