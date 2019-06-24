import { Component, OnInit } from '@angular/core';
import { MorrisJsModule } from 'angular-morris-js';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {

  taskBox: any;
  todoBox: any;
  walletBox: any;
  pendingBox: any;
  
  constructor() { }

  ngOnInit() {
    this.taskBox = {
      "title": "Tasks completed",
      "percentage": "24%",
      "total": 12,
      "badge": 'badge-purple',
      "period": "This Month",
      "progress": "progress-bar-purple",
      "progress_alt": "progress progress-bar-purple-alt"
    }

    this.todoBox = {
      "title": "Todo's completed",
      "percentage": "74%",
      "total": 20,
      "badge": 'badge-info',
      "period": "This Month",
      "progress": "progress-bar-info",
      "progress_alt": "progress progress-bar-info-alt"
    }

    this.walletBox = {
      "title": 'My Expenses',
      "percentage": "55%",
      "total": "Rs. 3000",
      "badge": "badge-danger",
      "period": 'This Month',
      "progress": "progress-bar-danger",
      "progress_alt": "progress progress-bar-danger-alt"
    }

    this.pendingBox = {
      "title": 'Pending Lists',
      "percentage": "15%",
      "total": "49",
      "badge": "badge-inverse",
      "period": 'This Month',
      "progress": "progress-bar-inverse",
      "progress_alt": "progress progress-bar-inverse-alt"
    }
  }

}
