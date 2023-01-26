#!/bin/bash

kubectl get deployment ads-management -n marketing > /dev/null 2>&1
if [ "$?" -ne 0 ]; then
  exit 1
fi

IMAGE=$(kubectl get deployment ads-management -n marketing -o jsonpath='{.spec.template.spec.containers[*].image}')
PORT=$(kubectl get deployment ads-management -n marketing -o jsonpath='{.spec.template.spec.containers[*].ports[*].containerPort}')
REPLICAS=$(kubectl get deployment ads-management -n marketing -o jsonpath='{.spec.replicas}')
LABEL1=$(kubectl get deployment ads-management -n marketing -o jsonpath='{.metadata.labels.environment}')
LABEL2=$(kubectl get deployment ads-management -n marketing -o jsonpath='{.metadata.labels.team}')
READY_REPLICAS=$(IMAGE=$(kubectl get deployment ads-management -n marketing -o jsonpath='{.status.readyReplicas}'))

if [[ "$IMAGE" == "httpd:2.4.41-alpine" && \
      "$PORT" == "80" && \
      "$REPLICAS" == "2" && \
      "$LABEL1" == "production" && \
      "$LABEL2" == "social-media" && \
      "$READY_REPLICAS" == "2" ]]; then
    exit 0
else
    exit 1
fi
