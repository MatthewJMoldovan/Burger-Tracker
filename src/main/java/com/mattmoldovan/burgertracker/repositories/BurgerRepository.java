package com.mattmoldovan.burgertracker.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.mattmoldovan.burgertracker.models.Burger;

public interface BurgerRepository extends CrudRepository<Burger, Long> {
	List<Burger> findAll();

}
