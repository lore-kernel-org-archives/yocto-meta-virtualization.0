Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.14666.1585930297579933394
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 03 Apr 2020 09:11:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PPYf4P8e;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id f6so8322603wmj.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Apr 2020 09:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hS/Bn0AZRM9EAwMiCqAgPipdWBTjbieb4xeCx7FBty4=;
        b=PPYf4P8en2vgTwl9m3Xb4THAqbtXfVpFXavca+dfCrBpkHzZslSduxUNmfyA0rbX7q
         OPb7/KuJTuRjOMzbER0MclgBOZ6OMEpeKZM1E9h2CawU2eLEDx7A6Z6VgOrId79sL4Md
         OcShvhFi5M5mF7OhtI/+bkld62fn07WTL9cBmvvE/kxUazCKrevtQ+J0u0rvS0nj8EKV
         SoG00Hm51j1Y5RBgq2WqsqqeJYrEhcXjwC1uFBAGPbSkZQLRIqCpieGwFJvS8JSI5ON5
         PIhz4TjVE+sQIMYXkjPtyqgi9it5m4tHSYOrjxLi62Ah2n8snX1eD1pNvD0bKOyklEu1
         qYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hS/Bn0AZRM9EAwMiCqAgPipdWBTjbieb4xeCx7FBty4=;
        b=GFH1nRQAFq1A0jAIpHr7LmW3XFKAChjnSnstTaDmxvzEvq0NXhhOATZQO5BvzkKzXi
         Aduv9uPjwMDZyJFbHwq6w2Si2cpD+Ve4aU8R2957AX3khY2+qIzxQEIGvdqBjHgBKlNG
         kMCx4aMqt8rgBHHAaRLND+Vt4iayau+FxqzGFcSbMfA/K7a7vHLrpicaz22JVlWoYfHT
         hu0FRnyRYtwO80+6ttRnoE4q+QNOl4BZpaeQOf0SjGJ40Y3tQZ72lEpJ+2vvmLTz8vtb
         OVu13C2sFhat+qkhnz5g18ZctiZn55A3fy4qY5wlECCj9atcX65nvCCQ6waRcGrZxVpg
         ZG7A==
X-Gm-Message-State: AGi0PuboTR6z0E1CfNf1bNsqO65jtzMNwb3CHQrZs3ayv8YXaJjo91da
	Ge12Yz7IX/0QYN6HfY4TjUcUOdtR
X-Google-Smtp-Source: APiQypLqmVp9q3RDQl+uB/BkA0MMOlIrAWE93medw9fute9nvOH73IstFQkoBYNsMbeMe+JCMjSeRw==
X-Received: by 2002:a7b:c148:: with SMTP id z8mr9206548wmi.31.1585930295695;
        Fri, 03 Apr 2020 09:11:35 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id k9sm13371747wrd.74.2020.04.03.09.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 09:11:34 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Martin Jansa <martin.jansa@lge.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-virtualization][zeus][PATCH] hyperstart: refresh 0001-container.c-Fix-compiler-errors-that-gcc-8.1.0-repor.patch to apply cleanly
Date: Fri,  3 Apr 2020 18:11:33 +0200
Message-Id: <20200403161133.2180695-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Martin Jansa <martin.jansa@lge.com>

ERROR: hyperstart-v0.2+gitAUTOINC+15bb718ad3-r0 do_patch: Fuzz detected:

Applying patch 0001-container.c-Fix-compiler-errors-that-gcc-8.1.0-repor.patch
patching file src/container.c
Hunk #2 succeeded at 118 with fuzz 1 (offset 17 lines).
Hunk #3 succeeded at 148 (offset 18 lines).
Hunk #4 succeeded at 158 (offset 18 lines).
Hunk #5 succeeded at 167 with fuzz 1 (offset 18 lines).
Hunk #6 succeeded at 197 (offset 20 lines).
Hunk #7 succeeded at 222 (offset 20 lines).
Hunk #8 succeeded at 240 (offset 20 lines).
Hunk #9 succeeded at 277 (offset 20 lines).
Hunk #10 succeeded at 285 (offset 20 lines).
Hunk #11 succeeded at 325 (offset 27 lines).
Hunk #12 succeeded at 583 (offset 30 lines).
Hunk #13 succeeded at 646 (offset 30 lines).
Hunk #14 succeeded at 664 (offset 30 lines).
Hunk #15 succeeded at 749 (offset 30 lines).
Hunk #16 succeeded at 769 (offset 30 lines).
Hunk #17 succeeded at 778 (offset 30 lines).

The context lines in the patches can be updated with devtool:

    devtool modify hyperstart
    devtool finish --force-patch-refresh hyperstart <layer_path>

Don't forget to review changes done by devtool!

ERROR: hyperstart-v0.2+gitAUTOINC+15bb718ad3-r0 do_patch: QA Issue: Patch log indicates that patches do not apply cleanly. [patch-fuzz]

