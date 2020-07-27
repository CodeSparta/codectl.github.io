---
layout: default
title: Home
nav_order: 1
description: "RedShift is a customizable and extensable platform delivery as code toolbelt"
permalink: /
last_modified_date: 2020-04-27T17:54:08+0000
---

# RedShift Official
{: .fs-9 }

Platform Delivery as Code Ecosystem
{: .fs-6 .fw-300 }

[View it on GitHub](https://github.com/RedShiftOfficial){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-2 }

---
## About

## Red Hat OpenShift 4 Airgap Automation Deploment as Code

This codebase is created and maintained by Red Hat Consulting.
These doc pages provides brief instructions on how to run the RedHat Koffer & Konductor automation suites to prepare & provision airgap restricted environments.

---
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

[Podman Installed]:https://podman.io/getting-started/installation.html
[Environment Considerations]:staging/considerations/
[HERE]:AWS_WORKAROUND.md
[Red Hat UPI OpenShift Web Console]:https://cloud.redhat.com/openshift/install/metal/user-provisioned
[AWS GovCloud Credentials Portal]:https://console.amazonaws-us-gov.com/iam/home#/security_credentials
[AWS Commercial Credentials Portal]:https://console.aws.amazon.com/iam/home#/security_credentials
[RHEL8]:https://access.redhat.com/downloads/content/479/ver=/rhel---8/8.2/x86_64/product-software
[RH CoreOS]:https://mirror.openshift.com/pub/openshift-v4/x86_64/dependencies/rhcos/latest/latest/

---
## About the project
### License
RedShift is distributed by an [MIT license](https://github.com/redshiftofficial/redshiftofficial.github.io/tree/master/LICENSE.txt).

### Contributing
When contributing to this repository, please first discuss the change you wish to make via issue,
email, or any other method with the owners of this repository before making a change. Read more about becoming a contributor in [our GitHub repo](https://github.com/redshiftofficial/redshiftofficial.github.io#contributing).

#### Thank you to our contributors!
<ul class="list-style-none">
{% for contributor in site.github.contributors %}
  <li class="d-inline-block mr-1">
     <a href="{{ contributor.html_url }}"><img src="{{ contributor.avatar_url }}" width="32" height="32" alt="{{ contributor.login }}"/></a>
  </li>
{% endfor %}
</ul>

### Code of Conduct
Just the Docs is committed to fostering a welcoming community.
[View our Code of Conduct](https://github.com/pmarsceill/just-the-docs/tree/master/CODE_OF_CONDUCT.md) on our GitHub repository.

RedShift is &copy; 2020-{{ "now" | date: "%Y" }} by [ContainerCraft.io](https://containercraft.io).
