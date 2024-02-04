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

import com.TTSS03.Entity.VenderMaster;
import com.TTSS03.Service.VenderMasterService;

@RestController
@RequestMapping("/api/vender")
public class VenderMasterController {

    @Autowired
    private VenderMasterService vmService;

    @PostMapping("/save")
    public ResponseEntity<VenderMaster> create(@RequestBody VenderMaster venderMaster) {
        try {
            VenderMaster savedVenderMaster = vmService.saveOne(venderMaster);
            return new ResponseEntity<>(savedVenderMaster, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/getbyid/{sl}")
    public ResponseEntity<VenderMaster> getById(@PathVariable("sl") int sl) {
        try {
            Optional<VenderMaster> venderMasterOptional = vmService.getById(sl);
            return venderMasterOptional
                    .map(venderMaster -> ResponseEntity.ok().body(venderMaster))
                    .orElse(ResponseEntity.notFound().build());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }


    @GetMapping("/getall")
    public ResponseEntity<List<VenderMaster>> getAll() {
        try {
        	System.out.println("hi");
            List<VenderMaster> venderMasters = vmService.getAll();
            return new ResponseEntity<>(venderMasters, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/updatebyid/{sl}")
    public ResponseEntity<VenderMaster> update(@PathVariable("sl") int sl, @RequestBody VenderMaster venderMaster) {
        try {
        	System.out.println(sl+""+venderMaster);
            VenderMaster updatedVenderMaster = vmService.update(sl, venderMaster);
            return new ResponseEntity<>(updatedVenderMaster, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @DeleteMapping("/delete/{sl}")
    public ResponseEntity<Void> delete(@PathVariable("sl") int sl) {
        try {
            vmService.delete(sl);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
