---
layout: default
title: AirGap
parent: User Guide
nav_order: 3
---

# AirGap
## Red Hat OpenShift 4.5+ | Artifacts AirGap Pivot
  0. Move all bundles to high side bastion `/tmp/bundle` directory
    
>
> Valid strategies include `{scp,rsync,s3,physical media}`
>    

  - Example rsync push
```
  export SSHTargetIp="10.0.1.99"
  export SSHAwsKey="${HOME}/.ssh/id_rsa/sparta"
```
  - Direct (no jump host)
```
  sudo chown -R core /tmp/bundle
  rsync --progress -avzh /tmp/bundle \
        -e "ssh -i ~/.ssh/id_rsa_${name}" \
    core@${eipREGISTRY}:~
```
  - With jump host
```
  sudo chown -R $USER /tmp/bundle
  export SSHJumpIp="876.54.3.2112"
  rsync -avzhr /tmp/bundle \
      -e "ssh -i ${aws_ssh_key} -A -J ec2-user@${SSHJumpIp}" \
    core@${SSHTargetIp}:~
```
  1. SSH to Private Registry Node
```
  ssh -i ~/.ssh/id_rsa_sparta \
      -e "ssh -i ${aws_ssh_key} -A -J ec2-user@${SSHJumpIp}" \
    ec2-user@${SSHJumpIp}
```
  2. Create CloudCtl base directory
```
  sudo mkdir -p /root/deploy/mirror ;
```
  3. Extract Infrastructure Bundle
```
  sudo tar xv -f ${HOME}/bundle/koffer-bundle.openshift-*.tar -C /root
```
  4. Extract Operators Bundle
```
  sudo tar xv -f ${HOME}/bundle/koffer-bundle.collector-operators.tar -C /root/deploy
```
  5. Extract Application Images Bundle
```
  sudo tar xv -f ${HOME}/bundle/koffer-bundle.collector-apps.tar -C /root/deploy/mirror
```
#### Continue Deployment High Side: [Konductor Deploy Cluster]    
[Quay.io Image Pull Secret]:https://cloud.redhat.com/openshift/install/metal/user-provisioned
[Konductor Deploy Cluster]:https://codectl.io/docs/user-guide/deploy
