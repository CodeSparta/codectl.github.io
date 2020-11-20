---
layout: default
title: Konductor
parent: Containers
nav_order: 2
---

# Konductor Engine
## Maestro Plugin Driver
![GitHub Workflow Status](https://img.shields.io/github/workflow/status/redshiftofficial/Konductor/DockerHubBuild?label=Container%20Build&style=flat-square)
![DockerHub Pulls](https://img.shields.io/docker/pulls/redshiftofficial/one?label=DockerHub%20Pulls&style=flat-square)    
Find on [quay.io](https://hub.docker.com/r/redshiftofficial/one)  &  [Quay.io](https://quay.io/repository/redshiftofficial/one)    
Find on [GitHub](https://github.com/redshiftofficial/Konductor)    
## About
Konductor provides a human workspace for DevOps dependency & control.
    
## Problem
Dependencies & prerequisites quickly become complex as the DevOps toolchain grows. Additional 
complexity stems from maturity as dependency version control comes into play. This common 
expamsion results in frequent & high cycle consumption troubleshooting & support engagement 
as well as rapid tribal knowledge dependence, and or large and hard to maintain documentation 
efforts which quickly become dated as the product lifecycle outpaces documentation team bandwidth.
    
## Solution
Konductor is an intentionally designed 'multi purpose container' antipattern.
Optimally containers most typically should build on the philosophy of 'one process per container'. 
Per this standard, Konductor offers 'one human process per container' and provides
the dependencies required for human task accomplishment.
    
## Features
Konductor is a SSH & TMUX enabled [UBI8] based Infrastructure As Code [(IaC)] 
development & deployment sandbox which includes multiple cloud provider tools & devops 
deployment utilities. Konductor is a core compoment of the [CloudCtl] bastion [Podman]
container [Pod], and is intended for use in both typical & restricted or airgap network environments.
    
```txt
Public Binaries Installed:
  - jq, oc, helm, registry, gcloud, kubectl, terraform, openshift-install

Yum Packages Installed:
  - git, vim, tree, tmux, rsync, bsdtar, podman, openssl, ncurses, nmap-ncat, python3-pip, openssh, ansible

Pip Packages installed:
  - ansible, awscli, boto3
```
    
## Dependencies 
##### Supported Distributions
  - [Fedora] 32+
  - [CentOS] 8.0+
  - [RedHat] 8.0+
  - [Ubuntu] 20.04+
  - [Fedora CoreOS]
  - [RedHat CoreOS]
##### Install Dependencies
  - [Install Podman]

## Usage
#### A) [Run with CloudCtl Ansible Automation](https://github.com/redshiftofficial/CloudCTL)
#### B) Run Manually:
##### Create local path persisence directory
```sh
mkdir ${HOME}/.red/.run 2>/dev/null
```
##### Start CloudCtl Pod
```sh
sudo podman pod create                \
    --name cloudctl                   \
    --publish 2022:2022               \
    --pod-id-file ~/.red/.run/pod.id
```
##### Run ConainerOne
```sh
sudo podman run \
    --detach              --name one             \
    --pod cloudctl        --hostname one         \
    --privileged          --pull always          \
    --restart on-failure  --workdir /root/deploy \
    --entrypoint=/bin/entrypoint                 \
    --volume ${HOME}/.red:/root/deploy:z        \
  quay.io/cloudctl/konductor:latest
```
##### Exec directly:
```sh
sudo podman exec -it one connect
```
##### Or SSH into Konductor:
```sh
cat ~/.ssh/id_rsa.pub >> ~/.red/.secrets.d/ssh/user/authorized_keys
ssh -p 2022 root@localhost
```
## Removal & Cleanup
```sh
sudo podman rm --force one
sudo podman rmi --force one:latest
sudo podman pod rm --force cloudctl
sudo rm -rf ${HOME}/.red
```

[Pod]:https://kubernetes.io/docs/concepts/workloads/pods/pod
[UBI8]:https://www.redhat.com/en/blog/introducing-red-hat-universal-base-image
[(IaC)]:https://www.ibm.com/cloud/learn/infrastructure-as-code
[CloudCtl]:https://github.com/redshiftofficial/CloudCTL
[Podman]:https://docs.podman.io/en/latest
[Install Podman]:https://podman.io/getting-started/installation
[Fedora]:https://getfedora.org
[Ubuntu]:https://ubuntu.com/download
[CentOS]:https://www.centos.org/download
[RedHat]:https://access.redhat.com/downloads
[Fedora CoreOS]:https://getfedora.org/en/coreos?stream=stable
[RedHat CoreOS]:https://coreos.com/
