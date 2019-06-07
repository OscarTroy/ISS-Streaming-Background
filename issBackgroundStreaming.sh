#!/bin/bash

if pgrep -f 'vlc -I dummy'; then
	notify-send -u critical -t 3 -i $(dirname "${BASH_SOURCE[0]}")/earth.png "ISS Background Streaming" \ "Houston, We\'ve Got a Problem! \n ISS streaming is already running \n Turning off all systems"
	kill -9 $(ps aux | grep 'vlc -I dummy' | awk '{print $2}')
	kill -9 $(ps aux | grep 'issBackgroundStreaming.sh' | awk '{print $2}')
else 
	#Retrying when the connection is lost
	while (true)
	do
		if ! pgrep -f 'vlc -I dummy'; then
			notify-send -u critical -t 3 -i $(dirname "${BASH_SOURCE[0]}")/earth.png "ISS Background Streaming" \ "Turning ON all systems \n Dowloading data from ISS..."
			streamlink http://www.ustream.tv/channel/iss-hdev-payload best --player 'vlc -I dummy --video-wallpaper --no-video-title-show --noaudio'
    	fi
    	sleep 60
    done
fi
