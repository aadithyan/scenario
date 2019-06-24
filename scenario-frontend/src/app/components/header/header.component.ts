import { Component, OnInit } from '@angular/core';
import * as $ from 'jquery';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {

  constructor() { }

  ngOnInit() {
    this.toggleNotifications();
  }

  toggleNotifications(){
    $(".right-bar-toggle").click(function () {
      $(".right-bar").toggle();
      $('.wrapper').toggleClass('right-bar-enabled');
    });
  }

}
