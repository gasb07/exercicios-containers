#!/bin/bash
REPLICAS=$(kubectl get deployment bigapp -n webapp -o jsonpath='{.spec.replicas}')

if [[ "$REPLICAS" == "2"  ]]; then
    exit 0
else
    exit 1
fi
