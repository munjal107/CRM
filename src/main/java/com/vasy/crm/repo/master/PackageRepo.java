package com.vasy.crm.repo.master;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.vasy.crm.model.master.Package;

@Repository
public interface PackageRepo extends JpaRepository<Package, Long> {

    ArrayList<Package> findByIsDeleted(boolean b);

}
