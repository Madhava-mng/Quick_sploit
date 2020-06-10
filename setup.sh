#!/usr/bin/bash
function check(){
    if [ -f /data/data/com.termux/files/usr/bin/ls ];then
        if [ -f /data/data/com.termux/files/usr/bin/msfconsole ];then
            printf "[\033[32;1m+\u001b[0m] Check metasploit status ...................... Ok\n"
            sleep 0.4
        else
            printf "[\033[31;1m!\u001b[0m] Check metasploit status ......................... Installing\n"
            echo "\nPleace be wite.\n Turn on Data.\n\n"
            sleep 1
            pkg install unstable-repo && pkg install metasploit 2>/dev/null
            echo "" > /data/data/com.termux/files/usr/opt/metasploit-framework/lib/pg/deprecated_constants.rb  2>/dev/null
            check
        fi
        if [ -f /data/data/com.termux/files/usr/bin/python ];then
            printf  "[\033[32;1m+\u001b[0m] Check Python3 status ......................... Ok\n"
            sleep 0.5
        else
            printf "[\033[31;1m!\u001b[0m] Check Python3 status ......................... Installing\n"
            sleep 1
            pkg install python 2>/dev/null
            check
        fi
    else
        if [ -f /usr/bin/msfconsole ];then
            printf  "[\033[32;1m+\u001b[0m] Check metasploit status ...................... Ok\n"
            sleep 1
        else
            printf  "[\033[31;1m!\u001b[0m] Check metasploit status ......................... Installing\n"
            echo "\nPleace be wite.\n Turn on Data.\n\n"
            sleep 1
            sudo apt-get install metasploit-framework 2>/dev/null
        fi
    fi
}
function check2(){
    path="`pwd`/module.txt"
    if [ -f $path ];then
        printf "[\033[32;1m+\u001b[0m] Check modules status ......................... Ok\n"
        sleep 0.5
    else
        printf "[\033[31;1m!\u001b[0m] Check modules status ......................... \033[31;1mFail\033[0m\n"
    fi
    if [ -f "`pwd`/Banner.py" ];then
        printf "[\033[32;1m+\u001b[0m] Check banners status ......................... Ok\n"
        sleep 1
    else
        printf "[\033[31;1m!\u001b[0m] Check banners status ......................... \033[31;1mFail\033[0m\n"
    fi
}
check
check2
