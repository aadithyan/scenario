import { Component, OnInit } from '@angular/core';
import { SessionService } from 'src/app/shared/services/session.service';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AddExperiencesComponent } from '../add-experiences/add-experiences.component';

@Component({
  selector: 'app-experiences',
  templateUrl: './experiences.component.html',
  styleUrls: ['./experiences.component.scss']
})
export class ExperiencesComponent implements OnInit {
  currentUser: any;

  constructor(private sessionService: SessionService,
              private modalService: NgbModal) { }

  ngOnInit() {
    this.currentUser = this.sessionService.getCurrentSession();
  }

  newExperiencesModel() {
    const modalRef = this.modalService.open(AddExperiencesComponent, { size: 'lg'})
  }
}
