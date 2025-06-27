# Corrosion Repair
This example is based on ongoing efforts to detect and repair corrosion in industrial environments using teams of autonomous systems. In this demo, we used a heterogeneous team composed of
1.  A wheeled robot equipped with sensors for initial surveying of the deployment environment;
2. A human supervisor using an augmented reality headset with a remote server used for evaluating corrosion detections made by the survey robot and sharing files with the downstream systems;
3. A quadruped robot tasked with performing surface coverage over detected corrosion using a spray-based coating to prevent its further development (a proxy laser device was used in place of this spray coating in this demonstration);
4. A static, high-reach manipulator system also tasked with performing surface coverage but capable of reaching much higher surfaces than the quadruped.

Once each set of configuration files is copied to the corresponding system, the whole system can be started by running
```bash
export CORAL_LIB="$(pwd)/lib"
```
followed by
```bash
coral launch
```
on each robot.

Many of the images used in this demonstration have not been made publicly available. Therefore, this example cannot be run easily (unlike [Hyla-SLAM](../hyla_slam/), for example), but is provided to show how Coral scales to complex systems.

<div align="center">
  <img src="./.asset/demo_team.JPG" width="80%">
</div>
