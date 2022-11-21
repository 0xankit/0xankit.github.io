---
title: "Boxfuse Setup & Deployment for Play Framework in Scala"
date: 2021-11-08T08:06:25+05:30
description: Boxfuse Setup & Deployment for Play Framework in Scala
menu:
  sidebar:
    name: Boxfuse implementation | Play
    identifier: boxfuse
    weight: 10
tags: ["playframework", "Boxfuse", "scala", "tutorial"]
categories: ["Development"]
---

Greeting! Let's deploy playframework using Boxfuse
### Getting Started
- Visit the Boxfuse website.
- Login with your GitHub account.
- Connect your AWS account and give permission for using json.
- Make sure you select the correct AWS region.
- Download the personalized Boxfuse client.
- Place it in root directory and add it to env variable.
- In my case, I placed it inside `~/go/installation/amd/go/boxfuse/`.
- To add boxfuse to env variables I used:
  ```shell
  export GOROOT=/Users/<username>/go/installation/amd/go
  export GOPATH=/Users/<username>/go
  export GOBIN=$GOPATH/bin
  export GO111MODULE=on
  export PATH=$GOPATH/bin:$PATH
  export PATH=$GOROOT/bin:$PATH
  ```
- Now, you can check if it is installed properly usingboxfuse -v.
- Then, navigate to the Play project and create a distribution image using sbt dist. It should show something like this:
  ```shell
  [info] Main Scala API documentation successful.
  [warn] there were two feature warnings; re-run with -feature for details
  [warn] 67 warnings found
  [success] All package validations passed
  [info] Your package is ready in /Project/directory/target/universal/<Project_Name>-1.0.zip
  [success] Total time: 154 s (02:34), completed 27-Oct-2021, 3:16:15 PM
  ```
- Now, run dist image with Boxfuse usingboxfuse run -env=test (Note: it will run on AWS).
- Define all required env variables in the boxfuse.conf file located in Boxfuse installation directory as below:
  ```shell
  envvars.myvar=myvalue
  envvars.otherone=Something Else
  ```
- Or to pass env variables from terminal, use this: `boxfuse run -env=test  envvars.SERVER_PORT=26657 envvars.PLAY_HTTP_SECRET="YOUR_PLAY_SECRET" -capacity=1:t2.micro`
- `-capacity=1:t2.micro` is used to define the number of instances and types of instances to deploy.
- For more configuration, check <boxfuse-installation-directory>/conf/boxfuse.conf(Note: by default, it shows all the logs in the console).

### Errors & Fixes:
1. Unable to create RDS DB instance ERROR: Running
- WARNING: Run failed: Unable to create RDS DB instance
- ERROR: Running 0xankit/<Project_Name>:0.0.0.1635328070074 failed!
- [FIXED] Change `db.t2.micro` to `db.t3.micro` from boxfuse dashboard by clicking on scale and then try again.

2. Unable to start VirtualBox instance boxfuse-dev-hdd-2016.02.09_0xankit-<Project_Name>
ERROR: Unable to start VirtualBox instance boxfuse-dev-hdd-2016.02.09_0xankit-<Project_Name>
- ensure VirtualBox is working correctly
- ensure hardware virtualization (VT-x or AMD-V) is enabled on your machine and check by running "`/usr/local/bin/VBoxManage list hostinfo`"
[FIXED] Define `-env=test`

3. JVM exited with status 255
  ```shell
  "  play.core.server.ProdServerStart
  i-0cd1a2fa4e0bcc642 => 2021-10-28 11:08:56.147 JVM exited with status 255
  i-0cd1a2fa4e0bcc642 => 2021-10-28 11:08:56.147 Rebooting in 15 seconds ...
  ```
[FIXED] Define `logs.filter.level=TRACE` to see exact error.

4. Postgres root certificate error: Could not open SSL root certificate file.
ERROR: ```shell i-0a5d6b28fb9d1c587 => 2021-10-29 12:24:43.512 Caused by: org.postgresql.util.PSQLException: Could not open SSL root certificate file //.postgresql/root.crt.```
[FIXED] Define `slick.dbs.default.db.properties.sslfactory="org.postgresql.ssl.NonValidatingFactory"` in application.conf

5. For Timeout error
[FIXED] Define `slick.dbs.default.db.connectionTimeout=15s` in application.conf

6. Evolutions couldn’t be applied
[FIXED] Define `play.evolutions.autoApply=true` in application.conf

7. Could’t write permission’ issue
[FIXED] Define `play.server.pidfile.path=/dev/null` in application.conf
And with that, you’ve crossed another level to becoming a boss coder. GG! 👏

I hope you found this article instructional and informative. If you have any feedback or queries, please let me know in the comments below. And follow me on [twitter](https://twitter.com/me_0xankit)!




[//]: # (- Hero image is in the same directory as the post.)

[//]: # (- This post should be at top of the sidebar.)

[//]: # (- Post author should be the same as specified in `author.yaml` file.)