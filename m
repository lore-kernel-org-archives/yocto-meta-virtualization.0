Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 64DE8E00833; Mon,  7 Mar 2016 08:33:29 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C5877E0073D
	for <meta-virtualization@yoctoproject.org>;
	Mon,  7 Mar 2016 08:33:27 -0800 (PST)
Received: by mail-vk0-f41.google.com with SMTP id e6so122945886vkh.2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 07 Mar 2016 08:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=iICWrw72dxy9dBpyFcQhr9huSKZ9mZaQmnuRF3xJPRY=;
	b=kfTpXa1BUwx69/yueIpySTcYCU5Cvvt2A6k5FNGurdcyJvxswvjyh//qeIi9XKdZrL
	js42q7hIpEeAhC8w79GzFDb5HenLTQJFv8yv/lyheiTy65MP48WtanMRESQnd9UNef5M
	frNPWxsAyR5l515e/Kmo9k8QlcoGLRo7RWqvFVkXzuDJrd7mntnH9p0MI5GLSshstNnm
	B/rKWiEIaQ+RsJ3S0YAXCqTyAyslq94G5Z97LpHw48tIppkmkVa7F7ryb7voz6rX2PKx
	5IsI4oURXcQY03vPRD6avH9tb8px3cgaUBuJqNqI7zfWGsRMw+/QMLRBUbdULb4QtDSE
	YGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=iICWrw72dxy9dBpyFcQhr9huSKZ9mZaQmnuRF3xJPRY=;
	b=B84pi4gKoc+u6PybmqnreVB0iRZq832TPwtptWUQtXdnhzdctA+w2NbO3XtlI5+I4W
	BNt01kK2kTkp4iaFRfZKr8A+bErHAC5Dz7CFwb/2hHH5sDCtlh95vqs+b+KRHwRSymOE
	nwqBnOQLV8WD0GYA8Ac4iYBRj2O0wqZwrkc0sVRZQXAZAg/IyzmIqEgksahManIgkfhF
	ALqGwz/76U6s2XNH59LFswTgr5ALZULiGzlwnHBtmtw28PqnOA3C5sVIvYUI+e0eTqUL
	X61x0l3BRjf5NMa1JQOPPRDADOACHFJxh2uf54TqUCyPGaqrqIb8/4szwARq2XDKZvDL
	gFuw==
X-Gm-Message-State: AD7BkJI/3tHx/dcuyDh8cUgOEQZyVlYpSuH2F9pOm+AkOFfWOY6YLvOcYKzDvPbNWCw4WvwJHyT7hXv6S20amQ==
MIME-Version: 1.0
X-Received: by 10.31.6.17 with SMTP id 17mr21399269vkg.75.1457368406643; Mon,
	07 Mar 2016 08:33:26 -0800 (PST)
Received: by 10.176.6.42 with HTTP; Mon, 7 Mar 2016 08:33:26 -0800 (PST)
In-Reply-To: <1456759679-385-1-git-send-email-bogdan.purcareata@nxp.com>
References: <1456759679-385-1-git-send-email-bogdan.purcareata@nxp.com>
Date: Mon, 7 Mar 2016 11:33:26 -0500
Message-ID: <CADkTA4NtVdvuimG7uL9EiyR8C8bTdTqhEY8KnHyaqYNyoWt28w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Bogdan Purcareata <bogdan.purcareata@nxp.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] lxc: upstream fixes for lxc-execute
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
X-List-Received-Date: Mon, 07 Mar 2016 16:33:29 -0000
Content-Type: multipart/alternative; boundary=001a1143f24a2f5ce7052d780600

--001a1143f24a2f5ce7052d780600
Content-Type: text/plain; charset=UTF-8

merged to master.

Bruce

On Mon, Feb 29, 2016 at 10:27 AM, Bogdan Purcareata <
bogdan.purcareata@nxp.com> wrote:

