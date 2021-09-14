base_dir="/home/${USER}"
data_dir="$base_dir/easy_data"
cur_dir=$(cd "$(dirname "$0")"; pwd) 

declare -A dataset_urls
dataset_urls=([case005]=http://118.31.19.101:8080/dataset/det/denet_fruit_4class.zip 
              [case006]=http://118.31.19.101:8080/dataset/det/denet_berkeley_10class_jpg.zip
              [case007]=http://118.31.19.101:8080/dataset/det/denet_fruit_4class.zip
              [case008]=http://118.31.19.101:8080/dataset/det/denet_berkeley_10class_jpg.zip)

./Reset.sh

if [ $1 == case005 ] || [ $1 == case006 ] || [ $1 == case007 ] || [ $1 == case008 ]; then
    # create easy_data dir
    rm -rf $data_dir
    ./data_dir_create.sh
    
    echo "Downloading dataset..."
    wget -P $data_dir ${dataset_urls[$1]}

    unzip -d $data_dir $data_dir/*.zip
    mv $data_dir/*/JPEGImages $data_dir/*/Annotations $data_dir/
fi

./DeNET_tool.sh
python3 arm_config.py -t DeNET -i $data_dir/ImageSets/train.txt
python3 test_image_create.py -v $data_dir/ImageSets/val.txt
