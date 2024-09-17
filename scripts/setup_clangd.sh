#!/bin/bash

if [ ! -f ".clangd" ]; then
    echo "Creating .clangd"
    inc_cmd="-I$EMSC_DEV/include"
    echo -e "CompileFlags:\r  Add: [$inc_cmd, -std=c++20]" > ".clangd"
fi