Signed-off-by: Martin Jansa <martin.jansa@lge.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...compiler-errors-that-gcc-8.1.0-repor.patch | 44 +++++++++----------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/recipes-extended/hyperstart/hyperstart/0001-container.c-Fix-compiler-errors-that-gcc-8.1.0-repor.patch b/recipes-extended/hyperstart/hyperstart/0001-container.c-Fix-compiler-errors-that-gcc-8.1.0-repor.patch
index 4a01de5..091ce3c 100644
--- a/recipes-extended/hyperstart/hyperstart/0001-container.c-Fix-compiler-errors-that-gcc-8.1.0-repor.patch
+++ b/recipes-extended/hyperstart/hyperstart/0001-container.c-Fix-compiler-errors-that-gcc-8.1.0-repor.patch
@@ -1,4 +1,4 @@
-From 11f5089300c1c368d896c95890827dc85a67f132 Mon Sep 17 00:00:00 2001
+From 085dd65bba063e391350487f2a5e4a7bf69ee6c8 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Fri, 15 Jun 2018 08:04:35 -0700
 Subject: [PATCH] container.c: Fix compiler errors that gcc 8.1.0 reports
@@ -47,12 +47,13 @@ container.c:176:4: note: 'sprintf' output 9 or more bytes (assuming 520) into a
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+
 ---
  src/container.c | 47 ++++++++++++++++++++++++++++-------------------
  1 file changed, 28 insertions(+), 19 deletions(-)
 
 diff --git a/src/container.c b/src/container.c
-index 0938d82..b1c52d4 100644
+index fee67ff..94d49d8 100644
 --- a/src/container.c
 +++ b/src/container.c
 @@ -22,6 +22,8 @@
