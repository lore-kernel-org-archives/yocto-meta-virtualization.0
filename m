Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web10.3681.1586139390897373838
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 05 Apr 2020 19:16:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r2fPFnPi;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id n17so1620096qtv.4
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 05 Apr 2020 19:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QZnlNwt7BCKytaJIYkobPO6WvmjZhdit3xw3xzc7DjM=;
        b=r2fPFnPihk0vpwu3c5b4a7P0g9waUa+XzsMgT9L2Z5xH6ACM4LA5LtBlKkeDb7RXnx
         WiVI3MEOcq/mT0XddUjUasHSKc39LTZOspany6VwqTuXEf15oupFfEMR4Yx4lX20gqdJ
         o3xAs+oeQCgBQMGF7TGB9HOo9kwamTUw9sS3vqKKdoty0xtRUFTXrjVEE+mqexGUrsFN
         Chb4p8FFxvGbyxxjIb3bqT3V3snNlXasObwtaOP5x1xnnl232Kc8YsElaQL6Y/qTOfxv
         oSlfkbNYbK66rUwVuknSt/GXhOVEPTZ4vh/a7so6eEqTlxobSGFntAjtKfDdBf6dcWEW
         t9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QZnlNwt7BCKytaJIYkobPO6WvmjZhdit3xw3xzc7DjM=;
        b=IZWvhC6JbBgxghAh+xhXT5ESIwEPrqvcesf7/V0AVeyCmEbNU8twB6VWG+MwvhwBbE
         L4W2js8w5Er10R7cN/aXc6ryv2UWRThtAI1X1Tb6rIFIoGJMC1L5NTRD9cJLt08Demxz
         qsP68s29nM0PQOwEiFiCMqoLcld8TvW68Tx69zxnXQJrQOFPBJ/qdt5F7BQyO4yQkkJ4
         kert3X+KY4AgAjkPUgYSiMlkRYtWPkev9NK7/VlFl+Wc43AMoU6P6O8OasyJQDFU4IRe
         fA+YjyOUhj/yEBksP1F3LMLu8u/berfpgOZpJjfqNNDnyX4Au6AiIRS/IH6akLHxxPW7
         aTgg==
X-Gm-Message-State: AGi0PubDWXaruazYlN0QcfrRM0o0gw9/KFzhYpDWBuG1NRalZ6YEIrwP
	Ec0rtDObB2c729J0/Mdj4dk=
X-Google-Smtp-Source: APiQypJKFN4eO3534b6tPZd93FgiudSYJqddQIXc2fL7Njy+4JVTY+Nv35Tv8xAXa0AtXRqaK9SAQg==
X-Received: by 2002:ac8:16b8:: with SMTP id r53mr18951017qtj.7.1586139389973;
        Sun, 05 Apr 2020 19:16:29 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id 73sm13871446qkf.82.2020.04.05.19.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 19:16:29 -0700 (PDT)
Date: Sun, 5 Apr 2020 22:16:27 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Martin Jansa <martin.jansa@lge.com>
Subject: Re: [meta-virtualization][zeus][PATCH] hyperstart: refresh 0001-container.c-Fix-compiler-errors-that-gcc-8.1.0-repor.patch to apply cleanly
Message-ID: <20200406021624.GA54226@gmail.com>
References: <20200403161133.2180695-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200403161133.2180695-1-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: [meta-virtualization][zeus][PATCH] hyperstart: refresh 0001-container.c-Fix-compiler-errors-that-gcc-8.1.0-repor.patch to apply cleanly
on 03/04/2020 Martin Jansa wrote:

