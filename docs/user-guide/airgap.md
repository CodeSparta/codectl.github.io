---
layout: default
title: Airgap Artifact Walk
parent: User Guide
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

### Run on "low side" public facing bastion
  1. Push artifact bundles to "high side" RHCOS private registry node
```
  rsync --progress -avzh bundle -e "ssh -i ~/.ssh/${keyname}" core@${rhcos_private_registry_node_ip}:~
```
  2. SSH to the "high side" RHCOS CloudCtl private deployment services node
```
  ssh -i ~/.ssh/${keyname} core@${rhcos_private_registry_node_ip}
```
  3. Extract bundles
```
 for i in $( ls ${HOME}/bundle/* ); do sudo tar xvf ${HOME}/$i -C /root ; done
```
## Continue [High-Side Deploy]    
[Quay.io Image Pull Secret]:https://cloud.redhat.com/openshift/install/metal/user-provisioned
[High-Side Deploy]:https://codectl.io/docs/user-guide/deploy
