# Hyla-SLAM
This example uses [Hyla-SLAM](https://github.com/swanbeck/hyla_slam.git) to generate a point cloud map using a ROS2 bag file. It uses the [colosseo_test0_00](http://srrg.diag.uniroma1.it/vbr_slam/colosseo/colosseo_test0/colosseo_test0_00.bag) bag from the [VBR dataset](https://rvp-group.net/slam-dataset.html). 

Before running, check the [.env](./.env) file and change the `ARCH` environment variable to match your system (either `amd64` or `arm64` at the time of writing). Then, to run the example, use the included [run.sh](./run.sh) script:
```
bash run.sh
```
which will automatically download the bag, convert it to ROS2 (using the Python [rosbags](https://pypi.org/project/rosbags/) library), and start the Coral instance. All Coral images for this example are available on Dockerhub and will be automatically pulled by Coral if not found locally. 
```
📦 Extracting dependencies from image swanbeck/coral-bag_player:humble-amd64 for service bag_player
📦 Extracting dependencies from image swanbeck/coral-hyla_slam:humble-amd64 for service hyla_slam
📦 Extracting dependencies from image swanbeck/coral-watertender:humble-amd64 for service watertender
📦 Extracting dependencies from image swanbeck/coral-dynamic_runner:humble-amd64 for service runner
Writing compose file /home/steven/workspace/research/testing/coral_examples/hyla_slam/lib/compose/coral-1750974833831974735.yaml
Starting instance coral-1750974833831974735
🎮 Starting drivers (1): [bag_player]
[+] Running 1/1
 ✔ Container coral-1750974833831974735-bag_player-1  Started  
🧠 Starting skillsets (2): [hyla_slam watertender]
[+] Running 2/2
 ✔ Container coral-1750974833831974735-watertender-1  Started 
 ✔ Container coral-1750974833831974735-hyla_slam-1    Started
🚀 Starting executors (1): [runner]
Delaying 1s before starting executors...
[+] Running 1/1
 ✔ Container coral-1750974833831974735-runner-1  Started
```

Once the runner process exits, the running skillsets can be killed with `Ctrl + C`:
```
runner               | [runner-1] [INFO] [1750974917.912054850] [runner]: SUCCESS!
runner               | [INFO] [runner-1]: process has finished cleanly [pid 51]
^C
Interrupt received. Forcing shutdown...
[+] Killing 2/2
 ✔ Container coral-1750974833831974735-watertender-1  Killed
 ✔ Container coral-1750974833831974735-hyla_slam-1    Killed
[+] Running 4/4
 ✔ Container coral-1750974833831974735-watertender-1  Removed 
 ✔ Container coral-1750974833831974735-hyla_slam-1    Removed 
 ✔ Container coral-1750974833831974735-bag_player-1   Removed 
 ✔ Container coral-1750974833831974735-runner-1       Removed
Cleaning up instance coral-1750974833831974735
✅ Done
```

Point cloud map data will be saved in the [data/](./data) directory and will resemble below.
<div align="center">
  <img src="./.asset/colosseo.svg" width="100%">
</div>

Users are referred to [Hyla-SLAM](https://github.com/swanbeck/hyla_slam.git) for interpreting this output.
