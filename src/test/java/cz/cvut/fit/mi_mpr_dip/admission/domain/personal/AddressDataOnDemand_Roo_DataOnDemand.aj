// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.cvut.fit.mi_mpr_dip.admission.domain.personal;

import cz.cvut.fit.mi_mpr_dip.admission.domain.personal.Address;
import cz.cvut.fit.mi_mpr_dip.admission.domain.personal.AddressDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect AddressDataOnDemand_Roo_DataOnDemand {
    
    declare @type: AddressDataOnDemand: @Component;
    
    private Random AddressDataOnDemand.rnd = new SecureRandom();
    
    private List<Address> AddressDataOnDemand.data;
    
    public Address AddressDataOnDemand.getNewTransientAddress(int index) {
        Address obj = new Address();
        return obj;
    }
    
    public Address AddressDataOnDemand.getSpecificAddress(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Address obj = data.get(index);
        Long id = obj.getId();
        return Address.findAddress(id);
    }
    
    public Address AddressDataOnDemand.getRandomAddress() {
        init();
        Address obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Address.findAddress(id);
    }
    
    public boolean AddressDataOnDemand.modifyAddress(Address obj) {
        return false;
    }
    
    public void AddressDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Address.findAddressEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Address' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Address>();
        for (int i = 0; i < 10; i++) {
            Address obj = getNewTransientAddress(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
