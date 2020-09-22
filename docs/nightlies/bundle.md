---
layout: default
title: Low Side Bundle
parent: nightlies
nav_order: 2
---

# Low-Side Artifact Bundle
### Koffer Collector Plugins
  - [Infrastructure]    
  - [Operators]    
  - [Applications]    
    
### Run on public facing bastion instance
  0. Ensure [Podman](https://podman.io/getting-started/installation.html) is installed
  1. Create Platform Artifacts Staging Directory
```
 mkdir -p $(pwd)/bundle ;
```
  2. Build OpenShift Infrastructure, Operators, and App Bundles
```
sudo podman run -it --rm --pull always \
    --volume $(pwd)/bundle:/root/deploy/bundle:z \
  docker.io/codesparta/koffer bundle \
    --config https://codectl.io/docs/config/stable/sparta.yml
```
    
  3. Paste [Quay.io Image Pull Secret] when prompted
  3. Review your artifacts
```
 du -sh $(pwd)/bundle/*
```
    
## Continue [Airgap Artifact Walk](https://codectl.io/docs/user-guide/airgap)    
[Operators]:https://github.com/CodeSparta/collector-operators
[Applications]:https://github.com/CodeSparta/collector-apps
[Infrastructure]:https://github.com/CodeSparta/collector-infra
[Quay.io Image Pull Secret]:https://cloud.redhat.com/openshift/install/metal/user-provisioned
