import { Component, OnInit } from '@angular/core';
import { SessionService } from 'src/app/shared/services/session.service';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AddQualificationsComponent } from '../add-qualifications/add-qualifications.component';

@Component({
  selector: 'app-qualifications',
  templateUrl: './qualifications.component.html',
  styleUrls: ['./qualifications.component.scss']
})
export class QualificationsComponent implements OnInit {
  currentUser: any;

  constructor(private sessionService: SessionService,
              private modalService: NgbModal) { }

  ngOnInit() {
    this.currentUser = this.sessionService.getCurrentSession();
  }

  newQualificationsModel() {
    const modalRef = this.modalService.open(AddQualificationsComponent, { size: 'lg'})
  }

}
