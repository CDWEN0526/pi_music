#!/bin/bash
path=`ps aux | grep mplayer | grep -v grep | awk -F 'mplayer' '{print $2}' | grep -v print`
sudo rm -rf ${path}
echo "已删除${path}"
