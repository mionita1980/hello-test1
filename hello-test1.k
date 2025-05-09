import manifests
import k8s.api.apps.v1 as apps
import k8s.api.core.v1 as core
import k8s.api.networking.v1 as net

app = "hello-test1"

deployment1 = apps.Deployment {
    metadata = {
        name = app + "-deployment"
        labels.app = app
    }
    spec = {
        replicas = 1
        selector.matchLabels = metadata.labels
        template = {
            metadata.labels = metadata.labels
            spec.containers = [
                {
                    name = metadata.labels.app
                    image = "mionita1980/${metadata.labels.app}:latest"
                    ports = [{ containerPort = 8080 }]
                }
            ]
        }
    }
}

service1 = core.Service {
    metadata.name = app + "-service"
    spec = {
        selector = {
            "app": deployment1.metadata.labels.app
        }
        ports = [
            {
                port: 80
                targetPort: 8080
            }
        ]
    }
}

ingress1 = net.Ingress {
    metadata.name = app + "-ingress"
    spec.ingressClassName = "webapprouting.kubernetes.azure.com"
    spec.rules = [
        {
            http.paths = [
                {
                    path: "/"
                    pathType: "Prefix"
                    backend.service.name: app + "-service"
                    backend.service.port: {
                        number: 80
                    }
                }
            ]
        }
    ]
}

manifests.yaml_stream([
    deployment1
    service1
    ingress1
])
