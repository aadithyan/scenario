import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { RegisterComponent } from './components/register/register.component';
import { LoginComponent } from './components/login/login.component';
import { LayoutComponent } from './components/layout/layout.component';
import { DashboardComponent } from './modules/dashboard/pages/components/dashboard/dashboard.component';
import { SessionGuard } from './shared/guards/session.guard';
import { ChangePasswordComponent } from './modules/user/pages/change-password/change-password.component';
import { ProfileComponent } from './modules/user/pages/profile/profile.component';

const routes: Routes = [
  {
    path: 'register',
    component: RegisterComponent
  },
  {
    path: 'login',
    component: LoginComponent
  },
  {
    path: 'dashboard',
    component: DashboardComponent,
    canActivate: [SessionGuard]
  },
  {
    path: 'change-password',
    component: ChangePasswordComponent,
    canActivate: [SessionGuard]
  },
  {
    path: 'profile',
    component: ProfileComponent,
    canActivate: [SessionGuard]
  },
  {
    path: '',
    redirectTo: '/login',
    pathMatch: 'full'
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
