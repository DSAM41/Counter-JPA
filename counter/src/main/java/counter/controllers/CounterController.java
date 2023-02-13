package counter.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import counter.model.Counter;
import counter.service.CounterService;

/**
 * HomeController
 */
@RestController
//@RequestMapping("/")
public class CounterController {

	@Autowired
	private CounterService counterService;

	@GetMapping("counter/all")
	public List<Counter> showAll() {
		return counterService.getCounter();
	}

	@GetMapping("counter/search")
	public List<Counter> searchDefine(@RequestParam("hopo") String hopo, @RequestParam("flti") String flti,
			@RequestParam("alc") String alc, @RequestParam("counter") String counter) {
		return counterService.searchCounter(hopo, flti, alc, counter);
	}

	@DeleteMapping("counter/remove")
	public void removeCounter(@RequestBody Counter model) {
		counterService.deleteCounter(model);
	}

	@PutMapping("counter/edit")
	public Counter addExample(@RequestBody Counter model) {
		return counterService.updateCounter(model);
	}

	@PostMapping("counter/create")
	public Counter create(@RequestBody Counter model) {
		return counterService.createCounter(model);
	}
//	@PostMapping("counter/create")
//	public Counter create(@RequestBody Counter model) {
//		return counterService.createCounter(model);
//	}
}

@Controller
//@RequestMapping(value = "/")
class Counters {
	@RequestMapping(value = "counter")
	public String indexHome() {
		return "counter";
	}
}