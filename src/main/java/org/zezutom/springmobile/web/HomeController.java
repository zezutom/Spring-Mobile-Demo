package org.zezutom.springmobile.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zezutom.springmobile.model.DeviceInfo;
import org.zezutom.springmobile.model.DeviceResolver;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
public class HomeController {

    @Resource
    private DeviceResolver deviceResolver;

    @RequestMapping("/index.htm")
    public String index(Model model, HttpServletRequest request) {
        DeviceInfo deviceInfo = updateModel(model, request);
        return getView(deviceInfo.isDisplayNormal());
    }

    private DeviceInfo updateModel(Model model, HttpServletRequest request) {
        DeviceInfo deviceInfo = deviceResolver.resolveDevice(request);
        model.addAttribute("device", deviceInfo);
        return deviceInfo;
    }

    private String getView(boolean normal) {
        return normal ? "index" : "index-mobile";
    }

}


