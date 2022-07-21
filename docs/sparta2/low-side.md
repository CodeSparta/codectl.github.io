---
layout: default
title: low side bundle
parent: Sparta 2
nav_order: 2
---

# OpenShift Disconnected Utility

Download your registry.redhat.io pull secret from the Red Hat OpenShift Cluster Manager.
https://console.redhat.com/openshift/install/pull-secret

## Prerequisites
  - Install podman to the localhost
  - If the container has not been built yet go to containers/utilty and build the conatiner with the instructions provided.

## Creating an OCP conatiner image set
Modify the imageset-config.yaml file to include what you need for your install. The example below will pull all base images necessary for a first time installation of OpenShift. The user can use the oc-mirror utility to pull key operators when operating in an airgapped environment.


## Utility container
The utility container contains all the tools necessary to successful pull RedHat Openshift operators for an airgapped installation. Run the following commands to create the ocp-images.tar The container must run as the root user for the containerized ansible environment to properly run.   

```
# The quay script will create the $HOME/.docker/config.json file that is necessary for the openshift mirror to query the image repositories.
bash quay.sh

#The start script will create a running utility container with volumes mounted to the $HOME/utility and $HOME and .docker directories
bash utility-start.sh

# The init will prompt the user for the quay pull secret and then run the oc-mirror based on the imageset-config.yaml
bash init.sh

#The bundle script will compile the utility conatainer along with the Sparta ansible roles and OCP utilities(oc, openshift-installer, oc-mirror & mirror registry) into a single tar file located at the tar-bundles directory
bash bundle.sh
```

When the init.sh script is finished it generates a ocp-images.tar with the images from the specified image set.

There are 2 tar files to move to the airgapped environment in the following locations.
```
/root/utility/ocp-images.tar
/root/utility/tar-bundles/sparta-utility.tar.gz

```

Running the cleanup.sh script will stop and delete the running utility container
