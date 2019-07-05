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
import { HeaderComponent } from './components/header/header.component';
import { FooterComponent } from './components/footer/footer.component';
import { MenuComponent } from './components/menu/menu.component';
import { LayoutComponent } from './components/layout/layout.component';
import { DashboardComponent } from './modules/dashboard/pages/components/dashboard/dashboard.component';
import { ProjectListComponent } from './modules/dashboard/components/project-list/project-list.component';
import { SidebarComponent } from './components/sidebar/sidebar.component';
import { BoxCardsComponent } from './modules/cards/components/box-cards/box-cards.component';
import { ListCardComponent } from './modules/list_cards/components/list-card/list-card.component';
import { SessionService } from './shared/services/session.service';
import { SessionGuard } from './shared/guards/session.guard';
import { InfoCardsComponent } from './modules/cards/components/info-cards/info-cards.component';
import { UserService } from './shared/services/user.service';
import { ChangePassword } from './modules/user/models/change_password.modal';
import { ChangePasswordComponent } from './modules/user/pages/change-password/change-password.component';
import { ProfileComponent } from './modules/user/pages/profile/profile.component';
import { UserCardComponent } from './modules/user/components/user-card/user-card.component';
import { SkillsCardComponent } from './modules/user/components/skills-card/skills-card.component';
import { DetailsCardComponent } from './modules/user/components/details-card/details-card.component';
import { AddSkillsComponent } from './modules/user/components/add-skills/add-skills.component';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { NgSelectModule } from '@ng-select/ng-select';
import { LevelService } from './shared/services/levels.service';
import { TypeaheadModule } from 'ngx-bootstrap/typeahead';
import { SkillService } from './shared/services/skill.service';
import { UserSkills } from './modules/user/models/user_skills.modal';
import { QualificationsComponent } from './modules/user/components/qualifications/qualifications.component';
import { AddQualificationsComponent } from './modules/user/components/add-qualifications/add-qualifications.component';
import { UserQualifications } from './modules/user/models/user_qulifications.modal';

@NgModule({
  declarations: [
    AppComponent,
    RegisterComponent,
    LoginComponent,
    HeaderComponent,
    FooterComponent,
    MenuComponent,
    LayoutComponent,
    DashboardComponent,
    ProjectListComponent,
    SidebarComponent,
    BoxCardsComponent,
    ListCardComponent,
    InfoCardsComponent,
    ChangePasswordComponent,
    ProfileComponent,
    UserCardComponent,
    SkillsCardComponent,
    DetailsCardComponent,
    AddSkillsComponent,
    QualificationsComponent,
    AddQualificationsComponent
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    NgbModule,
    NgSelectModule,
    TypeaheadModule.forRoot(),
    ToastrModule.forRoot({
      closeButton: false,
      tapToDismiss: true,
      positionClass: 'toast-top-right',
      preventDuplicates: true,
      easing: 'easeOutBounce',
      newestOnTop: true
    })
  ],
  entryComponents: [AddSkillsComponent, AddQualificationsComponent],
  providers: [HttpService, 
              AuthenticationService,
              SessionService,
              ResponseService,
              SessionGuard,
              RegisterUser,
              LoginUser,
              ChangePassword,
              UserSkills,
              UserQualifications,
              UserService,
              LevelService,
              SkillService,
              {
                provide: HTTP_INTERCEPTORS,
                useClass: BaseInterceptor,
                multi: true
              },],
  bootstrap: [AppComponent]
})
export class AppModule { }
