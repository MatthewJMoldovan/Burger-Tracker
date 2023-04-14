package com.mattmoldovan.burgertracker.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mattmoldovan.burgertracker.models.Burger;
import com.mattmoldovan.burgertracker.repositories.BurgerRepository;

@Service
public class BurgerService {

	@Autowired
	private BurgerRepository burgerRepo;

	public List<Burger> allBurgers() {
		return burgerRepo.findAll();
	}

	public Burger createBurger(Burger newBurger) {
		return burgerRepo.save(newBurger);
	}

	public Burger findBurger(Long id) {
		Optional<Burger> optionalBurger = burgerRepo.findById(id);
		if (optionalBurger.isPresent()) {
			return optionalBurger.get();
		}
		return null;
	}

	public void removeBurger(Long id) {
		burgerRepo.deleteById(id);
	}

	public Burger updateBurger(Burger oneBurger) {
		return burgerRepo.save(oneBurger);
	}

}
