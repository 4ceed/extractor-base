extractor-base
=====

This repository provides a base implementation of extractor that can be run on 4CeeD system.

## Build extractor

Build extractor Docker image:

```
docker build -t t2c2/sample-extractor .
```

## Deploy extractor

To deploy the extractor on the Kubernetes instance that hosts 4CeeD system, run the following command: 

```
kubectl create -f extractor-rc.yaml
```

## Implement your own extractor

TBD
