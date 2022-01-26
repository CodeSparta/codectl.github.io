# oc-mirror

= Installing oc-mirror on a connected node
The following procedure was tested on RHEL 8.5 and Fedora 34

== Prerequisites:
- Docker/Podman
- Go  (sudo dnf install go)
- Make (sudo dnf install make)
- https://cloud.redhat.com/openshift/install/metal/user-provisioned[Valid Pull Secret]
----
Note: You must have a config.json in your .docker/ directory in order to successfuly pull and push the mirror images (applicable for all nodes). It is important because oc-mirror uses docker containers to pull images from a known registry and then uses a separate set of containers to push to a local or remote repository of your choosing.
----

== Cloning the repository

* The repository is located at https://github.com/openshift/oc-mirror :
     - $ git clone https://github.com/openshift/oc-mirror.git

* Please verify in your home directory that you have a .docker/config.json file that allows you to push and pull container images. (just copy and paste your keys in docker hub.)

== Building the oc-mirror operator
* In the oc-mirror directory that was cloned, you will run the following command:
----
    $ make build
----

* The operator should be able to run the imageset-config.yml from the oc-mirror directory unless specified in an absolute path.


== Using the operator
* In this use case, we will be pulling operator images for OCP disconnected.
    - The oc-mirror reads yaml files to gather information such as index(s) i.e redhat-certified and  community, the operators you want to pull and specific versions of those operators
* The first step is to edit the imageset-config.yml to reference what operators you wish to mirror.

Example below:
----
apiVersion: mirror.openshift.io/v1alpha1
kind: ImageSetConfiguration
mirror:
  ocp:
  operators:
    - catalog: registry.redhat.io/redhat/redhat-operator-index:v4.9
      headsonly: false
      packages:
        - name: rhacs-operator
        - name: cluster-logging
        - name: kubevirt-hyperconverged
        - name: odf-operator
        - name: compliance-operator
        - name: kiali-ossm
        - name: jaeger-product
        - name: servicemeshoperator
        - name: elasticsearch-operator
        - name: rhsso-operator
    - catalog: registry.redhat.io/redhat/certified-operator-index:v4.9
      headsonly: false
      packages:
        - name: gpu-operator-certified
          startingVersion: '1.9.0'
----

* Running oc-mirror
    - Once you are in the oc-mirror directory you will uyse the following command to gather the operators:
----

     $ ./bin/oc-mirror --config imageset-config.yaml file://archive
Note:
     This will set of the oc-miorror command to configure via the imageset-config that we configured above.
     The file://archive is the destination that oc-mirror sends the tar files and workspaces to.
     Dont worry about the archive directory being on the system, oc-mirror will create it for you.
----

* Completed Mirror
     - When oc-mirror is completed you will then navigate to the archive directory specified above.
     - To verify that it has worked, you will see your newly created archive directory. Inside that directory, you will find a mirror_seql_000000.tar file.

* Deployment prep
     - Now that you have successfully used oc-mirror to package the images, you are ready to deploy them to your registry.
     - To do so you must package the oc-mirror directory into a tar file.
----
    $ tar -cvf oc-mirror.tar oc-mirror/
----

* Transfer the tar file to the destination network

----
Note: the recommended way to transfer this is via aws for speed.

    $ scp oc-mirror.tar user@destination.node:/userdir/

OR (if applicable)

   1.) [localhost]$ aws s3 cp oc-mirror.tar s3://tempXXX/oc-mirror.tar

   2.) [destinationhost] $ aws s3 cp s3://tempXX/oc-mirror.tar .

----



== Deploying to the registry

* Unpack the oc-mirror.tar

----
    $ tar -xvf oc-mirror.tar
----

* Verify the tool is operable

----
    $ ./bin/oc-mirror --help
----

* Verify that your config.json is in ~/.docker/ and has push,pull permissions

* Load image to registry

----
    $ ./bin/oc-mirror --from archives/mirror_seql_000000.tar docker://my.custom.registry.com:5000

Note:
    this will push to your registry and at the end of the output, oc-mirror will give you paths to your index.yaml(s). typically they will be located in oc-mirror-workspace/results-XXXXXX/

The output will have a big blue "INFO" at the end to easily locate the path.
----
== Post archive Deployment

After the oc-mirror has deployed archived tar under the archives directory a oc-mirror-workspace directory will be created. After running the command below all the correct pods will be running under the marketplace project.

----
cd oc-mirror-workspace/results-XXXXXX/ and run
oc patch OperatorHub cluster --type json -p '[{"op": "add", "path": "/spec/disableAllDefaultSources", "value": true}]'
oc apply -f catalogSource-xxx.yaml
oc apply -f imageContentSourcePolicy.yaml
watch oc get pods -n openshift-marketplace
----
Note:
  the system will need the oc command line and cluster-admin access to deploy these configurations

== Additional notes
The oc-mirror is a repeatable process to push and pull in new operators. The user can re-run the oc-mirror by creating a new tar based off of the ImageSetConfiguration yaml. The bundle can then be re-run on the disconnected registry and the yaml files will need to be reapplied to grab the new images.

* to push to a remote registry, all server certificates must be verified by a CA otherwise you must add the servers certificate to your store.
----
$ openssl s_client --connect <yourreg> --showcerts
$ sudo trust anchor path/to/certificate.crt
----

* Looking for specific operators, catalogs, or channels

----
$ ./bin/oc-mirror list operators --catalogs --version=4.9

$ ./bin/oc-mirror list operators --catalog=catalog-name

$ ./bin/oc-mirror list operators --catalog=catalog-name --package=package-name

$ ./bin/oc-mirror list operators --catalog=catalog-name --package=package-name --channel=channel-name
----

== OperatorHub image error
The most common error that can occur when deploying operators is the fuzzy logic doesn't work disconnected and images are pointed to the incorrect registry point. The example below is when executing ODF on OCP 4.9 index

Follow these steps to fix image pull errrors.

1. Create a new imageContentSourcePolicy and apply it with the correct mirror destinations
----
 ---
apiVersion: operator.openshift.io/v1alpha1
kind: ImageContentSourcePolicy
metadata:
  name: odf-all-the-things
spec:
  repositoryDigestMirrors:
  - mirrors:
    - ocp-registry.ocp.cvn5000.navy.mil:5000/odf4
    - ocp-registry.ocp.cvn5000.navy.mil:5000/ocs4
    source: registry.redhat.io/odf4
---
apiVersion: operator.openshift.io/v1alpha1
kind: ImageContentSourcePolicy
metadata:
  name: ocs-all-the-things
spec:
  repositoryDigestMirrors:
  - mirrors:
    - ocp-registry.ocp.cvn5000.navy.mil:5000/odf4
    - ocp-registry.ocp.cvn5000.navy.mil:5000/ocs4
    source: registry.redhat.io/ocs4
----

2. Delete the errored pods in some cases to redeploy the operator
