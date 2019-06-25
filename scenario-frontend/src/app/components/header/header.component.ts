import { Component, OnInit } from '@angular/core';
import * as $ from 'jquery';
import { SessionService } from 'src/app/shared/services/session.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {

  constructor(private sessionService: SessionService) { }

  ngOnInit() {
    this.toggleNotifications();
  }

  toggleNotifications(){
    $(".right-bar-toggle").click(function () {
      $(".right-bar").toggle();
      $('.wrapper').toggleClass('right-bar-enabled');
    });
  }

  logout() {
    this.sessionService.logout();
  }

}
