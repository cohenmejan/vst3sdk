project "VST3SDK"
	kind "StaticLib"
	language "C++"
    cppdialect "C++20"
	systemversion "latest"
	staticruntime "on"

	flags {
		"MultiProcessorCompile",
	}

	targetdir "%{wks.location}/bin/%{cfg.buildcfg}/%{prj.name}"
	objdir "%{wks.location}/bin-obj/%{cfg.buildcfg}/%{prj.name}"

	includedirs {
		"%{wks.location}/Dependencies/VST3SDK",
		"%{wks.location}/Dependencies/VST3SDK/base/thread/include",
		"%{wks.location}/Dependencies/VST3SDK/vstgui4",
	}

	files {
		"base/source/*.h",
		"base/source/*.cpp",
		"base/thread/include/*.h",
		"base/thread/include/*.cpp",
		"base/thread/source/*.h",
		"base/thread/source/*.cpp",

		"pluginterfaces/base/*.h",
		"pluginterfaces/base/*.cpp",
		"pluginterfaces/gui/*.h",
		"pluginterfaces/gui/*.cpp",
		"pluginterfaces/vst/*.h",
		"pluginterfaces/vst/*.cpp",

		"public.sdk/source/common/*.h",
		"public.sdk/source/common/*.cpp",
		"public.sdk/source/main/*.h",
		"public.sdk/source/main/*.cpp",

		"public.sdk/source/vst/*.h",
		"public.sdk/source/vst/*.cpp",
		"public.sdk/source/vst/basewrapper/*.h",
		"public.sdk/source/vst/basewrapper/*.cpp",
		"public.sdk/source/vst/hosting/*.h",
		"public.sdk/source/vst/hosting/*.cpp",
		"public.sdk/source/vst/utility/*.h",
		"public.sdk/source/vst/utility/*.cpp",

		"vstgui4/vstgui/plugin-bindings/*.h",
		"vstgui4/vstgui/plugin-bindings/*.cpp",

		"vstgui4/vstgui/vstgui_win32.cpp"
	}

	filter { "files:vstgui4/vstgui/vstgui_win32.cpp" }
    	buildoptions { "/bigobj" }
	filter {}

	removefiles {
		"**_linux.cpp",
		"**linuxmain.cpp",
		"**macmain.cpp",
		"**vstsinglecomponenteffect**",
		"**aeffguieditor**",
		"**basewrapper.sdk.cpp"
	}

	defines {
		"_CRT_SECURE_NO_WARNINGS",
		"WIN32=1"
	}

	filter "configurations:Debug"
		defines { "DEBUG" }
		symbols "On"

	filter "configurations:Release"
		defines { "NDEBUG" }
		optimize "On"