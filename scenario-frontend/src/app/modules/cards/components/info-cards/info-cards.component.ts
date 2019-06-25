import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'app-info-cards',
  templateUrl: './info-cards.component.html',
  styleUrls: ['./info-cards.component.scss']
})
export class InfoCardsComponent implements OnInit {

  @Input() infoCardObject: any;
  constructor() { }

  ngOnInit() {
  }

}
