---
layout: default
title: Overview
nav_order: 2
has_children: false
permalink: /docs/overview
---
## Why?
When planning & delivering OpenShift to deployment environments we typically think 
in terms of installing to standard [Public Cloud] providers such as IBM, Amazon AWS,
Microsoft Azure, etc. We may also look at private cloud platforms such as vmware,
openstack, or even bare metal. Delivery within the standard paradigm includes
access to public internet services & dependency artifact resources. We may
choose "[Installer Provisioned Infrastructure]" or "[User Provisioned
Infrastructure]" where the former is an opinionated all in one delivery mechanism 
that provisions and configures infrastructure and the latter provides more
flexibility by deploying OpenShift to User provisioned & configured
infrastructure at the cost of more deployment and lifecycle user responsibility.

## How?


[Public Cloud]:https://www.redhat.com/en/topics/cloud-computing/what-is-public-cloud
[Installer Provisioned Infrastructure]:https://github.com/openshift/installer#supported-platforms
[User Provisioned Infrastructure]:https://github.com/openshift/installer#supported-platforms

### Architecture Diagram
![Diagram](./web/sparta.png)

### [Bundle Creation Demo:](https://asciinema.org/a/BFb4Hq4h9q4tsNllfRT9K5OWC)
[![asciicast](https://asciinema.org/a/BFb4Hq4h9q4tsNllfRT9K5OWC.png)](https://asciinema.org/a/BFb4Hq4h9q4tsNllfRT9K5OWC)

{: .fs-6 .fw-300 }
