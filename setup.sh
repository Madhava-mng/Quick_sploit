#!/usr/bin/bash
function check(){
    if [ -f /data/data/com.termux/files/usr/bin/ls ];then
        if [ -f /data/data/com.termux/files/usr/bin/msfconsole ];then
            echo -e "[\033[32;1m*\u001b[0m] Check metasploit status ......................... Ok"
            sleep 0.8
        else
            echo -e "[\033[31;1m!\u001b[0m] Check metasploit status ......................... Installing"
            echo "\nPleace be wite.\n Turn on Data.\n\n"
            sleep 1
            pkg install unstable-repo && pkg install metasploit
            check
        fi
        if [ -f /data/data/com.termux/files/usr/bin/python ];then
            echo -e "[\033[32;1m*\u001b[0m] Check Python3 status ......................... Ok"
            sleep 1
        else
            echo -e "[\033[32;1m*\u001b[0m] Check Python3 status ......................... Installing"
            sleep 1
            pkg install python
            check
        fi
    else
        if [ -f /usr/bin/msfconsole ];then
            echo -e "[\033[32;1m*\u001b[0m] Check metasploit status ......................... Ok"
            sleep 1
        else
            echo -e "[\033[31;1m!\u001b[0m] Check metasploit status ......................... Installing"
            echo "\nPleace be wite.\n Turn on Data.\n\n"
            sleep 1
            sudo apt-get install metasploit-framework
        fi
    fi
}
check
