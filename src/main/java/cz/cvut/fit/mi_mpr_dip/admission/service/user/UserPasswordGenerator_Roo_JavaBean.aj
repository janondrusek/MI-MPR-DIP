// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.cvut.fit.mi_mpr_dip.admission.service.user;

import cz.cvut.fit.mi_mpr_dip.admission.service.user.UserPasswordGenerator;
import cz.cvut.fit.mi_mpr_dip.admission.util.StringGenerator;
import org.springframework.security.authentication.encoding.PasswordEncoder;

privileged aspect UserPasswordGenerator_Roo_JavaBean {
    
    public PasswordEncoder UserPasswordGenerator.getPasswordEncoder() {
        return this.passwordEncoder;
    }
    
    public StringGenerator UserPasswordGenerator.getStringGenerator() {
        return this.stringGenerator;
    }
    
    public Integer UserPasswordGenerator.getSaltBeginning() {
        return this.saltBeginning;
    }
    
    public Integer UserPasswordGenerator.getSaltEnd() {
        return this.saltEnd;
    }
    
    public Integer UserPasswordGenerator.getPlaintextBeginning() {
        return this.plaintextBeginning;
    }
    
    public Integer UserPasswordGenerator.getPlaintextEnd() {
        return this.plaintextEnd;
    }
    
}
