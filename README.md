# Godot Modules

![🐧 Linux](https://github.com/goostengine/godot-modules/workflows/%F0%9F%90%A7%20Linux/badge.svg)
![🍎 macOS](https://github.com/goostengine/godot-modules/workflows/%F0%9F%8D%8E%20macOS/badge.svg)
![🎨 Windows](https://github.com/goostengine/godot-modules/workflows/%F0%9F%8E%A8%20Windows/badge.svg)
![🤖 Android](https://github.com/goostengine/godot-modules/workflows/%F0%9F%A4%96%20Android/badge.svg)
![🍏 iOS](https://github.com/goostengine/godot-modules/workflows/%F0%9F%8D%8F%20iOS/badge.svg)
![🌐 JavaScript](https://github.com/goostengine/godot-modules/workflows/%F0%9F%8C%90%20JavaScript/badge.svg)

A collection of various community
[Godot Engine](https://github.com/godotengine/godot)
[C++ modules](https://docs.godotengine.org/en/stable/development/cpp/custom_modules_in_cpp.html).

The goal of this repository is to collect C++ modules for the purpose of
accessibility and the ease of discovery. This allows to try out various modules
conveniently from within a single, centralized place.

Each module represents a `git` submodule versioned as part of this repository.

It's recommended that you manually clone modules of interest which you intend to
use in your project, it's *not* recommended to use this repository in production
as it may not be actively updated.

## List of modules
|                            Module name                             |                    Short description                     |
| ------------------------------------------------------------------ | -------------------------------------------------------- |
| [goost](https://github.com/goostengine/goost)                      | A general-purpose, extensible C++ extension for Godot.   |
| [sqlite](https://github.com/godot-extended-libraries/godot-sqlite) | SQLite for Godot based on gdsqlite-native. |
| [gltf](https://github.com/godot-extended-libraries/gltf)           | glTF format support for 3D scenes and models.            |
| [json](https://github.com/godot-extended-libraries/json)           | Import JSON files as resources.                          |
| [anl](https://github.com/Xrayez/godot-anl)                         | Accidental Noise Library in Godot.                       |
| [qurobullet](https://github.com/quinnvoker/qurobullet)             | Design 2D projectile system.                             |
| [voronoi](https://github.com/rakai93/godot_voronoi)                | Compute Voronoi diagrams.                                |
| [voxel](https://github.com/Zylann/godot_voxel)                     | Create volumetric worlds.                                |
| [lportal](https://github.com/lawnjelly/godot-lportal)              | Portal rendering and culling.                              |
| [llightmap](https://github.com/lawnjelly/godot-llightmap)          | Soft shadows with high performance at runtime.   |
| [lsimd](https://github.com/lawnjelly/godot-lsimd)                  | SIMD instructions support from within GDScript.          |
| [smooth](https://github.com/lawnjelly/godot-smooth)                | Fixed timestep interpolation helper nodes.               |

## Building

The process is similar to compiling the
[Goost](https://github.com/goostengine/goost) Godot Engine extension:

```sh
git clone https://github.com/goostengine/godot-modules --recurse-submodules
cd godot-modules
scons
```

Note that this will clone the Godot Engine repository to compile all modules as
part of it.

Alternatively, you can compile all the modules by using the
[`custom_modules`](https://docs.godotengine.org/en/stable/development/compiling/introduction_to_the_buildsystem.html#custom-modules)
build options directly from within the existing engine source code:

```sh
git clone https://github.com/goostengine/godot-modules --recurse-submodules
cd godot
scons custom_modules="../godot-modules/modules"
```

But you should be aware of module detection limitations as described in the
following Godot proposals:

1. [Detect custom C++ modules recursively](https://github.com/godotengine/godot-proposals/issues/1619).
2. [Allow to customize C++ module name by not relying on module's directory name](https://github.com/godotengine/godot-proposals/issues/1561).

Else you may need to specify the search paths manually in this case.

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

## License

Unless otherwise specified, all files in this repository are released under the
terms of the [MIT license](LICENSE.txt), except for the modules which may have a
license not compatible with the MIT license, see [`.gitmodules`](.gitmodules)
file for a complete list of modules with respective URL pointing to other
projects.
