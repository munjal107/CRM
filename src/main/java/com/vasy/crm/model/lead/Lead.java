package com.vasy.crm.model.lead;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.vasy.crm.model.Auditable;
import com.vasy.crm.model.location.City;
import com.vasy.crm.model.location.Country;
import com.vasy.crm.model.location.State;
import com.vasy.crm.model.master.BusinessCategory;
import com.vasy.crm.model.master.LeadSource;

@Entity
@Table(name = "leads")
public class Lead extends Auditable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "lead_id")
    long id;

    @ManyToOne
    @JoinColumn(name = "leadsource_id")
    LeadSource ls;

    @ManyToOne
    @JoinColumn(name = "buscat_id")
    BusinessCategory bs;

    String corporateName;

    String customerName;

    String mobileNo;

    String email;

    String address;

    String noOfEmployees;

    String packages;

    String turnover;

    String remarks;

    @ManyToOne
    @JoinColumn(name = "country_id")
    Country country;

    @ManyToOne
    @JoinColumn(name = "state_id")
    State state;

    @ManyToOne
    @JoinColumn(name = "city_id")
    City city;


    boolean isDeleted;

    boolean isCustomer;


    @Column(columnDefinition = " varchar(250) default 'open'")
    String leadStatus = "open";

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public LeadSource getLs() {
        return ls;
    }

    public void setLs(LeadSource ls) {
        this.ls = ls;
    }

    public BusinessCategory getBs() {
        return bs;
    }

    public void setBs(BusinessCategory bs) {
        this.bs = bs;
    }

    public String getCorporateName() {
        return corporateName;
    }

    public void setCorporateName(String corporateName) {
        this.corporateName = corporateName;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getMobileNo() {
        return mobileNo;
    }

    public void setMobileNo(String mobileNo) {
        this.mobileNo = mobileNo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNoOfEmployees() {
        return noOfEmployees;
    }

    public void setNoOfEmployees(String noOfEmployees) {
        this.noOfEmployees = noOfEmployees;
    }

    public String getPackages() {
        return packages;
    }

    public void setPackages(String packages) {
        this.packages = packages;
    }

    public String getTurnover() {
        return turnover;
    }

    public void setTurnover(String turnover) {
        this.turnover = turnover;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }


    public Country getCountry() {
        return country;
    }

    public void setCountry(Country country) {
        this.country = country;
    }

    public State getState() {
        return state;
    }

    public void setState(State state) {
        this.state = state;
    }

    public City getCity() {
        return city;
    }

    public void setCity(City city) {
        this.city = city;
    }

    public boolean isDeleted() {
        return isDeleted;
    }

    public void setDeleted(boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

    public String getLeadStatus() {
        return leadStatus;
    }

    public void setLeadStatus(String leadStatus) {
        this.leadStatus = leadStatus;
    }

    public boolean isCustomer() {
        return isCustomer;
    }

    public void setCustomer(boolean isCustomer) {
        this.isCustomer = isCustomer;
    }

    @Override
    public String toString() {
        return "Lead{" +
                "id=" + id +
                '}';
    }
}
