# ISS Background Streaming

Script for watching the ISS (International Space Station) streaming via VLC in the background. 


## Getting Started

All that you need to do is run the script and enjoy. And if you want to go further you could add a desktop launcher.

### Prerequisites

Which things you need to install the software and how to install them:

#### 1. streamlink

- UBUNTU
```
sudo apt-get install streamlink
```

- CENTOS
```
pip install pyopenssl yotta
yum install epel-release
yum install python-pip
pip install streamlink
pip uninstall pyOpenSSL #It is due an error with SSL library
```

#### 2. vlc

- UBUNTU
```
sudo apt-get install vlc
```

- CENTOS
```
yum install https://download1.rpmfusion.org/free/el/rpmfusion-free-release-7.noarch.rpm
yum install vlc
```

### Installing

All you have to do is downloand the script. Give it execution permission:

```
chmod +x issBackgroundStreaming.sh
```

And then run the script

```
./issBackgroundStreaming.sh
```

### Launcher

If you prefer to run the script in an icon launcher there are:

```
earth.png
iss.desktop
```

Files to do it. The only thing that you have to do is put the "iss.desktop" in the path "/home/xxxxx/.local/share/applications/" and modify the file paths to the image and the script:

iss.desktop:
```
Icon=/home/xxxxx/ISS/earth.png
Exec=/home/xxxxx/ISS/issBackgroundStreaming.sh
```


## How it works

The script has been created for having only one instance. It works like **switch on/off**, if you run the script again you will stop the instance that is already running.

In the case of losing the internet connection, the programme will try to connect again in the following 60 seconds.

## Next steps
1. If the internet connection is lost, run a VLC background with a local image.
2. Do this for Windows.
3. Proxy: make it work via proxy.