> From: Martin Jansa <martin.jansa@lge.com>
> 
> ERROR: hyperstart-v0.2+gitAUTOINC+15bb718ad3-r0 do_patch: Fuzz detected:
> 
> Applying patch 0001-container.c-Fix-compiler-errors-that-gcc-8.1.0-repor.patch
> patching file src/container.c
> Hunk #2 succeeded at 118 with fuzz 1 (offset 17 lines).
> Hunk #3 succeeded at 148 (offset 18 lines).
> Hunk #4 succeeded at 158 (offset 18 lines).
> Hunk #5 succeeded at 167 with fuzz 1 (offset 18 lines).
> Hunk #6 succeeded at 197 (offset 20 lines).
> Hunk #7 succeeded at 222 (offset 20 lines).
> Hunk #8 succeeded at 240 (offset 20 lines).
> Hunk #9 succeeded at 277 (offset 20 lines).
> Hunk #10 succeeded at 285 (offset 20 lines).
> Hunk #11 succeeded at 325 (offset 27 lines).
> Hunk #12 succeeded at 583 (offset 30 lines).
> Hunk #13 succeeded at 646 (offset 30 lines).
> Hunk #14 succeeded at 664 (offset 30 lines).
> Hunk #15 succeeded at 749 (offset 30 lines).
> Hunk #16 succeeded at 769 (offset 30 lines).
> Hunk #17 succeeded at 778 (offset 30 lines).
> 
> The context lines in the patches can be updated with devtool:
> 
>     devtool modify hyperstart
>     devtool finish --force-patch-refresh hyperstart <layer_path>
> 
> Don't forget to review changes done by devtool!
> 
> ERROR: hyperstart-v0.2+gitAUTOINC+15bb718ad3-r0 do_patch: QA Issue: Patch log indicates that patches do not apply cleanly. [patch-fuzz]

Picked to Zeus.

Bruce

