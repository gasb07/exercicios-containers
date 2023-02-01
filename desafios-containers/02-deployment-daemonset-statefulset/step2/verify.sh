#!/bin/bash

kubectl get deployment payroll -n finance > /dev/null 2>&1
if [ "$?" -ne 0 ]; then
  exit 1
fi
IMAGE=$(kubectl get deployment payroll -n finance -o jsonpath='{.spec.template.spec.containers[*].image}')
PORT=$(kubectl get deployment payroll -n finance -o jsonpath='{.spec.template.spec.containers[*].ports[*].containerPort}')
REPLICAS=$(kubectl get deployment payroll -n finance -o jsonpath='{.spec.replicas}')
LABEL1=$(kubectl get deployment payroll -n finance -o jsonpath='{.metadata.labels.environment}')
ENV1=$(kubectl get deployment payroll -n finance -o jsonpath='{.spec.template.spec.containers[*].env[?(@.name=="ROOT_FOLDER")].value}')
ENV2=$(kubectl get deployment payroll -n finance -o jsonpath='{.spec.template.spec.containers[*].env[?(@.name=="HOSTNAME")].value}')

if [[ "$IMAGE" == "nginx:latest" && \
      "$PORT" == "80" && \
      "$REPLICAS" == "1" && \
      "$LABEL1" == "production" && \
      "$ENV1" == "/var/http/www" && \
      "$ENV2" == "payroll.company.com" ]]; then
    exit 0
else
    exit 1
fi
