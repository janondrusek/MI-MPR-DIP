// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.cvut.fit.mi_mpr_dip.admission.domain.personal;

import cz.cvut.fit.mi_mpr_dip.admission.domain.personal.Gender;

privileged aspect Gender_Roo_JavaBean {
    
    public int Gender.getVersion() {
        return this.version;
    }
    
    public void Gender.setVersion(int version) {
        this.version = version;
    }
    
    public Long Gender.getGenderId() {
        return this.genderId;
    }
    
    public void Gender.setGenderId(Long genderId) {
        this.genderId = genderId;
    }
    
    public String Gender.getName() {
        return this.name;
    }
    
    public void Gender.setName(String name) {
        this.name = name;
    }
    
}
