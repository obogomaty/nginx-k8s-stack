#!/bin/bash
kube-score score path/to/your/kubernetes/manifests | tee kube-score-output.txt
if [ $? -ne 0 ]; then
    echo "kube-score tests failed."
    exit 1
else
    echo "kube-score tests passed."
fi