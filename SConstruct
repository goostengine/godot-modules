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
    print("Disabling module: %s, %s" % (name, reason))
    args.append("module_%s_enabled=no" % name)

cannot_compile = "cannot compile editor builds for Godot %s for all platforms as of now" % godot_ver

disable_module("godot_box2d", cannot_compile)
disable_module("voxel", cannot_compile)
disable_module("tabletop_club_godot_module", cannot_compile)
disable_module("qurobullet", cannot_compile)
disable_module("llightmap", cannot_compile)
disable_module("smooth", cannot_compile)

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
