package counter.controllers;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
	public List<Counter> searchDefine(@RequestParam("hopo") String hopo,@RequestParam("flti") String flti,@RequestParam("alc") String alc, @RequestParam("counter") String counter) {
		return counterService.searchCounter(hopo, flti, alc, counter);
	}

	@Transactional
	@GetMapping("counter/remove")
	public void removeCounter(@RequestParam("hopo") String hopo,@RequestParam("flti") String flti,@RequestParam("alc") String alc) {
		counterService.deleteCounter(hopo, flti, alc);
	}
	
	@GetMapping("counter/edit")
	public void editCounter(@RequestParam("hopo") String hopo,@RequestParam("flti") String flti,@RequestParam("alc") String alc, @RequestParam("counter") String counter) {
		counterService.updateCounter(hopo, flti, alc, counter);
	}

	@GetMapping("counter/create")
	public void create(@RequestParam("hopo") String hopo,@RequestParam("flti") String flti,@RequestParam("alc") String alc, @RequestParam("counter") String counter) {
		counterService.createCounter(hopo, flti, alc, counter);
	}
}

@Controller
//@RequestMapping(value = "/")
class Counters {
	@RequestMapping(value = "counter")
	public String indexHome() {
		return "counter";
	}
}