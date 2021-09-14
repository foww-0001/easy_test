base_dir="/home/${USER}"
data_dir="$base_dir/easy_data"
cur_dir=$(cd "$(dirname "$0")"; pwd) 

declare -A dataset_urls
dataset_urls=([case001]=http://118.31.19.101:8080/dataset/cls/classnet_flower_2class.zip 
              [case002]=http://118.31.19.101:8080/dataset/cls/classnet_flower_17class_jpg.zip
              [case003]=http://118.31.19.101:8080/dataset/cls/classnet_flower_2class.zip
              [case004]=http://118.31.19.101:8080/dataset/cls/classnet_flower_17class_jpg.zip)

# create easy_data dir
rm -rf $data_dir
./data_dir_create.sh
./Reset.sh

echo "Downloading dataset..."
wget -P $data_dir ${dataset_urls[$1]}

unzip -d $data_dir $data_dir/*.zip
mv $data_dir/*/JPEGImages $data_dir/

./ClassNET_tool.sh
python3 arm_config.py -t ClassNET -i $data_dir/ImageSets/train.txt
python3 test_image_create.py -v $data_dir/ImageSets/val.txt