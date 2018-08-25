#!/bin/bash

for volume in pv{1..200} ; do
cat << EOF >> pvs200.json
{
  "apiVersion": "v1",
  "kind": "PersistentVolume",
  "metadata": {
    "name": "${volume}"
  },
  "spec": {
    "capacity": {
        "storage": "5Gi"
    },
    "accessModes": [ "ReadWriteOnce" , "ReadWriteMany" ],
    "nfs": {
        "path": "/export/pvs/$volume",
        "server": "10.22.68.7"
    },
    "persistentVolumeReclaimPolicy": "Recycle"
  }
}
EOF
echo "Created def file for ${volume}";
done;


