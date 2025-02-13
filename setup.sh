#!/bin/bash

chmod +x ./install/bootstrap.sh
./install/bootstrap.sh

chmod +x ./install/install_dependencies.sh
./install/install_dependencies.sh

chmod +x ./install/create_nvim_env.sh
./install/create_nvim_env.sh
