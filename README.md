# Rails Toy App

Toy Rails app from railstutorial.org

Also an exercise in how to deploy a Kubernetes cluster on
Google Kubernetes Engine

[Toy App Resource](https://www.railstutorial.org/book/toy_app)
[Kubernetes Hello App](https://cloud.google.com/kubernetes-engine/docs/tutorials/hello-app)

## Getting Started

Local Kubernetes

```
minikube start --vm-driver hyperv --hyperv-virtual-switch "Realtek PCIe GbE Family Controller Virtual Switch"
```

### Prerequisites

- [gcloud](https://cloud.google.com/sdk/gcloud/)
- [gcloud kubectl](https://cloud.google.com/kubernetes-engine/docs/quickstart)
- [docker](https://www.docker.com/)
- [rails](https://rubyonrails.org/)

### Installing

1. install from Gemfile

```
bundle install
```

2. build docker image

```
docker build -t toy_app .
```

to run it locally:

```
docker run -it --rm toy_app bundle exec rake test
```

and

```
docker run -p 3000:3000 -it toy_app
```

3. push the image to Gcloud

first, tag the image:

```
docker tag toy_app us.gcr.io/rails-toy-app/toy_app:v1
```

then push it:

```
gcloud docker -- push us.gcr.io/rails-toy-app/toy_app:v1
```

4. build your cluster on Gcloud console

5. deploy the application on the cluster:

find the cluster name

```
gcloud container clusters list
```

get authentication to cluster:

```
gcloud container clusters get-credentials your-first-cluster-1
```

run docker image on cluster:

```
kubectl run hello-server --image us.gcr.io/rails-toy-app/toy_app:v1 --port 3000
```

6. expose the application:

```
kubectl expose deployment hello-server --type LoadBalancer --port 80 --target-port 3000
```

7. find the external ip by:

```
kubectl get service hello-server
```

# License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details

# Acknowledgements

- [Rails Toy App](https://www.railstutorial.org/book/toy_app)
- [Rails Dockerfile](https://docs.docker.com/compose/rails/)
- [Learning deploying Docker image locally](https://blog.codeship.com/running-rails-development-environment-docker/)

- [Learning deploying Docker image to GKE using kubectl](https://engineering.adwerx.com/rails-on-kubernetes-8cd4940eacbe)

- [cluster deployment](https://cloud.google.com/kubernetes-engine/docs/quickstart#defaults)
