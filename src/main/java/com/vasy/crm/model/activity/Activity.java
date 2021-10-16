package com.vasy.crm.model.activity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.vasy.crm.model.Auditable;
import com.vasy.crm.model.lead.Lead;
import com.vasy.crm.model.login.UserLogin;
import com.vasy.crm.model.master.ActivityList;
import com.vasy.crm.model.master.Outcome;

@Entity
public class Activity extends Auditable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    long id;

    @ManyToOne
    @JoinColumn(name = "lead_id")
    Lead lead;

    @OneToOne
    ActivityList al;

    @OneToOne
    Outcome outcome;

    String actvityTitle;

    @Temporal(TemporalType.DATE)
    Date dueDate;

    @Temporal(TemporalType.TIME)
    Date dueTime;

    @OneToOne
    @JoinColumn(name = "user_id")
    UserLogin userObj;

    String description;

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

    public ActivityList getAl() {
        return al;
    }

    public void setAl(ActivityList al) {
        this.al = al;
    }

    public Outcome getOutcome() {
        return outcome;
    }

    public void setOutcome(Outcome outcome) {
        this.outcome = outcome;
    }

    public String getActvityTitle() {
        return actvityTitle;
    }

    public void setActvityTitle(String actvityTitle) {
        this.actvityTitle = actvityTitle;
    }

    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    public Date getDueTime() {
        return dueTime;
    }

    public void setDueTime(Date dueTime) {
        this.dueTime = dueTime;
    }

    public UserLogin getUserObj() {
        return userObj;
    }

    public void setUserObj(UserLogin userObj) {
        this.userObj = userObj;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    @Override
    public String toString() {
        return "Activity{" +
                "id=" + id +
                ", lead=" + lead +
                ", userObj=" + userObj +
                '}';
    }
}