> These patches address some warnings that LXC throws when running
> an application container. They are currently applied in the official
> repository.
>
> Signed-off-by: Bogdan Purcareata <bogdan.purcareata@nxp.com>
> ---
>  ...s-Create-dev-shm-folder-if-it-doesn-t-exi.patch | 39 ++++++++++++
>  ...if_needed-only-safe-mount-when-rootfs-is-.patch | 69
> ++++++++++++++++++++++
>  ...t_symlink-Account-when-prefix-is-empty-st.patch | 37 ++++++++++++
>  recipes-containers/lxc/lxc_1.1.4.bb                |  3 +
>  4 files changed, 148 insertions(+)
>  create mode 100644
> recipes-containers/lxc/files/lxc_setup_fs-Create-dev-shm-folder-if-it-doesn-t-exi.patch
>  create mode 100644
> recipes-containers/lxc/files/mount_proc_if_needed-only-safe-mount-when-rootfs-is-.patch
>  create mode 100644
> recipes-containers/lxc/files/open_without_symlink-Account-when-prefix-is-empty-st.patch
>
> diff --git
> a/recipes-containers/lxc/files/lxc_setup_fs-Create-dev-shm-folder-if-it-doesn-t-exi.patch
> b/recipes-containers/lxc/files/lxc_setup_fs-Create-dev-shm-folder-if-it-doesn-t-exi.patch
> new file mode 100644
> index 0000000..751a7ac
> --- /dev/null
> +++
> b/recipes-containers/lxc/files/lxc_setup_fs-Create-dev-shm-folder-if-it-doesn-t-exi.patch
> @@ -0,0 +1,39 @@
> +From 81e3c9cf8b2f230d761738da28e9dc69fb90ec46 Mon Sep 17 00:00:00 2001
> +From: Bogdan Purcareata <bogdan.purcareata@nxp.com>
> +Date: Fri, 8 Jan 2016 15:38:44 +0000
> +Subject: [PATCH] lxc_setup_fs: Create /dev/shm folder if it doesn't exist
> +
> +When running application containers with lxc-execute, /dev is
> +populated only with device entries. Since /dev is a tmpfs mount in
> +the container environment, the /dev/shm folder not being present is not
> +a sufficient reason for the /dev/shm mount to fail.
> +
> +Create the /dev/shm directory if not present.
> +
> +Upstream-status: Accepted
> +[
> https://github.com/lxc/lxc/commit/81e3c9cf8b2f230d761738da28e9dc69fb90ec46
> ]
> +
> +Signed-off-by: Bogdan Purcareata <bogdan.purcareata@nxp.com>
> +Acked-by: Serge E. Hallyn <serge.hallyn@ubuntu.com>
> +---
> + src/lxc/initutils.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/src/lxc/initutils.c b/src/lxc/initutils.c
> +index 45df60f..8d9016c 100644
> +--- a/src/lxc/initutils.c
> ++++ b/src/lxc/initutils.c
> +@@ -47,6 +47,10 @@ extern void lxc_setup_fs(void)
> +       if (mount_fs("proc", "/proc", "proc"))
> +               INFO("failed to remount proc");
> +
> ++      /* if /dev has been populated by us, /dev/shm does not exist */
> ++      if (access("/dev/shm", F_OK) && mkdir("/dev/shm", 0777))
> ++              INFO("failed to create /dev/shm");
> ++
> +       /* if we can't mount /dev/shm, continue anyway */
> +       if (mount_fs("shmfs", "/dev/shm", "tmpfs"))
> +               INFO("failed to mount /dev/shm");
> +--
> +1.9.1
> +
> diff --git
> a/recipes-containers/lxc/files/mount_proc_if_needed-only-safe-mount-when-rootfs-is-.patch
> b/recipes-containers/lxc/files/mount_proc_if_needed-only-safe-mount-when-rootfs-is-.patch
> new file mode 100644
> index 0000000..c3afd85
> --- /dev/null
> +++
> b/recipes-containers/lxc/files/mount_proc_if_needed-only-safe-mount-when-rootfs-is-.patch
> @@ -0,0 +1,69 @@
> +From f267d6668e3a95cb2247accb169cf1bc7f8ffcab Mon Sep 17 00:00:00 2001
> +From: Bogdan Purcareata <bogdan.purcareata@nxp.com>
> +Date: Wed, 20 Jan 2016 10:53:57 +0000
> +Subject: [PATCH] mount_proc_if_needed: only safe mount when rootfs is
> defined
> +
> +The safe_mount function was introduced in order to address CVE-2015-1335,
> +one of the vulnerabilities being a mount with a symlink for the
> +destination path. In scenarios such as lxc-execute with no rootfs, the
> +destination path is the host /proc, which is previously mounted by the
> +host, and is unmounted and mounted again in a new set of namespaces,
> +therefore eliminating the need to check for it being a symlink.
> +
> +Mount the rootfs normally if the rootfs is NULL, keep the safe mount
> +only for scenarios where a different rootfs is defined.
> +
> +Upstream-status: Accepted
> +[
> https://github.com/lxc/lxc/commit/f267d6668e3a95cb2247accb169cf1bc7f8ffcab
> ]
> +
> +Signed-off-by: Bogdan Purcareata <bogdan.purcareata@nxp.com>
> +Acked-by: Serge E. Hallyn <serge.hallyn@ubuntu.com>
> +---
> + src/lxc/conf.c  |  1 +
> + src/lxc/utils.c | 10 +++++++++-
> + 2 files changed, 10 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/lxc/conf.c b/src/lxc/conf.c
> +index 632dde3..1e30c0c 100644
> +--- a/src/lxc/conf.c
> ++++ b/src/lxc/conf.c
> +@@ -3509,6 +3509,7 @@ int ttys_shift_ids(struct lxc_conf *c)
> +       return 0;
> + }
> +
> ++/* NOTE: not to be called from inside the container namespace! */
> + int tmp_proc_mount(struct lxc_conf *lxc_conf)
> + {
> +       int mounted;
> +diff --git a/src/lxc/utils.c b/src/lxc/utils.c
> +index 4e96a50..0bc7a20 100644
> +--- a/src/lxc/utils.c
> ++++ b/src/lxc/utils.c
> +@@ -1704,6 +1704,8 @@ int safe_mount(const char *src, const char *dest,
> const char *fstype,
> +  *
> +  * Returns < 0 on failure, 0 if the correct proc was already mounted
> +  * and 1 if a new proc was mounted.
> ++ *
> ++ * NOTE: not to be called from inside the container namespace!
> +  */
> + int mount_proc_if_needed(const char *rootfs)
> + {
> +@@ -1737,8 +1739,14 @@ int mount_proc_if_needed(const char *rootfs)
> +       return 0;
> +
> + domount:
> +-      if (safe_mount("proc", path, "proc", 0, NULL, rootfs) < 0)
> ++      if (!strcmp(rootfs,"")) /* rootfs is NULL */
> ++              ret = mount("proc", path, "proc", 0, NULL);
> ++      else
> ++              ret = safe_mount("proc", path, "proc", 0, NULL, rootfs);
> ++
> ++      if (ret < 0)
> +               return -1;
> ++
> +       INFO("Mounted /proc in container for security transition");
> +       return 1;
> + }
> +--
> +1.9.1
> +
> diff --git
> a/recipes-containers/lxc/files/open_without_symlink-Account-when-prefix-is-empty-st.patch
> b/recipes-containers/lxc/files/open_without_symlink-Account-when-prefix-is-empty-st.patch
> new file mode 100644
> index 0000000..28f9889
> --- /dev/null
> +++
> b/recipes-containers/lxc/files/open_without_symlink-Account-when-prefix-is-empty-st.patch
> @@ -0,0 +1,37 @@
> +From 01074e5b34719537cef474c6b81d4f55e6427639 Mon Sep 17 00:00:00 2001
> +From: Bogdan Purcareata <bogdan.purcareata@nxp.com>
> +Date: Fri, 8 Jan 2016 15:38:35 +0000
> +Subject: [PATCH] open_without_symlink: Account when prefix is empty string
> +
> +In the current implementation, the open_without_symlink function
> +will default to opening the root mount only if the passed rootfs
> +prefix is null. It doesn't account for the case where this prefix
> +is passed as an empty string.
> +
> +Properly handle this second case as well.
> +
> +Upstream-Status: Accepted
> +[
> https://github.com/lxc/lxc/commit/01074e5b34719537cef474c6b81d4f55e6427639
> ]
> +
> +Signed-off-by: Bogdan Purcareata <bogdan.purcareata@nxp.com>
> +Acked-by: Serge E. Hallyn <serge.hallyn@ubuntu.com>
> +---
> + src/lxc/utils.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/lxc/utils.c b/src/lxc/utils.c
> +index ed8c4c4..4e96a50 100644
> +--- a/src/lxc/utils.c
> ++++ b/src/lxc/utils.c
> +@@ -1575,7 +1575,7 @@ static int open_without_symlink(const char *target,
> const char *prefix_skip)
> +       fulllen = strlen(target);
> +
> +       /* make sure prefix-skip makes sense */
> +-      if (prefix_skip) {
> ++      if (prefix_skip && strlen(prefix_skip) > 0) {
> +               curlen = strlen(prefix_skip);
> +               if (!is_subdir(target, prefix_skip, curlen)) {
> +                       ERROR("WHOA there - target '%s' didn't start with
> prefix '%s'",
> +--
> +1.9.1
> +
> diff --git a/recipes-containers/lxc/lxc_1.1.4.bb b/recipes-containers/lxc/
> lxc_1.1.4.bb
> index 4006deb..e017dcf 100644
> --- a/recipes-containers/lxc/lxc_1.1.4.bb
> +++ b/recipes-containers/lxc/lxc_1.1.4.bb
> @@ -34,6 +34,9 @@ SRC_URI = "
> http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>         file://make-some-OpenSSH-tools-optional.patch \
>         file://lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch \
>         file://logs-optionally-use-base-filenames-to-report-src-fil.patch \
> +       file://open_without_symlink-Account-when-prefix-is-empty-st.patch \
> +       file://lxc_setup_fs-Create-dev-shm-folder-if-it-doesn-t-exi.patch \
> +       file://mount_proc_if_needed-only-safe-mount-when-rootfs-is-.patch \
>         "
>
>  SRC_URI[md5sum] = "d33c4bd9c57755c0e2b0e2acbc3f171d"
> --
> 1.9.1
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

--001a1143f24a2f5ce7052d780600
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged to master.<div><br></div><div>Bruce</div></div><div=
 class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Feb 29, 2016 =
at 10:27 AM, Bogdan Purcareata <span dir=3D"ltr">&lt;<a href=3D"mailto:bogd=
an.purcareata@nxp.com" target=3D"_blank">bogdan.purcareata@nxp.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">These patches address some =
warnings that LXC throws when running<br>
an application container. They are currently applied in the official<br>
repository.<br>
<br>
Signed-off-by: Bogdan Purcareata &lt;<a href=3D"mailto:bogdan.purcareata@nx=
p.com">bogdan.purcareata@nxp.com</a>&gt;<br>
---<br>
=C2=A0...s-Create-dev-shm-folder-if-it-doesn-t-exi.patch | 39 ++++++++++++<=
br>
=C2=A0...if_needed-only-safe-mount-when-rootfs-is-.patch | 69 +++++++++++++=
+++++++++<br>
=C2=A0...t_symlink-Account-when-prefix-is-empty-st.patch | 37 ++++++++++++<=
br>
=C2=A0recipes-containers/lxc/<a href=3D"http://lxc_1.1.4.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_1.1.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +<br>
=C2=A04 files changed, 148 insertions(+)<br>
=C2=A0create mode 100644 recipes-containers/lxc/files/lxc_setup_fs-Create-d=
ev-shm-folder-if-it-doesn-t-exi.patch<br>
=C2=A0create mode 100644 recipes-containers/lxc/files/mount_proc_if_needed-=
only-safe-mount-when-rootfs-is-.patch<br>
=C2=A0create mode 100644 recipes-containers/lxc/files/open_without_symlink-=
Account-when-prefix-is-empty-st.patch<br>
<br>
diff --git a/recipes-containers/lxc/files/lxc_setup_fs-Create-dev-shm-folde=
r-if-it-doesn-t-exi.patch b/recipes-containers/lxc/files/lxc_setup_fs-Creat=
e-dev-shm-folder-if-it-doesn-t-exi.patch<br>
new file mode 100644<br>
index 0000000..751a7ac<br>
--- /dev/null<br>
+++ b/recipes-containers/lxc/files/lxc_setup_fs-Create-dev-shm-folder-if-it=
-doesn-t-exi.patch<br>
@@ -0,0 +1,39 @@<br>
+From 81e3c9cf8b2f230d761738da28e9dc69fb90ec46 Mon Sep 17 00:00:00 2001<br>
+From: Bogdan Purcareata &lt;<a href=3D"mailto:bogdan.purcareata@nxp.com">b=
ogdan.purcareata@nxp.com</a>&gt;<br>
+Date: Fri, 8 Jan 2016 15:38:44 +0000<br>
+Subject: [PATCH] lxc_setup_fs: Create /dev/shm folder if it doesn&#39;t ex=
ist<br>
+<br>
+When running application containers with lxc-execute, /dev is<br>
+populated only with device entries. Since /dev is a tmpfs mount in<br>
+the container environment, the /dev/shm folder not being present is not<br=
>
+a sufficient reason for the /dev/shm mount to fail.<br>
+<br>
+Create the /dev/shm directory if not present.<br>
+<br>
+Upstream-status: Accepted<br>
+[<a href=3D"https://github.com/lxc/lxc/commit/81e3c9cf8b2f230d761738da28e9=
dc69fb90ec46" rel=3D"noreferrer" target=3D"_blank">https://github.com/lxc/l=
xc/commit/81e3c9cf8b2f230d761738da28e9dc69fb90ec46</a>]<br>
+<br>
+Signed-off-by: Bogdan Purcareata &lt;<a href=3D"mailto:bogdan.purcareata@n=
xp.com">bogdan.purcareata@nxp.com</a>&gt;<br>
+Acked-by: Serge E. Hallyn &lt;<a href=3D"mailto:serge.hallyn@ubuntu.com">s=
erge.hallyn@ubuntu.com</a>&gt;<br>
+---<br>
+ src/lxc/initutils.c | 4 ++++<br>
+ 1 file changed, 4 insertions(+)<br>
+<br>
+diff --git a/src/lxc/initutils.c b/src/lxc/initutils.c<br>
+index 45df60f..8d9016c 100644<br>
+--- a/src/lxc/initutils.c<br>
++++ b/src/lxc/initutils.c<br>
+@@ -47,6 +47,10 @@ extern void lxc_setup_fs(void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mount_fs(&quot;proc&quot;, &quot;/proc&quot=
;, &quot;proc&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INFO(&quot;failed t=
o remount proc&quot;);<br>
+<br>
++=C2=A0 =C2=A0 =C2=A0 /* if /dev has been populated by us, /dev/shm does n=
ot exist */<br>
++=C2=A0 =C2=A0 =C2=A0 if (access(&quot;/dev/shm&quot;, F_OK) &amp;&amp; mk=
dir(&quot;/dev/shm&quot;, 0777))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 INFO(&quot;failed to cre=
ate /dev/shm&quot;);<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* if we can&#39;t mount /dev/shm, continue any=
way */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mount_fs(&quot;shmfs&quot;, &quot;/dev/shm&=
quot;, &quot;tmpfs&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INFO(&quot;failed t=
o mount /dev/shm&quot;);<br>
+--<br>
+1.9.1<br>
+<br>
diff --git a/recipes-containers/lxc/files/mount_proc_if_needed-only-safe-mo=
unt-when-rootfs-is-.patch b/recipes-containers/lxc/files/mount_proc_if_need=
ed-only-safe-mount-when-rootfs-is-.patch<br>
new file mode 100644<br>
index 0000000..c3afd85<br>
--- /dev/null<br>
+++ b/recipes-containers/lxc/files/mount_proc_if_needed-only-safe-mount-whe=
n-rootfs-is-.patch<br>
@@ -0,0 +1,69 @@<br>
+From f267d6668e3a95cb2247accb169cf1bc7f8ffcab Mon Sep 17 00:00:00 2001<br>
+From: Bogdan Purcareata &lt;<a href=3D"mailto:bogdan.purcareata@nxp.com">b=
ogdan.purcareata@nxp.com</a>&gt;<br>
+Date: Wed, 20 Jan 2016 10:53:57 +0000<br>
+Subject: [PATCH] mount_proc_if_needed: only safe mount when rootfs is defi=
ned<br>
+<br>
+The safe_mount function was introduced in order to address CVE-2015-1335,<=
br>
+one of the vulnerabilities being a mount with a symlink for the<br>
+destination path. In scenarios such as lxc-execute with no rootfs, the<br>
+destination path is the host /proc, which is previously mounted by the<br>
+host, and is unmounted and mounted again in a new set of namespaces,<br>
+therefore eliminating the need to check for it being a symlink.<br>
+<br>
+Mount the rootfs normally if the rootfs is NULL, keep the safe mount<br>
+only for scenarios where a different rootfs is defined.<br>
+<br>
+Upstream-status: Accepted<br>
+[<a href=3D"https://github.com/lxc/lxc/commit/f267d6668e3a95cb2247accb169c=
f1bc7f8ffcab" rel=3D"noreferrer" target=3D"_blank">https://github.com/lxc/l=
xc/commit/f267d6668e3a95cb2247accb169cf1bc7f8ffcab</a>]<br>
+<br>
+Signed-off-by: Bogdan Purcareata &lt;<a href=3D"mailto:bogdan.purcareata@n=
xp.com">bogdan.purcareata@nxp.com</a>&gt;<br>
+Acked-by: Serge E. Hallyn &lt;<a href=3D"mailto:serge.hallyn@ubuntu.com">s=
erge.hallyn@ubuntu.com</a>&gt;<br>
+---<br>
+ src/lxc/conf.c=C2=A0 |=C2=A0 1 +<br>
+ src/lxc/utils.c | 10 +++++++++-<br>
+ 2 files changed, 10 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/lxc/conf.c b/src/lxc/conf.c<br>
+index 632dde3..1e30c0c 100644<br>
+--- a/src/lxc/conf.c<br>
++++ b/src/lxc/conf.c<br>
+@@ -3509,6 +3509,7 @@ int ttys_shift_ids(struct lxc_conf *c)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+ }<br>
+<br>
++/* NOTE: not to be called from inside the container namespace! */<br>
+ int tmp_proc_mount(struct lxc_conf *lxc_conf)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int mounted;<br>
+diff --git a/src/lxc/utils.c b/src/lxc/utils.c<br>
+index 4e96a50..0bc7a20 100644<br>
+--- a/src/lxc/utils.c<br>
++++ b/src/lxc/utils.c<br>
+@@ -1704,6 +1704,8 @@ int safe_mount(const char *src, const char *dest, co=
nst char *fstype,<br>
+=C2=A0 *<br>
+=C2=A0 * Returns &lt; 0 on failure, 0 if the correct proc was already moun=
ted<br>
+=C2=A0 * and 1 if a new proc was mounted.<br>
++ *<br>
++ * NOTE: not to be called from inside the container namespace!<br>
+=C2=A0 */<br>
+ int mount_proc_if_needed(const char *rootfs)<br>
+ {<br>
+@@ -1737,8 +1739,14 @@ int mount_proc_if_needed(const char *rootfs)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+<br>
+ domount:<br>
+-=C2=A0 =C2=A0 =C2=A0 if (safe_mount(&quot;proc&quot;, path, &quot;proc&qu=
ot;, 0, NULL, rootfs) &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 if (!strcmp(rootfs,&quot;&quot;)) /* rootfs is NULL =
*/<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D mount(&quot;proc=
&quot;, path, &quot;proc&quot;, 0, NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D safe_mount(&quot=
;proc&quot;, path, &quot;proc&quot;, 0, NULL, rootfs);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0INFO(&quot;Mounted /proc in container for secur=
ity transition&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
+ }<br>
+--<br>
+1.9.1<br>
+<br>
diff --git a/recipes-containers/lxc/files/open_without_symlink-Account-when=
-prefix-is-empty-st.patch b/recipes-containers/lxc/files/open_without_symli=
nk-Account-when-prefix-is-empty-st.patch<br>
new file mode 100644<br>
index 0000000..28f9889<br>
--- /dev/null<br>
+++ b/recipes-containers/lxc/files/open_without_symlink-Account-when-prefix=
-is-empty-st.patch<br>
@@ -0,0 +1,37 @@<br>
+From 01074e5b34719537cef474c6b81d4f55e6427639 Mon Sep 17 00:00:00 2001<br>
+From: Bogdan Purcareata &lt;<a href=3D"mailto:bogdan.purcareata@nxp.com">b=
ogdan.purcareata@nxp.com</a>&gt;<br>
+Date: Fri, 8 Jan 2016 15:38:35 +0000<br>
+Subject: [PATCH] open_without_symlink: Account when prefix is empty string=
<br>
+<br>
+In the current implementation, the open_without_symlink function<br>
+will default to opening the root mount only if the passed rootfs<br>
+prefix is null. It doesn&#39;t account for the case where this prefix<br>
+is passed as an empty string.<br>
+<br>
+Properly handle this second case as well.<br>
+<br>
+Upstream-Status: Accepted<br>
+[<a href=3D"https://github.com/lxc/lxc/commit/01074e5b34719537cef474c6b81d=
4f55e6427639" rel=3D"noreferrer" target=3D"_blank">https://github.com/lxc/l=
xc/commit/01074e5b34719537cef474c6b81d4f55e6427639</a>]<br>
+<br>
+Signed-off-by: Bogdan Purcareata &lt;<a href=3D"mailto:bogdan.purcareata@n=
xp.com">bogdan.purcareata@nxp.com</a>&gt;<br>
+Acked-by: Serge E. Hallyn &lt;<a href=3D"mailto:serge.hallyn@ubuntu.com">s=
erge.hallyn@ubuntu.com</a>&gt;<br>
+---<br>
+ src/lxc/utils.c | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/lxc/utils.c b/src/lxc/utils.c<br>
+index ed8c4c4..4e96a50 100644<br>
+--- a/src/lxc/utils.c<br>
++++ b/src/lxc/utils.c<br>
+@@ -1575,7 +1575,7 @@ static int open_without_symlink(const char *target, =
const char *prefix_skip)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fulllen =3D strlen(target);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* make sure prefix-skip makes sense */<br>
+-=C2=A0 =C2=A0 =C2=A0 if (prefix_skip) {<br>
++=C2=A0 =C2=A0 =C2=A0 if (prefix_skip &amp;&amp; strlen(prefix_skip) &gt; =
0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0curlen =3D strlen(p=
refix_skip);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!is_subdir(targ=
et, prefix_skip, curlen)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ERROR(&quot;WHOA there - target &#39;%s&#39; didn&#39;t start wit=
h prefix &#39;%s&#39;&quot;,<br>
+--<br>
+1.9.1<br>
+<br>
diff --git a/recipes-containers/lxc/<a href=3D"http://lxc_1.1.4.bb" rel=3D"=
noreferrer" target=3D"_blank">lxc_1.1.4.bb</a> b/recipes-containers/lxc/<a =
href=3D"http://lxc_1.1.4.bb" rel=3D"noreferrer" target=3D"_blank">lxc_1.1.4=
.bb</a><br>
index 4006deb..e017dcf 100644<br>
--- a/recipes-containers/lxc/<a href=3D"http://lxc_1.1.4.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_1.1.4.bb</a><br>
+++ b/recipes-containers/lxc/<a href=3D"http://lxc_1.1.4.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_1.1.4.bb</a><br>
@@ -34,6 +34,9 @@ SRC_URI =3D &quot;<a href=3D"http://linuxcontainers.org/d=
ownloads/${BPN}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://l=
inuxcontainers.org/downloads/${BPN}-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://make-some-OpenSSH-tools-optional.patch \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lxc-doc-upgrade-to-use-docbook-3.1-DTD.p=
atch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://logs-optionally-use-base-filenames-to-re=
port-src-fil.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://open_without_symlink-Account-when-prefix=
-is-empty-st.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://lxc_setup_fs-Create-dev-shm-folder-if-it=
-doesn-t-exi.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://mount_proc_if_needed-only-safe-mount-whe=
n-rootfs-is-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;d33c4bd9c57755c0e2b0e2acbc3f171d&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div>

--001a1143f24a2f5ce7052d780600--
