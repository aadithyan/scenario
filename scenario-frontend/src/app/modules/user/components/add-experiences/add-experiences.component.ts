import { Component, OnInit } from '@angular/core';
import { SessionService } from 'src/app/shared/services/session.service';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { ResponseService } from 'src/app/shared/services/response.service';
import { UserService } from 'src/app/shared/services/user.service';
import { UserExperiences } from '../../models/user_experiences.modal';
import { NgForm } from '@angular/forms';
import * as moment from 'moment';

@Component({
  selector: 'app-add-experiences',
  templateUrl: './add-experiences.component.html',
  styleUrls: ['./add-experiences.component.scss']
})
export class AddExperiencesComponent implements OnInit {
  subscribe: any;
  currentUser: any;
  company = "";
  job_title = "";
  start_date: any;
  current = false;
  end_date = "";
  website = "";
  comment = "";
  user_experiences_modal: any;
  period = "";

  constructor(private sessionService: SessionService,
              public activeModal: NgbActiveModal,
              private userService: UserService,
              private userExperienceModal: UserExperiences,
              private responseService: ResponseService) { }

  ngOnInit() {
    this.currentUser = this.sessionService.getCurrentSession();
    this.current = false;
    this.user_experiences_modal = this.userExperienceModal.returnUserExperiencesModal();
    this.clearExperiencesList();
  }

  getPeriods(start_date, end_date) {
    start_date = new Date(start_date);
    end_date = new Date(end_date);
    var months;
    months = (end_date.getFullYear() - start_date.getFullYear()) * 12;
    months -= start_date.getMonth() + 1;
    months += end_date.getMonth();
    return months <= 0 ? this.convertMonthsToString(months) : this.convertMonthsToString(months);
  }

  convertMonthsToString(months) {
    return (parseInt(months) / 12 | 0) + " years and " + parseInt(months) % 12 +" months"
  }

  addMoreExperiences(addExperienceForm: NgForm) {
    if(addExperienceForm.valid) {
      this.start_date = moment(this.start_date).format('YYYY-MM-DD');
      this.end_date = this.end_date != null ? moment(this.end_date).format('YYYY-MM-DD') : moment(new Date()).format('YYYY-MM-DD');
      this.period = this.getPeriods(this.start_date, this.end_date);        
      this.user_experiences_modal.experiences.push({ company: this.company,
                                                     job_title: this.job_title,
                                                     start_date: this.start_date,
                                                     end_date: this.end_date,
                                                     current: this.current,
                                                     comment: this.comment,
                                                     website: this.website,
                                                     period: this.period})
    } else {
      this.responseService.show_messages("error", "Required Fields are empty");
    }
  }

  onSubmitExperiences(addExperienceForm: NgForm) {
    if(addExperienceForm.valid){
      this.addMoreExperiences(addExperienceForm);
      this.saveExperiences();
    } else {
      this.responseService.show_messages("error", "Required Fields are empty");
    }
  }

  saveExperiences() {
    this.subscribe = this.userService.saveUserExperience(this.user_experiences_modal, this.currentUser.data.id).subscribe(data => {
      this.responseService.show_messages("success", "Successfully added your experience");
      this.sessionService.removeSession();
      this.sessionService.generateSession(data);
      this.closeModal();
    });
  }

  closeModal() {
    this.clearExperiencesList();
    this.activeModal.dismiss();
  }

  clearExperiencesList() {
    this.user_experiences_modal.experiences = []
  }
}
