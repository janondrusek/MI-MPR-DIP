// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.cvut.fit.mi_mpr_dip.admission.domain;

import cz.cvut.fit.mi_mpr_dip.admission.domain.UserRoleDataOnDemand;
import cz.cvut.fit.mi_mpr_dip.admission.domain.UserRoleIntegrationTest;
import cz.cvut.fit.mi_mpr_dip.admission.domain.user.UserRole;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserRoleIntegrationTest_Roo_IntegrationTest {
    
    declare @type: UserRoleIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: UserRoleIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: UserRoleIntegrationTest: @Transactional;
    
    @Autowired
    private UserRoleDataOnDemand UserRoleIntegrationTest.dod;
    
    @Test
    public void UserRoleIntegrationTest.testCountUserRoles() {
        Assert.assertNotNull("Data on demand for 'UserRole' failed to initialize correctly", dod.getRandomUserRole());
        long count = UserRole.countUserRoles();
        Assert.assertTrue("Counter for 'UserRole' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void UserRoleIntegrationTest.testFindUserRole() {
        UserRole obj = dod.getRandomUserRole();
        Assert.assertNotNull("Data on demand for 'UserRole' failed to initialize correctly", obj);
        Long id = obj.getUserRoleId();
        Assert.assertNotNull("Data on demand for 'UserRole' failed to provide an identifier", id);
        obj = UserRole.findUserRole(id);
        Assert.assertNotNull("Find method for 'UserRole' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'UserRole' returned the incorrect identifier", id, obj.getUserRoleId());
    }
    
    @Test
    public void UserRoleIntegrationTest.testFindAllUserRoles() {
        Assert.assertNotNull("Data on demand for 'UserRole' failed to initialize correctly", dod.getRandomUserRole());
        long count = UserRole.countUserRoles();
        Assert.assertTrue("Too expensive to perform a find all test for 'UserRole', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<UserRole> result = UserRole.findAllUserRoles();
        Assert.assertNotNull("Find all method for 'UserRole' illegally returned null", result);
        Assert.assertTrue("Find all method for 'UserRole' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void UserRoleIntegrationTest.testFindUserRoleEntries() {
        Assert.assertNotNull("Data on demand for 'UserRole' failed to initialize correctly", dod.getRandomUserRole());
        long count = UserRole.countUserRoles();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<UserRole> result = UserRole.findUserRoleEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'UserRole' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'UserRole' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void UserRoleIntegrationTest.testFlush() {
        UserRole obj = dod.getRandomUserRole();
        Assert.assertNotNull("Data on demand for 'UserRole' failed to initialize correctly", obj);
        Long id = obj.getUserRoleId();
        Assert.assertNotNull("Data on demand for 'UserRole' failed to provide an identifier", id);
        obj = UserRole.findUserRole(id);
        Assert.assertNotNull("Find method for 'UserRole' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyUserRole(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'UserRole' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void UserRoleIntegrationTest.testMergeUpdate() {
        UserRole obj = dod.getRandomUserRole();
        Assert.assertNotNull("Data on demand for 'UserRole' failed to initialize correctly", obj);
        Long id = obj.getUserRoleId();
        Assert.assertNotNull("Data on demand for 'UserRole' failed to provide an identifier", id);
        obj = UserRole.findUserRole(id);
        boolean modified =  dod.modifyUserRole(obj);
        Integer currentVersion = obj.getVersion();
        UserRole merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getUserRoleId(), id);
        Assert.assertTrue("Version for 'UserRole' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void UserRoleIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'UserRole' failed to initialize correctly", dod.getRandomUserRole());
        UserRole obj = dod.getNewTransientUserRole(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'UserRole' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'UserRole' identifier to be null", obj.getUserRoleId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'UserRole' identifier to no longer be null", obj.getUserRoleId());
    }
    
    @Test
    public void UserRoleIntegrationTest.testRemove() {
        UserRole obj = dod.getRandomUserRole();
        Assert.assertNotNull("Data on demand for 'UserRole' failed to initialize correctly", obj);
        Long id = obj.getUserRoleId();
        Assert.assertNotNull("Data on demand for 'UserRole' failed to provide an identifier", id);
        obj = UserRole.findUserRole(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'UserRole' with identifier '" + id + "'", UserRole.findUserRole(id));
    }
    
}
