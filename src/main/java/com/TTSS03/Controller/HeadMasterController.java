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

import com.TTSS03.Entity.HeadMaster;
import com.TTSS03.Service.HeadMasterService;

@RestController
@RequestMapping("/api/head")
public class HeadMasterController {

    @Autowired
    private HeadMasterService hmService;

    @PostMapping("/savehead")
    public ResponseEntity<HeadMaster> create(@RequestBody HeadMaster headMaster) {
        try {
            HeadMaster savedHeadMaster = hmService.saveOne(headMaster);
            return ResponseEntity.ok(savedHeadMaster);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @GetMapping("/getbyid/{sl}")
    public ResponseEntity<HeadMaster> getById(@PathVariable("sl") int sl) {
    	System.out.println(sl);
        try {
            Optional<HeadMaster> headMasterOptional = hmService.getById(sl);
            System.out.println(headMasterOptional.get());
            return headMasterOptional
                    .map(headMaster -> ResponseEntity.ok().body(headMaster))
                    .orElse(ResponseEntity.notFound().build());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @GetMapping("/getall")
    public ResponseEntity<List<HeadMaster>> getAll() {
        try {
            List<HeadMaster> headMasters = hmService.getAll();
            return ResponseEntity.ok(headMasters);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @PutMapping("/update/{sl}")
    public ResponseEntity<String> update(@PathVariable("sl") int sl, @RequestBody HeadMaster headMaster) {
        try {
            HeadMaster updatedHeadMaster = hmService.update(sl, headMaster);
            return ResponseEntity.ok("ok");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @DeleteMapping("/delete/{sl}")
    public ResponseEntity<Void> delete(@PathVariable("sl") int sl) {
        try {
            hmService.delete(sl);
            return ResponseEntity.noContent().build();
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
}
