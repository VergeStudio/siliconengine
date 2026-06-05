set_project("demo")

-- version
set_version("0.0.1", {build = "%Y%m%d%H%M"})

-- set xmake min version
set_xmakever("3.0.0")

-- set warning all as error
--set_warnings("all", "error")

set_languages("c17", "cxx23") -- https://xmake.io/#/zh-cn/manual/project_target?id=targetset_languages

add_rules("mode.debug", "mode.release", "mode.valgrind")

set_encodings("utf-8")

if is_mode("release") then
    --set_optimize("smallest")
    if is_plat("windows") then
        add_ldflags("/LTCG")
    end
end

target("demo", function()
    set_kind("binary")

    if is_plat("windows") then
        add_defines("WIN")
    end

    if is_kind("shared") then
        add_defines("DEMO_SHARED_LIB", "DEMO_EXPORT", {public = true})
    end

    add_deps("silicon::core", "silicon::logger", {configs = {shared = true}})

    add_includedirs("include", {public = true})
    add_headerfiles("include/demo/**.hpp")

    add_files("src/**.cpp")
    add_files("src/**.cppm", {public = true})

    set_configdir("$(builddir)/demo/config")
    add_configfiles("demo.config.cppm.in")
    add_files("$(builddir)/demo/config/demo.*.cppm", {public = true})

    after_build(function(target)

    end)
end)
