---
layout: default
title: Utility Container
parent: Sparta 2
nav_order: 1
---
## utility container Overview

The utility container is the successor to the Konductor project. The container is a human friendly Red Hat UBI8 based Infrastructure-As-Code (IaC) development & deployment runtime which includes multiple cloud provider tools & DevOps deployment utilities. The utility container exists to deploy out the following containerized services in a disconnected environment by utilizing podman.

## Customizable
The build container is meant to run with the latest OpenShift packages and latest Ansible core versions. To modify OpenShift version packages you modify the ARG OCP_LIST in the Dockerfile to point to your specific mirror tar.gz files.

### Services   
  - Ansible
  - Openshift-installer
  - OC command line
  - kubectl
  - oc-mirror
  - mirror-registry
  - awscli

## Build container
On an Internet connected box to build the container.

```
git clone https://github.com/CodeSparta/utility
cd Utility/containers/utility
podman build -t utility .
```

## Test or utilize the container

The commands below will start the container locally and allow the user execution into the container.
```
podman run -d -it --name utility localhost/utility:latest
podman exec -it utility /bin/bash
```
