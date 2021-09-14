# EasyGPT使用及测试
---
## 安装EasyGPT
根据边辕视觉用户手册EasyGPT-User-Manual_CN_v1.4.0-release_20200608.pdf进行安装，用户手册存放在百度网盘/参考资料/边辕视觉下面。

## 连通相机
通过相机的网线连接电脑，修改网络的IP地址(IP地址：10.0.0.10，子网掩码：255.255.255.0，默认网关：10.0.0.1)，通过终端输入命令ping 10.0.0.2，看是否可以和相机进行通信。然后打开EasyGPT软件，点击Tools->Camera Setup，点击连接相机，则和相机连接成功，如果连接不成功可以去边辕视觉用户手册中寻找解决方法。连接成功后，点击Tools->设置，参照下图进行设置：
![2](https://user-images.githubusercontent.com/14048368/119222598-c64d3780-bb27-11eb-9151-74258cc70899.PNG)


## GPT实例编译
打开 http://118.31.19.101:8080 服务器，下载easy_gpt对应的[gpt文件](http://118.31.19.101:8080/easy_gpt/), [json文件](http://118.31.19.101:8080/easy_gpt/)以及对应的测试图片。打开EasyGPT软件，点击File->Open a design，分别导入不同任务的gpt，点击多图像加载，在旁边的输入文件下面输入最终sdcard中的图片路径。点击网络模块，在旁边的推理文件下面输入最终sdcard中的.bin路径，参数文件下面输入最终sdcard中的.json路径。

最后点击For循环，在Event type下面选择Mouse event(即鼠标触发)。点击编译，过渡到相机。

## 结果可视化
通过相机hdmi接口连接到显示屏，运行Runtime GPT，通过点击鼠标可以查看不同图片得到的检测结果。
