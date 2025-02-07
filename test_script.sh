#!/bin/bash


check_which_system () {
    echo "$(uname -s)"
}

VAR=$(check_if_linux)
echo "$VAR"