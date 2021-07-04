# ABOUT

Hi there!! 👋

This repo is a Cloud Native Serverless Workshop. 

# SERVERLESS WORKSHOPS

## This project was built  🛠️

* [Makefile]
* [Docker and Docker-Compose]
* [Kind]
* [Kubectl]
* [Helm]
* [Lens]

## Prerequisites  📋

If you want to work on this project, you will need:

* Go
* Make  
* Bash
* Docker Desktop 

**Note:** 

Before, use this project, please check the Mafiles command provides

CLONE 
   ```sh
   git clone https://github.com/erasmolpa/serverless-workshop
   ```
AND RUN 

   ```sh
     make help
   ```

AND RUN 

 ```sh
     make i-requirements
   ```

## Build 🔧


## Run 🚀

### Knative
 
You can run the following make command to deploy locally:

**helm install**
  ```sh
     make h-install 
   ```


### Monitoring
   After **you install helm** in your computer, you need run the following make command to install the monitoring stack:

  **Install prometheus stack**
  ```sh
     make install-monitoring-stack
   ```

  **Upgrade prometheus confguration**
  ```sh
     make update-prometheus-config
   ```


### Knative-DEMO

 **Start demo**
  ```sh
     make i-knative 
   ```

![knative-demo](./media/knative-demo.png)

  **Stop demo**
  ```sh
     make local-demo-stop 
   ```
  
**Endpoints**

 [GO API Endpoint](http://localhost:8080/api/v3/)

 [Prometheus](http://localhost:9090)

 [Grafana](http://localhost:3000) (user:admin, pass:foobar)
 

![kube_service](./media/kube_service.png)

And then navigate to the endpoint

![kube_service](./media/kubedemo.png)

## Testing ⚙️

About project Tests. Are a bit poor. I cannot dedicate all the time I would like to create Mock and integration Testing.

## References 

* serverless framework
    [reference](https://www.serverless.com/framework/docs/providers/knative/)
* examples with knative eventing


## Roadmap and Improvements 🚀


🚧 Makefile which must provide a automate way to install and configure invironments, as well as run the different DEMOS.

🚧 Observability based on prometheus, Grafana etc for the different workshops.

🚧 Create configuration to deploy with serverless framework

🚧 Customize the service.yaml file. Setting params line concurrency etc.

See the [open issues](https://github.com/erasmolpa/serverless-workshop/issues?q=is%3Aissue+is%3Aopen+sort%3Aupdated-desc) for a list of proposed features (and known issues).


## Contributing 🖇️

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Versioning 📌

This project use [Semantic Versioning](https://semver.org/lang/es/)

# Contact ✒️

Please contact me in the email **erasmolpa@gmail.com** 
                                       AND/OR 
                               **cristianqs31@gmail.com** if you have any cuestion
