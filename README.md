
# ABOUT

Hi there!! 👋

## This project was built  🛠️

* [Intellij]
* [Makefile]
* [SpringBoot]
* [Maven3]
* [Docker and Docker-Compose]
* [Helm]
* [Lens]

## Prerequisites  📋

If you want to work on this project, you will need:

* Java 8
* Make  
* Maven 3
* Docker Desktop 

**Note:** 

Before, use this project, please check the Mafiles command provides, 

   ```sh
     make help
   ```

For custom configuration, for example, ports binding, etc, check the **.env** file 

## Build 🔧

1. Clone the repo
   ```sh
   git clone https://github.com/erasmolpa//github_api_client_spring_boot
   ```
2. Run Make build commands:
   
   ```sh
     make m-install ##For build the java artifact.
   ```
   if you want build the docker image locally
   ```sh
     make build 
   ```

## Run 🚀

**NOTE** 

The most "complete" way to run, at least from now, is the **docker-compose-demo** option, because deploy, prometheus and grafana as well. 

For locally demo using docker-compose :

### Docker-Compose

 **Start demo**
  ```sh
     make local-demo-start 
   ```
![demo](./media/demo.png)

  **Stop demo**
  ```sh
     make local-demo-stop 
   ```

If you have not Make installed, you can run docker-compose demo directly as following:

```sh 
   docker-compose -f local_demo/docker-compose-local-demo.yml up -d    ### For START
   docker-compose -f local_demo/docker-compose-local-demo.yml down     ### For STOP
```
  
**Endpoints**

 [API Endpoint](http://localhost:8080/api/v3/)

 [Prometheus](http://localhost:9090)

 [Grafana](http://localhost:3000) (user:admin, pass:foobar)

### Kubernetes
 
You can run the following make command to deploy locally:

**helm install**
  ```sh
     make h-install 
   ```

The helm deployment is configured to expose the API service as NodePort.That means, you will have the service in your localhost and random port. 

  ```sh
    kubectl get svc -n default
  ```



## Testing ⚙️


## Roadmap and Improvements 🚀

🚧 .

See the [open issues](https://github.com/erasmolpa//serverless-workshop/issues?q=is%3Aissue+is%3Aopen+sort%3Aupdated-desc) for a list of proposed features (and known issues).

<!-- CONTRIBUTING -->
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

Please contact me in the email **erasmolpa@gmail.com** if you have any cuestion

And if you want, we can connect 😃

<a href="https://twitter.com/erasmolpa">
  <img align="left" alt="Erasmo Dominguez Jimenez | Twitter" width="21px" src="https://raw.githubusercontent.com/erasmolpa/erasmolpa/master/assets/twitter.png" />
</a>

<a href="https://github.com/erasmolpa">
  <img align="left" alt="Erasmo Dominguez Jimenez | GitHub" width="21px" src="https://raw.githubusercontent.com/erasmolpa/erasmolpa/master/assets/github.png" />
</a>

<a href="https://www.linkedin.com/in/erasmolpa/">
  <img align="left" alt="Erasmo Dominguez Jimenez | LinkedIn" width="21px" src="https://raw.githubusercontent.com/erasmolpa/erasmolpa/master/assets/linkedin.png" />
</a>

<a href="https://www.instagram.com/erasmolpa/">
  <img align="left" alt="Erasmo Dominguez Jimenez | Instagram" width="21px" src="https://raw.githubusercontent.com/erasmolpa/erasmolpa/master/assets/instagram.png" />
</a>
<br />
<br />


