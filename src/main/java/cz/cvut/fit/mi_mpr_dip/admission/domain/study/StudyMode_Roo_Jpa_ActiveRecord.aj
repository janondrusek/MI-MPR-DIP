// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.cvut.fit.mi_mpr_dip.admission.domain.study;

import cz.cvut.fit.mi_mpr_dip.admission.domain.study.StudyMode;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect StudyMode_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager StudyMode.entityManager;
    
    public static final EntityManager StudyMode.entityManager() {
        EntityManager em = new StudyMode().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long StudyMode.countStudyModes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM StudyMode o", Long.class).getSingleResult();
    }
    
    public static List<StudyMode> StudyMode.findAllStudyModes() {
        return entityManager().createQuery("SELECT o FROM StudyMode o", StudyMode.class).getResultList();
    }
    
    public static StudyMode StudyMode.findStudyMode(Long id) {
        if (id == null) return null;
        return entityManager().find(StudyMode.class, id);
    }
    
    public static List<StudyMode> StudyMode.findStudyModeEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM StudyMode o", StudyMode.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void StudyMode.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void StudyMode.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            StudyMode attached = StudyMode.findStudyMode(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void StudyMode.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void StudyMode.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public StudyMode StudyMode.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        StudyMode merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
