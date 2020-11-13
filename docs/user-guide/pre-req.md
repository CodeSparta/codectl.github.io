---
layout: default
title: Pre-Requisites
parent: User Guide
nav_order: 1
---

## Pre-Requisites

### Amazon AWS Requirements
    
  1. Red Hat OpenShift Minimum Requirements    
  - [AWS Minimum Requirements](https://tinyurl.com/yyb89pec)
  2. User Provisioned AWS VPC Infrastructure    
  - Optional: Developer VPC [Sparta DevKit VPC](https://codectl.io/docs/developer/aws-vpc)
    
  3. Admin Privileged AWS account keys    
  - AWS Commercial account Key Secret & ID Pair ([AWS Commercial Credentials Portal])    
  - AWS GovCloud account Key Secret & ID Pair ([AWS GovCloud Credentials Portal])    

### User Provided Low-Side Unrestricted Prep Node    
  4. Unsecured, public network artifact collection host    
  - This host must meet the following requirements:    
    - [Podman Installed]    
    - Access to Internet    
    - Minimum of 64 GB available storage    
  - The following is recommended for the host:    
    - RHEL 8: bare metal, cloud instance, or virtual machine    
    - Valid host type examples: localhost, local vm, or cloud instance    
    - Host Hardware Equivalent: t2.2xlarge (8 vCPU, 32GB RAM, 64GB Disk)    

### Red Hat Credentials    
  4. A Quay pull secret is required for the registry, and can be found at the [Red Hat UPI OpenShift Web Console].    

----------------------------------------------------------------
## Next:    
####  [Low-Side Artifact Bundle](https://codectl.io/docs/user-guide/bundle)

[RH CoreOS]:https://mirror.openshift.com/pub/openshift-v4/x86_64/dependencies/rhcos/latest/latest
[Podman Installed]:https://podman.io/getting-started/installation.html
[Red Hat UPI OpenShift Web Console]:https://cloud.redhat.com/openshift/install/metal/user-provisioned
[AWS GovCloud Credentials Portal]:https://console.amazonaws-us-gov.com/iam/home#/security_credentials

[AWS Commercial Credentials Portal]:https://console.aws.amazon.com/iam/home#/security_credentials
[RHEL 8]:https://access.redhat.com/downloads/content/479/ver=/rhel---8/8.2/x86_64/product-software
