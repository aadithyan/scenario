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
  reminderList: any;
  reminderTitle = "";
  dailyTaskLists: any;
  dailyTaskTitle = "";
  todoLists: any;
  todoListTitle = "";
  schedulesList: any;
  scheduleTitle = "";
  infoCard: any;
  infoCard2: any;
  infoCard3: any;
  infoCard4: any;
  
  constructor() { }

  ngOnInit() {
    this.cardBoxData();
    this.listRemindersCardData();
    this.listDailyTasksCardData();
    this.listTodoCardData();
    this.listScheduleCardData();
    this.listInfoCardsData();
  }

  listInfoCardsData() {
    this.infoCard = {
      "image_url": "assets/images/users/avatar-3.jpg",
      "name": "Alexandra Daddario",
      "email": "alexamdra@gmail.com",
      "class": "text-info",
      "role": "Manager"
    }
    this.infoCard2 = {
      "image_url": "assets/images/users/avatar-10.jpg",
      "name": "Robert Drowney Jr",
      "email": "drowney@gmail.com",
      "class": "text-warning",
      "role": "Team Lead"
    }
    this.infoCard3 = {
      "image_url": "assets/images/users/avatar-1.jpg",
      "name": "Chris Hemsworth",
      "email": "nic@gmail.com",
      "class": "text-success",
      "role": "Developer"
    }
    this.infoCard4 = {
      "image_url": "assets/images/users/avatar-6.jpg",
      "name": "Brad Pitt",
      "email": "brad@gmail.com",
      "class": "text-danger",
      "role": "Frontend"
    }
  }

  listScheduleCardData() {
    this.scheduleTitle = "My Schedules";
    this.schedulesList = [{
      "name": "Schedule 1",
      "class": "mdi-spin  mdi-vector-square text-primary",
      "date": "February 29, 2016 - 10:30am to 12:45pm"
    },{
      "name": "Schedule 2",
      "class": "mdi-spin mdi-vector-square text-success",
      "date": "February 29, 2016 - 10:30am to 12:45pm"
    },{
      "name": "Schedule 3",
      "class": "mdi-spin mdi-vector-square text-pink",
      "date": "February 29, 2016 - 10:30am to 12:45pm"
    },{
      "name": "Schedule 4",
      "class": "mdi-spin mdi-vector-square text-muted",
      "date": "February 29, 2016 - 10:30am to 12:45pm"
    },{
      "name": "Schedule 5",
      "class": "mdi-spin mdi-vector-square text-danger",
      "date": "February 29, 2016 - 10:30am to 12:45pm"
    }]
  }

  listTodoCardData() {
    this.todoListTitle = "Todo";
    this.todoLists = [{
      "name": "Todo 1",
      "class": "mdi-spin  mdi-square-outline text-primary",
      "date": "February 29, 2016 - 10:30am to 12:45pm"
    },{
      "name": "Todo 2",
      "class": "mdi-spin mdi-square-outline text-success",
      "date": "February 29, 2016 - 10:30am to 12:45pm"
    },{
      "name": "Todo 3",
      "class": "mdi-spin mdi-square-outline text-pink",
      "date": "February 29, 2016 - 10:30am to 12:45pm"
    },{
      "name": "Todo 4",
      "class": "mdi-spin mdi-square-outline text-muted",
      "date": "February 29, 2016 - 10:30am to 12:45pm"
    },{
      "name": "Todo 5",
      "class": "mdi-spin mdi-square-outline text-danger",
      "date": "February 29, 2016 - 10:30am to 12:45pm"
    }]
  }

  listDailyTasksCardData() {
    this.dailyTaskTitle = "Daily Tasks";
    this.dailyTaskLists = [{
      "name": "Task 1",
      "class": "mdi-spin mdi-checkbox-blank text-primary",
      "date": "February 29, 2016 - 10:30am to 12:45pm"
    },{
      "name": "Task 2",
      "class": "mdi-spin mdi-checkbox-blank text-success",
      "date": "February 29, 2016 - 10:30am to 12:45pm"
    },{
      "name": "Task 3",
      "class": "mdi-spin mdi-checkbox-blank text-pink",
      "date": "February 29, 2016 - 10:30am to 12:45pm"
    },{
      "name": "Task 4",
      "class": "mdi-spin mdi-checkbox-blank text-muted",
      "date": "February 29, 2016 - 10:30am to 12:45pm"
    },{
      "name": "Task 5",
      "class": "mdi-spin mdi-checkbox-blank text-danger",
      "date": "February 29, 2016 - 10:30am to 12:45pm"
    }]
  }

  listRemindersCardData() {
    this.reminderTitle = "Upcoming Reminders";
    this.reminderList = [{
      "name": "Meet Manager",
      "class": "mdi-spin mdi-amazon-alexa text-primary",
      "date": "February 29, 2016 - 10:30am to 12:45pm"
    },{
      "name": "Project Discussion",
      "class": "mdi-spin mdi-amazon-alexa text-success",
      "date": "February 29, 2016 - 10:30am to 12:45pm"
    },{
      "name": "Meet Manager",
      "class": "mdi-spin mdi-amazon-alexa text-pink",
      "date": "February 29, 2016 - 10:30am to 12:45pm"
    },{
      "name": "Project Discussion",
      "class": "mdi-spin mdi-amazon-alexa text-muted",
      "date": "February 29, 2016 - 10:30am to 12:45pm"
    },{
      "name": "Meet Manager",
      "class": "mdi-spin mdi-amazon-alexa text-danger",
      "date": "February 29, 2016 - 10:30am to 12:45pm"
    }]
  }

  cardBoxData() {
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
