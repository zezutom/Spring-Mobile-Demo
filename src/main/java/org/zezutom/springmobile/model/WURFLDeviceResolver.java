package org.zezutom.springmobile.model;

import net.sourceforge.wurfl.core.Device;
import net.sourceforge.wurfl.core.WURFLManager;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.mobile.device.site.SitePreference;
import org.springframework.mobile.device.site.SitePreferenceUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * Makes use of the WURFL tools to resolve the device.
 */
@Service
public class WURFLDeviceResolver implements DeviceResolver {

    @Resource
    private WURFLManager manager;

    @Override
    public DeviceInfo resolveDevice(HttpServletRequest request) {

        // Spring caters for the elementary information (is this a mobile?)
        boolean mobile = DeviceUtils.getCurrentDevice(request).isMobile();

        // Look for site preferences
        SitePreference sitePreference = SitePreferenceUtils.getCurrentSitePreference(request);

        // Decide the type of the device and how to display the device
        DeviceInfo deviceInfo = new DeviceInfo(mobile);
        deviceInfo.setDisplayNormal(SitePreference.NORMAL.equals(sitePreference));

        // Other properties are resolved using the WURFL capabilities
        Device device = manager.getDeviceForRequest(request);

        deviceInfo.setId(device.getId());
        deviceInfo.setCapabilities(device.getCapabilities());
        deviceInfo.setMarkUp(device.getMarkUp().toString());
        deviceInfo.setUserAgent(device.getUserAgent());

        return deviceInfo;
    }
}
