workspace "OpenGL"
    configurations { "Debug", "Release" }

    filter "system:windows"
        architecture "x86"

    filter "system:macosx"
        architecture "arm64"

project "OpenGL"
    location "OpenGL"
    kind "ConsoleApp"
    language "C++"

    targetdir "bin/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}/%{prj.name}"
    objdir "bin-int/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}/%{prj.name}"

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs {
        "Dependencies/**"
    }

    filter "system:windows"
        libdirs
        {
            "Dependencies/GLEW/lib/Release/Win32",
            "Dependencies/GLFW/lib-vc2022",
        }

        links { "glew32", "glfw3"}

    filter "system:macosx"
        libdirs
        {
            "Dependencies/GLEW/lib/Release/arm64",
            "Dependencies/GLFW/lib-arm64",
        }

        links { "Cocoa.framework", "IOKit.framework", "CoreVideo.framework", "OpenGL.framework", "glew", "glfw3" }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"