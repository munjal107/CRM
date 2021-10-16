package com.vasy.crm.model.estimate;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.vasy.crm.model.Auditable;
import com.vasy.crm.model.lead.Lead;
import com.vasy.crm.model.master.Package;

@Entity
@Table(name = "estimate_tbl")
public class Estimate extends Auditable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "estimate_id")
    long id;

    @ManyToOne
    @JoinColumn(name = "lead_id")
    Lead lead;

    @Temporal(TemporalType.DATE)
    Date dueDate;

    long estimateNo;

    String packageName;

    String TnC;

    String Remarks;

    String packageAmount;


    float totalAmount;

    @ManyToMany(fetch = FetchType.EAGER)
    private List<Package> invoicePackages;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Lead getLead() {
        return lead;
    }

    public void setLead(Lead lead) {
        this.lead = lead;
    }

    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    public long getEstimateNo() {
        return estimateNo;
    }

    public void setEstimateNo(long estimateNo) {
        this.estimateNo = estimateNo;
    }

    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    public String getTnC() {
        return TnC;
    }

    public void setTnC(String tnC) {
        TnC = tnC;
    }

    public String getRemarks() {
        return Remarks;
    }

    public void setRemarks(String remarks) {
        Remarks = remarks;
    }

    public float getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(float totalAmount) {
        this.totalAmount = totalAmount;
    }

    public List<Package> getInvoicePackages() {
        return invoicePackages;
    }

    public void setInvoicePackages(List<Package> invoicePackages) {
        this.invoicePackages = invoicePackages;
    }

    public String getPackageAmount() {
        return packageAmount;
    }

    public void setPackageAmount(String packageAmount) {
        this.packageAmount = packageAmount;
    }


}
