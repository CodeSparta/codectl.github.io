---
layout: default
title: Prerequisite
parent: User Guide
nav_order: 1
---

# Prereqs
## Red Hat OpenShift 4.5+ | Low Side | Artifact Collection
    
This codebase is created and maintained by RedHat Consulting, a Platform One partner.
This wiki provides brief instructions on how to run the RedHat Koffer & Konductor automation suites to prepare & provision airgap restricted environments.

## Requirements

### Low Side Workstation Host

The deployment process requires an initial unsecured public networked workstation host where all artifacts are collected. This host must meet the following requirements:

  - [Podman Installed]
  - Access to Internet
  - Minimum of 64 GB available storage
  - Recommended:
    - [RHEL8] or [RH CoreOS]: bare metal, cloud instance, or virtual machine
    - Valid host type examples: localhost, local vm, or cloud instance
    - Host Hardware Equivalent: t2.2xlarge {8 vCPU, 32GB RAM}

### Red Hat Credentials
A Quay pull secret is required for the registry, and can be found at the [Red Hat UPI OpenShift Web Console].

### AWS Credentials
One set of Admin level AWS account credentials are required for this deployment.    
  (Commercial or GovCloud)
    
  - AWS Commercial account ([AWS Commercial Credentials Portal])
    - Access Key ID
    - Secret Access Key
  - AWS GovCloud account ([AWS GovCloud Credentials Portal])
    - Access Key ID
    - Secret Access Key

----------------------------------------------------------------
## Get Started:
####  1. Low Side Prep: [Artifact Bundles](./BUNDLE.md)
####  2. Move Artifacts: [AirGap Pivot](./PIVOT.md)
####  3. High Side Deploy: [CloudCtl Konductor](./DEPLOY.md)

[Podman Installed]:https://podman.io/getting-started/installation.html
[Red Hat UPI OpenShift Web Console]:https://cloud.redhat.com/openshift/install/metal/user-provisioned
[AWS GovCloud Credentials Portal]:https://console.amazonaws-us-gov.com/iam/home#/security_credentials
[AWS Commercial Credentials Portal]:https://console.aws.amazon.com/iam/home#/security_credentials
[RHEL8]:https://access.redhat.com/downloads/content/479/ver=/rhel---8/8.2/x86_64/product-software
[RH CoreOS]:https://mirror.openshift.com/pub/openshift-v4/x86_64/dependencies/rhcos/latest/latest/
