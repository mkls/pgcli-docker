#Usage

```
kubectl run --image mkls/pgcli \
--overrides='{
  "spec": {
    "containers": [
      {
        "name": "oneoff",
        "image": "mkls/pgcli",
        "command": [ "/bin/bash", "-c", "--" ],
        "args": [ "while true; do sleep 30; done;" ],
        "envFrom": [{
          "secretRef": { "name": "[APP_NAME]" }
        }]
      }
    ]
  }
}' \
-n [NAMESPACE] [NAME]
```