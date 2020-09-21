---
layout: default
title: High Side Deploy
parent: nightlies
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
  4. Exec into Konductor
```
 podman exec -it one connect
```
  5. Watch Cluster Operators come online (may take 30-60 minutes)
```
 watch oc get co
```
  6. Patch/Disable Cloud Credential Operator
```
oc patch cm cloud-credential-operator-config -p '{"data":{"disabled":"true"}}' -n openshift-cloud-credential-operator
```
  7. Print & Load Apps ELB DNS CNAME Forwarder into apps route53 entry
```
oc get svc -n openshift-ingress | awk '/router-default/{print $4}'
```
  8. Add Apps ELB `*.apps.cluster.domain.com` wildcard [DNS Entry](https://console.amazonaws-us-gov.com/route53/home?#resource-record-sets)
    
[CloudCtl]:https://github.com/CodeSparta/CloudCtl
[Konductor]:https://github.com/CodeSparta/Konductor
