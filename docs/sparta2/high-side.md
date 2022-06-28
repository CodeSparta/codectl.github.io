---
layout: default
title: airgapped deployment
parent: Sparta 2
nav_order: 3
---

# sparta2
Once the sparta-utiltiy.tar.gz and the ocp-images.tar have been moved to the airgapped box they will need to be unpacked and utility container

## Prerequisites
- RHEL 8 base image
- Podman

### Unpack tar files
Step 1: Create the utility directory. Mirror-registry requires root privileges to run.  

`sudo mkdir -p /root/utility`

Step 2: unpack the packages to the utility directory

`sudo tar xvf sparta-utility.tar.gz -C /root/utility`

Step 3: Move the ocp-images.tar to the utility directory

`sudo mv ocp-images.tar /root/`

Step 5: This script creates an SSH keypair and adds the public to the `authorized_keys` file of the host.

`cd /root/utility/sparta2 && bash ssh-keys.sh`

Step 5: load the utility container onto the localhost

`sudo podman load -i /root/utility/tar-bundles/utility.tar`

Step 6: Modify the ansible inventory by changing IPADDR to the localhost IP

`vi /root/utility/sparta2/inventory`

Step 7: Modify vars to setup the mirror-registry

`vi /root/utility/sparta2/vars/registry.yml`

Step 8: Run ansible playbooks
- mirror-registry.yml
- oc-mirror.yml
- cert-dir.yml
- ocp-build-config.yml
