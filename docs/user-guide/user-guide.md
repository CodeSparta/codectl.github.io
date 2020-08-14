---
layout: default
title: User Guide
nav_order: 3
has_children: true
permalink: /docs/user-guide
---

## User Guide
The Sparta platform delivery ecosystem is maintained by contributors from Red Hat Consulting.
This guide provides brief instructions on the basic Sparta platform delivery method to prepare and provision an airgapped Red Hat OpenShift deployment on AWS GovCloud.

----------------------------------------------------------------
## Requirements

### Low-Side Workstation Host
The deployment process requires an initial unsecured, public network workstation host where all artifacts are collected. 

This host must meet the following requirements:
  - [Podman Installed]
  - Access to Internet
  - Minimum of 64 GB available storage
  
The following is recommended for the host:
  - Bastion: [RHEL 8] bare metal, cloud instance, or virtual machine
  - Valid host type examples: localhost, local vm, or cloud instance
  - Host Hardware Equivalent: t2.2xlarge (8 vCPU, 32GB RAM, 64GB Disk)

### Red Hat Credentials
A Quay pull secret is required for the registry, and can be found at the [Red Hat UPI OpenShift Web Console].

### AWS Credentials
One set of Admin level AWS account credentials are required for this deployment.    
    
  - AWS Commercial account ([AWS Commercial Credentials Portal])
    - Access Key ID
    - Secret Access Key
  - AWS GovCloud account ([AWS GovCloud Credentials Portal])
    - Access Key ID
    - Secret Access Key

----------------------------------------------------------------
## Get Started:
####  1. Low Side Prep: [Artifact Bundles](https://codectl.io/docs/user-guide/bundle)
####  2. Move Artifacts: [AirGap Pivot](https://codectl.io/docs/user-guide/airgap)
####  3. High Side Deploy: [CloudCtl Konductor](https://codectl.io/docs/user-guide/deploy)

[RH CoreOS]:https://mirror.openshift.com/pub/openshift-v4/x86_64/dependencies/rhcos/latest/latest
[Podman Installed]:https://podman.io/getting-started/installation.html
[Red Hat UPI OpenShift Web Console]:https://cloud.redhat.com/openshift/install/metal/user-provisioned
[AWS GovCloud Credentials Portal]:https://console.amazonaws-us-gov.com/iam/home#/security_credentials
[AWS Commercial Credentials Portal]:https://console.aws.amazon.com/iam/home#/security_credentials
[RHEL 8]:https://access.redhat.com/downloads/content/479/ver=/rhel---8/8.2/x86_64/product-software
{: .fs-6 .fw-300 }
