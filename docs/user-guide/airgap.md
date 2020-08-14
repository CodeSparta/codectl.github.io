---
layout: default
title: AirGap
parent: User Guide
nav_order: 3
---

# AirGap
## Artifact Walk
    
>
> Valid strategies include `{scp,rsync,s3,physical media}`
>    

  0. Set Permissions on bundle(s)
```
  sudo chown -R $USER /tmp/bundle
```
  1. Push bastion ssh keys to rhel bastion
```
  scp -i ~/.ssh/${keyname} ~/.ssh/${keyname}* ec2-user@${rhel_bastion_public_ip}:~/.ssh/
```
  2. Push artifact bundles to RHEL8 Bastion
```
  rsync --progress -avzh /tmp/bundle -e "ssh -i ~/.ssh/${keyname}" ec2-user@${rhel_bastion_public_ip}:~
```
  3. SSH to the Private Registry Node
```
  ssh ec2-user@${rhel_bastion_public_ip}
```
  4. Push artifact bundles to Private Registry Node
```
  rsync --progress -avzh /tmp/bundle -e "ssh -i ~/.ssh/${keyname}" core@${rhel_bastion_public_ip}:~
```
  5. SSH to the Private Registry Node
```
  ssh core@${rhcos_private_registry_internal_ip}
```
  6. Extract Bundles
```
  sudo tar xv -f ${HOME}/bundle/koffer-bundle.openshift-*.tar         -C /root
  sudo tar xv -f ${HOME}/bundle/koffer-bundle.collector-operators.tar -C /root/deploy
  sudo tar xv -f ${HOME}/bundle/koffer-bundle.collector-apps.tar      -C /root/deploy/mirror
```
#### Continue Deployment High Side: [Konductor Deploy Cluster]    
[Quay.io Image Pull Secret]:https://cloud.redhat.com/openshift/install/metal/user-provisioned
[Konductor Deploy Cluster]:https://codectl.io/docs/user-guide/deploy
