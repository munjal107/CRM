package com.vasy.crm.repo.master;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vasy.crm.model.master.Outcome;

public interface OutcomeRepo extends JpaRepository<Outcome, Long> {
    ArrayList<Outcome> findByIsDeleted(boolean b);
}
