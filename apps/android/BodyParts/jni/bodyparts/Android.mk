LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := bodyparts
LOCAL_SRC_FILES := body_parts_recognizer.cpp openni_grabber.cpp org_pointclouds_bodyparts_BodyPartsRecognizer.cpp \
  file_grabber.cpp org_pointclouds_bodyparts_Grabber.cpp stopwatch.cpp \
  org_pointclouds_bodyparts_Cloud.cpp org_pointclouds_bodyparts_Application.cpp cloud.cpp
LOCAL_LDLIBS := -llog
LOCAL_STATIC_LIBRARIES := boost boost_filesystem tbb
LOCAL_SHARED_LIBRARIES := OpenNI

include $(BUILD_SHARED_LIBRARY)
