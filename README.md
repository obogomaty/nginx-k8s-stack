# OpenResty App Kubernetes Helm Chart

This project provides a production-ready, DevOps-focused Kubernetes deployment for an OpenResty application, using Helm for templating and environment promotion.

## Features
- **Helm Chart** for easy templating and deployment
- **Environment overlays** for dev, staging, and prod
- **Resource requests/limits, HPA, PDB, RBAC, and backup CronJob**
- **Prometheus & Grafana** for monitoring
- **Loki** for centralized logging
- **cert-manager** for TLS/Ingress
- **Trivy** for image scanning (CI/CD)
- **OPA/Gatekeeper** policy example
- **Cost optimization** with ResourceQuota and LimitRange

## Directory Structure
```
helm-chart/
  Chart.yaml           # Helm chart metadata
  values.yaml          # Default values
  templates/           # Resource templates
    deployment.yaml
    service.yaml
  overlays/            # Environment-specific values
    dev/values.yaml
    staging/values.yaml
    prod/values.yaml
```

## Usage
1. **Install Helm** (if not already):
   ```sh
   brew install helm
   ```
2. **Deploy to a specific environment:**
   ```sh
   helm upgrade --install nginx-app ./helm-chart -f helm-chart/overlays/dev/values.yaml
   # or for staging/prod
   # helm upgrade --install nginx-app ./helm-chart -f helm-chart/overlays/staging/values.yaml
   # helm upgrade --install nginx-app ./helm-chart -f helm-chart/overlays/prod/values.yaml
   ```
3. **Expose and access the app:**
   - Get the URL:
     ```sh
     minikube service nginx-app-service --url
     ```
   - Or, port-forward to your local machine:
     ```sh
     kubectl port-forward service/nginx-app-service 8080:80
     # Then open http://localhost:8080 in your browser
     ```

## Customization
- Edit `values.yaml` and overlay values files to set image tags, resource limits, secrets, and environment-specific settings.
- By default, the stack deploys OpenResty (`openresty/openresty:latest`). You can switch to another compatible image by editing the image fields in the values files.
- Add or modify templates in `templates/` for additional resources.

## Security & Best Practices
- All pods use resource requests/limits and RBAC.
- Image scanning and policy enforcement are integrated via CI/CD and OPA/Gatekeeper.
- Secrets are managed via Helm values and can be extended to use external secret managers.

## Monitoring & Logging
- Prometheus and Grafana for metrics and dashboards (see monitoring.yaml).
- Loki for centralized logging (see logging.yaml).
- Alerting rules included for proactive monitoring.

## Troubleshooting
- Use `kubectl get all` and `kubectl describe` for resource status.
- Check pod logs with `kubectl logs <pod-name>`.
- Use `helm status nginx-app` for Helm release info.

## Further Improvements
- Add more dashboards and alerts in Grafana/Prometheus.
- Integrate with external secret managers.
- Automate database backup/restore.
- Expand CI/CD for blue/green or canary deployments.

---

For more details, see the main README.md in the project root.