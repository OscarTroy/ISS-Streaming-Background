#!/bin/bash
PS="ps -ef"
Icon="~/Imágenes/earth.jpg"
var_proxy_http= echo "$http_proxy"
var_proxy_https= echo "$https_proxy"

#if echo "$PS"|grep -q 'vlc -I dummy';
#    then notify-send -i $Icon "  ISS background OFF" \ "\"Houston, We've Got a Problem !\"";
 #   kill $(ps aux | grep 'vlc -I dummy' | awk '{print $2}')
#else 
	while (! echo "$PS"| grep -q 'vlc -I dummy')
	do
#	notify-send -i $Icon " ISS background ON" \ "Dowloading data from ISS...";
#livestreamer http://ustream.tv/channel/iss-hdev-payload best --player 'vlc -I dummy --video-wallpaper --no-video-title-show --noaudio'
		if [-z $var_proxy_http]; then
			livestreamer http://ustream.tv/channel/iss-hdev-payload best --player 'vlc -I dummy --video-wallpaper --no-video-title-show --noaudio' --http-proxy \"$var_proxy_http\" --https-proxy \"$var_proxy_https\"
		else 
			livestreamer http://ustream.tv/channel/iss-hdev-payload best --player 'vlc -I dummy --video-wallpaper --no-video-title-show --noaudio'
		fi
    #livestreamer http://www.ustream.tv/embed/9408562?html5ui best --player "cvlc --no-video" & livestreamer http://ustream.tv/channel/iss-hdev-payload best --player 'vlc -I dummy --video-wallpaper --no-video-title-show --noaudio'
    #livestreamer http://www.ustream.tv/embed/9408562?html5ui best --player "cvlc --no-video" --http-proxy 192.168.11.103:8080 --https-proxy 192.168.11.103:8080 & livestreamer http://ustream.tv/channel/iss-hdev-payload best --player 'vlc -I dummy --video-wallpaper --no-video-title-show --noaudio' --http-proxy 192.168.11.103:8080 --https-proxy 192.168.11.103:8080
	done
#fi
