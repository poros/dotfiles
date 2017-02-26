#!/bin/bash
# A utility to do more env setup using the given file.
# Expect ENVSETUP to be properly defined.


ENVSETUP="$HOME/.bash_commons"
sourceFrom () {
   base_file="$1"
   source_file="${ENVSETUP}/${base_file}";
   if [ -f "${source_file}" ]; then
       . ${source_file}
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
sourceFrom bashrc-os-mac

# host-specific setup
sourceFrom "bashrc-host-${HOSTNAME}"

# Final processing after OS-specific and host-specific setup.
sourceFrom bashrc-common-final

export PYTHONSTARTUP=~/.pythonrc.py
export RUST_SRC_PATH=~/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src

# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
# Setting cargo PATH for rust
PATH="$HOME/.cargo/bin:$PATH"
export PATH
