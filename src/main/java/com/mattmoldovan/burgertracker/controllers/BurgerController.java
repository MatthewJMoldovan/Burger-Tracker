package com.mattmoldovan.burgertracker.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

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
	public String processMainCreate(@Valid @ModelAttribute("newBurger") Burger newBurger, BindingResult result,
			Model model) {
		if (result.hasErrors()) {
			model.addAttribute("burgerList", burgerService.allBurgers());
			return "main.jsp";
		} else {
			burgerService.createBurger(newBurger);
			return "redirect:/";
		}

	}

	@GetMapping("/burgers/{id}")
	public String displayOneBurger(@PathVariable("id") Long id, Model model) {
		Burger oneBurger = burgerService.findBurger(id);
		model.addAttribute("oneBurger", oneBurger);
		return "oneBurger.jsp";
	}

	@GetMapping("/burgers/edit/{id}")
	public String editOneBurger(@PathVariable("id") Long id, Model model) {
		Burger oneBurger = burgerService.findBurger(id);
		model.addAttribute("oneBurger", oneBurger);
		return "editBurger.jsp";
	}

	@PutMapping("/process/edit/{id}")
	public String processEdit(@Valid @ModelAttribute("oneBurger") Burger oneBurger, BindingResult result,
			@PathVariable("id") Long id, Model model) {

		if (result.hasErrors()) {
			return "editBurger.jsp";
		} else {
			burgerService.updateBurger(oneBurger);
			return "redirect:/burgers/{id}";
		}
	}

	@DeleteMapping("/burgers/{id}")
	public String deleteBurger(@PathVariable("id") Long id) {
		burgerService.removeBurger(id);
		return "redirect:/";
	}
}
