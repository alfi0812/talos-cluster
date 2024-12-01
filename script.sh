#!/bin/bash

# Get all replicationsource names and namespaces
replicationsources=$(kubectl get replicationsource -A -o jsonpath='{range .items[*]}{.metadata.namespace}{" "}{.metadata.name}{"\n"}{end}')

# Loop through each replicationsource and apply the patch
while IFS= read -r line; do
    namespace=$(echo $line | awk '{print $1}')
    name=$(echo $line | awk '{print $2}')
    echo "Patching replicationsource $name in namespace $namespace..."
    kubectl patch replicationsource ${name} -n ${namespace} --type merge -p '{"spec":{"trigger":{"manual":"{{.now2}}"}}}'
    #kubectl -n ${namespace} patch replicationsource ${name} --type=json -p='[{"op": "remove", "path": "/spec/trigger/manual"}]'

done <<< "$replicationsources"