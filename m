Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B94D5E019B3; Tue, 19 Jun 2018 09:29:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.53 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 95D99E019B1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Jun 2018 09:29:49 -0700 (PDT)
Received: by mail-lf0-f53.google.com with SMTP id q11-v6so426743lfc.7
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Jun 2018 09:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xYbZu6ZJnB91AiTRnya32c644MEVkFqb9xbvtnNQEwQ=;
	b=a55qFVuFcJ4VHdn8pzm+TNYPJ8P4dPpOvwgXYy4qpNGJTt4Fdd0zs9eqjhfSHaSqEY
	D+Gmsb32h6G8rqgvSAtfX8RdsRU80cZZM4huK1/aMNIRcKxwJUhm0reBtB0A2omxWfIP
	FMoqNq9mRg/WukLukAJGf3osmVVUFZB7kwfPukB/QCES5si+W3x7BzcjUNXollTtFOTc
	wQ40TEV7As1N0ZAvPrsnZnkj0zixCTk4Oi8Ss16JC2QaBrATIiqkkz6cunrHT/D/OIz8
	XHS24lIUYbuFvIR7sgBQsp0l85k4VPnyoggPgEPgbDBPPFl5HTcSdhwg5qF7AJ096gO0
	p3YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xYbZu6ZJnB91AiTRnya32c644MEVkFqb9xbvtnNQEwQ=;
	b=fJ1eZzZ18KC06eiQz5gf0Hdk60mEUSQ5oNr7tkwqfWc9/gXrjuAvWYn0X+R0WAJJqm
	0OC+N14eXxcisGoV8n9Z4/2a+N7tXzCyMpT+eHm+K4dNflih0vFz7dNK8Aa/AkxhDJiY
	QutLUvadDhDta5m23tIIBtmzql2ePUmd6RPARCTOeye/K+0UJBZyIc3bSp7Noq6bOWHX
	5K+vHB6phgxvcl4K5BilWHJpFIV4EP5FG5Q68QvSTaziek3gKHYuCUWocud6bHWNBdXD
	7rblsmZiPNtRc20znwKMyaoUIRBDVDgWtUYnQbh7pNXbSb4wIQXCdg4ZRKZiApakHmPe
	nTrQ==
X-Gm-Message-State: APt69E3vhMm8RwsX9v1DO0n5VTharoyKyaGtuH5X3DW0rsRMFkJONxfK
	syAfQ5SpFs7xCuXZGeV796XFvaqqnv/QXjBnATQ=
X-Google-Smtp-Source: ADUXVKK3WYkAOZPbzcw2z4RuYZvU2fpF7usXE0jbW8yJoGeQhJLv4/E6hUaSvqSyIkhR8mdU5Rh6s6tEUoTNp7eOpGw=
X-Received: by 2002:a2e:9b52:: with SMTP id
	o18-v6mr8352566ljj.49.1529425788389; 
	Tue, 19 Jun 2018 09:29:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:161a:0:0:0:0:0 with HTTP; Tue, 19 Jun 2018 09:29:47
	-0700 (PDT)
In-Reply-To: <20180615151923.53904-1-jason.wessel@windriver.com>
References: <20180615151923.53904-1-jason.wessel@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 19 Jun 2018 12:29:47 -0400
Message-ID: <CADkTA4OT+xqin9kAJh3eZqKovPEp4mJ1QRrs75ZFugxD2yvHrw@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] hyperstart: Fix compiler errors from gcc 8.1.0 uprev
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jun 2018 16:29:51 -0000
Content-Type: multipart/alternative; boundary="000000000000d3cc82056f0130e6"

--000000000000d3cc82056f0130e6
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Fri, Jun 15, 2018 at 11:19 AM, Jason Wessel <jason.wessel@windriver.com>
wrote:

