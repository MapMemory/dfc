#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="."

# Header of script

if [[ $1 == "-d1" ]]; then
    GLOBAL_LEVEL_DEBUG=1
else
    GLOBAL_LEVEL_DEBUG=2
fi

message_info() {
    text=$1
    level_debug=$2
    Color_Off='\033[0m'
    BIGreen='\033[0;32m'
    
    if [[ $level_debug -le $GLOBAL_LEVEL_DEBUG ]]; then
        printf "${BIGreen}| ⓘ  ${text}${Color_Off}\n"
    elif [[ $level_debug > $GLOBAL_LEVEL_DEBUG ]]; then
        echo "| ${text}\n"
    fi
}

message_input() {
    text=$1
    Color_Off='\033[0m'
    BIGreen='\033[0;32m'
    printf "${BIGreen}| ${text}${Color_Off}"
}

message_error() {
    text=$1
    Color_Off='\033[0m'
    BIGreen='\033[0;32m'
    printf "${BIGreen}| ⓘ  ${text}${Color_Off}\n"
}

message_space() {
    level_debug=$1
    Color_Off='\033[0m'
    BIGreen='\033[0;32m'

    if [[ $level_debug -le $GLOBAL_LEVEL_DEBUG ]]; then
        printf "${BIGreen}|${Color_Off}\n"
    elif [[ $level_debug > $GLOBAL_LEVEL_DEBUG ]]; then
        echo "| ${text}\n"
    fi
}

message_space_null() {
    printf "\n"
}

# General process
message_info "$(date '+%H:%M:%S (%d/%m/%Y)')" 2
message_space 2

message_info "Подпроекты: 'dfc-server' и 'dfc-site'" 1
message_space 1
message_space 1
message_info "Остановка подпроекта 'dfc-server'" 1
message_space 1
(cd $dfc_project_main_folder/dfc-server && sh dfc-stop.sh -d1)
message_space 1
message_space 1
message_info "Остановка подпроекта 'dfc-site'" 1
message_space 1
(cd $dfc_project_main_folder/dfc-site && sh dfc-stop.sh -d1)
message_space 1
message_space 1
message_info "Остановка завершена" 1

# End of script

if [[ $1 != "-d1" ]]; then
    message_space 1
    message_input "Нажмите на ENTER чтобы выйти\n"
    message_input "=> "
    read -p ''
fi
