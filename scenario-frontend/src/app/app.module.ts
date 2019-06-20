import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { RegisterComponent } from './components/register/register.component';
import { HttpService } from './shared/services/http.service';
import { AuthenticationService } from './shared/services/authentication.service';
import { RegisterUser } from './models/register.modal';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { BaseInterceptor } from './shared/interceptors/base.interceptor';
import { LoginComponent } from './components/login/login.component';
import { LoginUser } from './models/login.modal';
import { ToastrModule }  from 'ngx-toastr';
import { ResponseService } from './shared/services/response.service';
@NgModule({
  declarations: [
    AppComponent,
    RegisterComponent,
    LoginComponent
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    ToastrModule.forRoot({
      closeButton: false,
      tapToDismiss: true,
      positionClass: 'toast-top-right',
      preventDuplicates: true,
      progressBar: true,
      easing: 'easeOutBounce',
      newestOnTop: true
    })
  ],
  providers: [HttpService, 
              AuthenticationService,
              ResponseService,
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
