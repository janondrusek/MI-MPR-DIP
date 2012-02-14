// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.cvut.fit.mi_mpr_dip.admission.domain;

import cz.cvut.fit.mi_mpr_dip.admission.domain.Admission;
import cz.cvut.fit.mi_mpr_dip.admission.domain.personal.Person;
import cz.cvut.fit.mi_mpr_dip.admission.domain.study.Degree;
import cz.cvut.fit.mi_mpr_dip.admission.domain.study.Faculty;
import cz.cvut.fit.mi_mpr_dip.admission.domain.study.Programme;
import cz.cvut.fit.mi_mpr_dip.admission.domain.study.StudyMode;

privileged aspect Admission_Roo_JavaBean {
    
    public int Admission.getVersion() {
        return this.version;
    }
    
    public void Admission.setVersion(int version) {
        this.version = version;
    }
    
    public Long Admission.getAdmissionId() {
        return this.admissionId;
    }
    
    public void Admission.setAdmissionId(Long admissionId) {
        this.admissionId = admissionId;
    }
    
    public String Admission.getCode() {
        return this.code;
    }
    
    public void Admission.setCode(String code) {
        this.code = code;
    }
    
    public Faculty Admission.getFaculty() {
        return this.faculty;
    }
    
    public void Admission.setFaculty(Faculty faculty) {
        this.faculty = faculty;
    }
    
    public Degree Admission.getDegree() {
        return this.degree;
    }
    
    public void Admission.setDegree(Degree degree) {
        this.degree = degree;
    }
    
    public StudyMode Admission.getStudyMode() {
        return this.studyMode;
    }
    
    public void Admission.setStudyMode(StudyMode studyMode) {
        this.studyMode = studyMode;
    }
    
    public Programme Admission.getProgramme() {
        return this.programme;
    }
    
    public void Admission.setProgramme(Programme programme) {
        this.programme = programme;
    }
    
    public Person Admission.getPerson() {
        return this.person;
    }
    
    public void Admission.setPerson(Person person) {
        this.person = person;
    }
    
}
