#Usage

```
kubectl run --image morzzz007/pgcli \
--overrides='{
  "spec": {
    "containers": [
      {
        "name": "oneoff",
        "image": "morzzz007/pgcli",
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