@@ -64,7 +65,7 @@ index 0938d82..b1c52d4 100644
  static int container_populate_volume(char *src, char *dest)
  {
  	struct stat st;
-@@ -99,12 +101,12 @@ static int container_setup_volume(struct hyper_pod *pod,
+@@ -116,12 +118,12 @@ static int container_setup_volume(struct hyper_pod *pod,
  				  struct hyper_container *container)
  {
  	int i;
@@ -79,8 +80,8 @@ index 0938d82..b1c52d4 100644
 +		char mountpoint[MAX_PBUF];
  		char *options = NULL;
  		const char *filevolume = NULL;
- 		vol = &container->vols[i];
-@@ -128,7 +130,8 @@ static int container_setup_volume(struct hyper_pod *pod,
+ 		bool newvolume = false;
+@@ -146,7 +148,8 @@ static int container_setup_volume(struct hyper_pod *pod,
  			if (hyper_mount_nfs(vol->device, path) < 0)
  				return -1;
  			/* nfs export has implicitly included _data part of the volume */
@@ -90,7 +91,7 @@ index 0938d82..b1c52d4 100644
  		} else {
  			fprintf(stdout, "mount %s to %s, tmp path %s\n",
  				dev, vol->mountpoint, path);
-@@ -137,7 +140,7 @@ static int container_setup_volume(struct hyper_pod *pod,
+@@ -155,7 +158,7 @@ static int container_setup_volume(struct hyper_pod *pod,
  				options = "nouuid";
  
  			if (access(dev, R_OK) < 0) {
@@ -99,7 +100,7 @@ index 0938d82..b1c52d4 100644
  				sprintf(device, "/block/%s", vol->device);
  				hyper_netlink_wait_dev(pod->ueventfd, device);
  			}
-@@ -146,7 +149,8 @@ static int container_setup_volume(struct hyper_pod *pod,
+@@ -164,7 +167,8 @@ static int container_setup_volume(struct hyper_pod *pod,
  				perror("mount volume device failed");
  				return -1;
  			}
@@ -108,8 +109,8 @@ index 0938d82..b1c52d4 100644
 +                                return -1;
  		}
  
- 		if (container_check_file_volume(volume, &filevolume) < 0)
-@@ -173,7 +177,8 @@ static int container_setup_volume(struct hyper_pod *pod,
+ 		if (container_check_volume(volume, &filevolume, &newvolume) < 0)
+@@ -193,7 +197,8 @@ static int container_setup_volume(struct hyper_pod *pod,
  				perror("create volume file failed");
  				return -1;
  			}
@@ -119,7 +120,7 @@ index 0938d82..b1c52d4 100644
  			/* 0777 so that any user can read/write the new file volume */
  			if (chmod(volume, 0777) < 0) {
  				fprintf(stderr, "fail to chmod directory %s\n", volume);
-@@ -197,9 +202,9 @@ static int container_setup_volume(struct hyper_pod *pod,
+@@ -217,9 +222,9 @@ static int container_setup_volume(struct hyper_pod *pod,
  
  	for (i = 0; i < container->maps_num; i++) {
  		struct stat st;
@@ -131,7 +132,7 @@ index 0938d82..b1c52d4 100644
  
  		sprintf(path, "%s/%s", SHARED_DIR, map->source);
  		sprintf(mountpoint, "./%s", map->path);
-@@ -215,7 +220,8 @@ static int container_setup_volume(struct hyper_pod *pod,
+@@ -235,7 +240,8 @@ static int container_setup_volume(struct hyper_pod *pod,
  			}
  			if (map->docker) {
  				/* converted from volume */
@@ -141,7 +142,7 @@ index 0938d82..b1c52d4 100644
  				src = volume;
  				if (container->initialize &&
  				    (container_populate_volume(mountpoint, volume) < 0)) {
-@@ -251,7 +257,7 @@ static int container_setup_modules(struct hyper_container *container)
+@@ -271,7 +277,7 @@ static int container_setup_modules(struct hyper_container *container)
  {
  	struct stat st;
  	struct utsname uts;
@@ -150,7 +151,7 @@ index 0938d82..b1c52d4 100644
  
  	if (uname(&uts) < 0) {
  		perror("fail to call uname");
-@@ -259,7 +265,8 @@ static int container_setup_modules(struct hyper_container *container)
+@@ -279,7 +285,8 @@ static int container_setup_modules(struct hyper_container *container)
  	}
  
  	sprintf(src, "/lib/modules/%s", uts.release);
@@ -160,7 +161,7 @@ index 0938d82..b1c52d4 100644
  
  	if (stat(dst, &st) == 0) {
  		struct dirent **list;
-@@ -291,7 +298,7 @@ static int container_setup_modules(struct hyper_container *container)
+@@ -318,7 +325,7 @@ static int container_setup_modules(struct hyper_container *container)
  
  static int container_setup_mount(struct hyper_container *container)
  {
@@ -169,7 +170,7 @@ index 0938d82..b1c52d4 100644
  
  	// current dir is container rootfs, the operations on "./PATH" are the operations on container's "/PATH"
  	if (!container->readonly) {
-@@ -546,7 +553,7 @@ static int hyper_setup_container_rootfs(void *data)
+@@ -576,7 +583,7 @@ static int hyper_setup_container_rootfs(void *data)
  {
  	struct hyper_container_arg *arg = data;
  	struct hyper_container *container = arg->c;
@@ -178,7 +179,7 @@ index 0938d82..b1c52d4 100644
  	int setup_dns;
  
  	/* wait for ns-opened ready message */
-@@ -609,7 +616,7 @@ static int hyper_setup_container_rootfs(void *data)
+@@ -639,7 +646,7 @@ static int hyper_setup_container_rootfs(void *data)
  			goto fail;
  		}
  	} else {
@@ -187,7 +188,7 @@ index 0938d82..b1c52d4 100644
  
  		sprintf(path, "%s/%s/", SHARED_DIR, container->image);
  		fprintf(stdout, "src directory %s\n", path);
-@@ -627,7 +634,9 @@ static int hyper_setup_container_rootfs(void *data)
+@@ -657,7 +664,9 @@ static int hyper_setup_container_rootfs(void *data)
  	fprintf(stdout, "root directory for container is %s/%s, init task %s\n",
  		root, container->rootfs, container->exec.argv[0]);
  
@@ -198,7 +199,7 @@ index 0938d82..b1c52d4 100644
  	if (mount(rootfs, rootfs, NULL, MS_BIND|MS_REC, NULL) < 0) {
  		perror("failed to bind rootfs");
  		goto fail;
-@@ -710,7 +719,7 @@ fail:
+@@ -740,7 +749,7 @@ fail:
  
  static int hyper_setup_pty(struct hyper_container *c)
  {
@@ -207,7 +208,7 @@ index 0938d82..b1c52d4 100644
  
  	sprintf(root, "/tmp/hyper/%s/devpts/", c->id);
  
-@@ -730,7 +739,7 @@ static int hyper_setup_pty(struct hyper_container *c)
+@@ -760,7 +769,7 @@ static int hyper_setup_pty(struct hyper_container *c)
  
  static void hyper_cleanup_pty(struct hyper_container *c)
  {
@@ -216,7 +217,7 @@ index 0938d82..b1c52d4 100644
  
  	sprintf(path, "/tmp/hyper/%s/devpts/", c->id);
  	if (umount(path) < 0)
-@@ -739,7 +748,7 @@ static void hyper_cleanup_pty(struct hyper_container *c)
+@@ -769,7 +778,7 @@ static void hyper_cleanup_pty(struct hyper_container *c)
  
  int container_prepare_rootfs_dev(struct hyper_container *container, struct hyper_pod *pod)
  {
@@ -225,6 +226,3 @@ index 0938d82..b1c52d4 100644
  
  	if (container->fstype == NULL)
  		return 0;
--- 
-2.17.1
-
-- 
2.25.1

