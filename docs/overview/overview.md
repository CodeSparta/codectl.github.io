---
layout: default
title: Overview
nav_order: 2
has_children: false
permalink: /docs/overview
---
## Why?
When planning & delivering OpenShift to various deployment environments we typically 
think in terms of installing to standard [Public Cloud] providers such as IBM, Amazon AWS,
Microsoft Azure, etc. We may also look at private cloud platforms such as vmware,
openstack, or even bare metal. Delivery within the standard paradigm is
presumptive of access to public internet services & dependency resources.

We may choose "[Installer Provisioned Infrastructure]" (IPI) or "[User Provisioned
Infrastructure]" (UPI) where the former is an opinionated all in one delivery mechanism 
that provisions and configures infrastructure and the platform stack vs the latter 
which provides more flexibility by deploying OpenShift to User provisioned & configured
infrastructure at the cost of more deployment and lifecycle user responsibility.

Sparta delivers an alternate opinionated 'IPI' like OpenShift delivery
experience with restricted target environment support exposed by wrapping the
UPI process in an ecosystem of UPI delivery tooling.

## How?
Sparta leverages containerized runtimes for executing [Infrastructure as Code] (IAC)
automation plugins & opinionated enforcement of artifact collection and delivery.

The Plugin Ecosystem written primarily in [Ansible] & [Terraform] but also featuring
[BASH], [Python], and [Golang] enables community accessibility & advanced capability
development.

## Method
Airgap & Restricted network delivery represent similar but critically unique
challenges. For now Sparta delivers via an airgap only model, primarily aimed at
pre-existing infrastructure and consisting of four distinct stages.

Stages:
  - [Low Side] or the public internet access stage.
    1. Artifact Collection, the process of collecting and archiving all dependencies for transport
    2. "The Walk" or the disconnected transportation of artifacts through secure boundaries
  - [High Side] or the network(s) beyond restriction boundaries and or the airgap.
    3. "Manifest Initialization" where declarative configurations are generated and stowed for IaC consumption
    4. "Deployment" or the execution & run of IaC automation as configured by the declarative manifest configuration

[Public Cloud]:https://www.redhat.com/en/topics/cloud-computing/what-is-public-cloud
[Installer Provisioned Infrastructure]:https://github.com/openshift/installer#supported-platforms
[User Provisioned Infrastructure]:https://github.com/openshift/installer#supported-platforms
[IaC]:https://www.ibm.com/cloud/learn/infrastructure-as-code
[Infrastructure as Code]:https://www.ibm.com/cloud/learn/infrastructure-as-code
[Low Side]:https://en.wikipedia.org/wiki/Air_gap_(networking)#Use_in_classified_settings
[High Side]:https://en.wikipedia.org/wiki/Air_gap_(networking)#Use_in_classified_settings
[BASH]:https://www.gnu.org/software/bash
[Python]:https://www.python.org
[Golang]:https://golang.org
[Ansible]:https://www.ansible.com
[Terraform]:https://www.terraform.io

### Architecture Diagram
![Diagram](./web/sparta.png)

### [Bundle Creation Demo:](https://asciinema.org/a/BFb4Hq4h9q4tsNllfRT9K5OWC)
[![asciicast](https://asciinema.org/a/BFb4Hq4h9q4tsNllfRT9K5OWC.png)](https://asciinema.org/a/BFb4Hq4h9q4tsNllfRT9K5OWC)

{: .fs-6 .fw-300 }
