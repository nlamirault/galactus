# Galactus

<img src="https://github.com/nlamirault/galactus/raw/master/galactus.png" width="100">

Terraforming ...

## Backend

### Amazon S3

Create a bucket:

    $ aws s3api create-bucket --bucket my-galactus --region eu-west-1 \
        --create-bucket-configuration LocationConstraint=eu-west-1

Enable the server side encryption:

    $ aws s3api put-bucket-encryption --bucket my-galactus \
        --server-side-encryption-configuration={\"Rules\":[{\"ApplyServerSideEncryptionByDefault\":{\"SSEAlgorithm\":\"AES256\"}}]}

Enable the bucket’s versioning:

    $ aws s3api put-bucket-versioning --bucket my-galactus \
        --versioning-configuration Status=Enabled

### Google Cloud Storage

*TODO*


## Actions

### Kubernetes

* [ ] Kubernetes Cluster in Google Kubernetes Engine (GKE)
* [ ] Kubernetes Cluster in Azure Container Service (AKS)

### Source code

* [x] Define your projects, organizations, teams on Github
* [x] Define your projects, groups on Gitlab

### Meetings

* [x] Google Calendar

### Monitoring

* [x] Updown
* [x] UptimeRobot
* [x] StatusCake

### DNS

* [x] Gandi
* [x] Cloudflare


## Changelog

A changelog is available [here](ChangeLog.md).


## Contact

Nicolas Lamirault <nicolas.lamirault@gmail.com>
