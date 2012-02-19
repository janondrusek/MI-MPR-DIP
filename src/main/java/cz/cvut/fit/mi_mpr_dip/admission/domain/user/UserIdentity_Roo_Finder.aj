// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.cvut.fit.mi_mpr_dip.admission.domain.user;

import cz.cvut.fit.mi_mpr_dip.admission.domain.user.UserIdentity;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect UserIdentity_Roo_Finder {
    
    public static TypedQuery<UserIdentity> UserIdentity.findUserIdentitysByUsernameEquals(String username) {
        if (username == null || username.length() == 0) throw new IllegalArgumentException("The username argument is required");
        EntityManager em = UserIdentity.entityManager();
        TypedQuery<UserIdentity> q = em.createQuery("SELECT o FROM UserIdentity AS o WHERE o.username = :username", UserIdentity.class);
        q.setParameter("username", username);
        return q;
    }
    
}
