#!/usr/bin/env bash
source <(curl -s https://raw.githubusercontent.com/bketelsen/IncusScripts/main/misc/build.func)
# Copyright (c) 2021-2025 tteck
# Author: tteck (tteckster)
# License: MIT | https://github.com/community-scripts/ProxmoxVE/raw/main/LICENSE

# App Default Values
APP="Alpine"
var_tags="os;alpine"
var_cpu="1"
var_ram="512"
var_disk="0.1"
var_os="alpine"
var_version="3.21"
var_unprivileged="1"

# App Output & Base Settings
header_info "$APP"
base_settings

# Core
variables
color
catch_errors

function update_script() {
  UPD=$(whiptail --backtitle "Incus Scripts" --title "SUPPORT" --radiolist --cancel-button Exit-Script "Spacebar = Select" 11 58 1 \
    "1" "Check for Alpine Updates" ON \
    3>&1 1>&2 2>&3)

  header_info
  if [ "$UPD" == "1" ]; then
    apk update && apk upgrade
    exit
  fi
}

start
build_container
description

msg_ok "Completed Successfully!\n"
