-- scaffold geniefile for dynamix

dynamix_script = path.getabsolute(path.getdirectory(_SCRIPT))
dynamix_root = path.join(dynamix_script, "dynamix")

dynamix_includedirs = {
	path.join(dynamix_script, "config"),
	dynamix_root,
}

dynamix_libdirs = {}
dynamix_links = {}
dynamix_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { dynamix_includedirs }
	end,

	_add_defines = function()
		defines { dynamix_defines }
	end,

	_add_libdirs = function()
		libdirs { dynamix_libdirs }
	end,

	_add_external_links = function()
		links { dynamix_links }
	end,

	_add_self_links = function()
		links { "dynamix" }
	end,

	_create_projects = function()

project "dynamix"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		dynamix_includedirs,
	}

	defines {}

	files {
		path.join(dynamix_script, "config", "**.h"),
		path.join(dynamix_root, "**.h"),
		path.join(dynamix_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
