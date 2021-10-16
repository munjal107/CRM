package com.vasy.crm.model.master;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "package")
public class Package {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "package_id")
    private long id;

    private String productName;

    private long basicRate;

    private long trialRate;

    private long intermediateRate;

    private long advanceRate;

    private String tax;

    boolean isDeleted;

    public long getBasicRate() {
        return basicRate;
    }

    public void setBasicRate(long basicRate) {
        this.basicRate = basicRate;
    }

    public long getTrialRate() {
        return trialRate;
    }

    public void setTrialRate(long trialRate) {
        this.trialRate = trialRate;
    }

    public long getIntermediateRate() {
        return intermediateRate;
    }

    public void setIntermediateRate(long intermediateRate) {
        this.intermediateRate = intermediateRate;
    }

    public long getAdvanceRate() {
        return advanceRate;
    }

    public void setAdvanceRate(long advanceRate) {
        this.advanceRate = advanceRate;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }


    public String getTax() {
        return tax;
    }

    public void setTax(String tax) {
        this.tax = tax;
    }

    public boolean isDeleted() {
        return isDeleted;
    }

    public void setDeleted(boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

}
