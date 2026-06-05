-- set xmake min version
set_xmakever("3.0.0")

-- set warning all as error
--set_warnings("all", "error")

set_languages("c17", "cxx23") -- https://xmake.io/#/zh-cn/manual/project_target?id=targetset_languages

-- version
set_version("0.0.1", { build = "%Y%m%d%H%M" })

-- 设置默认编码
set_encodings("utf-8")

set_toolchains("clang")

includes("app/**", "pkg/**")

set_project("siliconengine")
