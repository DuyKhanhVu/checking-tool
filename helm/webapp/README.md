# WEB APP
## Structure
This is a general chart for a typical web app. Therefore, it contains:
- 1 deployment for the web app:
  - Main container will be constantly named "web-app"
  - It will server only 1 port. That only one port should be named "http" for convention of mapping service.
  - Some sidecar containers if needed
  - Every container will be fully customizable as k8s container
  - **Special:** env will be defined as dict, so it can be overwrite by helm values
  - Can add same annotations for both Deployment and Pod
  - Can configure affinity, tolerations, nodeSelector
- 1 service, appropriated with port named "http" in "web-app"
  - It can be ClusterIP (default) or ExternalIP
- Have ingress or not.
  - Only support config for hosts, paths and annotations.
  - In our org, we don't need TLS supporting internally. TLS will be server by LB.
  - Ingress will be automatically mapped to the service named "http"
- Name/Fullname overridable

## Features not supported:
- Job
- Init container

## Changelog
### Version 0.1.0
- Start this chart

### Version 0.1.1
- update deployment.yaml: from `apiVersion: apps/v1beta2` to `apiVersion: apps/v1`

### Version 0.1.2
- update service.yaml: add nodePort
  ```
  {{- if $port.nodePort }}
    nodePort: {{ $port.nodePort | int64 }}
  {{- end }}
  ```
  
### Version >= 1.0.0
- Update api for Kubernetes >= v1.18
- Side notes:
Ingress API:
+ Kubernetes <= v1.15: extensions/v1beta1
+ Kubernetes >= v1.16 & <=v1.18: networking.k8s.io/v1beta1
+ Kubernetes >= v1.19: networking.k8s.io/v1

### Version 1.0.6

- Support ingress apiVersion compatible for any Kubernetes (auto detect)
- Support new ingress `backend` specs:
    * `spec.backend` -> `spec.defaultBackend`
    * `serviceName` -> `service.name`
    * `servicePort` -> `service.port.name` (for string values)
    * `servicePort` -> `service.port.number` (for numeric values)
    * `pathType` no longer has a default value in v1; "Exact", "Prefix", or "ImplementationSpecific" must be specified

