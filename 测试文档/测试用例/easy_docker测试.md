easy_docker库测试
==================

## 测试概述

### 目的
测试docker环境正常无误。

### 测试范围
测试涉及easy_docker(1.0), easy_sample_mark（0.1）, easy_ai（0.1）, easy_perception（0.1）的整体测试。

## 测试计划执行情况
#### 1. 安装软件
easy_docker环境编译：[docker镜像编译及制作流程](https://github.com/MiniBullLab/easy_docker/blob/master/docs/docker%E9%95%9C%E5%83%8F%E7%BC%96%E8%AF%91%E5%8F%8A%E5%88%B6%E4%BD%9C%E6%B5%81%E7%A8%8B.md)

#### 2. 软件使用方法
docker安装完后，docker使用方式：

- 启动docker镜像
```
./scripts/run/docker_start.sh workspace
```
- 进入docker镜像
```
./scripts/run/docker_into.sh workspace
```
进入镜像后会在home目录下生成easy_data目录，将easy_sample_mark, easy_ai, easy_perception分别clone到easy_data目录下。

easy_sample_mark编译：[docker环境下编译与运行](https://github.com/MiniBullLab/easy_sample_mark/blob/develop/docs/docker%E7%8E%AF%E5%A2%83%E4%B8%8B%E7%BC%96%E8%AF%91%E4%B8%8E%E8%BF%90%E8%A1%8C.md)。
easy_sample_mark使用：操作视频在百度网盘中。

easy_ai：下载预训练模型[data](http://118.31.19.101:8080/easy_tools/data_v3.zip)解压后放到easy_ai/easy_tools目录下。


### 测试环境与配置

| 资源名称 | 配置 | 备注 |
| :------: | :------ | :------ | 
| 带有gpu的服务器 | Ubuntu18.04,4T硬盘,128G内存,12G独显 | |
| 安霸cv22芯片 | linux系统内核4.6，RAM2G，ROM8G | |

### 测试用例表格

| 测试用例标识符 | 测试用例名称 | 详细说明 | 备注 |
| :------: | :------ | :------ |  :------ | 
| docker_case001 | 检测任务标注 | 标注数据[饺子数据](http://118.31.19.101:8080/dataset/det/denet_dumpling_1class_bmp_xml.zip)（1类，jpg格式），对图片中的饺子进行拉框操作，标注后结果正确保存到Annotations文件夹中。| |
| docker_case002 | 分割任务标注 | 标注数据[易拉罐底部气泡数据](http://118.31.19.101:8080/dataset/seg/segnet_can_2class_jpg.zip)（2类，jpg格式），对易拉罐底部的气泡进行多边形标注操作，标注后结果正确保存到Annotations文件夹中。| |
| docker_case003 | OCR任务标注 | 标注数据[集装箱数据](http://118.31.19.101:8080/dataset/seg/segnet_can_2class_jpg.zip)（jpg格式），对集装箱字符多边形标注操作，并注释字符内容，标注后结果正确保存到Annotations文件夹中。| |
| docker_case004 | 分割图生成 | 分割标注后的结果生成mask图片，结果保存在SegmentLabel文件夹中。| |
| docker_case005 | 视频转化为图片 | | |
| docker_case006 | 图片格式转换 | | |
| docker_case007 | 分类任务训练 | 训练数据集为[花朵数据](http://118.31.19.101:8080/dataset/cls/classnet_flower_17class_jpg.zip)（17类，jpg格式），运行easy_tools的脚步文件ClassNet.sh进行训练，训练生成classnet.bin文件。| |
| docker_case008 | 检测任务训练 | 训练数据集为[水果数据](http://118.31.19.101:8080/dataset/det/denet_fruit_4class.zip)（4类，混合格式（jpg,png,bmp）），运行easy_tools的脚步文件DeNet.sh进行训练，训练生成denet.bin文件。| |
| docker_case009 | 分割任务训练 | 训练数据集为[螺母数据](http://118.31.19.101:8080/dataset/seg/segnet_nut_2class.zip)（2类，混合格式（jpg,png,bmp）），运行easy_tools的脚步文件SegNet.sh进行训练，训练生成segnet.bin文件。| |
| docker_case010 | 字符识别任务训练 | 训练数据集为[花朵数据](http://118.31.19.101:8080/dataset/cls/classnet_flower_2class.zip)（2类，混合格式（jpg,png,bmp）），运行easy_tools的脚步文件TextNet.sh进行训练，训练生成TextNet.bin文件。| |
| docker_case011 | OneClass任务训练 | 训练数据集为[花朵数据](http://118.31.19.101:8080/dataset/cls/classnet_flower_2class.zip)（2类，混合格式（jpg,png,bmp）），运行easy_tools的脚步文件OneClassNet.sh进行训练，训练生成OneClassNet.bin文件。| |
| docker_case012 | 分类任务部署 | 通过easy_perception编译生成classnet_test，将训练得到的classnet.bin以及测试图片一起放到sd卡中，插入AMBA的板子后，上电运行classnet_test，结果保存在cls_result.txt中。| |
| docker_case013 | 检测任务部署 | 通过easy_perception编译生成denet_test，将训练得到的denet.bin以及测试图片一起放到sd卡中，插入AMBA的板子后，上电运行denet_test，结果保存在det2d_result.txt中。| |
| docker_case014 | 分割任务部署 | 通过easy_perception编译生成segnet_test，将训练得到的segnet.bin以及测试图片一起放到sd卡中，插入AMBA的板子后，上电运行segnet_test，结果保存在seg_result.txt中。| |
| docker_case015 | 字符识别任务部署 | 通过easy_perception编译生成textnet_test，将训练得到的TextNet.bin以及测试图片一起放到sd卡中，插入AMBA的板子后，上电运行textnet_test，结果保存在text_result.txt中。| |
| docker_case016 | OneClass任务部署 | 通过easy_perception编译生成one_class_test，将训练得到的OneClassNet.bin以及测试图片一起放到sd卡中，插入AMBA的板子后，上电运行one_class_test，结果保存在one_class_result.txt中。| |