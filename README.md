# hass-hass

## Deploy built image
```
oc new-app akrambenaissi/openshift-homeassistant --name=hass
oc expose hass
```

## Build and deploy on OpenShift Online
OpenShift Online does not allow Docker image builds. You need to build locally and then push to its registry

### Create your project
```
oc login --token=YOUR_TOKEN --server=https://api.us-east-2.starter.openshift-online.com:6443
oc new-project your-project
```

### Build the image locally
```
docker build . -t akrambenaissi/openshift-homeassistant
docker tag akrambenaissi/hasshass default-route-openshift-image-registry.apps.us-east-2.starter.openshift-online.com/your-project/openshift-homeassistant
```

### Push to OpenShift Online Registry
```
docker login default-route-openshift-image-registry.apps.us-east-2.starter.openshift-online.com -u YOUR_USER -p YOUR_TOKEN
docker push default-route-openshift-image-registry.apps.us-east-2.starter.openshift-online.com/your-project/openshift-homeassistant
```

### Deploy the app
```
oc new-app openshift-homeassistant --name=hass
oc expose hass
```


