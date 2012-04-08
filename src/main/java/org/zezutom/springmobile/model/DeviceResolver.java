package org.zezutom.springmobile.model;

import javax.servlet.http.HttpServletRequest;

/**
 * Resolves a device, based on a client request.
 */
public interface DeviceResolver {

    DeviceInfo resolveDevice(HttpServletRequest request);
}
