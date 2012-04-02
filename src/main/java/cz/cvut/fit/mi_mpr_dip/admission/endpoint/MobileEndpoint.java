package cz.cvut.fit.mi_mpr_dip.admission.endpoint;

import java.net.URISyntaxException;

import javax.ws.rs.core.Response;

import cz.cvut.fit.mi_mpr_dip.admission.domain.AdmissionResult;
import cz.cvut.fit.mi_mpr_dip.admission.domain.Appendix;

public interface MobileEndpoint {

	public Response getUserIdentity();

	public Response getAdmission(String admissionCode);

	public Response saveResult(String admissionCode, AdmissionResult result) throws URISyntaxException;

	public Response savePhoto(String admissionCode, Appendix photo) throws URISyntaxException;

}
