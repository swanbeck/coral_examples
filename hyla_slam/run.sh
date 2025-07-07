#!/bin/bash

ROS1_BAG="./bags/colosseo_test0_00.bag"
ROS2_BAG="./bags/colosseo_test0_00"
URL="http://srrg.diag.uniroma1.it/vbr_slam/colosseo/colosseo_test0/colosseo_test0_00.bag"

# === Get ROS2 bag ===
if [ ! -d "$ROS2_BAG" ]; then
    # === Check for ROS1 bag ===
    echo "ROS2 bag '$ROS2_BAG' does not exist. Checking for ROS1 bag '$ROS1_BAG'..."
    if [ ! -f "$ROS1_BAG" ]; then
        echo "ROS1 bag '$ROS1_BAG' not found. Downloading..."
        mkdir -p ./bags
        curl -o "$ROS1_BAG" "$URL"
        if [ $? -ne 0 ]; then
            echo "Download failed!"
            exit 1
        fi
    else
        echo "ROS1 bag '$ROS1_BAG' already exists."
    fi
    # === Convert ROS1 bag to ROS2 ===
    if ! command -v rosbags-convert &> /dev/null; then
        echo "rosbags-convert command not found. Please install it (pip install rosbags) then run this script again."
        exit 1
    fi
    echo "Converting ROS1 bag to ROS2..."
    rosbags-convert --src "$ROS1_BAG" --dst "$ROS2_BAG"
    if [ $? -ne 0 ]; then
        echo "Conversion failed!"
        exit 1
    fi
fi

# === Run Coral ===
coral launch
