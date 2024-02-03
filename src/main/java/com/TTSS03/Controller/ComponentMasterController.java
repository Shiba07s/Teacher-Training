package com.TTSS03.Controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Entity.ComponentMaster;
import com.TTSS03.Service.ComponentMasterService;

@RestController
@RequestMapping("/api/component")
public class ComponentMasterController {
	
	@Autowired
	ComponentMasterService ComponentMasterServ;
	
	@GetMapping("/components")
	public ResponseEntity<List<ComponentMaster>>findAllComponent(){
		List<ComponentMaster> findAll = ComponentMasterServ.findAll();
		
		return ResponseEntity.ok(findAll);
	}
	

    @PostMapping("/savecomponent")
    public ResponseEntity<ComponentMaster> create(@RequestBody ComponentMaster componentMaster) {
        try {
        	System.out.println(componentMaster);
            ComponentMaster savedComponentMaster = ComponentMasterServ.saveone(componentMaster);
            return ResponseEntity.ok(savedComponentMaster);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @GetMapping("/getbyid/{sl}")
    public ResponseEntity<ComponentMaster> getById(@PathVariable("sl") int sl) {
        try {
            Optional<ComponentMaster> componentMasterOptional = ComponentMasterServ.getbyid(sl);
            return componentMasterOptional
                    .map(componentMaster -> ResponseEntity.ok().body(componentMaster))
                    .orElse(ResponseEntity.notFound().build());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @GetMapping("/getall")
    public ResponseEntity<List<ComponentMaster>> getAll() {
        try {
            List<ComponentMaster> componentMasters = ComponentMasterServ.getAll();
            return ResponseEntity.ok(componentMasters);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @PutMapping("/updatebyid/{sl}")
    public ResponseEntity<ComponentMaster> update(@PathVariable("sl") int sl, @RequestBody ComponentMaster componentMaster) {
        try {
        	System.out.println(componentMaster);
            ComponentMaster updatedComponentMaster = ComponentMasterServ.update(sl, componentMaster);
            return ResponseEntity.ok(updatedComponentMaster);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @DeleteMapping("/delete/{sl}")
    public ResponseEntity<Void> delete(@PathVariable("sl") int sl) {
        try {
        	ComponentMasterServ.delete(sl);
            return ResponseEntity.noContent().build();
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

}
