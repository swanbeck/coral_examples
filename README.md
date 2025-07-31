<div align="center">
    <img src="./.asset/coral.svg" width="20%">
</div>

# Coral Examples
This repo contains examples of practical applications that have been enabled by Coral. It is meant to show the general structure of Coral-composed systems and illustrate how even extremely complex multi-robot applications can be synthesized using just a few high-level configuration files.

Before getting started, please build the [Coral CLI](https://github.com/swanbeck/coral_cli.git).

---
# Index
Current examples include:

* [hyla_slam](./hyla_slam/): All containers used in this example are available on Dockerhub so it is the recommended example for users looking to see Coral in action. It can be easily run by following the instructions in the [nested README](./hyla_slam/README.md).

* [corrosion_mitigation](./corrosion_mitigation/): An example of an industrial corrosion survey and repair task using a heterogeneous team of systems including an initial survey robot, a human using an augmented-reality headset enabled by a server, and a quadruped robot and high-reach static manipulator robot tasked with taking reparative action on detected corrosion. This application uses many images that have not been made publicly available and therefore cannot be run easily, but is provided to show how Coral scales to complex and multi-agent systems.
