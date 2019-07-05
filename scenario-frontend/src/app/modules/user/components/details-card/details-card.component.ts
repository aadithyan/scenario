import { Component, OnInit } from '@angular/core';
import { SessionService } from 'src/app/shared/services/session.service';

@Component({
  selector: 'app-details-card',
  templateUrl: './details-card.component.html',
  styleUrls: ['./details-card.component.scss']
})
export class DetailsCardComponent implements OnInit {
  currentUser: any;
  profile_image = "";

  constructor(private sessionService: SessionService) { }

  ngOnInit() {
    this.currentUser = this.sessionService.getCurrentSession();
    this.profile_image = "assets/images/users/" + this.currentUser.data.gender.toLowerCase() + "_profile.jpg"
  }

}
