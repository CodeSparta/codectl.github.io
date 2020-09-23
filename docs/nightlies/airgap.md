---
layout: default
title: Airgap Artifact Walk
parent: nightlies
nav_order: 3
---

# Airgap Artifact Walk
> Valid transport strategies include:
>  - S3
>  - SCP
>  - Rsync
>  - Physical media (e.g. DVD)
>
> Glossary:
>  - `keyname` your [AWS SSH key pair](https://console.amazonaws-us-gov.com/ec2/home?#KeyPairs) for provisioning bastion and registry
>  - `rhcos_private_registry_node_ip` your Red Hat CoreOS (RHCOS) registry node [private IP](https://console.amazonaws-us-gov.com/ec2/home?#Instances)
>    

### Run on public facing bastion instance
  1. Push artifact bundles to RHCOS private registry node
```
  rsync --progress -avzh bundle -e "ssh -i ~/.ssh/${keyname}" core@${rhcos_private_registry_node_ip}:~
```
  2. SSH to the RHCOS private registry node
```
  ssh -i ~/.ssh/${keyname} core@${rhcos_private_registry_node_ip}
```
  3. Extract bundles
```
  sudo mkdir -p /root/deploy && sudo tar xv -f ${HOME}/bundle/koffer-bundle.*.tar -C /root
```
## Continue [High-Side Deploy]    
[Quay.io Image Pull Secret]:https://cloud.redhat.com/openshift/install/metal/user-provisioned
[High-Side Deploy]:https://codectl.io/docs/user-guide/deploy
