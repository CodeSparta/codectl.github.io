---
layout: default
title: VPC Teardown
parent: User Guide
nav_order: 5
---

# Cluster & VPC Teardown

### On the private registry Konductor Container

  1. Exec into container
```
 sudo podman exec -it one bash
```
  2. Change dir into Terraform Directory
```
 cd /root/deploy/terraform/shaman
```
  3. Patch masters to make scheduleable
```
oc patch schedulers.config.openshift.io cluster -p '{"spec":{"mastersSchedulable":true}}' --type=merge
```
  4. Delete machinesets & wait for worker nodes to terminate
```
for i in $(oc get machinesets -A | awk '/machine-api/{print $2}'); do oc delete machineset $i -n openshift-machine-api; echo deleted $i; done
```
  5. Delete service router & wait for it to terminate
```
oc delete service router-default -n openshift-ingress &
```
  4. Exec control plane breakdown playbook
```
 chmod +x ./breakdown.yml && ./breakdown.yml
```

-------------------------------------------------------------------------------
### On your devkit-vpc controller
  1. change dir into devkit-vpc directory
  2. exec breakdown script
```
 ./devkit-destroy-vpc.sh
```
    
[CloudCtl]:https://github.com/CodeSparta/CloudCtl
[Konductor]:https://github.com/CodeSparta/Konductor
