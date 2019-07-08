package com.sy.controller.fxc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Operationalfxc {

    @RequestMapping("/instructions/operational.html")
    public String ToOperational(){
        return "fxc/operational";
    }
}
