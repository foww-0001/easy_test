base_dir="/home/${USER}"
data_dir="$base_dir/easy_data"
cur_dir=$(cd "$(dirname "$0")"; pwd) 

declare -A dataset_urls
dataset_urls=([case013]=http://118.31.19.101:8080/dataset/seg/segnet_nut_2class.zip
              [case014]=http://118.31.19.101:8080/dataset/seg/segnet_nut_2class.zip
              [case016]=http://118.31.19.101:8080/dataset/seg/segnet_led_2class_wrong_label.zip
              [case018]=http://118.31.19.101:8080/dataset/seg/segnet_led_2class_wrong_label.zip)

./Reset.sh

if [ $1 == case013 ] || [ $1 == case014 ] || [ $1 == case016 ] || [ $1 == case018 ]; then
    # create easy_data dir
    rm -rf $data_dir
    ./data_dir_create.sh

    echo "Downloading dataset..."
    wget -P $data_dir ${dataset_urls[$1]}

    unzip -d $data_dir $data_dir/*.zip
    mv $data_dir/*/JPEGImages $data_dir/*/SegmentLabel $data_dir/
fi

./SegNET_tool.sh
python3 arm_config.py -t SegNET -i $data_dir/ImageSets/train.txt
python3 test_image_create.py -v $data_dir/ImageSets/val.txt
