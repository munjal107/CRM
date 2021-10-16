
package com.vasy.crm.model.support;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.vasy.crm.model.Auditable;
import com.vasy.crm.model.lead.Lead;
import com.vasy.crm.model.login.UserLogin;

@Entity

@Table(name = "support_tbl")
public class Support extends Auditable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "support_id")
    long id;

    @ManyToOne
    @JoinColumn(name = "lead_id")
    Lead lead;

    @ManyToOne
    @JoinColumn(name = "assigned_to")
    UserLogin userObj;

    String caseModule;
    String caseSubModule;
    String caseChannel;
    String caseType;
    String caseClassification;
    String caseRemarks;
    String casePriority;
    String caseStatus;

    @Temporal(TemporalType.DATE)
    Date issueDate;


    public Date getIssueDate() {
        return issueDate;
    }

    public void setIssueDate(Date issueDate) {
        this.issueDate = issueDate;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public UserLogin getUserObj() {
        return userObj;
    }

    public void setUserObj(UserLogin userObj) {
        this.userObj = userObj;
    }

    public Lead getLead() {
        return lead;
    }

    public void setLead(Lead lead) {
        this.lead = lead;
    }

    public String getCasePriority() {
        return casePriority;
    }

    public void setCasePriority(String casePriority) {
        this.casePriority = casePriority;
    }

    public String getCaseModule() {
        return caseModule;
    }

    public void setCaseModule(String caseModule) {
        this.caseModule = caseModule;
    }

    public String getCaseSubModule() {
        return caseSubModule;
    }

    public void setCaseSubModule(String caseSubModule) {
        this.caseSubModule = caseSubModule;
    }

    public String getCaseChannel() {
        return caseChannel;
    }

    public void setCaseChannel(String caseChannel) {
        this.caseChannel = caseChannel;
    }

    public String getCaseType() {
        return caseType;
    }

    public void setCaseType(String caseType) {
        this.caseType = caseType;
    }

    public String getCaseClassification() {
        return caseClassification;
    }

    public void setCaseClassification(String caseClassification) {
        this.caseClassification = caseClassification;
    }

    public String getCaseRemarks() {
        return caseRemarks;
    }

    public void setCaseRemarks(String caseRemarks) {
        this.caseRemarks = caseRemarks;
    }

    public String getCaseStatus() {
        return caseStatus;
    }

    public void setCaseStatus(String caseStatus) {
        this.caseStatus = caseStatus;
    }


}
