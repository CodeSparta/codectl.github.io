---
layout: default
title: Low Side Bundle
parent: User Guide
nav_order: 2
---

# Low-Side Artifact Bundle
### Koffer Collector Plugins
  - [Infrastructure]    
  - [Operators]    
  - [Applications]    
    
> Requires:
>  - ssh
>  - ssh key pair
>    
> Glossary:
>  - `keyname` your [AWS SSH key pair](https://console.amazonaws-us-gov.com/ec2/home?#KeyPairs) for provisioning bastion and registry
>  - `rhel_bastion_public_ip` [public IP](https://console.amazonaws-us-gov.com/ec2/home?#Instances) of your RHEL bastion
    
### Run on local system

  1. Push AWS SSH keys to "low side" RHEL Bastion
```
  scp -i ~/.ssh/${keyname} ~/.ssh/${keyname}* ec2-user@${rhel_bastion_public_ip}:~/.ssh/
```
  2. SSH to the RHEL bastion
```
  ssh -i ~/.ssh/${keyname} ec2-user@${rhel_bastion_public_ip}
```
    
### Run on "low side" public facing RHEL Bastion

  3. Ensure [Podman](https://podman.io/getting-started/installation.html) is installed
```
 sudo dnf install -y podman
```
  4. Create Platform Artifacts Staging Directory
```
 mkdir -p $(pwd)/bundle ;
```
  5. Build OpenShift Infrastructure, Operators, and App Bundles
```
podman run -it --rm --pull always \
    --volume ${HOME}/bundle:/root/bundle:z \
  quay.io/cloudctl/koffer:4.6.4 bundle \
    --config https://codectl.io/docs/config/stable/sparta.yml
```
  6. Paste [Quay.io Image Pull Secret] when prompted    
  7. Set Permissions on bundle(s)
```
  sudo chown -R $USER $(pwd)/bundle
```
  8. Review your artifacts
```
 du -sh $(pwd)/bundle/*
```
    
## Continue [Airgap Artifact Walk](https://codectl.io/docs/user-guide/airgap)    
[Operators]:https://github.com/CodeSparta/collector-operators
[Applications]:https://github.com/CodeSparta/collector-apps
[Infrastructure]:https://github.com/CodeSparta/collector-infra
[Quay.io Image Pull Secret]:https://cloud.redhat.com/openshift/install/metal/user-provisioned
