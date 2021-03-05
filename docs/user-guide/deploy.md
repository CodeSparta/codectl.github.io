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
  2. Run init.sh
```
 cd /root/cloudctl && ./init.sh
```
  3. Exec into Konductor
```
 podman exec -it konductor connect
```
  4. Assign variables
```
 vim /root/platform/iac/cluster-vars.yml
```
  5. Run sparta automation
```
 cd /root/platform/iac/sparta && ./site.yml
```
  6. Watch Cluster Operators come online (may take 30-60 minutes)
```
 watch oc get co
```
  7. Also watch for & add Apps ELB Route53 DNS CNAME `*.apps.cluster.domain.com` wildcard [DNS Entry](https://console.amazonaws-us-gov.com/route53/home?#resource-record-sets)
```
 oc get svc -n openshift-ingress | awk '/router-default/{print $4}'
```
    
[CloudCtl]:https://github.com/CodeSparta/CloudCtl
[Konductor]:https://github.com/CodeSparta/Konductor
