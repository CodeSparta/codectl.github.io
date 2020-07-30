---
layout: default
title: Koffer
parent: Containers
nav_order: 1
---

# Koffer
## Artifact Rake & Bundle Appliance
## About

Koffer is an ansible automation runtime for raking in various artifacts required 
to deploy Kubernetes Infrastructure, Pipelines, and applications into airgaped 
environments. Koffer is strictly an ansible consumer and requires run against an 
external repo volume cloned or mounted to `/root/koffer`.

Compatibile Artifact Types:
  - git
  - terraform 
    - performs terraform init at time of capture
  - docker images
    - Pulls & hydrates built in docker registry service to persistent local path
    - high side is served with generic docker registry:2 container
  - capability to add more artifact types with custom collector ansible plugins

## Product
Koffer produces a standardized tarball on the host at `/tmp/koffer/bundle/koffer-bundle.*.tar.xz`

## Example Run
### 1. Create Koffer Bundle Directory
  - example with [koffer-infra](https://github.com/RedShiftOfficial/collector-infra) ansible automation    
    
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
