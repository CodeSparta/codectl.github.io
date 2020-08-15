---
layout: default
title: High Side Deploy
parent: User Guide
nav_order: 4
---

# High-Side Deployment

### On the private registry node

  1. Acquire root
```
 sudo -i
```
  2. Assign variables
```
 vi answer.sh
```
  3. Run [Konductor]    
```
 ./konductor.sh
```
  4. Patch/Disable Cloud Credential Operator
```
oc patch cm cloud-credential-operator-config -p '{"data":{"disabled":"true"}}' -n openshift-cloud-credential-operator
```
  5. Print & Load Apps ELB DNS CNAME Forwarder into apps route53 entry
```
oc get svc -n openshift-ingress | awk '/router-default/{print $4}'
```
    
[CloudCtl]:https://github.com/CodeSparta/CloudCtl
[Konductor]:https://github.com/CodeSparta/Konductor
