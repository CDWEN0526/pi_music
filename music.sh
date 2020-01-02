#!/bin/bash
cd `dirname $0`
while true;do 
echo -e "\n==树莓派自动采集音乐程序=="
echo -e "  1、切换歌曲\n  2、删除歌曲\n  3、调整音量\n  4、播放音乐\n  5、采集音乐\n  6、停止播放\n  7、退出系统\n"
read -p "请输入您的操作：" number
echo -e  "\n=======开始执行操作=======\n"
case $number in 
"1")
./next_mp3.sh
sleep 2
;;
"2")
./rm_mp3.sh
sleep 2
;;
"3")
./yin.sh
;;
"4")
mp3_num=`ps aux| grep mp3.sh | grep -v grep | wc -l`
if [ $mp3_num == 0 ];then
sudo nohup ./mp3.sh &> /dev/null &
else
echo "正在播放，请勿重复执行播放..."
fi
sleep 2
;;
"5")
echo "开始采集音乐，请稍等..."
sudo ./mp3_3.py
sudo ./mp3_1.py
sudo ./mp3_2.py
sudo ./mp3_4.py
sudo ./mp3_5.py
sudo ./mp3_12.py
sudo ./mp3_14.py
sudo ./kill_mp3.sh
sleep 3
;;
"6")
sudo ./kill_all_mp3.sh
echo "关闭播放"
exit 0
;;
"7")
echo "退出后台运行..."
exit 0
;;
*)
echo "异常操作..."
sleep 2
;;
esac
clear
done

