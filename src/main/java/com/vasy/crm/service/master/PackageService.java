package com.vasy.crm.service.master;

import java.util.ArrayList;

import com.vasy.crm.model.master.Package;

public interface PackageService {

    ArrayList<Package> getPackage();

    void deletePackage(long id);

    Package addPAckage(Package p);

    Package getPackageById(long id);
}
