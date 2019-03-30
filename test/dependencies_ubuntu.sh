#!/bin/bash
#  ----------------------------------------------------------------
# Copyright 2016 Cisco Systems
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ------------------------------------------------------------------
#
# Script for running ydk CI on docker via travis-ci.org
#
# dependencies_ubuntu (Ubuntu 16.04)
# ------------------------------------------------------------------

function print_msg {
    echo -e "${MSG_COLOR}*** $(date) *** dependencies_ubuntu.sh | $@ ${NOCOLOR}"
}

function install_confd {
    print_msg "Installing confd"

    wget https://github.com/CiscoDevNet/ydk-gen/files/562538/confd-basic-6.2.linux.x86_64.zip &> /dev/null
    unzip confd-basic-6.2.linux.x86_64.zip
    ./confd-basic-6.2.linux.x86_64.installer.bin ../confd
}

########################## EXECUTION STARTS HERE #############################

RED="\033[0;31m"
NOCOLOR="\033[0m"
YELLOW='\033[1;33m'
MSG_COLOR=$YELLOW

./test/dependencies_ubuntu_basic.sh

install_confd
