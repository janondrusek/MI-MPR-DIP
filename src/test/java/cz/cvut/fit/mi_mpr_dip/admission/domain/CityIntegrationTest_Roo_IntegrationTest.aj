// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.cvut.fit.mi_mpr_dip.admission.domain;

import cz.cvut.fit.mi_mpr_dip.admission.domain.City;
import cz.cvut.fit.mi_mpr_dip.admission.domain.CityDataOnDemand;
import cz.cvut.fit.mi_mpr_dip.admission.domain.CityIntegrationTest;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CityIntegrationTest_Roo_IntegrationTest {
    
    declare @type: CityIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: CityIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: CityIntegrationTest: @Transactional;
    
    @Autowired
    private CityDataOnDemand CityIntegrationTest.dod;
    
    @Test
    public void CityIntegrationTest.testCountCitys() {
        Assert.assertNotNull("Data on demand for 'City' failed to initialize correctly", dod.getRandomCity());
        long count = City.countCitys();
        Assert.assertTrue("Counter for 'City' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void CityIntegrationTest.testFindCity() {
        City obj = dod.getRandomCity();
        Assert.assertNotNull("Data on demand for 'City' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'City' failed to provide an identifier", id);
        obj = City.findCity(id);
        Assert.assertNotNull("Find method for 'City' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'City' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void CityIntegrationTest.testFindAllCitys() {
        Assert.assertNotNull("Data on demand for 'City' failed to initialize correctly", dod.getRandomCity());
        long count = City.countCitys();
        Assert.assertTrue("Too expensive to perform a find all test for 'City', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<City> result = City.findAllCitys();
        Assert.assertNotNull("Find all method for 'City' illegally returned null", result);
        Assert.assertTrue("Find all method for 'City' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void CityIntegrationTest.testFindCityEntries() {
        Assert.assertNotNull("Data on demand for 'City' failed to initialize correctly", dod.getRandomCity());
        long count = City.countCitys();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<City> result = City.findCityEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'City' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'City' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void CityIntegrationTest.testFlush() {
        City obj = dod.getRandomCity();
        Assert.assertNotNull("Data on demand for 'City' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'City' failed to provide an identifier", id);
        obj = City.findCity(id);
        Assert.assertNotNull("Find method for 'City' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyCity(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'City' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void CityIntegrationTest.testMergeUpdate() {
        City obj = dod.getRandomCity();
        Assert.assertNotNull("Data on demand for 'City' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'City' failed to provide an identifier", id);
        obj = City.findCity(id);
        boolean modified =  dod.modifyCity(obj);
        Integer currentVersion = obj.getVersion();
        City merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'City' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void CityIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'City' failed to initialize correctly", dod.getRandomCity());
        City obj = dod.getNewTransientCity(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'City' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'City' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'City' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void CityIntegrationTest.testRemove() {
        City obj = dod.getRandomCity();
        Assert.assertNotNull("Data on demand for 'City' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'City' failed to provide an identifier", id);
        obj = City.findCity(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'City' with identifier '" + id + "'", City.findCity(id));
    }
    
}