> 
> Signed-off-by: Martin Jansa <martin.jansa@lge.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  ...compiler-errors-that-gcc-8.1.0-repor.patch | 44 +++++++++----------
>  1 file changed, 21 insertions(+), 23 deletions(-)
> 
> diff --git a/recipes-extended/hyperstart/hyperstart/0001-container.c-Fix-compiler-errors-that-gcc-8.1.0-repor.patch b/recipes-extended/hyperstart/hyperstart/0001-container.c-Fix-compiler-errors-that-gcc-8.1.0-repor.patch
> index 4a01de5..091ce3c 100644
> --- a/recipes-extended/hyperstart/hyperstart/0001-container.c-Fix-compiler-errors-that-gcc-8.1.0-repor.patch
> +++ b/recipes-extended/hyperstart/hyperstart/0001-container.c-Fix-compiler-errors-that-gcc-8.1.0-repor.patch
> @@ -1,4 +1,4 @@
> -From 11f5089300c1c368d896c95890827dc85a67f132 Mon Sep 17 00:00:00 2001
> +From 085dd65bba063e391350487f2a5e4a7bf69ee6c8 Mon Sep 17 00:00:00 2001
>  From: Jason Wessel <jason.wessel@windriver.com>
>  Date: Fri, 15 Jun 2018 08:04:35 -0700
>  Subject: [PATCH] container.c: Fix compiler errors that gcc 8.1.0 reports
> @@ -47,12 +47,13 @@ container.c:176:4: note: 'sprintf' output 9 or more bytes (assuming 520) into a
>      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  
>  Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> +
>  ---
>   src/container.c | 47 ++++++++++++++++++++++++++++-------------------
>   1 file changed, 28 insertions(+), 19 deletions(-)
>  
>  diff --git a/src/container.c b/src/container.c
> -index 0938d82..b1c52d4 100644
> +index fee67ff..94d49d8 100644
>  --- a/src/container.c
>  +++ b/src/container.c
>  @@ -22,6 +22,8 @@
> @@ -64,7 +65,7 @@ index 0938d82..b1c52d4 100644
>   static int container_populate_volume(char *src, char *dest)
>   {
>   	struct stat st;
> -@@ -99,12 +101,12 @@ static int container_setup_volume(struct hyper_pod *pod,
> +@@ -116,12 +118,12 @@ static int container_setup_volume(struct hyper_pod *pod,
>   				  struct hyper_container *container)
>   {
>   	int i;
> @@ -79,8 +80,8 @@ index 0938d82..b1c52d4 100644
>  +		char mountpoint[MAX_PBUF];
>   		char *options = NULL;
>   		const char *filevolume = NULL;
> - 		vol = &container->vols[i];
> -@@ -128,7 +130,8 @@ static int container_setup_volume(struct hyper_pod *pod,
> + 		bool newvolume = false;
> +@@ -146,7 +148,8 @@ static int container_setup_volume(struct hyper_pod *pod,
>   			if (hyper_mount_nfs(vol->device, path) < 0)
>   				return -1;
>   			/* nfs export has implicitly included _data part of the volume */
> @@ -90,7 +91,7 @@ index 0938d82..b1c52d4 100644
>   		} else {
>   			fprintf(stdout, "mount %s to %s, tmp path %s\n",
>   				dev, vol->mountpoint, path);
> -@@ -137,7 +140,7 @@ static int container_setup_volume(struct hyper_pod *pod,
> +@@ -155,7 +158,7 @@ static int container_setup_volume(struct hyper_pod *pod,
>   				options = "nouuid";
>   
>   			if (access(dev, R_OK) < 0) {
> @@ -99,7 +100,7 @@ index 0938d82..b1c52d4 100644
>   				sprintf(device, "/block/%s", vol->device);
>   				hyper_netlink_wait_dev(pod->ueventfd, device);
>   			}
> -@@ -146,7 +149,8 @@ static int container_setup_volume(struct hyper_pod *pod,
> +@@ -164,7 +167,8 @@ static int container_setup_volume(struct hyper_pod *pod,
>   				perror("mount volume device failed");
>   				return -1;
>   			}
> @@ -108,8 +109,8 @@ index 0938d82..b1c52d4 100644
>  +                                return -1;
>   		}
>   
> - 		if (container_check_file_volume(volume, &filevolume) < 0)
> -@@ -173,7 +177,8 @@ static int container_setup_volume(struct hyper_pod *pod,
> + 		if (container_check_volume(volume, &filevolume, &newvolume) < 0)
> +@@ -193,7 +197,8 @@ static int container_setup_volume(struct hyper_pod *pod,
>   				perror("create volume file failed");
>   				return -1;
>   			}
> @@ -119,7 +120,7 @@ index 0938d82..b1c52d4 100644
>   			/* 0777 so that any user can read/write the new file volume */
>   			if (chmod(volume, 0777) < 0) {
>   				fprintf(stderr, "fail to chmod directory %s\n", volume);
> -@@ -197,9 +202,9 @@ static int container_setup_volume(struct hyper_pod *pod,
> +@@ -217,9 +222,9 @@ static int container_setup_volume(struct hyper_pod *pod,
>   
>   	for (i = 0; i < container->maps_num; i++) {
>   		struct stat st;
> @@ -131,7 +132,7 @@ index 0938d82..b1c52d4 100644
>   
>   		sprintf(path, "%s/%s", SHARED_DIR, map->source);
>   		sprintf(mountpoint, "./%s", map->path);
> -@@ -215,7 +220,8 @@ static int container_setup_volume(struct hyper_pod *pod,
> +@@ -235,7 +240,8 @@ static int container_setup_volume(struct hyper_pod *pod,
>   			}
>   			if (map->docker) {
>   				/* converted from volume */
> @@ -141,7 +142,7 @@ index 0938d82..b1c52d4 100644
>   				src = volume;
>   				if (container->initialize &&
>   				    (container_populate_volume(mountpoint, volume) < 0)) {
> -@@ -251,7 +257,7 @@ static int container_setup_modules(struct hyper_container *container)
> +@@ -271,7 +277,7 @@ static int container_setup_modules(struct hyper_container *container)
>   {
>   	struct stat st;
>   	struct utsname uts;
> @@ -150,7 +151,7 @@ index 0938d82..b1c52d4 100644
>   
>   	if (uname(&uts) < 0) {
>   		perror("fail to call uname");
> -@@ -259,7 +265,8 @@ static int container_setup_modules(struct hyper_container *container)
> +@@ -279,7 +285,8 @@ static int container_setup_modules(struct hyper_container *container)
>   	}
>   
>   	sprintf(src, "/lib/modules/%s", uts.release);
> @@ -160,7 +161,7 @@ index 0938d82..b1c52d4 100644
>   
>   	if (stat(dst, &st) == 0) {
>   		struct dirent **list;
> -@@ -291,7 +298,7 @@ static int container_setup_modules(struct hyper_container *container)
> +@@ -318,7 +325,7 @@ static int container_setup_modules(struct hyper_container *container)
>   
>   static int container_setup_mount(struct hyper_container *container)
>   {
> @@ -169,7 +170,7 @@ index 0938d82..b1c52d4 100644
>   
>   	// current dir is container rootfs, the operations on "./PATH" are the operations on container's "/PATH"
>   	if (!container->readonly) {
> -@@ -546,7 +553,7 @@ static int hyper_setup_container_rootfs(void *data)
> +@@ -576,7 +583,7 @@ static int hyper_setup_container_rootfs(void *data)
>   {
>   	struct hyper_container_arg *arg = data;
>   	struct hyper_container *container = arg->c;
> @@ -178,7 +179,7 @@ index 0938d82..b1c52d4 100644
>   	int setup_dns;
>   
>   	/* wait for ns-opened ready message */
> -@@ -609,7 +616,7 @@ static int hyper_setup_container_rootfs(void *data)
> +@@ -639,7 +646,7 @@ static int hyper_setup_container_rootfs(void *data)
>   			goto fail;
>   		}
>   	} else {
> @@ -187,7 +188,7 @@ index 0938d82..b1c52d4 100644
>   
>   		sprintf(path, "%s/%s/", SHARED_DIR, container->image);
>   		fprintf(stdout, "src directory %s\n", path);
> -@@ -627,7 +634,9 @@ static int hyper_setup_container_rootfs(void *data)
> +@@ -657,7 +664,9 @@ static int hyper_setup_container_rootfs(void *data)
>   	fprintf(stdout, "root directory for container is %s/%s, init task %s\n",
>   		root, container->rootfs, container->exec.argv[0]);
>   
> @@ -198,7 +199,7 @@ index 0938d82..b1c52d4 100644
>   	if (mount(rootfs, rootfs, NULL, MS_BIND|MS_REC, NULL) < 0) {
>   		perror("failed to bind rootfs");
>   		goto fail;
> -@@ -710,7 +719,7 @@ fail:
> +@@ -740,7 +749,7 @@ fail:
>   
>   static int hyper_setup_pty(struct hyper_container *c)
>   {
> @@ -207,7 +208,7 @@ index 0938d82..b1c52d4 100644
>   
>   	sprintf(root, "/tmp/hyper/%s/devpts/", c->id);
>   
> -@@ -730,7 +739,7 @@ static int hyper_setup_pty(struct hyper_container *c)
> +@@ -760,7 +769,7 @@ static int hyper_setup_pty(struct hyper_container *c)
>   
>   static void hyper_cleanup_pty(struct hyper_container *c)
>   {
> @@ -216,7 +217,7 @@ index 0938d82..b1c52d4 100644
>   
>   	sprintf(path, "/tmp/hyper/%s/devpts/", c->id);
>   	if (umount(path) < 0)
> -@@ -739,7 +748,7 @@ static void hyper_cleanup_pty(struct hyper_container *c)
> +@@ -769,7 +778,7 @@ static void hyper_cleanup_pty(struct hyper_container *c)
>   
>   int container_prepare_rootfs_dev(struct hyper_container *container, struct hyper_pod *pod)
>   {
> @@ -225,6 +226,3 @@ index 0938d82..b1c52d4 100644
>   
>   	if (container->fstype == NULL)
>   		return 0;
> --- 
> -2.17.1
> -
> -- 
> 2.25.1
> 
