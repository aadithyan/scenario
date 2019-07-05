import { Component, OnInit } from '@angular/core';
import { SessionService } from 'src/app/shared/services/session.service';
import { UserQualifications } from '../../models/user_qulifications.modal';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { NgForm } from '@angular/forms';
import { UserService } from 'src/app/shared/services/user.service';
import { ResponseService } from 'src/app/shared/services/response.service';

@Component({
  selector: 'app-add-qualifications',
  templateUrl: './add-qualifications.component.html',
  styleUrls: ['./add-qualifications.component.scss']
})
export class AddQualificationsComponent implements OnInit {
  user_qualifications_modal: any;
  subscribe: any;
  currentUser: any;
  name = "";
  specialization = "";
  institute = "";
  address = "";
  city = "";
  state = "";
  country = "";
  zip_postal_code = "";
  start_year = "";
  end_year = "";

  constructor(private sessionService: SessionService,
              private userQualificationModal: UserQualifications,
              public activeModal: NgbActiveModal,
              private userService: UserService,
              private responseService: ResponseService) { }

  ngOnInit() {
    this.user_qualifications_modal = this.userQualificationModal.returnUserQualificationsModal();
    this.currentUser = this.sessionService.getCurrentSession();
  }

  // Add More button clicked
  addMoreQualifications(addQualificationsForm: NgForm) {
    if(addQualificationsForm.valid){
      this.user_qualifications_modal.qualifications.push({ name: this.name,
                                                          institute: this.institute,
                                                          specialization: this.specialization,
                                                          address: this.address,
                                                          city: this.city,
                                                          state: this.state,
                                                          country: this.country,
                                                          zip_postal_code: this.zip_postal_code,
                                                          start_year: this.start_year,
                                                          end_year: this.end_year  }) 
    } else {
      this.responseService.show_messages("error", "Required Fields are empty");
    }
  }

  onSubmitQualifications(addQualificationsForm: NgForm) {
    if(addQualificationsForm.valid){
      this.addMoreQualifications(addQualificationsForm);
      this.saveQualifications();
    } else {
      this.responseService.show_messages("error", "Required Fields are empty");
    }
  }

  saveQualifications() {
    this.subscribe = this.userService.saveUserQualification(this.user_qualifications_modal, this.currentUser.data.id).subscribe(data => {
      this.responseService.show_messages("success", "Successfully added your qualifications");
      this.sessionService.removeSession();
      this.sessionService.generateSession(data);
      this.closeModal();
    });
  }

  closeModal() {
    this.activeModal.dismiss();
  }

}
