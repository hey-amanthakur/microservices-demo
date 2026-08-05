# Sock Shop : A Microservice Demo Application

[![CI](https://github.com/microservices-demo/microservices-demo/actions/workflows/main.yaml/badge.svg)](https://github.com/microservices-demo/microservices-demo/actions/workflows/main.yaml)
[![License](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0)
[![Docs](https://img.shields.io/badge/docs-sock--shop-blue.svg)](https://microservices-demo.github.io/microservices-demo/)

The application is the user-facing part of an online shop that sells socks. It is intended to aid the demonstration and testing of microservice and cloud native technologies.

It is built using [Spring Boot](http://projects.spring.io/spring-boot/), [Go kit](http://gokit.io) and [Node.js](https://nodejs.org/) and is packaged in Docker containers.

You can read more about the [application design](./internal-docs/design.md) and the full [documentation site](https://microservices-demo.github.io/microservices-demo/).

## Table of Contents

- [Quickstart](#quickstart)
- [Deployment Platforms](#deployment-platforms)
- [Screenshot](#screenshot)
- [Visualizing the application](#visualizing-the-application)
- [Bugs, Feature Requests and Contributing](#bugs-feature-requests-and-contributing)

## Quickstart

The fastest way to get Sock Shop running is with Docker Compose:

```bash
git clone https://github.com/microservices-demo/microservices-demo.git
cd microservices-demo/deploy/docker-compose
docker-compose up -d
```

Then open <http://localhost:8080/> and you should see the Sock Shop storefront.

## Deployment Platforms

The [deploy folder](./deploy/) contains scripts and instructions to provision the application onto your favourite platform.

| Platform | Documentation |
|----------|---------------|
| Docker Compose | [deploy/docker-compose](deploy/docker-compose) |
| Kubernetes | [deploy/kubernetes](deploy/kubernetes) |
| Amazon ECS | [deploy/ecs](deploy/ecs) |
| Nomad | [deploy/nomad](deploy/nomad) |
| Mesos / DC/OS | [deploy/mesos](deploy/mesos) |

Please let us know if there is a platform that you would like to see supported.

## Screenshot

![Sock Shop frontend](https://github.com/microservices-demo/microservices-demo.github.io/raw/master/assets/sockshop-frontend.png)

## Visualizing the application

Use [Weave Scope](http://weave.works/products/weave-scope/) or [Weave Cloud](http://cloud.weave.works/) to visualize the application once it's running in the selected [target platform](./deploy/).

![Sock Shop in Weave Scope](https://github.com/microservices-demo/microservices-demo.github.io/raw/master/assets/sockshop-scope.png)

## Bugs, Feature Requests and Contributing

We'd love to see community contributions. We like to keep it simple and use Github issues to track bugs and feature requests and pull requests to manage contributions. See the [contribution information](.github/CONTRIBUTING.md) for more information.
