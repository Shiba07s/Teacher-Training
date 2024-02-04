package com.TTSS03.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "bdg_compontresource_limit")
public class ComponentMasterLimit {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long sl;

    @Column(name = "budgeted_year")
    private String budgetedYear;

    @Column(name = "resources")
    private String resources;

    @Column(name = "resource_type")
    private String resourceType;

    @Column(name = "city_type")
    private String cityType;

    @Column(name = "approved_rate")
    private Double approvedRate;

    @Column(name = "unit")
    private String unit;

    @Column(name = "remarks")
    private String remarks;

  

    @Column(name = "record_status")
    private String recordStatus;


}
