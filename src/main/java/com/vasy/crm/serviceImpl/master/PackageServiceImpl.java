package com.vasy.crm.serviceImpl.master;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vasy.crm.model.master.Package;
import com.vasy.crm.repo.master.PackageRepo;
import com.vasy.crm.service.master.PackageService;

@Service
public class PackageServiceImpl implements PackageService {

    @Autowired
    PackageRepo packageRepo;

    @Override
    public ArrayList<Package> getPackage() {
        // TODO Auto-generated method stub
        return packageRepo.findByIsDeleted(false);
    }

    @Override
    public void deletePackage(long id) {
        // TODO Auto-generated method stub
        Package p = packageRepo.findById(id).orElse(null);
        p.setDeleted(true);
        packageRepo.save(p);


    }

    @Override
    public Package addPAckage(Package p) {
        // TODO Auto-generated method stub
        return packageRepo.save(p);
    }

    @Override
    public Package getPackageById(long id) {
        // TODO Auto-generated method stub
        return packageRepo.findById(id).orElse(null);
    }

}
