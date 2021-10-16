package com.vasy.crm.repo.location;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.vasy.crm.model.location.Country;


@Repository
public interface CountryRepo extends JpaRepository<Country, Long> {

}
