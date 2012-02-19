// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.cvut.fit.mi_mpr_dip.admission.domain;

import cz.cvut.fit.mi_mpr_dip.admission.domain.UserIdentityDataOnDemand;
import cz.cvut.fit.mi_mpr_dip.admission.domain.UserIdentityIntegrationTest;
import cz.cvut.fit.mi_mpr_dip.admission.domain.user.UserIdentity;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserIdentityIntegrationTest_Roo_IntegrationTest {
    
    declare @type: UserIdentityIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: UserIdentityIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: UserIdentityIntegrationTest: @Transactional;
    
    @Autowired
    private UserIdentityDataOnDemand UserIdentityIntegrationTest.dod;
    
    @Test
    public void UserIdentityIntegrationTest.testCountUserIdentitys() {
        Assert.assertNotNull("Data on demand for 'UserIdentity' failed to initialize correctly", dod.getRandomUserIdentity());
        long count = UserIdentity.countUserIdentitys();
        Assert.assertTrue("Counter for 'UserIdentity' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void UserIdentityIntegrationTest.testFindUserIdentity() {
        UserIdentity obj = dod.getRandomUserIdentity();
        Assert.assertNotNull("Data on demand for 'UserIdentity' failed to initialize correctly", obj);
        Long id = obj.getUserIdentityId();
        Assert.assertNotNull("Data on demand for 'UserIdentity' failed to provide an identifier", id);
        obj = UserIdentity.findUserIdentity(id);
        Assert.assertNotNull("Find method for 'UserIdentity' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'UserIdentity' returned the incorrect identifier", id, obj.getUserIdentityId());
    }
    
    @Test
    public void UserIdentityIntegrationTest.testFindAllUserIdentitys() {
        Assert.assertNotNull("Data on demand for 'UserIdentity' failed to initialize correctly", dod.getRandomUserIdentity());
        long count = UserIdentity.countUserIdentitys();
        Assert.assertTrue("Too expensive to perform a find all test for 'UserIdentity', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<UserIdentity> result = UserIdentity.findAllUserIdentitys();
        Assert.assertNotNull("Find all method for 'UserIdentity' illegally returned null", result);
        Assert.assertTrue("Find all method for 'UserIdentity' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void UserIdentityIntegrationTest.testFindUserIdentityEntries() {
        Assert.assertNotNull("Data on demand for 'UserIdentity' failed to initialize correctly", dod.getRandomUserIdentity());
        long count = UserIdentity.countUserIdentitys();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<UserIdentity> result = UserIdentity.findUserIdentityEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'UserIdentity' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'UserIdentity' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void UserIdentityIntegrationTest.testFlush() {
        UserIdentity obj = dod.getRandomUserIdentity();
        Assert.assertNotNull("Data on demand for 'UserIdentity' failed to initialize correctly", obj);
        Long id = obj.getUserIdentityId();
        Assert.assertNotNull("Data on demand for 'UserIdentity' failed to provide an identifier", id);
        obj = UserIdentity.findUserIdentity(id);
        Assert.assertNotNull("Find method for 'UserIdentity' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyUserIdentity(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'UserIdentity' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void UserIdentityIntegrationTest.testMergeUpdate() {
        UserIdentity obj = dod.getRandomUserIdentity();
        Assert.assertNotNull("Data on demand for 'UserIdentity' failed to initialize correctly", obj);
        Long id = obj.getUserIdentityId();
        Assert.assertNotNull("Data on demand for 'UserIdentity' failed to provide an identifier", id);
        obj = UserIdentity.findUserIdentity(id);
        boolean modified =  dod.modifyUserIdentity(obj);
        Integer currentVersion = obj.getVersion();
        UserIdentity merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getUserIdentityId(), id);
        Assert.assertTrue("Version for 'UserIdentity' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void UserIdentityIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'UserIdentity' failed to initialize correctly", dod.getRandomUserIdentity());
        UserIdentity obj = dod.getNewTransientUserIdentity(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'UserIdentity' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'UserIdentity' identifier to be null", obj.getUserIdentityId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'UserIdentity' identifier to no longer be null", obj.getUserIdentityId());
    }
    
    @Test
    public void UserIdentityIntegrationTest.testRemove() {
        UserIdentity obj = dod.getRandomUserIdentity();
        Assert.assertNotNull("Data on demand for 'UserIdentity' failed to initialize correctly", obj);
        Long id = obj.getUserIdentityId();
        Assert.assertNotNull("Data on demand for 'UserIdentity' failed to provide an identifier", id);
        obj = UserIdentity.findUserIdentity(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'UserIdentity' with identifier '" + id + "'", UserIdentity.findUserIdentity(id));
    }
    
}
