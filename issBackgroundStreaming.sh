#!/bin/bash
PS=`ps -ef`
Icon="/home/oscar_troyano/ISS/earth.png"
#var_proxy_http= echo "$http_proxy"
#var_proxy_https= echo "$https_proxy"

if pgrep -f 'vlc -I dummy'; then
	notify-send -u critical -t 3 -i $(dirname "${BASH_SOURCE[0]}")/earth.png "ISS Background Streaming" \ "Houston, We\'ve Got a Problem! \n ISS streaming is already running \n Turning off all systems"
	kill -9 $(ps aux | grep 'vlc -I dummy' | awk '{print $2}')
	kill -9 $(ps aux | grep 'issBackgroundStreaming.sh' | awk '{print $2}')
else 
	#Retrying when the connection is lost
	while (true)
	do
		#if ! echo "$PS"|grep 'vlc -I dummy'; then
		if ! pgrep -f 'vlc -I dummy'; then
			notify-send -u critical -t 3 -i $(dirname "${BASH_SOURCE[0]}")/earth.png "ISS Background Streaming" \ "Turning ON all systems \n Dowloading data from ISS..."
    		livestreamer http://www.ustream.tv/channel/iss-hdev-payload best --player 'vlc -I dummy --video-wallpaper --no-video-title-show --noaudio'
    	fi
    	sleep 60
		#livestreamer http://ustream.tv/channel/iss-hdev-payload best --player 'vlc -I dummy --video-wallpaper --no-video-title-show --noaudio'
		#if [ var_proxy_http ];
		#then
		#	livestreamer http://ustream.tv/channel/iss-hdev-payload best --player 'vlc -I dummy --video-wallpaper --no-video-title-show --noaudio' --http-proxy \"$var_proxy_http\" --https-proxy \"$var_proxy_https\"
		#else 
		#	livestreamer http://ustream.tv/channel/iss-hdev-payload best --player 'vlc -I dummy --video-wallpaper --no-video-title-show --noaudio'
		#fi
    	#livestreamer http://www.ustream.tv/embed/9408562?html5ui best --player "cvlc --no-video" & livestreamer http://ustream.tv/channel/iss-hdev-payload best --player 'vlc -I dummy --video-wallpaper --no-video-title-show --noaudio'
    	#livestreamer http://www.ustream.tv/embed/9408562?html5ui best --player "cvlc --no-video" --http-proxy 192.168.11.103:8080 --https-proxy 192.168.11.103:8080 & livestreamer http://ustream.tv/channel/iss-hdev-payload best --player 'vlc -I dummy --video-wallpaper --no-video-title-show --noaudio' --http-proxy 192.168.11.103:8080 --https-proxy 192.168.11.103:8080
    done
fi
