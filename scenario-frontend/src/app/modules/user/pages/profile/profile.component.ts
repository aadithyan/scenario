import { Component, OnInit } from '@angular/core';
import { SessionService } from 'src/app/shared/services/session.service';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.scss']
})
export class ProfileComponent implements OnInit {
  currentUser: any;
  constructor(private sessionService: SessionService) { }

  ngOnInit() {
    this.currentUser = this.sessionService.getCurrentSession();
  }

}
