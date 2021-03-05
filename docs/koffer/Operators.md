---
layout: default
title: Operators
parent: Collector Plugins
nav_order: 2
---

# [Operators](https://github.com/CodeSparta/collector-operators)
## AirGap Operator Hub Artifacts
## Provides
This automation provides a unified and standardized tarball of artifacts for
cloudctl services pod airgap operator deployment tasks.

## About
Koffer Collector Operator Hub uses the Koffer Engine runtime container to enable
streamlined low side capture of all required artifacts for deploying OpenShift
Operator Hub. Primarily built to enable airgaped environments in a standard
"registry < to > mirror" workflow model conventional to more typical connected
local mirror techniques.

Features:
  - Low side injestion direct to "pre-hydrated" registry stateful path
  - High side sha256 verification of artifacts bundle before standup
  - High side artifacts served via generic docker registry container

## Instructions:
### 0. Local run requirements
- RHEL8, Fedora 33+, or CoreOS 3.6.8+
- Packages:
 - podman 1.9+
 -  fuse-overlayfs
- A minimum of 32GB free storage
- sudo privileges for nested container build support

### 1. Run Koffer with [Remote Config](https://raw.githubusercontent.com/CodeSparta/collector-operators/master/docs/config/koffer.yml)
```
mkdir ${HOME}/bundle; \
sudo podman run -it --rm --pull always \
    --privileged --device /dev/fuse \
    --volume ${HOME}/bundle:/root/bundle:z \
  quay.io/cloudctl/koffer:v00.21.0221-extra bundle \
    --config https://git.io/Jt5uF
```
### 2. Check Bundle
 ```
 du -sh ${HOME}/bundle/koffer-bundle.operators-*.tar;
 ```

### 3. Unpack the bundle
- Copy the bundle to the restricted side deployment node
- NOTE: sha256sum checking requires correct paths & may take a while for large bundles
```
 cd ${HOME}/bundle;
 echo "$(cat koffer-bundle.operators-*.tar.sha256)" | sha256sum --check --status;
 sudo tar -xvf ${HOME}/bundle/koffer-bundle.operators-*.tar -C /root;
```
### 4. Operators are ready to deploy via CloudCtl - [Trusted Platform Delivery Kit](https://github.com/CloudCtl/cloudctl)
- Modify the mainfests
```
cd /root/platform/mirror/manifests/redhat-catalog-index-manifests
sed -i 's/localhost/registry.$(vpc_name).$(name_domain)/g' *
```
- Apply the mainfests

```
podman exec -it konductor connect
oc patch OperatorHub cluster --type json -p '[{"op": "add", "path": "/spec/disableAllDefaultSources", "value": true}]'

oc apply -f /root/platform/mirror/manifests/redhat-catalog-index-manifests/olm-icsp.yaml
oc apply -f /root/platform/mirror/manifests/redhat-catalog-index-manifests/rh-catalog-source.yaml
```
