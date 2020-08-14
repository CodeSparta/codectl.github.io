---
layout: default
title: Home
nav_order: 1
description: "Pluggable and Extendable Restricted Platform Delivery as Code"
permalink: /
last_modified_date: 2020-04-27T17:54:08+0000
---

# CodeSparta Official
{: .fs-9 }

Platform Delivery as Code Ecosystem
{: .fs-6 .fw-300 }

[Find on GitHub](https://github.com/CodeSparta){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-2 } 
[Build OpenShift](https://codectl.io/docs/user-guide){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-2 }    

---
## Red Hat OpenShift Airgap Platform Delivery as Code
Sparta was created to solve the problem of delivering the Red Hat [OpenShift](https://www.openshift.com)
 Kubernetes Platform, along with a complete middleware and application capability, within restricted
 deployment environments (e.g. behind an airgap).

The delivery design centers around the Koffer and Konductor automation runtime
containers as pluggable artifact collection and Infrastructure as Code (IaC) delivery engines, which
orchestrate the CloudCtl deployment services pod to augment cloud native features.

---
#### Supported Environments
  - Amazon AWS Commercial
  - Amazon AWS GovCloud
  - Amazon AWS c2s
  - Amazon AWS sc2s

#### Support Roadmap
  - Microsoft Azure Commercial
  - Microsoft Azure Gov
  - Bare Metal
  - VMware
    

[RHEL8]:https://access.redhat.com/downloads/content/479/ver=/rhel---8/8.2/x86_64/product-software
[RH CoreOS]:https://mirror.openshift.com/pub/openshift-v4/x86_64/dependencies/rhcos/latest/latest/
[AWS Commercial Credentials Portal]:https://console.aws.amazon.com/iam/home#/security_credentials
[AWS GovCloud Credentials Portal]:https://console.amazonaws-us-gov.com/iam/home#/security_credentials
[Red Hat UPI OpenShift Web Console]:https://cloud.redhat.com/openshift/install/metal/user-provisioned
[Podman Installed]:https://podman.io/getting-started/installation.html
[airgap]:https://tinyurl.com/yyrygo74

---
### Contributors:
###### This is an unofficial project maintained by a community of [Red Hat Consultants](https://www.redhat.com/en/services/consulting)
<ul class="list-style-none">
{% for contributor in site.github.contributors %}
  <li class="d-inline-block mr-1">
     <a href="{{ contributor.html_url }}"><img src="{{ contributor.avatar_url }}" width="32" height="32" alt="{{ contributor.login }}"/></a>
  </li>
{% endfor %}
</ul>
CodeSparta is distributed under the [MIT license](https://github.com/redshiftofficial/redshiftofficial.github.io/tree/master/LICENSE.txt).    
