---
layout: default
title: Bundle
parent: User Guide
nav_order: 1
---

# Bundle
## Red Hat OpenShift 4.5+ | Low Side | Artifact Collection
#### Koffer Collector Plugins [Infrastructure] - [Operators] - [Applications]   

#### 1. Create Platform Artifacts Staging Directory
```
 mkdir -p /tmp/platform ;
```
#### 2. Build Openshift Infrastructure Bundle
  - Paste [Quay.io Image Pull Secret] when prompted    
    
```
 sudo podman run -it --rm \
    --volume /tmp/platform:/root/deploy:z \
  docker.io/codesparta/koffer -branch latest
```
    
#### 3. Build Application Images Bundle
```
sudo podman run -it --rm \
    --volume /tmp/platform:/root/deploy:z
  docker.io/codesparta/koffer -repo collector-apps
```
#### 4. Build Operator Selection Bundle
```
 sudo podman run -it --rm \
     --privileged --device /dev/fuse \
     --entrypoint=/usr/bin/entrypoint \
     --volume /tmp/platform:/root/deploy:z \
   docker.io/ocpredshift/koffer:nightlies \
   https://github.com/CodeSparta/collector-operators.git master
```
    
    
#### 5. Continue [Artifacts AirGap Pivot](./PIVOT.md)

------------------------------------------------------------------------------
# Demo
![bundle](./web/bundle.svg)

[Operators]:https://github.com/CodeSparta/collector-operators
[Applications]:https://github.com/CodeSparta/collector-apps
[Infrastructure]:https://github.com/CodeSparta/collector-infra
[Quay.io Image Pull Secret]:https://cloud.redhat.com/openshift/install/metal/user-provisioned
