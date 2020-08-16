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
>  - `keyname` is the [AWS SSH key pair](https://console.amazonaws-us-gov.com/ec2/home?region=us-gov-west-1#KeyPairs) used to provision bastion and registry nodes
>  - `rhel_bastion_public_ip` is the public IP of your RHEL bastion
>  - `rhcos_private_registry_node_ip` is the Red Hat CoreOS (RHCOS) registry node private IP
>    

  0. Set Permissions on bundle(s)
```
  sudo chown -R $USER /tmp/bundle
```
  1. Push bastion SSH keys to RHEL bastion
```
  scp -i ~/.ssh/${keyname} ~/.ssh/${keyname}* ec2-user@${rhel_bastion_public_ip}:~/.ssh/
```
  2. Push artifact bundles to RHEL bastion
```
  rsync --progress -avzh /tmp/bundle -e "ssh -i ~/.ssh/${keyname}" ec2-user@${rhel_bastion_public_ip}:~
```
  3. SSH to the RHEL bastion
```
  ssh -i ~/.ssh/${keyname} ec2-user@${rhel_bastion_public_ip}
```
  4. Push artifact bundles to RHCOS private registry node
```
  rsync --progress -avzh bundle -e "ssh -i ~/.ssh/${keyname}" core@${rhcos_private_registry_node_ip}:~
```
  5. SSH to the RHCOS private registry node
```
  ssh -i ~/.ssh/${keyname} core@${rhcos_private_registry_node_ip}
```
  6. Extract bundles
```
  sudo mkdir -p /root/deploy/mirror
  sudo tar xv -f ${HOME}/bundle/koffer-bundle.openshift-*.tar         -C /root
  sudo tar xv -f ${HOME}/bundle/koffer-bundle.collector-operators.tar -C /root/deploy
  sudo tar xv -f ${HOME}/bundle/koffer-bundle.collector-apps.tar      -C /root/deploy/mirror
```
## Continue [High-Side Deploy]    
[Quay.io Image Pull Secret]:https://cloud.redhat.com/openshift/install/metal/user-provisioned
[High-Side Deploy]:https://codectl.io/docs/user-guide/deploy
