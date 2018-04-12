#!/bin/bash
# A utility to do more env setup using the given file.
# Expect ENVSETUP to be properly defined.


ENVSETUP="$HOME/.bash_commons"
sourceFrom () {
   base_file="$1"
   source_file="${ENVSETUP}/${base_file}";
   if [ -f "${source_file}" ]; then
       . "${source_file}"
       return 0
   else
       return 1
   fi

   # Note that if the file does not exist, no action is taken (silently).
   # Only the return value indicates that action was done.
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# http://dotslashstar.blogspot.com/2011/10/shell-trick-dynamic-bashrc-setup.html

# Special environmental & shell related setup are defined here
sourceFrom bashrc-common-shell

# Common aliases are defined externally.
sourceFrom bashrc-common-aliases

# Common Functions are defined externally.
sourceFrom bashrc-common-functions

# Platform-specific setup
sourceFrom bashrc-os-linux

# host-specific setup
sourceFrom "bashrc-host-${HOSTNAME}"

# Final processing after OS-specific and host-specific setup.
sourceFrom bashrc-common-final

# python autocompletion
export PYTHONSTARTUP=~/.pythonrc.py

# rust setup
export PATH="$PATH:$HOME/.cargo/bin"
export RUST_SRC_PATH="/nail/home/antonio/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"

# java setup
export JAVA_HOME="/usr/lib/jvm/java-8-oracle-1.8.0.92"
