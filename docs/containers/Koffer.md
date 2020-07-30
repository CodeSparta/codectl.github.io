---
layout: default
title: Koffer
parent: Containers
nav_order: 1
---

# Koffer Engine
## Artifact Rake & Bundle Appliance
## About

Koffer Engine is an ansible automation runtime for raking in various artifacts
required to deploy [Red Hat] [UPI] [OpenShift] Infrastructure, Pipelines, and
applications into airgaped environments. Koffer is strictly an empty engine and
is designed to run against compliant external collector plugin repos.

Compatibile Artifact Types:
  - git
  - terraform 
    - performs terraform init at time of capture
  - docker images
    - Pulls & hydrates built in docker registry service to persistent local path
    - high side is served with generic docker registry:2 container
  - capability to add more artifact types with custom collector ansible plugins

## Product
Koffer produces a CloudCtl ready archive at `/tmp/koffer/bundle/koffer-bundle.*.tar.xz`

## Example Run
  - example with [koffer-infra](https://github.com/RedShiftOfficial/collector-infra) collector plugin    
    
### 1. Create Koffer Bundle Directory
```
mkdir /tmp/platform
```
    
### 2. Run Koffer
```
 sudo podman run --name koffer \
    --volume /tmp/platform:/root/deploy:z     \
    --rm -it --entrypoint=/usr/bin/entrypoint \
  docker.io/ocpredshift/koffer:latest         \
    https://github.com/RedShiftOfficial/collector-infra.git latest
```
### 3. Verify Bundle
```
 du -sh /tmp/platform/bundle/*
```
    
[UPI]:https://www.openshift.com/blog/deploying-a-upi-environment-for-openshift-4-1-on-vms-and-bare-metal
[Red Hat]:https://www.redhat.com
[OpenShift]:https://www.openshift.com
