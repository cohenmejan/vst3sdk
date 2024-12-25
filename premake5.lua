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
		"%{wks.location}/Dependencies/VST3SDK"
	}

	files {
		"pluginterfaces/base/*.h",
		"pluginterfaces/base/*.cpp",
		"public.sdk/source/*.h",
		"public.sdk/source/*.cpp",
		"public.sdk/source/common/*.h",
		"public.sdk/source/common/*.cpp",
		"public.sdk/source/vst/hosting/*.h",
		"public.sdk/source/vst/hosting/*.cpp",
		"public.sdk/source/vst/utility/*.h",
		"public.sdk/source/vst/utility/*.cpp",
	}

	removefiles {
		"**_linux.cpp",
		"linux**.cpp",
	}

	defines {
		"_CRT_SECURE_NO_WARNINGS"
	}

	filter "configurations:Debug"
		defines { "DEBUG" }
		symbols "On"

	filter "configurations:Release"
		defines { "NDEBUG" }
		optimize "On"