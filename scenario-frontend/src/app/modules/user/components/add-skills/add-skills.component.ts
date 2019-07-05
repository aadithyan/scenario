import { Component, OnInit } from '@angular/core';
import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import {NgSelectModule, NgOption} from '@ng-select/ng-select';
import { LevelService } from 'src/app/shared/services/levels.service';
import { NgForm } from '@angular/forms';
import { SkillService } from 'src/app/shared/services/skill.service';
import { TypeaheadMatch } from 'ngx-bootstrap/typeahead/typeahead-match.class';
import { UserSkills } from '../../models/user_skills.modal';
import { SessionService } from 'src/app/shared/services/session.service';
import { ResponseService } from 'src/app/shared/services/response.service';

@Component({
  selector: 'app-add-skills',
  templateUrl: './add-skills.component.html',
  styleUrls: ['./add-skills.component.scss']
})
export class AddSkillsComponent implements OnInit {
  levels: any;
  user_skill_modal: any;
  skills = [];
  years = 0;
  months = 0;

  selectedSkillValue = "";
  selectedSkillOption = "";
  subscribe: any;
  selectedLevel: any;
  selectedSkillsArray = [];
  currentUser: any;
  constructor(public activeModal: NgbActiveModal,
              private levelService: LevelService,
              private skillService: SkillService,
              private sessionService: SessionService,
              private responseService: ResponseService,
              private userSkillModal: UserSkills) { }

  ngOnInit() {
    this.listLevels();
    this.listSkills();
    this.user_skill_modal = this.userSkillModal.returnNewSkillsModal();
    this.currentUser = this.sessionService.getCurrentSession();
  }

  closeModal() {
    this.activeModal.close('Modal Closed');
  }

  // Listing all skills
  listSkills() {
    this.subscribe = this.skillService.listSkills().subscribe(response => {
      response.data.forEach(data => {
        this.skills.push({ id: data.id, name: data.name });
      });
    });
  }

  // Listing all levels
  listLevels() {
    this.subscribe = this.levelService.getLevels().subscribe(response => {
      this.levels = response.data;
    });    
  }

  // Add More button clicked
  addMoreSkills(addSkillsForm: NgForm) {
    if(addSkillsForm.valid){
      this.user_skill_modal.user_skill.push({ level_id: this.selectedLevel, 
                                      skill_id: this.selectedSkillOption, 
                                      years: this.years, months: this.months == null ? 0 : this.months }) 
    }
  }

  onSubmitSkills(addSkillsForm: NgForm) {
    if(addSkillsForm.valid){
      this.addMoreSkills(addSkillsForm);
      this.saveSkills();
    }
  }

  saveSkills(){
    this.subscribe = this.skillService.saveSkills(this.user_skill_modal, this.currentUser.data.id).subscribe(data => {
      this.responseService.show_messages("success", "Successfully added your skills");
      this.sessionService.removeSession();
      this.sessionService.generateSession(data);
      this.activeModal.dismiss();
    });
  }

  public handleStaticResultSelected (result) {
    this.selectedSkillOption = result;
  }

  onSelect(event: TypeaheadMatch): void {
    this.selectedSkillOption = event.item.id;
  }
}
