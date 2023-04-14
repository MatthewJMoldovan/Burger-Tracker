package com.mattmoldovan.burgertracker.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.mattmoldovan.burgertracker.models.Burger;
import com.mattmoldovan.burgertracker.services.BurgerService;

import jakarta.validation.Valid;

@Controller
public class BurgerController {
	
	@Autowired
	private BurgerService burgerService;
	
	@GetMapping("/")
	public String mainPage(Model model) {
		model.addAttribute("burgerList", burgerService.allBurgers());
		model.addAttribute("newBurger", new Burger());
		return "main.jsp";
	}
	
	@PostMapping("/process")
	public String processMainCreate(
			@Valid @ModelAttribute("newBurger")Burger newBurger, BindingResult result, Model model) {
		if(result.hasErrors()) {
			model.addAttribute("burgerList", burgerService.allBurgers());
			return "main.jsp";
		} else {
			burgerService.createBurger(newBurger);
			return"redirect:/";
		}
		
	}
	
	
	
	
	
	
}


