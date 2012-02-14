package cz.cvut.fit.mi_mpr_dip.admission.endpoint;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;

import javax.validation.Valid;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Required;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import cz.cvut.fit.mi_mpr_dip.admission.domain.Admission;
import cz.cvut.fit.mi_mpr_dip.admission.service.AdmissionService;
import cz.cvut.fit.mi_mpr_dip.admission.validator.AdmissionValidator;

@Path("/processing")
public class ProcessingServiceImpl implements ProcessingService {

	private AdmissionService admissionService;

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(new AdmissionValidator());
	}

	@Path("/admission/{id}")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@GET
	@Override
	public Admission getAdmission(@PathParam("id") Long id) {
		return Admission.findAdmission(id);
	}

	@Path("/admissions")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@GET
	@Override
	public List<Admission> getAdmissions() {
		return Admission.findAllAdmissions();
	}

	@Path("/admission")
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@PUT
	@Override
	public Response addAdmission(@Valid Admission admission) throws URISyntaxException {
		admissionService.deduplicateAndStore(admission);
		URI uri = new URI(admission.getAdmissionId().toString());
		return Response.created(uri).build();
	}

	@Required
	public void setAdmissionService(AdmissionService admissionService) {
		this.admissionService = admissionService;
	}

}
