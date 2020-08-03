---
layout: default
title: AirGap
parent: User Guide
nav_order: 2
---

# AirGap
## Red Hat OpenShift 4.5+ | Artifacts AirGap Pivot
#### 0. Move all bundles to high side bastion ${HOME} directory
#### 1. Extract Infrastructure Bundle
```
 sudo mkdir -p /root/deploy/mirror ;
```
#### 2. Extract Infrastructure Bundle
```
 sudo tar xv -f ${HOME}/koffer-bundle.openshift-*.tar -C /root
```
#### 3. Extract Operators Bundle
```
 sudo tar xv -f ${HOME}/koffer-bundle.collector-operators.tar -C /root/deploy
```
#### 4. Extract Application Images Bundle
```
 sudo tar xv -f ${HOME}/koffer-bundle.collector-apps.tar -C /root/deploy/mirror
```
#### 5. Continue High Side: [Konductor Deploy Cluster]

[Quay.io Image Pull Secret]:https://cloud.redhat.com/openshift/install/metal/user-provisioned
[Konductor Deploy Cluster]:https://codectl.io/docs/user-guide/deploy
