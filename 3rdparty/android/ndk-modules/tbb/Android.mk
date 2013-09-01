LOCAL_PATH := $(call my-dir)

ifeq ($(NDK_DEBUG),1)
tbb_conf := debug
else ifeq ($(NDK_DEBUG),true)
tbb_conf := debug
else
tbb_conf := release
endif

ifeq ($(tbb_conf),debug)
tbb_suffix := _debug
else
tbb_suffix :=
endif

include $(CLEAR_VARS)
LOCAL_MODULE := tbb

LOCAL_SRC_FILES := lib/$(tbb_conf)/$(TARGET_ARCH_ABI)/libtbb$(tbb_suffix).so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/include

include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := tbbmalloc

LOCAL_SRC_FILES := lib/$(tbb_conf)/$(TARGET_ARCH_ABI)/libtbbmalloc$(tbb_suffix).so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/include

include $(PREBUILT_SHARED_LIBRARY)
