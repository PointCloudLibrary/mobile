package org.pointclouds.onirec.grab;

import org.OpenNI.ImageMetaData;

public interface ColorGenerator extends Generator {
    ImageMetaData getMetaData();
}
