package cz.cvut.fit.mi_mpr_dip.admission.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cz.cvut.fit.mi_mpr_dip.admission.domain.Admission;
import cz.cvut.fit.mi_mpr_dip.admission.domain.City;
import cz.cvut.fit.mi_mpr_dip.admission.domain.Country;
import cz.cvut.fit.mi_mpr_dip.admission.domain.personal.Gender;
import cz.cvut.fit.mi_mpr_dip.admission.domain.personal.MaritalStatus;
import cz.cvut.fit.mi_mpr_dip.admission.domain.personal.Person;
import cz.cvut.fit.mi_mpr_dip.admission.domain.study.Degree;
import cz.cvut.fit.mi_mpr_dip.admission.domain.study.Faculty;
import cz.cvut.fit.mi_mpr_dip.admission.domain.study.Programme;
import cz.cvut.fit.mi_mpr_dip.admission.domain.study.StudyMode;

@Service
public class AdmissionServiceImpl implements AdmissionService {

	@Override
	@Transactional
	public void deduplicateAndStore(Admission admission) {
		deduplicateDegree(admission);
		deduplicateFaculty(admission);
		deduplicatePerson(admission.getPerson());
		deduplicateProgramme(admission);
		deduplicateStudyMode(admission);

		admission.persist();
	}

	private void deduplicateDegree(Admission admission) {
		List<Degree> degrees = Degree.findDegreesByNameEquals(admission.getDegree().getName()).getResultList();
		if (degrees.size() > 0) {
			admission.setDegree(degrees.get(0));
		}
	}

	private void deduplicateFaculty(Admission admission) {
		List<Faculty> faculties = Faculty.findFacultysByNameEquals(admission.getFaculty().getName()).getResultList();
		if (faculties.size() > 0) {
			admission.setFaculty(faculties.get(0));
		}
	}

	private void deduplicatePerson(Person person) {
		deduplicateCity(person);
		deduplicateCountries(person);
		deduplicateDocuments(person);
		deduplicateGender(person);
		deduplicateMaritalStatus(person);
	}

	private void deduplicateCity(Person person) {
		List<City> cities = City.findCitysByNameEquals(person.getCityOfBirth().getName()).getResultList();
		if (cities.size() > 0) {
			person.setCityOfBirth(cities.get(0));
		}
	}

	private void deduplicateCountries(Person person) {
		if (person.getCountryOfBirth().equals(person.getCitizenship())) {
			deduplicateEqualCountries(person);
		} else {
			deduplicateNonEqualCountries(person);
		}
	}

	private void deduplicateEqualCountries(Person person) {
		List<Country> countries = Country.findCountrysByNameEquals(person.getCountryOfBirth().getName())
				.getResultList();
		if (countries.size() > 0) {
			setCountries(person, countries.get(0));
		} else {
			Country country = person.getCitizenship();
			country.persist();
			setCountries(person, country);
		}
	}

	private void deduplicateNonEqualCountries(Person person) {
		Country citizenship = person.getCitizenship();
		Country countryOfBirth = person.getCountryOfBirth();
		List<Country> citizenships = Country.findCountrysByNameEquals(person.getCitizenship().getName())
				.getResultList();
		if (citizenships.size() > 0) {
			citizenship = citizenships.get(0);
		}

		List<Country> countriesOfBirth = Country.findCountrysByNameEquals(person.getCountryOfBirth().getName())
				.getResultList();
		if (countriesOfBirth.size() > 0) {
			countryOfBirth = countriesOfBirth.get(0);
		}

		setCountries(person, citizenship, countryOfBirth);
	}

	private void setCountries(Person person, Country country) {
		setCountries(person, country, country);
	}

	private void setCountries(Person person, Country citizenship, Country countryOfBirth) {
		person.setCitizenship(citizenship);
		person.setCountryOfBirth(countryOfBirth);
	}

	private void deduplicateDocuments(Person person) {

	}

	private void deduplicateGender(Person person) {
		List<Gender> genders = Gender.findGendersByNameEquals(person.getGender().getName()).getResultList();
		if (genders.size() > 0) {
			person.setGender(genders.get(0));
		}
	}

	private void deduplicateMaritalStatus(Person person) {
		List<MaritalStatus> maritalStatuses = MaritalStatus.findMaritalStatusesByNameEquals(
				person.getMaritalStatus().getName()).getResultList();
		if (maritalStatuses.size() > 0) {
			person.setMaritalStatus(maritalStatuses.get(0));
		}
	}

	private void deduplicateProgramme(Admission admission) {
		List<Programme> programmes = Programme.findProgrammesByNameEquals(admission.getProgramme().getName())
				.getResultList();
		if (programmes.size() > 0) {
			admission.setProgramme(programmes.get(0));
		}
	}

	private void deduplicateStudyMode(Admission admission) {
		List<StudyMode> studyModes = StudyMode.findStudyModesByNameEquals(admission.getStudyMode().getName())
				.getResultList();
		if (studyModes.size() > 0) {
			admission.setStudyMode(studyModes.get(0));
		}
	}

}
