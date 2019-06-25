import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'app-box-cards',
  templateUrl: './box-cards.component.html',
  styleUrls: ['./box-cards.component.scss']
})
export class BoxCardsComponent implements OnInit {

  @Input() cardObject: any;

  constructor() { }

  ngOnInit() {
  }

}
