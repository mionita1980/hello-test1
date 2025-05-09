# hello-test1

A "Hello" simple REST API backend server.

Created starting from https://guides.micronaut.io/latest/creating-your-first-micronaut-app.html using Gradle: https://guides.micronaut.io/latest/creating-your-first-micronaut-app-gradle-java.html.

## Use Image

How to use the image:

```bash
docker run -it -p 8080:8080 mionita1980/hello-test1:latest
```

You should get something like:
```
 __  __ _                                  _
|  \/  (_) ___ _ __ ___  _ __   __ _ _   _| |_
| |\/| | |/ __| '__/ _ \| '_ \ / _` | | | | __|
| |  | | | (__| | | (_) | | | | (_| | |_| | |_
|_|  |_|_|\___|_|  \___/|_| |_|\__,_|\__,_|\__|
09:41:20.067 [main] INFO  io.micronaut.runtime.Micronaut - Startup completed in 101ms. Server Running: http://xxxxxxxxxxxx:8080
...
```

Then connect using a browser to http://localhost:8080/hello and you should get back a `Hello World` message.

## Deploy Image to K8S

```bash
kcl hello-test1.k | kubectl apply -f -
```
