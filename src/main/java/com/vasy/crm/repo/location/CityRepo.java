package com.vasy.crm.repo.location;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.vasy.crm.model.location.City;


@Repository
public interface CityRepo extends JpaRepository<City, Long> {

    List<City> findByStateId(Long id);

}
