package com.vasy.crm.repo.location;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.vasy.crm.model.location.State;

@Repository
public interface StateRepo extends JpaRepository<State, Long> {

    List<State> findByCountryId(long id);

}
