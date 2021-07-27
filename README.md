# Godot Modules

![🐧 Linux](https://github.com/goostengine/godot-modules/workflows/%F0%9F%90%A7%20Linux/badge.svg)
![🍎 macOS](https://github.com/goostengine/godot-modules/workflows/%F0%9F%8D%8E%20macOS/badge.svg)
![🎨 Windows](https://github.com/goostengine/godot-modules/workflows/%F0%9F%8E%A8%20Windows/badge.svg)

A collection of various community
[Godot Engine](https://github.com/godotengine/godot)
[C++ modules](https://docs.godotengine.org/en/stable/development/cpp/custom_modules_in_cpp.html)
curated by the [Goost](https://github.com/goostengine/goost) project.

## Trying out

If available, you can download nighty builds of the
[modules listed below](#list-of-modules) for Linux, macOS, Windows integrated
into Godot editor builds for testing purposes:

- [🐧 Linux](https://nightly.link/goostengine/godot-modules/workflows/linux_builds/gd3/linux-editor.zip)
- [🍎 macOS](https://nightly.link/goostengine/godot-modules/workflows/macos_builds/gd3/macos-editor.zip)
- [🎨 Windows](https://nightly.link/goostengine/godot-modules/workflows/windows_builds/gd3/windows-editor.zip)

Otherwise you'll have to build Godot with custom modules yourself, see
[Building](#building) section.

## Purpose

The goal of this repository is to collect C++ modules for the purpose of
accessibility and the ease of discovery. This allows to try out various modules
conveniently from within a single, centralized place. Note that only editor
builds are provided via build artifacts.

Each module represents a `git` submodule versioned as part of this repository.

It's recommended that you manually clone modules of interest which you intend to
use in your project, it's *not* recommended to use this repository in production
as it may not be actively updated.

## List of modules

Note that some modules may not be able to be built properly, or they are
temporarily disabled due to other reasons as denoted in "Build status" column:

- 🟢 Build success in latest stable version of Godot.
- 🟡 Can build only for some editor platforms, or require certain workarounds.
- 🔴 Cannot build due to direct compilation errors. Please report such bugs upstream.

|                                    Module name                                     |                  Short description                  | Build status |
| ---------------------------------------------------------------------------------- | --------------------------------------------------- | ------------ |
| [anl](https://github.com/Xrayez/godot-anl)                                         | Accidental Noise Library in Godot.                  | 🟢            |
| [box2d](https://github.com/briansemrau/godot_box2d)                                | Integrates Box2D physics library in Godot.          | 🔴            |
| [goost](https://github.com/goostengine/goost)                                      | A general-purpose C++ extension for Godot.          | 🟢            |
| [json](https://github.com/godot-extended-libraries/json)                           | Import JSON files as resources.                     | 🟢            |
| [llightmap](https://github.com/lawnjelly/godot-llightmap)                          | Soft shadows with high performance at runtime.      | 🔴            |
| [lua](https://github.com/Trey2k/lua)                                               | Adds external Lua support via GDScript.             | 🟡            |
| [luascript](https://github.com/perbone/luascript)                                  | Lua language support for Godot Engine.              | 🟡            |
| [qurobullet](https://github.com/quinnvoker/qurobullet)                             | Design 2D projectile system.                        | 🔴            |
| [smooth](https://github.com/lawnjelly/godot-smooth)                                | Fixed timestep interpolation helper nodes.          | 🔴            |
| [sqlite](https://github.com/godot-extended-libraries/godot-sqlite)                 | SQLite for Godot based on gdsqlite-native.          | 🟢            |
| [tabletop_club](https://github.com/drwhut/tabletop_club_godot_module)              | Import resources at run-time.                       | 🔴            |
| [terrain_generator](https://github.com/EternalColor/Godot-Planet-Generator-Module) | Create planet meshes with OpenSimplexNoise terrain. | 🟢            |
| [voronoi](https://github.com/rakai93/godot_voronoi)                                | Compute Voronoi diagrams.                           | 🟢            |
| [voxel](https://github.com/Zylann/godot_voxel)                                     | Create volumetric worlds.                           | 🟡            |

## Building

There are two ways to build all modules listed above.

### Using `scons` command:

```sh
git clone https://github.com/goostengine/godot-modules --recurse-submodules
cd godot-modules
scons
```

The process is similar to compiling the
[Goost](https://github.com/goostengine/goost) Godot Engine extension. This will
clone the Godot Engine repository to compile all modules as part of it.

### Using `custom_modules` build option
  
Alternatively, you can compile all the modules by using the
[`custom_modules`](https://docs.godotengine.org/en/stable/development/compiling/introduction_to_the_buildsystem.html#custom-modules)
build options directly from within the existing engine source code:

```sh
git clone https://github.com/goostengine/godot-modules --recurse-submodules
cd godot
scons custom_modules="../godot-modules/modules"
```

Some modules may *not* compile on some platforms and/or targets as seen in the
list above, so using `scons` is preferable in those cases as it automatically
disables modules which cannot be compiled.

To update submodules, run:

```sh
git submodule update --remote
```

## Contributing

Only add modules which don't require manual installation of additional external
dependencies (various software development kits etc.)

The following command must be used from within the root of this repository:

```sh
git submodule add --name <NAME> --branch <BRANCH> <URL> modules/<NAME>
```

Make sure that the added modules do compile, commit the changes and then feel
free to open a pull request.

Also, consider supporting this Godot proposal:
- [Allow to customize C++ module name by not relying on module's directory name](https://github.com/godotengine/godot-proposals/issues/1561).

## License

Unless otherwise specified, all files in this repository are released under the
terms of the [MIT license](LICENSE.txt), except for the modules which may have a
license not compatible with the MIT license, see [`.gitmodules`](.gitmodules)
file for a complete list of modules with respective URL pointing to other
projects.
