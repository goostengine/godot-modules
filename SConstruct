#!/usr/bin/env python
#
# Adapted from upstream: https://github.com/goostengine/goost
#
import os
import sys
import pickle
import subprocess

godot_ver = "3.x"
godot_url = "https://github.com/godotengine/godot"
godot_dir = Dir("godot")

print("Configuring modules ...")

# A method which allows us to run `git`, `scons`, and other commands.
def run(args, dir="."):
    if sys.platform.startswith("win32"):
        return subprocess.run(args, check=True, shell=True, cwd=dir).returncode
    else:
        return subprocess.run(args, check=True, cwd=dir).returncode

if not godot_dir.exists():
    # Checkout Godot repository directly under the current directory.
    run(["git", "clone", godot_url])
    run(["git", "checkout", godot_ver, "--quiet"], godot_dir.abspath)

# Setup base SCons arguments to the Godot build command.
args = ["scons"]
for arg in ARGLIST:
    opt = "%s=%s" % (arg[0], arg[1])
    args.append(opt)

args.append("custom_modules=%s" % Dir("modules").abspath)

# Disable some modules which cannot be built.
def disable_module(name, reason=""):
    msg = "Disabling module: %s"
    if reason:
        msg += ", %s" % reason
    args.append("module_%s_enabled=no" % name)

# Enable some modules which might be disabled by default.
def enable_module(name):
    args.append("module_%s_enabled=yes" % name)

enable_module("luascript")

if ARGUMENTS.get("module", ""):
    # Disable all modules except the one supplied via command-line.
    module = ARGUMENTS["module"]
    enable_module(module)

    for name in os.listdir("modules"):
        if name != module:
            disable_module(name)

    # Make sure we don't accidentally pick up nested modules.
    args.append("custom_modules_recursive=no")

else:
    cannot_compile = "Cannot compile for Godot %s for all editor platforms as of now." % godot_ver

    disable_module("godot_box2d", cannot_compile)
    disable_module("voxel", cannot_compile)
    disable_module("tabletop_club_godot_module", cannot_compile)
    disable_module("qurobullet", cannot_compile)
    disable_module("llightmap", cannot_compile)
    disable_module("lua", cannot_compile)
    disable_module("smooth", cannot_compile)

    disable_module("git", "Temporarily disabled")

# Append the default `extra_suffix` to distinguish between other builds.
args.append("extra_suffix=community")
os.environ["BUILD_NAME"] = "community"

# Avoid issues when building with different versions of Python.
SConsignFile(".sconsign{0}.dblite".format(pickle.HIGHEST_PROTOCOL))

# Enable cache if required, this is reused by Godot and CI.
scons_cache_path = os.environ.get("SCONS_CACHE")
if scons_cache_path != None:
    CacheDir(scons_cache_path)
    print("SCons cache enabled... (path: '" + scons_cache_path + "')")

# Some SCons-specific options may not trigger an actual build.
skip_build = False

# Pass commonly used SCons options to the Godot build.
scons_options = ["help", "clean"]
for opt in scons_options:
    if not GetOption(opt):
        continue
    skip_build |= opt in ["help", "clean"]
    args.append("--%s" % opt)

if GetOption("num_jobs") > 1:
    args.append("--jobs=%s" % GetOption("num_jobs"))

if not skip_build:
    print("Building Godot ...")

# Run SCons to build Godot, check the build configuration etc.
run(args, godot_dir.abspath)
