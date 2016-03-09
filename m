Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 585F2E00951; Tue,  8 Mar 2016 21:12:19 -0800 (PST)
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
	*      [209.85.213.43 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5F9ACE0092C
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Mar 2016 21:12:15 -0800 (PST)
Received: by mail-vk0-f43.google.com with SMTP id e6so43383244vkh.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 08 Mar 2016 21:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=t7bKrp/5gr9Jd3BgzSkI37MT9KIZADXioSkxA2/suLg=;
	b=gTcqOarWx83dn8PNtxKIKyfT4dTQ4EvqwxEb/71WHQueGU6zfX96NRBADhy1ObaqDF
	wBCriODbEMcOMNGW/4bGL17gFWS4pvrnaFN+dA/KlZau94LLdRaeOXKwBMW/VDbITaJx
	kmwbS3Sz23sXPGVND0js2Vz0wgK8JxCz+VbYWM3xMj7Yofdw6J2eGy6LRXLnAg0iwG7S
	88l2YuWcm9U3QyFNZsYHbWWgtBgNs2oWbwG6xh9RS5PjZz2VpD5VmS8/RGDvil77mX7e
	NOjgfGaXanAnoX9S9fVuRgf1S7lOp/knVXaxw5ocp/F3z6CYD6tPiYmlxttrxCkUfCFi
	EVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=t7bKrp/5gr9Jd3BgzSkI37MT9KIZADXioSkxA2/suLg=;
	b=S7dt+d0Hnkc29xUkfyT9hJ7m7VUTv7UL0QxGRfZqtFBaeDnPpaMfVc+cAKh3VChYwA
	gGk4ErT5w/RDv0s5RV+kmqvIMVfp0tU57vyK/ucI63wYLyK1G/lgxSABZrYq2XQMmqaa
	ilJ/F5NS4/JZrveR5yhrTc3iH19whIHLXq3XRmaI26Zj9+RiC22eAl8/OJx/n4ZIjB65
	sniNgolYSh47yKRe6iyYPUmzfpe8SuhwEGC5eShlzzfaSAY6xhc0USgBxifasVT77ii7
	Urml0EmYcTOBfqBoaE8Mxl5Y+ntu1RRM6wmmn0HyCxzyXPsujUGteG+YWGmprbBuIhQO
	ePWw==
X-Gm-Message-State: AD7BkJLBHSSvXqGQEQgQb7tHivcAFde9ypCYgieFh0/w0o0NGCEqhABclECLutYLiGtTaf6b18RnbUNplsVwAQ==
MIME-Version: 1.0
X-Received: by 10.31.173.18 with SMTP id w18mr25686354vke.31.1457500334414;
	Tue, 08 Mar 2016 21:12:14 -0800 (PST)
Received: by 10.176.6.42 with HTTP; Tue, 8 Mar 2016 21:12:14 -0800 (PST)
In-Reply-To: <56DEB17F.3050003@nxp.com>
References: <1456759679-385-1-git-send-email-bogdan.purcareata@nxp.com>
	<CADkTA4NtVdvuimG7uL9EiyR8C8bTdTqhEY8KnHyaqYNyoWt28w@mail.gmail.com>
	<56DEB17F.3050003@nxp.com>
Date: Wed, 9 Mar 2016 00:12:14 -0500
Message-ID: <CADkTA4N-EFdDH_kBQUfx6b_ADXYDKcC_LOf0Yx269GWPML4toQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 09 Mar 2016 05:12:19 -0000
Content-Type: multipart/alternative; boundary=001a1143f394b16391052d96bd49

--001a1143f394b16391052d96bd49
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 8, 2016 at 6:03 AM, Bogdan Purcareata <bogdan.purcareata@nxp.com
> wrote:

> Thank you!
>
> Could you kindly cherry-pick this commit on the jethro branch as well?
> Sorry I
> failed to mention this in the initial patch.
>

Cherry picked to jethro.

Bruce


>
> Thank you!
> Bogdan P.
>
> On 07.03.2016 18:33, Bruce Ashfield wrote:
> > merged to master.
> >
> > Bruce
> >
> > On Mon, Feb 29, 2016 at 10:27 AM, Bogdan Purcareata <
> > bogdan.purcareata@nxp.com> wrote:
> >
> >> These patches address some warnings that LXC throws when running
> >> an application container. They are currently applied in the official
> >> repository.
> >>
> >> Signed-off-by: Bogdan Purcareata <bogdan.purcareata@nxp.com>
> >> ---
> >>   ...s-Create-dev-shm-folder-if-it-doesn-t-exi.patch | 39 ++++++++++++
> >>   ...if_needed-only-safe-mount-when-rootfs-is-.patch | 69
> >> ++++++++++++++++++++++
> >>   ...t_symlink-Account-when-prefix-is-empty-st.patch | 37 ++++++++++++
> >>   recipes-containers/lxc/lxc_1.1.4.bb                |  3 +
> >>   4 files changed, 148 insertions(+)
> >>   create mode 100644
> >>
> recipes-containers/lxc/files/lxc_setup_fs-Create-dev-shm-folder-if-it-doesn-t-exi.patch
> >>   create mode 100644
> >>
> recipes-containers/lxc/files/mount_proc_if_needed-only-safe-mount-when-rootfs-is-.patch
> >>   create mode 100644
> >>
> recipes-containers/lxc/files/open_without_symlink-Account-when-prefix-is-empty-st.patch
> >>
> >> diff --git
> >>
> a/recipes-containers/lxc/files/lxc_setup_fs-Create-dev-shm-folder-if-it-doesn-t-exi.patch
> >>
> b/recipes-containers/lxc/files/lxc_setup_fs-Create-dev-shm-folder-if-it-doesn-t-exi.patch
> >> new file mode 100644
> >> index 0000000..751a7ac
> >> --- /dev/null
> >> +++
> >>
> b/recipes-containers/lxc/files/lxc_setup_fs-Create-dev-shm-folder-if-it-doesn-t-exi.patch
> >> @@ -0,0 +1,39 @@
> >> +From 81e3c9cf8b2f230d761738da28e9dc69fb90ec46 Mon Sep 17 00:00:00 2001
> >> +From: Bogdan Purcareata <bogdan.purcareata@nxp.com>
> >> +Date: Fri, 8 Jan 2016 15:38:44 +0000
> >> +Subject: [PATCH] lxc_setup_fs: Create /dev/shm folder if it doesn't
> exist
> >> +
> >> +When running application containers with lxc-execute, /dev is
> >> +populated only with device entries. Since /dev is a tmpfs mount in
> >> +the container environment, the /dev/shm folder not being present is not
> >> +a sufficient reason for the /dev/shm mount to fail.
> >> +
> >> +Create the /dev/shm directory if not present.
> >> +
> >> +Upstream-status: Accepted
> >> +[
> >>
> https://github.com/lxc/lxc/commit/81e3c9cf8b2f230d761738da28e9dc69fb90ec46
> >> ]
> >> +
> >> +Signed-off-by: Bogdan Purcareata <bogdan.purcareata@nxp.com>
> >> +Acked-by: Serge E. Hallyn <serge.hallyn@ubuntu.com>
> >> +---
> >> + src/lxc/initutils.c | 4 ++++
> >> + 1 file changed, 4 insertions(+)
> >> +
> >> +diff --git a/src/lxc/initutils.c b/src/lxc/initutils.c
> >> +index 45df60f..8d9016c 100644
> >> +--- a/src/lxc/initutils.c
> >> ++++ b/src/lxc/initutils.c
> >> +@@ -47,6 +47,10 @@ extern void lxc_setup_fs(void)
> >> +       if (mount_fs("proc", "/proc", "proc"))
> >> +               INFO("failed to remount proc");
> >> +
> >> ++      /* if /dev has been populated by us, /dev/shm does not exist */
> >> ++      if (access("/dev/shm", F_OK) && mkdir("/dev/shm", 0777))
> >> ++              INFO("failed to create /dev/shm");
> >> ++
> >> +       /* if we can't mount /dev/shm, continue anyway */
> >> +       if (mount_fs("shmfs", "/dev/shm", "tmpfs"))
> >> +               INFO("failed to mount /dev/shm");
> >> +--
> >> +1.9.1
> >> +
> >> diff --git
> >>
> a/recipes-containers/lxc/files/mount_proc_if_needed-only-safe-mount-when-rootfs-is-.patch
> >>
> b/recipes-containers/lxc/files/mount_proc_if_needed-only-safe-mount-when-rootfs-is-.patch
> >> new file mode 100644
> >> index 0000000..c3afd85
> >> --- /dev/null
> >> +++
> >>
> b/recipes-containers/lxc/files/mount_proc_if_needed-only-safe-mount-when-rootfs-is-.patch
> >> @@ -0,0 +1,69 @@
> >> +From f267d6668e3a95cb2247accb169cf1bc7f8ffcab Mon Sep 17 00:00:00 2001
> >> +From: Bogdan Purcareata <bogdan.purcareata@nxp.com>
> >> +Date: Wed, 20 Jan 2016 10:53:57 +0000
> >> +Subject: [PATCH] mount_proc_if_needed: only safe mount when rootfs is
> >> defined
> >> +
> >> +The safe_mount function was introduced in order to address
> CVE-2015-1335,
> >> +one of the vulnerabilities being a mount with a symlink for the
> >> +destination path. In scenarios such as lxc-execute with no rootfs, the
> >> +destination path is the host /proc, which is previously mounted by the
> >> +host, and is unmounted and mounted again in a new set of namespaces,
> >> +therefore eliminating the need to check for it being a symlink.
> >> +
> >> +Mount the rootfs normally if the rootfs is NULL, keep the safe mount
> >> +only for scenarios where a different rootfs is defined.
> >> +
> >> +Upstream-status: Accepted
> >> +[
> >>
> https://github.com/lxc/lxc/commit/f267d6668e3a95cb2247accb169cf1bc7f8ffcab
> >> ]
> >> +
> >> +Signed-off-by: Bogdan Purcareata <bogdan.purcareata@nxp.com>
> >> +Acked-by: Serge E. Hallyn <serge.hallyn@ubuntu.com>
> >> +---
> >> + src/lxc/conf.c  |  1 +
> >> + src/lxc/utils.c | 10 +++++++++-
> >> + 2 files changed, 10 insertions(+), 1 deletion(-)
> >> +
> >> +diff --git a/src/lxc/conf.c b/src/lxc/conf.c
> >> +index 632dde3..1e30c0c 100644
> >> +--- a/src/lxc/conf.c
> >> ++++ b/src/lxc/conf.c
> >> +@@ -3509,6 +3509,7 @@ int ttys_shift_ids(struct lxc_conf *c)
> >> +       return 0;
> >> + }
> >> +
> >> ++/* NOTE: not to be called from inside the container namespace! */
> >> + int tmp_proc_mount(struct lxc_conf *lxc_conf)
> >> + {
> >> +       int mounted;
> >> +diff --git a/src/lxc/utils.c b/src/lxc/utils.c
> >> +index 4e96a50..0bc7a20 100644
> >> +--- a/src/lxc/utils.c
> >> ++++ b/src/lxc/utils.c
> >> +@@ -1704,6 +1704,8 @@ int safe_mount(const char *src, const char *dest,
> >> const char *fstype,
> >> +  *
> >> +  * Returns < 0 on failure, 0 if the correct proc was already mounted
> >> +  * and 1 if a new proc was mounted.
> >> ++ *
> >> ++ * NOTE: not to be called from inside the container namespace!
> >> +  */
> >> + int mount_proc_if_needed(const char *rootfs)
> >> + {
> >> +@@ -1737,8 +1739,14 @@ int mount_proc_if_needed(const char *rootfs)
> >> +       return 0;
> >> +
> >> + domount:
> >> +-      if (safe_mount("proc", path, "proc", 0, NULL, rootfs) < 0)
> >> ++      if (!strcmp(rootfs,"")) /* rootfs is NULL */
> >> ++              ret = mount("proc", path, "proc", 0, NULL);
> >> ++      else
> >> ++              ret = safe_mount("proc", path, "proc", 0, NULL, rootfs);
> >> ++
> >> ++      if (ret < 0)
> >> +               return -1;
> >> ++
> >> +       INFO("Mounted /proc in container for security transition");
> >> +       return 1;
> >> + }
> >> +--
> >> +1.9.1
> >> +
> >> diff --git
> >>
> a/recipes-containers/lxc/files/open_without_symlink-Account-when-prefix-is-empty-st.patch
> >>
> b/recipes-containers/lxc/files/open_without_symlink-Account-when-prefix-is-empty-st.patch
> >> new file mode 100644
> >> index 0000000..28f9889
> >> --- /dev/null
> >> +++
> >>
> b/recipes-containers/lxc/files/open_without_symlink-Account-when-prefix-is-empty-st.patch
> >> @@ -0,0 +1,37 @@
> >> +From 01074e5b34719537cef474c6b81d4f55e6427639 Mon Sep 17 00:00:00 2001
> >> +From: Bogdan Purcareata <bogdan.purcareata@nxp.com>
> >> +Date: Fri, 8 Jan 2016 15:38:35 +0000
> >> +Subject: [PATCH] open_without_symlink: Account when prefix is empty
> string
> >> +
> >> +In the current implementation, the open_without_symlink function
> >> +will default to opening the root mount only if the passed rootfs
> >> +prefix is null. It doesn't account for the case where this prefix
> >> +is passed as an empty string.
> >> +
> >> +Properly handle this second case as well.
> >> +
> >> +Upstream-Status: Accepted
> >> +[
> >>
> https://github.com/lxc/lxc/commit/01074e5b34719537cef474c6b81d4f55e6427639
> >> ]
> >> +
> >> +Signed-off-by: Bogdan Purcareata <bogdan.purcareata@nxp.com>
> >> +Acked-by: Serge E. Hallyn <serge.hallyn@ubuntu.com>
> >> +---
> >> + src/lxc/utils.c | 2 +-
> >> + 1 file changed, 1 insertion(+), 1 deletion(-)
> >> +
> >> +diff --git a/src/lxc/utils.c b/src/lxc/utils.c
> >> +index ed8c4c4..4e96a50 100644
> >> +--- a/src/lxc/utils.c
> >> ++++ b/src/lxc/utils.c
> >> +@@ -1575,7 +1575,7 @@ static int open_without_symlink(const char
> *target,
> >> const char *prefix_skip)
> >> +       fulllen = strlen(target);
> >> +
> >> +       /* make sure prefix-skip makes sense */
> >> +-      if (prefix_skip) {
> >> ++      if (prefix_skip && strlen(prefix_skip) > 0) {
> >> +               curlen = strlen(prefix_skip);
> >> +               if (!is_subdir(target, prefix_skip, curlen)) {
> >> +                       ERROR("WHOA there - target '%s' didn't start
> with
> >> prefix '%s'",
> >> +--
> >> +1.9.1
> >> +
> >> diff --git a/recipes-containers/lxc/lxc_1.1.4.bb
> b/recipes-containers/lxc/
> >> lxc_1.1.4.bb
> >> index 4006deb..e017dcf 100644
> >> --- a/recipes-containers/lxc/lxc_1.1.4.bb
> >> +++ b/recipes-containers/lxc/lxc_1.1.4.bb
> >> @@ -34,6 +34,9 @@ SRC_URI = "
> >> http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
> >>          file://make-some-OpenSSH-tools-optional.patch \
> >>          file://lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch \
> >>
> file://logs-optionally-use-base-filenames-to-report-src-fil.patch \
> >> +
>  file://open_without_symlink-Account-when-prefix-is-empty-st.patch \
> >> +
>  file://lxc_setup_fs-Create-dev-shm-folder-if-it-doesn-t-exi.patch \
> >> +
>  file://mount_proc_if_needed-only-safe-mount-when-rootfs-is-.patch \
> >>          "
> >>
> >>   SRC_URI[md5sum] = "d33c4bd9c57755c0e2b0e2acbc3f171d"
> >> --
> >> 1.9.1
> >>
> >> --
> >> _______________________________________________
> >> meta-virtualization mailing list
> >> meta-virtualization@yoctoproject.org
> >> https://lists.yoctoproject.org/listinfo/meta-virtualization
> >>
> >
> >
> >
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1143f394b16391052d96bd49
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Mar 8, 2016 at 6:03 AM, Bogdan Purcareata <span dir=3D"ltr">&lt=
;<a href=3D"mailto:bogdan.purcareata@nxp.com" target=3D"_blank">bogdan.purc=
areata@nxp.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Than=
k you!<br>
<br>
Could you kindly cherry-pick this commit on the jethro branch as well? Sorr=
y I<br>
failed to mention this in the initial patch.<br></blockquote><div><br>Cherr=
y picked to jethro.</div><div><br></div><div>Bruce</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">
<br>
Thank you!<br>
Bogdan P.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
On 07.03.2016 18:33, Bruce Ashfield wrote:<br>
&gt; merged to master.<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt; On Mon, Feb 29, 2016 at 10:27 AM, Bogdan Purcareata &lt;<br>
&gt; <a href=3D"mailto:bogdan.purcareata@nxp.com">bogdan.purcareata@nxp.com=
</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; These patches address some warnings that LXC throws when running<b=
r>
&gt;&gt; an application container. They are currently applied in the offici=
al<br>
&gt;&gt; repository.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Bogdan Purcareata &lt;<a href=3D"mailto:bogdan.purc=
areata@nxp.com">bogdan.purcareata@nxp.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0...s-Create-dev-shm-folder-if-it-doesn-t-exi.patch | 3=
9 ++++++++++++<br>
&gt;&gt;=C2=A0 =C2=A0...if_needed-only-safe-mount-when-rootfs-is-.patch | 6=
9<br>
&gt;&gt; ++++++++++++++++++++++<br>
&gt;&gt;=C2=A0 =C2=A0...t_symlink-Account-when-prefix-is-empty-st.patch | 3=
7 ++++++++++++<br>
&gt;&gt;=C2=A0 =C2=A0recipes-containers/lxc/<a href=3D"http://lxc_1.1.4.bb"=
 rel=3D"noreferrer" target=3D"_blank">lxc_1.1.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +<br>
&gt;&gt;=C2=A0 =C2=A04 files changed, 148 insertions(+)<br>
&gt;&gt;=C2=A0 =C2=A0create mode 100644<br>
&gt;&gt; recipes-containers/lxc/files/lxc_setup_fs-Create-dev-shm-folder-if=
-it-doesn-t-exi.patch<br>
&gt;&gt;=C2=A0 =C2=A0create mode 100644<br>
&gt;&gt; recipes-containers/lxc/files/mount_proc_if_needed-only-safe-mount-=
when-rootfs-is-.patch<br>
&gt;&gt;=C2=A0 =C2=A0create mode 100644<br>
&gt;&gt; recipes-containers/lxc/files/open_without_symlink-Account-when-pre=
fix-is-empty-st.patch<br>
&gt;&gt;<br>
&gt;&gt; diff --git<br>
&gt;&gt; a/recipes-containers/lxc/files/lxc_setup_fs-Create-dev-shm-folder-=
if-it-doesn-t-exi.patch<br>
&gt;&gt; b/recipes-containers/lxc/files/lxc_setup_fs-Create-dev-shm-folder-=
if-it-doesn-t-exi.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000..751a7ac<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++<br>
&gt;&gt; b/recipes-containers/lxc/files/lxc_setup_fs-Create-dev-shm-folder-=
if-it-doesn-t-exi.patch<br>
&gt;&gt; @@ -0,0 +1,39 @@<br>
&gt;&gt; +From 81e3c9cf8b2f230d761738da28e9dc69fb90ec46 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Bogdan Purcareata &lt;<a href=3D"mailto:bogdan.purcareata@n=
xp.com">bogdan.purcareata@nxp.com</a>&gt;<br>
&gt;&gt; +Date: Fri, 8 Jan 2016 15:38:44 +0000<br>
&gt;&gt; +Subject: [PATCH] lxc_setup_fs: Create /dev/shm folder if it doesn=
&#39;t exist<br>
&gt;&gt; +<br>
&gt;&gt; +When running application containers with lxc-execute, /dev is<br>
&gt;&gt; +populated only with device entries. Since /dev is a tmpfs mount i=
n<br>
&gt;&gt; +the container environment, the /dev/shm folder not being present =
is not<br>
&gt;&gt; +a sufficient reason for the /dev/shm mount to fail.<br>
&gt;&gt; +<br>
&gt;&gt; +Create the /dev/shm directory if not present.<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-status: Accepted<br>
&gt;&gt; +[<br>
&gt;&gt; <a href=3D"https://github.com/lxc/lxc/commit/81e3c9cf8b2f230d76173=
8da28e9dc69fb90ec46" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/lxc/lxc/commit/81e3c9cf8b2f230d761738da28e9dc69fb90ec46</a><br>
&gt;&gt; ]<br>
&gt;&gt; +<br>
&gt;&gt; +Signed-off-by: Bogdan Purcareata &lt;<a href=3D"mailto:bogdan.pur=
careata@nxp.com">bogdan.purcareata@nxp.com</a>&gt;<br>
&gt;&gt; +Acked-by: Serge E. Hallyn &lt;<a href=3D"mailto:serge.hallyn@ubun=
tu.com">serge.hallyn@ubuntu.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + src/lxc/initutils.c | 4 ++++<br>
&gt;&gt; + 1 file changed, 4 insertions(+)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/src/lxc/initutils.c b/src/lxc/initutils.c<br>
&gt;&gt; +index 45df60f..8d9016c 100644<br>
&gt;&gt; +--- a/src/lxc/initutils.c<br>
&gt;&gt; ++++ b/src/lxc/initutils.c<br>
&gt;&gt; +@@ -47,6 +47,10 @@ extern void lxc_setup_fs(void)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mount_fs(&quot;proc&quot;, &quot;/=
proc&quot;, &quot;proc&quot;))<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INFO(&quot=
;failed to remount proc&quot;);<br>
&gt;&gt; +<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 /* if /dev has been populated by us, /dev/s=
hm does not exist */<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if (access(&quot;/dev/shm&quot;, F_OK) &amp=
;&amp; mkdir(&quot;/dev/shm&quot;, 0777))<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 INFO(&quot;fail=
ed to create /dev/shm&quot;);<br>
&gt;&gt; ++<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* if we can&#39;t mount /dev/shm, con=
tinue anyway */<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mount_fs(&quot;shmfs&quot;, &quot;=
/dev/shm&quot;, &quot;tmpfs&quot;))<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INFO(&quot=
;failed to mount /dev/shm&quot;);<br>
&gt;&gt; +--<br>
&gt;&gt; +1.9.1<br>
&gt;&gt; +<br>
&gt;&gt; diff --git<br>
&gt;&gt; a/recipes-containers/lxc/files/mount_proc_if_needed-only-safe-moun=
t-when-rootfs-is-.patch<br>
&gt;&gt; b/recipes-containers/lxc/files/mount_proc_if_needed-only-safe-moun=
t-when-rootfs-is-.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000..c3afd85<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++<br>
&gt;&gt; b/recipes-containers/lxc/files/mount_proc_if_needed-only-safe-moun=
t-when-rootfs-is-.patch<br>
&gt;&gt; @@ -0,0 +1,69 @@<br>
&gt;&gt; +From f267d6668e3a95cb2247accb169cf1bc7f8ffcab Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Bogdan Purcareata &lt;<a href=3D"mailto:bogdan.purcareata@n=
xp.com">bogdan.purcareata@nxp.com</a>&gt;<br>
&gt;&gt; +Date: Wed, 20 Jan 2016 10:53:57 +0000<br>
&gt;&gt; +Subject: [PATCH] mount_proc_if_needed: only safe mount when rootf=
s is<br>
&gt;&gt; defined<br>
&gt;&gt; +<br>
&gt;&gt; +The safe_mount function was introduced in order to address CVE-20=
15-1335,<br>
&gt;&gt; +one of the vulnerabilities being a mount with a symlink for the<b=
r>
&gt;&gt; +destination path. In scenarios such as lxc-execute with no rootfs=
, the<br>
&gt;&gt; +destination path is the host /proc, which is previously mounted b=
y the<br>
&gt;&gt; +host, and is unmounted and mounted again in a new set of namespac=
es,<br>
&gt;&gt; +therefore eliminating the need to check for it being a symlink.<b=
r>
&gt;&gt; +<br>
&gt;&gt; +Mount the rootfs normally if the rootfs is NULL, keep the safe mo=
unt<br>
&gt;&gt; +only for scenarios where a different rootfs is defined.<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-status: Accepted<br>
&gt;&gt; +[<br>
&gt;&gt; <a href=3D"https://github.com/lxc/lxc/commit/f267d6668e3a95cb2247a=
ccb169cf1bc7f8ffcab" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/lxc/lxc/commit/f267d6668e3a95cb2247accb169cf1bc7f8ffcab</a><br>
&gt;&gt; ]<br>
&gt;&gt; +<br>
&gt;&gt; +Signed-off-by: Bogdan Purcareata &lt;<a href=3D"mailto:bogdan.pur=
careata@nxp.com">bogdan.purcareata@nxp.com</a>&gt;<br>
&gt;&gt; +Acked-by: Serge E. Hallyn &lt;<a href=3D"mailto:serge.hallyn@ubun=
tu.com">serge.hallyn@ubuntu.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + src/lxc/conf.c=C2=A0 |=C2=A0 1 +<br>
&gt;&gt; + src/lxc/utils.c | 10 +++++++++-<br>
&gt;&gt; + 2 files changed, 10 insertions(+), 1 deletion(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/src/lxc/conf.c b/src/lxc/conf.c<br>
&gt;&gt; +index 632dde3..1e30c0c 100644<br>
&gt;&gt; +--- a/src/lxc/conf.c<br>
&gt;&gt; ++++ b/src/lxc/conf.c<br>
&gt;&gt; +@@ -3509,6 +3509,7 @@ int ttys_shift_ids(struct lxc_conf *c)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;&gt; + }<br>
&gt;&gt; +<br>
&gt;&gt; ++/* NOTE: not to be called from inside the container namespace! *=
/<br>
&gt;&gt; + int tmp_proc_mount(struct lxc_conf *lxc_conf)<br>
&gt;&gt; + {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int mounted;<br>
&gt;&gt; +diff --git a/src/lxc/utils.c b/src/lxc/utils.c<br>
&gt;&gt; +index 4e96a50..0bc7a20 100644<br>
&gt;&gt; +--- a/src/lxc/utils.c<br>
&gt;&gt; ++++ b/src/lxc/utils.c<br>
&gt;&gt; +@@ -1704,6 +1704,8 @@ int safe_mount(const char *src, const char =
*dest,<br>
&gt;&gt; const char *fstype,<br>
&gt;&gt; +=C2=A0 *<br>
&gt;&gt; +=C2=A0 * Returns &lt; 0 on failure, 0 if the correct proc was alr=
eady mounted<br>
&gt;&gt; +=C2=A0 * and 1 if a new proc was mounted.<br>
&gt;&gt; ++ *<br>
&gt;&gt; ++ * NOTE: not to be called from inside the container namespace!<b=
r>
&gt;&gt; +=C2=A0 */<br>
&gt;&gt; + int mount_proc_if_needed(const char *rootfs)<br>
&gt;&gt; + {<br>
&gt;&gt; +@@ -1737,8 +1739,14 @@ int mount_proc_if_needed(const char *rootf=
s)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;&gt; +<br>
&gt;&gt; + domount:<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 if (safe_mount(&quot;proc&quot;, path, &quo=
t;proc&quot;, 0, NULL, rootfs) &lt; 0)<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if (!strcmp(rootfs,&quot;&quot;)) /* rootfs=
 is NULL */<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D mount(&=
quot;proc&quot;, path, &quot;proc&quot;, 0, NULL);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 else<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D safe_mo=
unt(&quot;proc&quot;, path, &quot;proc&quot;, 0, NULL, rootfs);<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;=
<br>
&gt;&gt; ++<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0INFO(&quot;Mounted /proc in container =
for security transition&quot;);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
&gt;&gt; + }<br>
&gt;&gt; +--<br>
&gt;&gt; +1.9.1<br>
&gt;&gt; +<br>
&gt;&gt; diff --git<br>
&gt;&gt; a/recipes-containers/lxc/files/open_without_symlink-Account-when-p=
refix-is-empty-st.patch<br>
&gt;&gt; b/recipes-containers/lxc/files/open_without_symlink-Account-when-p=
refix-is-empty-st.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000..28f9889<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++<br>
&gt;&gt; b/recipes-containers/lxc/files/open_without_symlink-Account-when-p=
refix-is-empty-st.patch<br>
&gt;&gt; @@ -0,0 +1,37 @@<br>
&gt;&gt; +From 01074e5b34719537cef474c6b81d4f55e6427639 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Bogdan Purcareata &lt;<a href=3D"mailto:bogdan.purcareata@n=
xp.com">bogdan.purcareata@nxp.com</a>&gt;<br>
&gt;&gt; +Date: Fri, 8 Jan 2016 15:38:35 +0000<br>
&gt;&gt; +Subject: [PATCH] open_without_symlink: Account when prefix is emp=
ty string<br>
&gt;&gt; +<br>
&gt;&gt; +In the current implementation, the open_without_symlink function<=
br>
&gt;&gt; +will default to opening the root mount only if the passed rootfs<=
br>
&gt;&gt; +prefix is null. It doesn&#39;t account for the case where this pr=
efix<br>
&gt;&gt; +is passed as an empty string.<br>
&gt;&gt; +<br>
&gt;&gt; +Properly handle this second case as well.<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Accepted<br>
&gt;&gt; +[<br>
&gt;&gt; <a href=3D"https://github.com/lxc/lxc/commit/01074e5b34719537cef47=
4c6b81d4f55e6427639" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/lxc/lxc/commit/01074e5b34719537cef474c6b81d4f55e6427639</a><br>
&gt;&gt; ]<br>
&gt;&gt; +<br>
&gt;&gt; +Signed-off-by: Bogdan Purcareata &lt;<a href=3D"mailto:bogdan.pur=
careata@nxp.com">bogdan.purcareata@nxp.com</a>&gt;<br>
&gt;&gt; +Acked-by: Serge E. Hallyn &lt;<a href=3D"mailto:serge.hallyn@ubun=
tu.com">serge.hallyn@ubuntu.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + src/lxc/utils.c | 2 +-<br>
&gt;&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/src/lxc/utils.c b/src/lxc/utils.c<br>
&gt;&gt; +index ed8c4c4..4e96a50 100644<br>
&gt;&gt; +--- a/src/lxc/utils.c<br>
&gt;&gt; ++++ b/src/lxc/utils.c<br>
&gt;&gt; +@@ -1575,7 +1575,7 @@ static int open_without_symlink(const char =
*target,<br>
&gt;&gt; const char *prefix_skip)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fulllen =3D strlen(target);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* make sure prefix-skip makes sense *=
/<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 if (prefix_skip) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 if (prefix_skip &amp;&amp; strlen(prefix_sk=
ip) &gt; 0) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0curlen =3D=
 strlen(prefix_skip);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!is_su=
bdir(target, prefix_skip, curlen)) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ERROR(&quot;WHOA there - target &#39;%s&#39; didn&#39;t=
 start with<br>
&gt;&gt; prefix &#39;%s&#39;&quot;,<br>
&gt;&gt; +--<br>
&gt;&gt; +1.9.1<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/recipes-containers/lxc/<a href=3D"http://lxc_1.1.4.bb=
" rel=3D"noreferrer" target=3D"_blank">lxc_1.1.4.bb</a> b/recipes-container=
s/lxc/<br>
&gt;&gt; <a href=3D"http://lxc_1.1.4.bb" rel=3D"noreferrer" target=3D"_blan=
k">lxc_1.1.4.bb</a><br>
&gt;&gt; index 4006deb..e017dcf 100644<br>
&gt;&gt; --- a/recipes-containers/lxc/<a href=3D"http://lxc_1.1.4.bb" rel=
=3D"noreferrer" target=3D"_blank">lxc_1.1.4.bb</a><br>
&gt;&gt; +++ b/recipes-containers/lxc/<a href=3D"http://lxc_1.1.4.bb" rel=
=3D"noreferrer" target=3D"_blank">lxc_1.1.4.bb</a><br>
&gt;&gt; @@ -34,6 +34,9 @@ SRC_URI =3D &quot;<br>
&gt;&gt; <a href=3D"http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.g=
z" rel=3D"noreferrer" target=3D"_blank">http://linuxcontainers.org/download=
s/${BPN}-${PV}.tar.gz</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://make-some-OpenSSH-tools-o=
ptional.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lxc-doc-upgrade-to-use-do=
cbook-3.1-DTD.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://logs-optionally-use-base-=
filenames-to-report-src-fil.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0file://open_without_symlink-Account-wh=
en-prefix-is-empty-st.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0file://lxc_setup_fs-Create-dev-shm-fol=
der-if-it-doesn-t-exi.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0file://mount_proc_if_needed-only-safe-=
mount-when-rootfs-is-.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0SRC_URI[md5sum] =3D &quot;d33c4bd9c57755c0e2b0e2acbc3f=
171d&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 1.9.1<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; meta-virtualization mailing list<br>
&gt;&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtu=
alization@yoctoproject.org</a><br>
&gt;&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualiza=
tion" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/l=
istinfo/meta-virtualization</a><br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt;</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- =
<br><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL poi=
nter, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a1143f394b16391052d96bd49--
