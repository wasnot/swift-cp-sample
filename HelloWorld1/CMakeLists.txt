cmake_minimum_required(VERSION 3.0)
include(ScadeSDK)

add_scade_application(HelloWorld1 "com.scade.helloworld1"
	SOURCES
	src/main.page.swift
	src/start.swift
	RESOURCES
		RESOURCES_GROUP "src" NOPREFIX
			main.page
		RESOURCES_GROUP NOBASE NOPREFIX
			"res/fonts"
			"res/fonts/ArialMT.ttf"
			"res/images"
			"res/images/electro1.png"
	IOS_EXPORT_METHOD "ad-hoc"
	MACOS_PLIST_PROPERTIES
		"CFBundleShortVersionString" "STRING" "1.0"
		"CFBundleVersion" "STRING" "1"
		"NSLocationWhenInUseUsageDescription" "STRING" ""
		"NSCameraUsageDescription" "STRING" "Take pictures from camera"
		"NSPhotoLibraryUsageDescription" "STRING" "Choose a photo from your library"
		"UIDeviceFamily" ARRAY
			INT "1"
		ARRAY_END
		"UISupportedInterfaceOrientations" ARRAY
			STRING "UIInterfaceOrientationPortrait"
		ARRAY_END
		"UISupportedInterfaceOrientations~ipad" ARRAY
			STRING "UIInterfaceOrientationPortrait"
		ARRAY_END
)
