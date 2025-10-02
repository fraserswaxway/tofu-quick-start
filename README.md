# Terraform (Tofu) Quick Start

### Abstract

Computer Science (Information Technology) related 
careers often require nearly continuous learning. I embrace this 
aspect of my chosen field. Over the years of coding and
product consulting,I've encountered a number 
of tools used to replace manual steps with automation.
Recently, I encountered a few uses of Infrastructure as Code (IaC)
by some customers. In particular the use
of HashiCorp Cloud Platform (HCP). I created an exercise
for myself to refine my Terradata skill set. I will share 
the exercise in this article.


### Contents
1. [Environment](#environment)
2. [Folder and Files](#folder)
3. [HashiCorp Configuration Language (HCL)](#hcl)<br>
3.1 [Functions](#functions)<br>
3.2 [Providers](#providers)<br>
3.3 [Variables](#variables)<br>
3.4 [Data](#data)<br>
3.5 [eRsource](#resource)<br>
4. [Command Line Interface (CLI) - Apply](#apply)
5. [cURL Validation](#curl)
6. [Tips](#tips)

Acknowledgements


### 1. Environment <a id="environment"/>

* Host: [Debian](https://www.debian.org/distrib/) 13.1.0
* Docker: Community Edition, [Docker-CE](https://docs.docker.com/engine/install/)
* IaC: [OpenTofu](#https://opentofu.org/docs/intro/install/)
* Kubernetes: [KIND](https://kubernetes.io/docs/tasks/tools/)
* Open Source Marketplace: [arkade](https://docs.openfaas.com/cli/install/)
* Microservices Command Line: [OpenFaaS Community Edition Command Line](https://docs.openfaas.com/cli/install/)
* Kubernetes CLI: [kubectl](https://kubernetes.io/docs/tasks/tools/)

### 2. Folder and Files<a id="folder"/>

Create a working folder (example: tofu-quick-start) with the files
and contents as shared at 
[https://github.com/fraserswaxway/tofu-quick-start](#https://github.com/fraserswaxway/tofu-quick-start).

```
tofu-quick-start
|-- main.tf
|-- output.tf
|-- provider.tf
|-- terraform.tfvars
`-- variables.tf
```

### 3. HashiCorp Configuration Language (HCL) <a id="hcl"/>

**[HCL](https://developer.hashicorp.com/terraform/language/syntax/configuration)** is used to specify (code) OpenTofu (Terraform).

#### 3.1 Functions <a id="functions"/>

Terraform's built-in **[functions](https://opentofu.org/docs/language/functions/)** allow manipulation 
and transformation of data within configuration.

#### 3.2 Providers <a id="providers"/>

Terraform **[providers](https://opentofu.org/docs/language/providers/)**
are tools for various platforms such as [Amazon Web Services](https://aws.amazon.com/what-is-aws/), 
[Azure](https://azure.microsoft.com/en-us/resources/cloud-computing-dictionary/what-is-azure), 
[Kubernetes](https://kubernetes.io/docs/concepts/overview/), 
[KinD](https://kind.sigs.k8s.io/), 
and [Docker](https://docs.docker.com/get-started/docker-overview/).

Providers can be found using [search](https://search.opentofu.org/).

The example includes a provider for [Kubernetes](https://kubernetes.io/docs/concepts/overview/) and other in the file 
[provider.tf](https://github.com/fraserswaxway/tofu-quick-start/blob/main/provider.tf).


#### 3.3 Variables <a id="variables"/>

Terraform **[variables](https://opentofu.org/docs/language/values/variables/)** allow customization without changing
configuration files. 

The example includes a variable for the KinD image tag in the file
[variables.tf](https://github.com/fraserswaxway/tofu-quick-start/blob/main/variables.tf).


#### 3.4 Data <a id="data"/>

Use Terraform **[data](https://opentofu.org/docs/language/data-sources/)** to retrieve and access 
information outside of the OpenTofu process.

#### 3.5 Resource <a id="resource"/>

A Terraform **[resourc](https://opentofu.org/docs/language/resources/)** is used 
to define an infrastructure object.

The example includes a resource KinD cluster in the file
[main.tf](https://github.com/fraserswaxway/tofu-quick-start/blob/main/main.tf).

**Note**, the use of **depends_on** to explicitly control object creation order.


### 4. Command Line Interface (CLI) - Apply<a id="apply"/>

Use the following commands to 
- Create KinD cluster
- Deploy OpenFaaS Community Edition (CE) pods (running processes in cluster)
- Deploy OpenFaas' public (compatible with CE license) environment function  
- Open port 8080 to the OpenFaaS Gateway
- Deploy a public OpenFaaS function to validate a microservice
```
cd tofu-quick-start
tofu init -upgrade
tofu apply -auto-approve
```

### 5. cURL Validation<a id="curl"/>

Use the following command to validate the microservice returns environment variable from the sample function. 

```
curl -X POST http://localhost:8080/function/env -d ''
```

### 6. Tips<a id="tips"/>

Following are some additional tips.

- The OpenFaaS Community Edition (CE) license limits what can be deployed to public images
- Login to OpenFaaS CE is required to use most **faas-cli** commands

 
  faas-cli login -u admin -p $(kubectl -n openfaas get secret basic-auth -o jsonpath='{.data.basic-auth-password}' \| base64 --decode)

- Use the following command to list OpenFaaS CE public images



  faas-cli store list
- Deploy additional OpenFaaS CE public images using


  faas-cli store deploy <function> 


  (Example: **faas-cli store deploy nslookup**)
- Function deployments to OpenFaaS may take several seconds (consider waiting 30 seconds before performing a validation test)
- View deployed OpenFaaS functions using **faas-cli list**
- Validate OpenFaaS functions using


  curl -X POST http://<host_or_ip>:8080/function/<function_name> -d '<data>' 


  (Example: curl -X POST http://localhost:8080/function/nslookup -d 'amazon.com')
- View the OpenFaaS pods using **kubectl get pods -n openfaas**

### About the Author

Stuart Fraser has honorary Master of Science in Computer Science from Old Dominion University and is a 
consulting Principal Architect at [Axway](https://axway.com/).  

### Acknowledgements

Special thanks to [Axway](https://axway.com/) for affording and enabling skills development.

