---
layout: default
title: OCP Install Build Config
parent: Sparta 2
nav_order: 3
---
## OCP Install Build Config Overview

`Ocp-install-build-config` is an Ansible role used to create the starting point for an `install-config.yaml` file to deploy OpenShift 4.x. It also includes completed examples to help model the final configuration file.

This role is used to create the starting point for a `install-config.yaml` file to deploy OpenShift 4.x. It also includes completed examples to help model the final configuration file.

Role Variables
--------------
### CONFIG

| Variable                 | Required | Default Value      |
|--------------------------|----------|--------------------|
| config_template          | yes      | `install-config`   |

| Options                  |
|--------------------------|
| aws-install-congfig      |
| install-config           |
| baremetal-install-config |

### ENV

| Variable                 | Required | Default Value      |
|--------------------------|----------|--------------------|
| install_type             | no       | `default`          |
| management_hostname      | yes      | `registry`  |
| cluster_name             | yes      | `ocp`              |
| cluster_domain           | yes      | `example.com`      |
| base_dir                 | yes      | `.`                |
| mac_prefix               | no       | `aa:bb:cc`         |

### SECRETS

| Variable                 | Required | Default Value             |
|--------------------------|----------|---------------------------|
| secrets_dir              | yes      | `{{ base_dir }}/secrets`  |

### REGISTRY

| Variable                 | Required | Default Value              |
|--------------------------|----------|----------------------------|
| registry_dir             | yes      | `{{ base_dir }}/registry`  |
| registry_port            | no       | `5000`                     |

### NETWORKING INFRA

| Variable                 | Required | Default Value                   |
|--------------------------|----------|---------------------------------|
| management_network       | no       | `192.168.0`                     |
| management_cidr          | no       | `{{ management_network }}.0/24` |
| machine_network          | no       | `192.168.1`                     |
| machine_cidr             | no       | `{{ machine_network }}.0/24`    |

### RHCOS_IMAGE_CACHE

| Variable                 | Required | Default Value                   |
|--------------------------|----------|---------------------------------|
| rhcos_image_cache        | no       | `{{ base_dir }}/rhcos_images`   |
| rhcos_image_name         | no       |                                 |
| rhcos_bootstrap_image_sha| no       |                                 |

### OPENSHIFT

| Variable                 | Required | Default Value                   |
|--------------------------|----------|---------------------------------|
| cluster_configs_dir      | yes      | `{{ base_dir }}/clusterconfigs` |
| network_type             | no       | `OVNKubernetes`                 |
| api_ip                   | no       | `{{ machine_network }}.2`       |
| ingress_ip               | no       | `{{ machine_network }}.3`       |
| node_hostname_schema     | no       | `ocp-node`                      |

### NODES
Include as many items under `nodes` list as needed:

| Variable                 | Required | Example Default Value           |
|--------------------------|----------|---------------------------------|
| name                     | no       | `{{ node_hostname_schema }}0`   |
| role                     | no       | `master`                        |
| bmc_address              | no       | `{{ management_network }}.4`    |
| net_address              | no       | `{{ machine_network }}.4`       |
| boot_mac                 | no       | `{{ mac_prefix }}:dd:ee:8c`     |
| ten_gig_mac_2            | no       | `{{ mac_prefix }}:dd:ee:8d`     |
| ten_gig_mac_3            | no       | `{{ mac_prefix }}:dd:ee:8e`     |
| ten_gig_mac_4            | no       | `{{ mac_prefix }}:dd:ee:8f`     |

### NETWORKING

Include as many items under `networking` list as needed:

| Variable                 | Required | Example Default Value           |
|--------------------------|----------|---------------------------------|
| name                     | no       | `br1`                           |
| iface_one                | no       | `eno3`                          |
| iface_two                | no       | `eno4`                          |
| bond                     | no       | `bond0`                         |
| ip_address               | no       | `{{ machine_network }}.151`     |
| ip_prefix_length         | no       | `24`                            |

### REDFISH

| Variable                 | Required | Example Default Value           |
|--------------------------|----------|---------------------------------|
| node_redfish_username    | no       | `redfish_user`                  |
| node_redfish_password    | no       | `redfish_password`              |

### AWS

| Variable                 | Required | Default Value           |
|--------------------------|----------|-------------------------|
| rhcos_ami                | yes      | `ami-0db1ef3c6695fc441` |
| aws_region               | yes      | `us-gov-west`           |
| deployer_name            | yes      | `example`               |
| bill_code                | yes      | `0`                     |

Example Playbook
----------------

    - hosts: localhost
      roles:
        - ocp-install-build-config

------------------

Detailed instructions for this role can be found at its Github repository:

https://github.com/CodeSparta/ocp-install-build-config
