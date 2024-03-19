project "Glslang"
	kind "StaticLib"
	language "C++"
    staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"SPIRV/**.h",
		"SPIRV/**.cpp",
		"glslang/**.h",
		"glslang/**.cpp",
		"**.h.tmpl",
	}

	includedirs
	{
		".",
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++20"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++20"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

    filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"