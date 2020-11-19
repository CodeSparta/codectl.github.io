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
  4. Exec into Konductor
```
 podman exec -it konductor connect
```
  5. Watch Cluster Operators come online (may take 30-60 minutes)
```
watch -d -n 5 -c "oc get svc -n openshift-ingress | awk '/router-default/{print $4}' ;echo; oc get co"
```
  6. Also watch for & add Apps ELB Route53 DNS CNAME `*.apps.cluster.domain.com` wildcard [DNS Entry](https://console.amazonaws-us-gov.com/route53/home?#resource-record-sets)
    
[CloudCtl]:https://github.com/CodeSparta/CloudCtl
[Konductor]:https://github.com/CodeSparta/Konductor
