# Godot Modules

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
