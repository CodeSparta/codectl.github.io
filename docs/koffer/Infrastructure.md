---
layout: default
title: Infrastructure
parent: Collector Plugins
nav_order: 1
---

# Infrastructure
## OpenShift Infrastructure Deployment Artifacts
This automation provides a unified and standardized tarball of artifacts for
airgap infrastructure deployment tasks. Included is the restricted environment
delivery services `CloudCtl` pod & `start-cloudctl.sh` script.

Features:
  - High side sha256 verification of artifacts bundle before standup
  - High side artifact delivery via script to run `cloudctl` podman pod running:
    - Nginx for serving CoreOS Ignition files
    - Generic Docker Registry:2 for serving pre-hydrated image content
    - ContainerOne user automation deployment and development workspace
  - Bastion host support for CoreOS or any Podman capable distribution
  - Low side injestion direct to "pre-hydrated" registry stateful path

## Instructions:
### 1. Run Infrastructure Collector with Koffer Engine
```
 mkdir -p /tmp/platform ; \
 sudo podman run \
     --volume /tmp/platform:/root/deploy:z     \
     --rm -it --entrypoint=/usr/bin/entrypoint \
   docker.io/containercraft/koffer:latest      \
   https://repo1.dsop.io/dsop/redhat/platformone/ocp4x/ansible/collector-infra.git latest

```
### 2. Move Koffer Bundle to target host `${USER}` directory
# [Developer Docs & Utils](./dev)
# Demo
![bundle](./web/bundle.svg)
[Koffer]:https://github.com/containercraft/Koffer
