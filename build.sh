#!/usr/bin/env bash

PCRE2_FLAGS=""
if which pcre2-config > /dev/null && [[ $(pcre2-config --version) > "10.36" ]]; then
    PCRE2_FLAGS="$(pcre2-config --cflags-posix --libs-posix) -DYED_SYNTAX_USE_PCRE2"
fi

gcc -o sh.so sh.c $(yed --print-cflags --print-ldflags) ${PCRE2_FLAGS}
