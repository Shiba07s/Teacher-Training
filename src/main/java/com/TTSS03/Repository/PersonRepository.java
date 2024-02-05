package com.TTSS03.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.TTSS03.Entity.Person;


public interface PersonRepository extends JpaRepository<Person, Integer> {

}