> The patch to hypterstart was also submitted to the upstream project.
> It fixes these errors/warnings:
>
> container.c: In function 'hyper_setup_container_rootfs':
> container.c:630:24: error: '/' directive writing 1 byte into a region of
> size between 0 and 511 [-Werror=format-overflow=]
>   sprintf(rootfs, "%s/%s/", root, container->rootfs);
>                         ^
> container.c:630:2: note: 'sprintf' output 3 or more bytes (assuming 514)
> into a destination of size 512
>   sprintf(rootfs, "%s/%s/", root, container->rootfs);
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> container.c:262:18: error: '%s' directive writing up to 511 bytes into a
> region of size 510 [-Werror=format-overflow=]
>   sprintf(dst, "./%s", src);
>                   ^~   ~~~
> container.c:262:2: note: 'sprintf' output between 3 and 514 bytes into a
> destination of size 512
>   sprintf(dst, "./%s", src);
>   ^~~~~~~~~~~~~~~~~~~~~~~~~
> container.c:218:24: error: '/_data' directive writing 6 bytes into a
> region of size between 1 and 512 [-Werror=format-overflow=]
>      sprintf(volume, "%s/_data", path);
>                         ^~~~~~
> container.c:218:5: note: 'sprintf' output between 7 and 518 bytes into a
> destination of size 512
>      sprintf(volume, "%s/_data", path);
>      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> container.c:149:24: error: '/_data' directive writing 6 bytes into a
> region of size between 0 and 511 [-Werror=format-overflow=]
>     sprintf(volume, "/%s/_data", path);
>                         ^~~~~~
> container.c:149:4: note: 'sprintf' output between 8 and 519 bytes into a
> destination of size 512
>     sprintf(volume, "/%s/_data", path);
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> container.c:131:24: error: '/' directive writing 1 byte into a region of
> size between 0 and 511 [-Werror=format-overflow=]
>     sprintf(volume, "/%s/", path);
>                         ^
> container.c:131:4: note: 'sprintf' output between 3 and 514 bytes into a
> destination of size 512
>     sprintf(volume, "/%s/", path);
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> container.c:176:24: error: '/_data/' directive writing 7 bytes into a
> region of size between 0 and 511 [-Werror=format-overflow=]
>     sprintf(volume, "/%s/_data/%s", path, filevolume);
>                         ^~~~~~~
> container.c:176:4: note: 'sprintf' output 9 or more bytes (assuming 520)
> into a destination of size 512
>     sprintf(volume, "/%s/_data/%s", path, filevolume);
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  ...compiler-errors-that-gcc-8.1.0-repor.patch | 230 ++++++++++++++++++
>  recipes-extended/hyperstart/hyperstart_git.bb |   1 +
>  2 files changed, 231 insertions(+)
>  create mode 100644 recipes-extended/hyperstart/
> hyperstart/0001-container.c-Fix-compiler-errors-that-gcc-8.1.0-repor.patch
>
> diff --git a/recipes-extended/hyperstart/hyperstart/0001-container.c-
> Fix-compiler-errors-that-gcc-8.1.0-repor.patch
> b/recipes-extended/hyperstart/hyperstart/0001-container.c-
> Fix-compiler-errors-that-gcc-8.1.0-repor.patch
> new file mode 100644
> index 0000000..4a01de5
> --- /dev/null
> +++ b/recipes-extended/hyperstart/hyperstart/0001-container.c-
> Fix-compiler-errors-that-gcc-8.1.0-repor.patch
> @@ -0,0 +1,230 @@
> +From 11f5089300c1c368d896c95890827dc85a67f132 Mon Sep 17 00:00:00 2001
> +From: Jason Wessel <jason.wessel@windriver.com>
> +Date: Fri, 15 Jun 2018 08:04:35 -0700
> +Subject: [PATCH] container.c: Fix compiler errors that gcc 8.1.0 reports
> +
> +gcc 8.1.0 reports the following compiler errors/warnings.  They can be
> +fixed by using snprintf and checking the result for truncation.  This
> +patch also uses a named constant instead of inserting the value 512 in
> +many locations.
> +
> +container.c: In function 'hyper_setup_container_rootfs':
> +container.c:630:24: error: '/' directive writing 1 byte into a region of
> size between 0 and 511 [-Werror=format-overflow=]
> +  sprintf(rootfs, "%s/%s/", root, container->rootfs);
> +                        ^
> +container.c:630:2: note: 'sprintf' output 3 or more bytes (assuming 514)
> into a destination of size 512
> +  sprintf(rootfs, "%s/%s/", root, container->rootfs);
> +  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +container.c:262:18: error: '%s' directive writing up to 511 bytes into a
> region of size 510 [-Werror=format-overflow=]
> +  sprintf(dst, "./%s", src);
> +                  ^~   ~~~
> +container.c:262:2: note: 'sprintf' output between 3 and 514 bytes into a
> destination of size 512
> +  sprintf(dst, "./%s", src);
> +  ^~~~~~~~~~~~~~~~~~~~~~~~~
> +container.c:218:24: error: '/_data' directive writing 6 bytes into a
> region of size between 1 and 512 [-Werror=format-overflow=]
> +     sprintf(volume, "%s/_data", path);
> +                        ^~~~~~
> +container.c:218:5: note: 'sprintf' output between 7 and 518 bytes into a
> destination of size 512
> +     sprintf(volume, "%s/_data", path);
> +     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +container.c:149:24: error: '/_data' directive writing 6 bytes into a
> region of size between 0 and 511 [-Werror=format-overflow=]
> +    sprintf(volume, "/%s/_data", path);
> +                        ^~~~~~
> +container.c:149:4: note: 'sprintf' output between 8 and 519 bytes into a
> destination of size 512
> +    sprintf(volume, "/%s/_data", path);
> +    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +container.c:131:24: error: '/' directive writing 1 byte into a region of
> size between 0 and 511 [-Werror=format-overflow=]
> +    sprintf(volume, "/%s/", path);
> +                        ^
> +container.c:131:4: note: 'sprintf' output between 3 and 514 bytes into a
> destination of size 512
> +    sprintf(volume, "/%s/", path);
> +    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +container.c:176:24: error: '/_data/' directive writing 7 bytes into a
> region of size between 0 and 511 [-Werror=format-overflow=]
> +    sprintf(volume, "/%s/_data/%s", path, filevolume);
> +                        ^~~~~~~
> +container.c:176:4: note: 'sprintf' output 9 or more bytes (assuming 520)
> into a destination of size 512
> +    sprintf(volume, "/%s/_data/%s", path, filevolume);
> +    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> +---
> + src/container.c | 47 ++++++++++++++++++++++++++++-------------------
> + 1 file changed, 28 insertions(+), 19 deletions(-)
> +
> +diff --git a/src/container.c b/src/container.c
> +index 0938d82..b1c52d4 100644
> +--- a/src/container.c
> ++++ b/src/container.c
> +@@ -22,6 +22,8 @@
> + #include "syscall.h"
> + #include "netlink.h"
> +
> ++#define MAX_PBUF 512
> ++
> + static int container_populate_volume(char *src, char *dest)
> + {
> +       struct stat st;
> +@@ -99,12 +101,12 @@ static int container_setup_volume(struct hyper_pod
> *pod,
> +                                 struct hyper_container *container)
> + {
> +       int i;
> +-      char dev[512], path[512];
> ++      char dev[MAX_PBUF], path[MAX_PBUF];
> +       struct volume *vol;
> +
> +       for (i = 0; i < container->vols_num; i++) {
> +-              char volume[512];
> +-              char mountpoint[512];
> ++              char volume[MAX_PBUF];
> ++              char mountpoint[MAX_PBUF];
> +               char *options = NULL;
> +               const char *filevolume = NULL;
> +               vol = &container->vols[i];
> +@@ -128,7 +130,8 @@ static int container_setup_volume(struct hyper_pod
> *pod,
> +                       if (hyper_mount_nfs(vol->device, path) < 0)
> +                               return -1;
> +                       /* nfs export has implicitly included _data part
> of the volume */
> +-                      sprintf(volume, "/%s/", path);
> ++                      if (snprintf(volume, MAX_PBUF, "/%s/", path) >=
> MAX_PBUF)
> ++                                return -1;
> +               } else {
> +                       fprintf(stdout, "mount %s to %s, tmp path %s\n",
> +                               dev, vol->mountpoint, path);
> +@@ -137,7 +140,7 @@ static int container_setup_volume(struct hyper_pod
> *pod,
> +                               options = "nouuid";
> +
> +                       if (access(dev, R_OK) < 0) {
> +-                              char device[512];
> ++                              char device[MAX_PBUF];
> +                               sprintf(device, "/block/%s", vol->device);
> +                               hyper_netlink_wait_dev(pod->ueventfd,
> device);
> +                       }
> +@@ -146,7 +149,8 @@ static int container_setup_volume(struct hyper_pod
> *pod,
> +                               perror("mount volume device failed");
> +                               return -1;
> +                       }
> +-                      sprintf(volume, "/%s/_data", path);
> ++                      if (snprintf(volume, MAX_PBUF, "/%s/_data", path)
> >= MAX_PBUF)
> ++                                return -1;
> +               }
> +
> +               if (container_check_file_volume(volume, &filevolume) < 0)
> +@@ -173,7 +177,8 @@ static int container_setup_volume(struct hyper_pod
> *pod,
> +                               perror("create volume file failed");
> +                               return -1;
> +                       }
> +-                      sprintf(volume, "/%s/_data/%s", path, filevolume);
> ++                      if (snprintf(volume, MAX_PBUF, "/%s/_data/%s",
> path, filevolume) >= MAX_PBUF)
> ++                                return -1;
> +                       /* 0777 so that any user can read/write the new
> file volume */
> +                       if (chmod(volume, 0777) < 0) {
> +                               fprintf(stderr, "fail to chmod directory
> %s\n", volume);
> +@@ -197,9 +202,9 @@ static int container_setup_volume(struct hyper_pod
> *pod,
> +
> +       for (i = 0; i < container->maps_num; i++) {
> +               struct stat st;
> +-              char *src, path[512], volume[512];
> ++              char *src, path[MAX_PBUF], volume[MAX_PBUF];
> +               struct fsmap *map = &container->maps[i];
> +-              char mountpoint[512];
> ++              char mountpoint[MAX_PBUF];
> +
> +               sprintf(path, "%s/%s", SHARED_DIR, map->source);
> +               sprintf(mountpoint, "./%s", map->path);
> +@@ -215,7 +220,8 @@ static int container_setup_volume(struct hyper_pod
> *pod,
> +                       }
> +                       if (map->docker) {
> +                               /* converted from volume */
> +-                              sprintf(volume, "%s/_data", path);
> ++                              if (snprintf(volume, MAX_PBUF, "%s/_data",
> path) >= MAX_PBUF)
> ++                                        return -1;
> +                               src = volume;
> +                               if (container->initialize &&
> +                                   (container_populate_volume(mountpoint,
> volume) < 0)) {
> +@@ -251,7 +257,7 @@ static int container_setup_modules(struct
> hyper_container *container)
> + {
> +       struct stat st;
> +       struct utsname uts;
> +-      char src[512], dst[512];
> ++      char src[MAX_PBUF], dst[MAX_PBUF];
> +
> +       if (uname(&uts) < 0) {
> +               perror("fail to call uname");
> +@@ -259,7 +265,8 @@ static int container_setup_modules(struct
> hyper_container *container)
> +       }
> +
> +       sprintf(src, "/lib/modules/%s", uts.release);
> +-      sprintf(dst, "./%s", src);
> ++      if (snprintf(dst, MAX_PBUF, "./%s", src) >= MAX_PBUF)
> ++        return -1;
> +
> +       if (stat(dst, &st) == 0) {
> +               struct dirent **list;
> +@@ -291,7 +298,7 @@ static int container_setup_modules(struct
> hyper_container *container)
> +
> + static int container_setup_mount(struct hyper_container *container)
> + {
> +-      char src[512];
> ++      char src[MAX_PBUF];
> +
> +       // current dir is container rootfs, the operations on "./PATH" are
> the operations on container's "/PATH"
> +       if (!container->readonly) {
> +@@ -546,7 +553,7 @@ static int hyper_setup_container_rootfs(void *data)
> + {
> +       struct hyper_container_arg *arg = data;
> +       struct hyper_container *container = arg->c;
> +-      char root[512], rootfs[512];
> ++      char root[MAX_PBUF], rootfs[MAX_PBUF];
> +       int setup_dns;
> +
> +       /* wait for ns-opened ready message */
> +@@ -609,7 +616,7 @@ static int hyper_setup_container_rootfs(void *data)
> +                       goto fail;
> +               }
> +       } else {
> +-              char path[512];
> ++              char path[MAX_PBUF];
> +
> +               sprintf(path, "%s/%s/", SHARED_DIR, container->image);
> +               fprintf(stdout, "src directory %s\n", path);
> +@@ -627,7 +634,9 @@ static int hyper_setup_container_rootfs(void *data)
> +       fprintf(stdout, "root directory for container is %s/%s, init task
> %s\n",
> +               root, container->rootfs, container->exec.argv[0]);
> +
> +-      sprintf(rootfs, "%s/%s/", root, container->rootfs);
> ++      if (snprintf(rootfs, MAX_PBUF, "%s/%s/", root, container->rootfs)
> >= MAX_PBUF)
> ++        goto fail;
> ++
> +       if (mount(rootfs, rootfs, NULL, MS_BIND|MS_REC, NULL) < 0) {
> +               perror("failed to bind rootfs");
> +               goto fail;
> +@@ -710,7 +719,7 @@ fail:
> +
> + static int hyper_setup_pty(struct hyper_container *c)
> + {
> +-      char root[512];
> ++      char root[MAX_PBUF];
> +
> +       sprintf(root, "/tmp/hyper/%s/devpts/", c->id);
> +
> +@@ -730,7 +739,7 @@ static int hyper_setup_pty(struct hyper_container *c)
> +
> + static void hyper_cleanup_pty(struct hyper_container *c)
> + {
> +-      char path[512];
> ++      char path[MAX_PBUF];
> +
> +       sprintf(path, "/tmp/hyper/%s/devpts/", c->id);
> +       if (umount(path) < 0)
> +@@ -739,7 +748,7 @@ static void hyper_cleanup_pty(struct hyper_container
> *c)
> +
> + int container_prepare_rootfs_dev(struct hyper_container *container,
> struct hyper_pod *pod)
> + {
> +-      char dev[512];
> ++      char dev[MAX_PBUF];
> +
> +       if (container->fstype == NULL)
> +               return 0;
> +--
> +2.17.1
> +
> diff --git a/recipes-extended/hyperstart/hyperstart_git.bb
> b/recipes-extended/hyperstart/hyperstart_git.bb
> index 0297477..99c2195 100644
> --- a/recipes-extended/hyperstart/hyperstart_git.bb
> +++ b/recipes-extended/hyperstart/hyperstart_git.bb
> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=
> fa818a259cbed7ce8bc2a22d35a464fc"
>  inherit autotools-brokensep
>
>  SRC_URI = "git://github.com/hyperhq/hyperstart.git"
> +SRC_URI += "file://0001-container.c-Fix-compiler-errors-that-gcc-8.1.
> 0-repor.patch"
>
>  SRCREV = "ad48a3230836f59ada163659cde151a37522068b"
>  PV = "v0.2+git${SRCREV}"
> --
> 2.17.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--000000000000d3cc82056f0130e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Fri, Jun 15, 2018 at 11:19 A=
M, Jason Wessel <span dir=3D"ltr">&lt;<a href=3D"mailto:jason.wessel@windri=
ver.com" target=3D"_blank">jason.wessel@windriver.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">The patch to hypterstart was also submit=
ted to the upstream project.<br>
It fixes these errors/warnings:<br>
<br>
container.c: In function &#39;hyper_setup_container_rootfs&#39;<wbr>:<br>
container.c:630:24: error: &#39;/&#39; directive writing 1 byte into a regi=
on of size between 0 and 511 [-Werror=3Dformat-overflow=3D]<br>
=C2=A0 sprintf(rootfs, &quot;%s/%s/&quot;, root, container-&gt;rootfs);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^<br>
container.c:630:2: note: &#39;sprintf&#39; output 3 or more bytes (assuming=
 514) into a destination of size 512<br>
=C2=A0 sprintf(rootfs, &quot;%s/%s/&quot;, root, container-&gt;rootfs);<br>
=C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<wbr>~~~~~~~~~~~~~~~~~~~~<br>
container.c:262:18: error: &#39;%s&#39; directive writing up to 511 bytes i=
nto a region of size 510 [-Werror=3Dformat-overflow=3D]<br>
=C2=A0 sprintf(dst, &quot;./%s&quot;, src);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~=C2=A0 =C2=
=A0~~~<br>
container.c:262:2: note: &#39;sprintf&#39; output between 3 and 514 bytes i=
nto a destination of size 512<br>
=C2=A0 sprintf(dst, &quot;./%s&quot;, src);<br>
=C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~<br>
container.c:218:24: error: &#39;/_data&#39; directive writing 6 bytes into =
a region of size between 1 and 512 [-Werror=3Dformat-overflow=3D]<br>
=C2=A0 =C2=A0 =C2=A0sprintf(volume, &quot;%s/_data&quot;, path);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^~~~~~<br>
container.c:218:5: note: &#39;sprintf&#39; output between 7 and 518 bytes i=
nto a destination of size 512<br>
=C2=A0 =C2=A0 =C2=A0sprintf(volume, &quot;%s/_data&quot;, path);<br>
=C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<wbr>~~~<br>
container.c:149:24: error: &#39;/_data&#39; directive writing 6 bytes into =
a region of size between 0 and 511 [-Werror=3Dformat-overflow=3D]<br>
=C2=A0 =C2=A0 sprintf(volume, &quot;/%s/_data&quot;, path);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^~~~~~<br>
container.c:149:4: note: &#39;sprintf&#39; output between 8 and 519 bytes i=
nto a destination of size 512<br>
=C2=A0 =C2=A0 sprintf(volume, &quot;/%s/_data&quot;, path);<br>
=C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<wbr>~~~~<br>
container.c:131:24: error: &#39;/&#39; directive writing 1 byte into a regi=
on of size between 0 and 511 [-Werror=3Dformat-overflow=3D]<br>
=C2=A0 =C2=A0 sprintf(volume, &quot;/%s/&quot;, path);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^<br>
container.c:131:4: note: &#39;sprintf&#39; output between 3 and 514 bytes i=
nto a destination of size 512<br>
=C2=A0 =C2=A0 sprintf(volume, &quot;/%s/&quot;, path);<br>
=C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
container.c:176:24: error: &#39;/_data/&#39; directive writing 7 bytes into=
 a region of size between 0 and 511 [-Werror=3Dformat-overflow=3D]<br>
=C2=A0 =C2=A0 sprintf(volume, &quot;/%s/_data/%s&quot;, path, filevolume);<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^~~~~~~<br>
container.c:176:4: note: &#39;sprintf&#39; output 9 or more bytes (assuming=
 520) into a destination of size 512<br>
=C2=A0 =C2=A0 sprintf(volume, &quot;/%s/_data/%s&quot;, path, filevolume);<=
br>
=C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<wbr>~~~~~~~~~~~~~~~~~~~<br>
<br>
Signed-off-by: Jason Wessel &lt;<a href=3D"mailto:jason.wessel@windriver.co=
m">jason.wessel@windriver.com</a>&gt;<br>
---<br>
=C2=A0...compiler-errors-that-gcc-8.<wbr>1.0-repor.patch | 230 ++++++++++++=
++++++<br>
=C2=A0recipes-extended/hyperstart/<a href=3D"http://hyperstart_git.bb" rel=
=3D"noreferrer" target=3D"_blank">hy<wbr>perstart_git.bb</a> |=C2=A0 =C2=A0=
1 +<br>
=C2=A02 files changed, 231 insertions(+)<br>
=C2=A0create mode 100644 recipes-extended/hyperstart/<wbr>hyperstart/0001-c=
ontainer.c-<wbr>Fix-compiler-errors-that-gcc-<wbr>8.1.0-repor.patch<br>
<br>
diff --git a/recipes-extended/hyperstart/<wbr>hyperstart/0001-container.c-<=
wbr>Fix-compiler-errors-that-gcc-<wbr>8.1.0-repor.patch b/recipes-extended/=
hyperstart/<wbr>hyperstart/0001-container.c-<wbr>Fix-compiler-errors-that-g=
cc-<wbr>8.1.0-repor.patch<br>
new file mode 100644<br>
index 0000000..4a01de5<br>
--- /dev/null<br>
+++ b/recipes-extended/hyperstart/<wbr>hyperstart/0001-container.c-<wbr>Fix=
-compiler-errors-that-gcc-<wbr>8.1.0-repor.patch<br>
@@ -0,0 +1,230 @@<br>
+From 11f5089300c1c368d896c95890827d<wbr>c85a67f132 Mon Sep 17 00:00:00 200=
1<br>
+From: Jason Wessel &lt;<a href=3D"mailto:jason.wessel@windriver.com">jason=
.wessel@windriver.com</a>&gt;<br>
+Date: Fri, 15 Jun 2018 08:04:35 -0700<br>
+Subject: [PATCH] container.c: Fix compiler errors that gcc 8.1.0 reports<b=
r>
+<br>
+gcc 8.1.0 reports the following compiler errors/warnings.=C2=A0 They can b=
e<br>
+fixed by using snprintf and checking the result for truncation.=C2=A0 This=
<br>
+patch also uses a named constant instead of inserting the value 512 in<br>
+many locations.<br>
+<br>
+container.c: In function &#39;hyper_setup_container_rootfs&#39;<wbr>:<br>
+container.c:630:24: error: &#39;/&#39; directive writing 1 byte into a reg=
ion of size between 0 and 511 [-Werror=3Dformat-overflow=3D]<br>
+=C2=A0 sprintf(rootfs, &quot;%s/%s/&quot;, root, container-&gt;rootfs);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^<br>
+container.c:630:2: note: &#39;sprintf&#39; output 3 or more bytes (assumin=
g 514) into a destination of size 512<br>
+=C2=A0 sprintf(rootfs, &quot;%s/%s/&quot;, root, container-&gt;rootfs);<br=
>
+=C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<wbr>~~~~~~~~~~~~~~~~~~~~<br>
+container.c:262:18: error: &#39;%s&#39; directive writing up to 511 bytes =
into a region of size 510 [-Werror=3Dformat-overflow=3D]<br>
+=C2=A0 sprintf(dst, &quot;./%s&quot;, src);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~=C2=A0 =
=C2=A0~~~<br>
+container.c:262:2: note: &#39;sprintf&#39; output between 3 and 514 bytes =
into a destination of size 512<br>
+=C2=A0 sprintf(dst, &quot;./%s&quot;, src);<br>
+=C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~<br>
+container.c:218:24: error: &#39;/_data&#39; directive writing 6 bytes into=
 a region of size between 1 and 512 [-Werror=3Dformat-overflow=3D]<br>
+=C2=A0 =C2=A0 =C2=A0sprintf(volume, &quot;%s/_data&quot;, path);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^~~~~~<br>
+container.c:218:5: note: &#39;sprintf&#39; output between 7 and 518 bytes =
into a destination of size 512<br>
+=C2=A0 =C2=A0 =C2=A0sprintf(volume, &quot;%s/_data&quot;, path);<br>
+=C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<wbr>~~~<br>
+container.c:149:24: error: &#39;/_data&#39; directive writing 6 bytes into=
 a region of size between 0 and 511 [-Werror=3Dformat-overflow=3D]<br>
+=C2=A0 =C2=A0 sprintf(volume, &quot;/%s/_data&quot;, path);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^~~~~~<br>
+container.c:149:4: note: &#39;sprintf&#39; output between 8 and 519 bytes =
into a destination of size 512<br>
+=C2=A0 =C2=A0 sprintf(volume, &quot;/%s/_data&quot;, path);<br>
+=C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<wbr>~~~~<br>
+container.c:131:24: error: &#39;/&#39; directive writing 1 byte into a reg=
ion of size between 0 and 511 [-Werror=3Dformat-overflow=3D]<br>
+=C2=A0 =C2=A0 sprintf(volume, &quot;/%s/&quot;, path);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^<br>
+container.c:131:4: note: &#39;sprintf&#39; output between 3 and 514 bytes =
into a destination of size 512<br>
+=C2=A0 =C2=A0 sprintf(volume, &quot;/%s/&quot;, path);<br>
+=C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
+container.c:176:24: error: &#39;/_data/&#39; directive writing 7 bytes int=
o a region of size between 0 and 511 [-Werror=3Dformat-overflow=3D]<br>
+=C2=A0 =C2=A0 sprintf(volume, &quot;/%s/_data/%s&quot;, path, filevolume);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^~~~~~~<br>
+container.c:176:4: note: &#39;sprintf&#39; output 9 or more bytes (assumin=
g 520) into a destination of size 512<br>
+=C2=A0 =C2=A0 sprintf(volume, &quot;/%s/_data/%s&quot;, path, filevolume);=
<br>
+=C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<wbr>~~~~~~~~~~~~~~~~~~~<br>
+<br>
+Signed-off-by: Jason Wessel &lt;<a href=3D"mailto:jason.wessel@windriver.c=
om">jason.wessel@windriver.com</a>&gt;<br>
+---<br>
+ src/container.c | 47 ++++++++++++++++++++++++++++--<wbr>-----------------=
<br>
+ 1 file changed, 28 insertions(+), 19 deletions(-)<br>
+<br>
+diff --git a/src/container.c b/src/container.c<br>
+index 0938d82..b1c52d4 100644<br>
+--- a/src/container.c<br>
++++ b/src/container.c<br>
+@@ -22,6 +22,8 @@<br>
+ #include &quot;syscall.h&quot;<br>
+ #include &quot;netlink.h&quot;<br>
+ <br>
++#define MAX_PBUF 512<br>
++<br>
+ static int container_populate_volume(char *src, char *dest)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct stat st;<br>
+@@ -99,12 +101,12 @@ static int container_setup_volume(struct hyper_pod *p=
od,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct hyper_container *contai=
ner)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
+-=C2=A0 =C2=A0 =C2=A0 char dev[512], path[512];<br>
++=C2=A0 =C2=A0 =C2=A0 char dev[MAX_PBUF], path[MAX_PBUF];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct volume *vol;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; container-&gt;vols_num; i+=
+) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char volume[512];<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char mountpoint[512];<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char volume[MAX_PBUF];<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char mountpoint[MAX_PBUF=
];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *options =3D N=
ULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *filevol=
ume =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vol =3D &amp;contai=
ner-&gt;vols[i];<br>
+@@ -128,7 +130,8 @@ static int container_setup_volume(struct hyper_pod *po=
d,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (hyper_mount_nfs(vol-&gt;device, path) &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* nfs export has implicitly included _data part of the volume */=
<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 sprintf(volume, &quot;/%s/&quot;, path);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (snprintf(volume, MAX_PBUF, &quot;/%s/&quot;, path) &gt;=3D MAX_PBUF=
)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fprintf(stdout, &quot;mount %s to %s, tmp path %s\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev, vol-&gt;mountpoint, path);<br>
+@@ -137,7 +140,7 @@ static int container_setup_volume(struct hyper_pod *po=
d,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0options =3D &quot;nouuid&quot;;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (access(dev, R_OK) &lt; 0) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char device[512];<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char device[MAX_PBUF];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(device, &quot;/block/%s&quot;=
, vol-&gt;device);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hyper_netlink_wait_dev(pod-&gt;<wbr>u=
eventfd, device);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+@@ -146,7 +149,8 @@ static int container_setup_volume(struct hyper_pod *po=
d,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0perror(&quot;mount volume device fail=
ed&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 sprintf(volume, &quot;/%s/_data&quot;, path);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (snprintf(volume, MAX_PBUF, &quot;/%s/_data&quot;, path) &gt;=3D MAX=
_PBUF)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (container_check=
_file_volume(<wbr>volume, &amp;filevolume) &lt; 0)<br>
+@@ -173,7 +177,8 @@ static int container_setup_volume(struct hyper_pod *po=
d,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0perror(&quot;create volume file faile=
d&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 sprintf(volume, &quot;/%s/_data/%s&quot;, path, filevolume);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (snprintf(volume, MAX_PBUF, &quot;/%s/_data/%s&quot;, path, filevolu=
me) &gt;=3D MAX_PBUF)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* 0777 so that any user can read/write the new file volume */<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (chmod(volume, 0777) &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;fail to chmod d=
irectory %s\n&quot;, volume);<br>
+@@ -197,9 +202,9 @@ static int container_setup_volume(struct hyper_pod *po=
d,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; container-&gt;maps_num; i+=
+) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct stat st;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *src, path[512], vo=
lume[512];<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *src, path[MAX_PBUF=
], volume[MAX_PBUF];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct fsmap *map =
=3D &amp;container-&gt;maps[i];<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char mountpoint[512];<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char mountpoint[MAX_PBUF=
];<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(path, &quot=
;%s/%s&quot;, SHARED_DIR, map-&gt;source);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(mountpoint,=
 &quot;./%s&quot;, map-&gt;path);<br>
+@@ -215,7 +220,8 @@ static int container_setup_volume(struct hyper_pod *po=
d,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (map-&gt;docker) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* converted from volume */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(volume, &quot;%s/_data&quot;, path)=
;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (snprintf(volume, MAX_PBUF, &quot;%s/_da=
ta&quot;, path) &gt;=3D MAX_PBUF)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -=
1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0src =3D volume;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (container-&gt;initialize &amp;&am=
p;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(container_populate_vol=
ume(<wbr>mountpoint, volume) &lt; 0)) {<br>
+@@ -251,7 +257,7 @@ static int container_setup_modules(struct hyper_contai=
ner *container)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct stat st;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct utsname uts;<br>
+-=C2=A0 =C2=A0 =C2=A0 char src[512], dst[512];<br>
++=C2=A0 =C2=A0 =C2=A0 char src[MAX_PBUF], dst[MAX_PBUF];<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (uname(&amp;uts) &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0perror(&quot;fail t=
o call uname&quot;);<br>
+@@ -259,7 +265,8 @@ static int container_setup_modules(struct hyper_contai=
ner *container)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(src, &quot;/lib/modules/%s&quot;, uts.r=
elease);<br>
+-=C2=A0 =C2=A0 =C2=A0 sprintf(dst, &quot;./%s&quot;, src);<br>
++=C2=A0 =C2=A0 =C2=A0 if (snprintf(dst, MAX_PBUF, &quot;./%s&quot;, src) &=
gt;=3D MAX_PBUF)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (stat(dst, &amp;st) =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct dirent **lis=
t;<br>
+@@ -291,7 +298,7 @@ static int container_setup_modules(struct hyper_contai=
ner *container)<br>
+ <br>
+ static int container_setup_mount(struct hyper_container *container)<br>
+ {<br>
+-=C2=A0 =C2=A0 =C2=A0 char src[512];<br>
++=C2=A0 =C2=A0 =C2=A0 char src[MAX_PBUF];<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// current dir is container rootfs, the operati=
ons on &quot;./PATH&quot; are the operations on container&#39;s &quot;/PATH=
&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!container-&gt;readonly) {<br>
+@@ -546,7 +553,7 @@ static int hyper_setup_container_rootfs(<wbr>void *dat=
a)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct hyper_container_arg *arg =3D data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct hyper_container *container =3D arg-&gt;c=
;<br>
+-=C2=A0 =C2=A0 =C2=A0 char root[512], rootfs[512];<br>
++=C2=A0 =C2=A0 =C2=A0 char root[MAX_PBUF], rootfs[MAX_PBUF];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int setup_dns;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* wait for ns-opened ready message */<br>
+@@ -609,7 +616,7 @@ static int hyper_setup_container_rootfs(<wbr>void *dat=
a)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto fail;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char path[512];<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char path[MAX_PBUF];<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(path, &quot=
;%s/%s/&quot;, SHARED_DIR, container-&gt;image);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stdout, &qu=
ot;src directory %s\n&quot;, path);<br>
+@@ -627,7 +634,9 @@ static int hyper_setup_container_rootfs(<wbr>void *dat=
a)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stdout, &quot;root directory for contai=
ner is %s/%s, init task %s\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0root, container-&gt=
;rootfs, container-&gt;exec.argv[0]);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 sprintf(rootfs, &quot;%s/%s/&quot;, root, container-=
&gt;rootfs);<br>
++=C2=A0 =C2=A0 =C2=A0 if (snprintf(rootfs, MAX_PBUF, &quot;%s/%s/&quot;, r=
oot, container-&gt;rootfs) &gt;=3D MAX_PBUF)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
++=C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mount(rootfs, rootfs, NULL, MS_BIND|MS_REC,=
 NULL) &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0perror(&quot;failed=
 to bind rootfs&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
+@@ -710,7 +719,7 @@ fail:<br>
+ <br>
+ static int hyper_setup_pty(struct hyper_container *c)<br>
+ {<br>
+-=C2=A0 =C2=A0 =C2=A0 char root[512];<br>
++=C2=A0 =C2=A0 =C2=A0 char root[MAX_PBUF];<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(root, &quot;/tmp/hyper/%s/devpts/&quot;=
, c-&gt;id);<br>
+ <br>
+@@ -730,7 +739,7 @@ static int hyper_setup_pty(struct hyper_container *c)<=
br>
+ <br>
+ static void hyper_cleanup_pty(struct hyper_container *c)<br>
+ {<br>
+-=C2=A0 =C2=A0 =C2=A0 char path[512];<br>
++=C2=A0 =C2=A0 =C2=A0 char path[MAX_PBUF];<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(path, &quot;/tmp/hyper/%s/devpts/&quot;=
, c-&gt;id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (umount(path) &lt; 0)<br>
+@@ -739,7 +748,7 @@ static void hyper_cleanup_pty(struct hyper_container *=
c)<br>
+ <br>
+ int container_prepare_rootfs_dev(<wbr>struct hyper_container *container, =
struct hyper_pod *pod)<br>
+ {<br>
+-=C2=A0 =C2=A0 =C2=A0 char dev[512];<br>
++=C2=A0 =C2=A0 =C2=A0 char dev[MAX_PBUF];<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (container-&gt;fstype =3D=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+-- <br>
+2.17.1<br>
+<br>
diff --git a/recipes-extended/hyperstart/<a href=3D"http://hyperstart_git.b=
b" rel=3D"noreferrer" target=3D"_blank"><wbr>hyperstart_git.bb</a> b/recipe=
s-extended/hyperstart/<a href=3D"http://hyperstart_git.bb" rel=3D"noreferre=
r" target=3D"_blank"><wbr>hyperstart_git.bb</a><br>
index 0297477..99c2195 100644<br>
--- a/recipes-extended/hyperstart/<a href=3D"http://hyperstart_git.bb" rel=
=3D"noreferrer" target=3D"_blank"><wbr>hyperstart_git.bb</a><br>
+++ b/recipes-extended/hyperstart/<a href=3D"http://hyperstart_git.bb" rel=
=3D"noreferrer" target=3D"_blank"><wbr>hyperstart_git.bb</a><br>
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>fa818a=
259cbed7ce8bc2a22d35a464<wbr>fc&quot;<br>
=C2=A0inherit autotools-brokensep <br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/hyperhq/hypersta=
rt.git" rel=3D"noreferrer" target=3D"_blank">github.com/hyperhq/<wbr>hypers=
tart.git</a>&quot;<br>
+SRC_URI +=3D &quot;file://0001-container.c-Fix-<wbr>compiler-errors-that-g=
cc-8.1.<wbr>0-repor.patch&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;<wbr>ad48a3230836f59ada163659cde151<wbr>a37522068b&q=
uot;<br>
=C2=A0PV =3D &quot;v0.2+git${SRCREV}&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
2.17.1<br>
<br>
-- <br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--000000000000d3cc82056f0130e6--
