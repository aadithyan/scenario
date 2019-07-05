import { Component, OnInit } from '@angular/core';
import { SessionService } from 'src/app/shared/services/session.service';
import { AddSkillsComponent } from '../add-skills/add-skills.component';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-skills-card',
  templateUrl: './skills-card.component.html',
  styleUrls: ['./skills-card.component.scss']
})
export class SkillsCardComponent implements OnInit {
  currentUser: any;
  constructor(private sessionService: SessionService,
              private modalService: NgbModal) { }

  ngOnInit() {
    this.currentUser = this.sessionService.getCurrentSession();
  }

  openModel() {
    const modalRef = this.modalService.open(AddSkillsComponent, { size: 'lg'});
  }

}
