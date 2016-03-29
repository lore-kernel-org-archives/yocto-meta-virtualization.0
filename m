Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 26B06E00C2F; Tue, 29 Mar 2016 09:38:28 -0700 (PDT)
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
	*      [209.85.218.45 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 53622E00C27
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Mar 2016 09:38:24 -0700 (PDT)
Received: by mail-oi0-f45.google.com with SMTP id d205so29818756oia.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Mar 2016 09:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=VIEfZ48OwEoWjoRQ6FNsDivLdr+/xSXyqPwbChDBEqk=;
	b=Py7ThmpixJ+MeYJzRSEXKZY+1KNbYmvi03sOm5dlJvVSkND72ocutR/D5cfMSpCou3
	RQxgwkMrXI50IlxxmA7Tjs8lQFlVu7fMgEsgqo5oCSKqU4LI+zu01lW7DKdS4ahEXqj3
	vlZXsp5N3f+xqjsB3p1LEysYnThv3FPBa0+bKM4VP7D+ZbdBkBg2ReT8EeM6rrYSpQg+
	/zKCnAYQHEFcqXeky3+KO1UBFtXvMW4ozlfoTvHaXboA8/FNfTqtRyATe49SL54hrpgA
	QEE239kZPtcqEzxJUWawQXI4EOGUdc7v9u2zVenEYtcD61fkBGV+zmqDgzswgW/8dGVU
	kw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=VIEfZ48OwEoWjoRQ6FNsDivLdr+/xSXyqPwbChDBEqk=;
	b=h82GxzpxB4olaILbSnU90aZNFCPZwd7I7hVjvb0tvB2ApGJQzMCxl+GEY8x4c8avOQ
	V1b9uWC1hFz4nDRqeY1rVRCAQIbUZ9fW+Kl/VG5cShJe+YJEd9Vn/+r4Ky9TxmL3vKVQ
	/rWzILsZl8Wzyju5ydGy8FKby6A0t433v8nqi9S0WjslxE+lGVmxcjmWAf74ayvW0SiM
	zaK9uHuFiwxLKorcTVdzXJ0j7sM0rya4Sqg2cuZXX2QGTLUU5Jp7d+eqrJ+TT6r6Me7p
	sDxgUFoLXb3lGs+AExDTkCK3UcBXFMmLLjK2rIf7QSeygDZPyiPXbdGryGUFOHgbFbBz
	vMKw==
X-Gm-Message-State: AD7BkJJP+9E3ZD+3oQ93peEteii/xJrsxRylHRah3tUMTIWa95kXYwF86ctfAVLsLepru+xPlWfse8uRHw9iug==
MIME-Version: 1.0
X-Received: by 10.157.7.67 with SMTP id 61mr1652759ote.186.1459269461714; Tue,
	29 Mar 2016 09:37:41 -0700 (PDT)
Received: by 10.157.5.101 with HTTP; Tue, 29 Mar 2016 09:37:41 -0700 (PDT)
In-Reply-To: <1458893573-632-1-git-send-email-bogdan.purcareata@nxp.com>
References: <1458893573-632-1-git-send-email-bogdan.purcareata@nxp.com>
Date: Tue, 29 Mar 2016 12:37:41 -0400
Message-ID: <CADkTA4NfaZ9-qgTXnT68O94KsEtdscEx+hcqiD8M_89-GLf_rQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Bogdan Purcareata <bogdan.purcareata@nxp.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] lxc: warning fixes in busybox template
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
X-List-Received-Date: Tue, 29 Mar 2016 16:38:28 -0000
Content-Type: multipart/alternative; boundary=001a113dda08e5ad73052f32a50e

--001a113dda08e5ad73052f32a50e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 25, 2016 at 4:12 AM, Bogdan Purcareata <
bogdan.purcareata@nxp.com> wrote:

> Warnings fixes:
> - optional mounts when dirs not available
> - busybox dynamically linked
> - fstab not available in container
>
> Please apply on master and jethro branches.
>

merged.

Bruce


>
> Signed-off-by: Bogdan Purcareata <bogdan.purcareata@nxp.com>
> ---
>  ...-Remove-warning-for-dynamically-linked-Bu.patch | 43
> +++++++++++++++++++
>  ...x-Touch-etc-fstab-in-the-container-rootfs.patch | 30 +++++++++++++
>  ...t_symlink-Don-t-SYSERROR-on-something-els.patch | 49
> ++++++++++++++++++++++
>  recipes-containers/lxc/lxc_1.1.4.bb                |  3 ++
>  4 files changed, 125 insertions(+)
>  create mode 100644
> recipes-containers/lxc/files/lxc-busybox-Remove-warning-for-dynamically-l=
inked-Bu.patch
>  create mode 100644
> recipes-containers/lxc/files/lxc-busybox-Touch-etc-fstab-in-the-container=
-rootfs.patch
>  create mode 100644
> recipes-containers/lxc/files/open_without_symlink-Don-t-SYSERROR-on-somet=
hing-els.patch
>
> diff --git
> a/recipes-containers/lxc/files/lxc-busybox-Remove-warning-for-dynamically=
-linked-Bu.patch
> b/recipes-containers/lxc/files/lxc-busybox-Remove-warning-for-dynamically=
-linked-Bu.patch
> new file mode 100644
> index 0000000..c0a810b
> --- /dev/null
> +++
> b/recipes-containers/lxc/files/lxc-busybox-Remove-warning-for-dynamically=
-linked-Bu.patch
> @@ -0,0 +1,43 @@
> +From 07e4c41f2963d73b9aedd552c74f17a33e89f020 Mon Sep 17 00:00:00 2001
> +From: Bogdan Purcareata <bogdan.purcareata@nxp.com>
> +Date: Thu, 24 Mar 2016 11:54:27 +0000
> +Subject: [PATCH] lxc-busybox: Remove warning for dynamically linked
> Busybox
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The warning has been present since commit 32b37181ea (with no purpose
> stated).
> +Support for dynamically linked Busybox has been added since commit
> bf6cc73696.
> +Haven't encountered any issues with dynamically linked Busybox in my las=
t
> +2 years' testing.
> +
> +Upstream-status: Accepted
> +[
> https://github.com/lxc/lxc/commit/07e4c41f2963d73b9aedd552c74f17a33e89f02=
0
> ]
> +
> +Signed-off-by: Bogdan Purcareata <bogdan.purcareata@nxp.com>
> +Acked-by: St=C3=A9phane Graber <stgraber@ubuntu.com>
> +---
> + templates/lxc-busybox.in | 7 -------
> + 1 file changed, 7 deletions(-)
> +
> +diff --git a/templates/lxc-busybox.in b/templates/lxc-busybox.in
> +index f547f9e..336fa12 100644
> +--- a/templates/lxc-busybox.in
> ++++ b/templates/lxc-busybox.in
> +@@ -304,13 +304,6 @@ configure_busybox()
> +         return 1
> +     fi
> +
> +-    file -L $(which busybox) | grep -q "statically linked"
> +-    if [ $? -ne 0 ]; then
> +-        echo "warning : busybox is not statically linked."
> +-        echo "warning : The template script may not correctly"
> +-        echo "warning : setup the container environment."
> +-    fi
> +-
> +     # copy busybox in the rootfs
> +     cp $(which busybox) $rootfs/bin
> +     if [ $? -ne 0 ]; then
> +--
> +1.9.1
> +
> diff --git
> a/recipes-containers/lxc/files/lxc-busybox-Touch-etc-fstab-in-the-contain=
er-rootfs.patch
> b/recipes-containers/lxc/files/lxc-busybox-Touch-etc-fstab-in-the-contain=
er-rootfs.patch
> new file mode 100644
> index 0000000..33862dd
> --- /dev/null
> +++
> b/recipes-containers/lxc/files/lxc-busybox-Touch-etc-fstab-in-the-contain=
er-rootfs.patch
> @@ -0,0 +1,30 @@
> +From 6ab1ca0375feeb00070f0c0f9186551b08b1ee5e Mon Sep 17 00:00:00 2001
> +From: Bogdan Purcareata <bogdan.purcareata@nxp.com>
> +Date: Tue, 22 Mar 2016 13:33:57 +0000
> +Subject: [PATCH] lxc-busybox: Touch /etc/fstab in the container rootfs
> +
> +Upstream-status: Accepted
> +[
> https://github.com/lxc/lxc/commit/6ab1ca0375feeb00070f0c0f9186551b08b1ee5=
e
> ]
> +
> +Signed-off-by: Bogdan Purcareata <bogdan.purcareata@nxp.com>
> +---
> + templates/lxc-busybox.in | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/templates/lxc-busybox.in b/templates/lxc-busybox.in
> +index c020e66..f547f9e 100644
> +--- a/templates/lxc-busybox.in
> ++++ b/templates/lxc-busybox.in
> +@@ -330,6 +330,9 @@ configure_busybox()
> +     # relink /sbin/init
> +     ln $rootfs/bin/busybox $rootfs/sbin/init
> +
> ++    # /etc/fstab must exist for "mount -a"
> ++    touch $rootfs/etc/fstab
> ++
> +     # passwd exec must be setuid
> +     chmod +s $rootfs/bin/passwd
> +     touch $rootfs/etc/shadow
> +--
> +1.9.1
> +
> diff --git
> a/recipes-containers/lxc/files/open_without_symlink-Don-t-SYSERROR-on-som=
ething-els.patch
> b/recipes-containers/lxc/files/open_without_symlink-Don-t-SYSERROR-on-som=
ething-els.patch
> new file mode 100644
> index 0000000..098ead7
> --- /dev/null
> +++
> b/recipes-containers/lxc/files/open_without_symlink-Don-t-SYSERROR-on-som=
ething-els.patch
> @@ -0,0 +1,49 @@
> +From 88e078ba865b675f9a0dc61caa0732d7052593f8 Mon Sep 17 00:00:00 2001
> +From: Christian Brauner <christian.brauner@mailbox.org>
> +Date: Wed, 23 Mar 2016 16:37:09 +0100
> +Subject: [PATCH] open_without_symlink: Don't SYSERROR on something else
> than
> + ELOOP
> +
> +The open_without_symlink routine has been specifically created to preven=
t
> +mounts with synlinks as source or destination. Keep SYSERROR'ing in that
> +particular scenario, but leave error handling to calling functions for t=
he
> +other ones - e.g. optional bind mount when the source dir doesn't exist
> +throws a nasty error.
> +
> +Upstream-status: Accepted
> +[
> https://github.com/lxc/lxc/commit/88e078ba865b675f9a0dc61caa0732d7052593f=
8
> ]
> +
> +Signed-off-by: Bogdan Purcareata <bogdan.purcareata@nxp.com>
> +---
> + src/lxc/utils.c | 7 ++++---
> + 1 file changed, 4 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/lxc/utils.c b/src/lxc/utils.c
> +index 6bee698..8e7ebbc 100644
> +--- a/src/lxc/utils.c
> ++++ b/src/lxc/utils.c
> +@@ -1621,8 +1621,6 @@ static int open_without_symlink(const char *target=
,
> const char *prefix_skip)
> +                       errno =3D saved_errno;
> +                       if (errno =3D=3D ELOOP)
> +                               SYSERROR("%s in %s was a symbolic link!",
> nextpath, target);
> +-                      else
> +-                              SYSERROR("Error examining %s in %s",
> nextpath, target);
> +                       goto out;
> +               }
> +       }
> +@@ -1667,8 +1665,11 @@ int safe_mount(const char *src, const char *dest,
> const char *fstype,
> +
> +       destfd =3D open_without_symlink(dest, rootfs);
> +       if (destfd < 0) {
> +-              if (srcfd !=3D -1)
> ++              if (srcfd !=3D -1) {
> ++                      saved_errno =3D errno;
> +                       close(srcfd);
> ++                      errno =3D saved_errno;
> ++              }
> +               return destfd;
> +       }
> +
> +--
> +1.9.1
> +
> diff --git a/recipes-containers/lxc/lxc_1.1.4.bb b/recipes-containers/lxc=
/
> lxc_1.1.4.bb
> index e017dcf..2645f4b 100644
> --- a/recipes-containers/lxc/lxc_1.1.4.bb
> +++ b/recipes-containers/lxc/lxc_1.1.4.bb
> @@ -37,6 +37,9 @@ SRC_URI =3D "
> http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>         file://open_without_symlink-Account-when-prefix-is-empty-st.patch=
 \
>         file://lxc_setup_fs-Create-dev-shm-folder-if-it-doesn-t-exi.patch=
 \
>         file://mount_proc_if_needed-only-safe-mount-when-rootfs-is-.patch=
 \
> +       file://open_without_symlink-Don-t-SYSERROR-on-something-els.patch=
 \
> +       file://lxc-busybox-Touch-etc-fstab-in-the-container-rootfs.patch =
\
> +       file://lxc-busybox-Remove-warning-for-dynamically-linked-Bu.patch=
 \
>         "
>
>  SRC_URI[md5sum] =3D "d33c4bd9c57755c0e2b0e2acbc3f171d"
> --
> 1.9.1
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>


--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113dda08e5ad73052f32a50e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Mar 25, 2016 at 4:12 AM, Bogdan Purcareata <span dir=3D"ltr">&l=
t;<a href=3D"mailto:bogdan.purcareata@nxp.com" target=3D"_blank">bogdan.pur=
careata@nxp.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">War=
nings fixes:<br>
- optional mounts when dirs not available<br>
- busybox dynamically linked<br>
- fstab not available in container<br>
<br>
Please apply on master and jethro branches.<br></blockquote><div><br></div>=
<div>merged.</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">
<br>
Signed-off-by: Bogdan Purcareata &lt;<a href=3D"mailto:bogdan.purcareata@nx=
p.com">bogdan.purcareata@nxp.com</a>&gt;<br>
---<br>
=C2=A0...-Remove-warning-for-dynamically-linked-Bu.patch | 43 +++++++++++++=
++++++<br>
=C2=A0...x-Touch-etc-fstab-in-the-container-rootfs.patch | 30 +++++++++++++=
<br>
=C2=A0...t_symlink-Don-t-SYSERROR-on-something-els.patch | 49 +++++++++++++=
+++++++++<br>
=C2=A0recipes-containers/lxc/<a href=3D"http://lxc_1.1.4.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_1.1.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++<br>
=C2=A04 files changed, 125 insertions(+)<br>
=C2=A0create mode 100644 recipes-containers/lxc/files/lxc-busybox-Remove-wa=
rning-for-dynamically-linked-Bu.patch<br>
=C2=A0create mode 100644 recipes-containers/lxc/files/lxc-busybox-Touch-etc=
-fstab-in-the-container-rootfs.patch<br>
=C2=A0create mode 100644 recipes-containers/lxc/files/open_without_symlink-=
Don-t-SYSERROR-on-something-els.patch<br>
<br>
diff --git a/recipes-containers/lxc/files/lxc-busybox-Remove-warning-for-dy=
namically-linked-Bu.patch b/recipes-containers/lxc/files/lxc-busybox-Remove=
-warning-for-dynamically-linked-Bu.patch<br>
new file mode 100644<br>
index 0000000..c0a810b<br>
--- /dev/null<br>
+++ b/recipes-containers/lxc/files/lxc-busybox-Remove-warning-for-dynamical=
ly-linked-Bu.patch<br>
@@ -0,0 +1,43 @@<br>
+From 07e4c41f2963d73b9aedd552c74f17a33e89f020 Mon Sep 17 00:00:00 2001<br>
+From: Bogdan Purcareata &lt;<a href=3D"mailto:bogdan.purcareata@nxp.com">b=
ogdan.purcareata@nxp.com</a>&gt;<br>
+Date: Thu, 24 Mar 2016 11:54:27 +0000<br>
+Subject: [PATCH] lxc-busybox: Remove warning for dynamically linked Busybo=
x<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+The warning has been present since commit 32b37181ea (with no purpose stat=
ed).<br>
+Support for dynamically linked Busybox has been added since commit bf6cc73=
696.<br>
+Haven&#39;t encountered any issues with dynamically linked Busybox in my l=
ast<br>
+2 years&#39; testing.<br>
+<br>
+Upstream-status: Accepted<br>
+[<a href=3D"https://github.com/lxc/lxc/commit/07e4c41f2963d73b9aedd552c74f=
17a33e89f020" rel=3D"noreferrer" target=3D"_blank">https://github.com/lxc/l=
xc/commit/07e4c41f2963d73b9aedd552c74f17a33e89f020</a>]<br>
+<br>
+Signed-off-by: Bogdan Purcareata &lt;<a href=3D"mailto:bogdan.purcareata@n=
xp.com">bogdan.purcareata@nxp.com</a>&gt;<br>
+Acked-by: St=C3=A9phane Graber &lt;<a href=3D"mailto:stgraber@ubuntu.com">=
stgraber@ubuntu.com</a>&gt;<br>
+---<br>
+ templates/<a href=3D"http://lxc-busybox.in" rel=3D"noreferrer" target=3D"=
_blank">lxc-busybox.in</a> | 7 -------<br>
+ 1 file changed, 7 deletions(-)<br>
+<br>
+diff --git a/templates/<a href=3D"http://lxc-busybox.in" rel=3D"noreferrer=
" target=3D"_blank">lxc-busybox.in</a> b/templates/<a href=3D"http://lxc-bu=
sybox.in" rel=3D"noreferrer" target=3D"_blank">lxc-busybox.in</a><br>
+index f547f9e..336fa12 100644<br>
+--- a/templates/<a href=3D"http://lxc-busybox.in" rel=3D"noreferrer" targe=
t=3D"_blank">lxc-busybox.in</a><br>
++++ b/templates/<a href=3D"http://lxc-busybox.in" rel=3D"noreferrer" targe=
t=3D"_blank">lxc-busybox.in</a><br>
+@@ -304,13 +304,6 @@ configure_busybox()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1<br>
+=C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
+-=C2=A0 =C2=A0 file -L $(which busybox) | grep -q &quot;statically linked&=
quot;<br>
+-=C2=A0 =C2=A0 if [ $? -ne 0 ]; then<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;warning : busybox is not staticall=
y linked.&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;warning : The template script may =
not correctly&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;warning : setup the container envi=
ronment.&quot;<br>
+-=C2=A0 =C2=A0 fi<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0# copy busybox in the rootfs<br>
+=C2=A0 =C2=A0 =C2=A0cp $(which busybox) $rootfs/bin<br>
+=C2=A0 =C2=A0 =C2=A0if [ $? -ne 0 ]; then<br>
+--<br>
+1.9.1<br>
+<br>
diff --git a/recipes-containers/lxc/files/lxc-busybox-Touch-etc-fstab-in-th=
e-container-rootfs.patch b/recipes-containers/lxc/files/lxc-busybox-Touch-e=
tc-fstab-in-the-container-rootfs.patch<br>
new file mode 100644<br>
index 0000000..33862dd<br>
--- /dev/null<br>
+++ b/recipes-containers/lxc/files/lxc-busybox-Touch-etc-fstab-in-the-conta=
iner-rootfs.patch<br>
@@ -0,0 +1,30 @@<br>
+From 6ab1ca0375feeb00070f0c0f9186551b08b1ee5e Mon Sep 17 00:00:00 2001<br>
+From: Bogdan Purcareata &lt;<a href=3D"mailto:bogdan.purcareata@nxp.com">b=
ogdan.purcareata@nxp.com</a>&gt;<br>
+Date: Tue, 22 Mar 2016 13:33:57 +0000<br>
+Subject: [PATCH] lxc-busybox: Touch /etc/fstab in the container rootfs<br>
+<br>
+Upstream-status: Accepted<br>
+[<a href=3D"https://github.com/lxc/lxc/commit/6ab1ca0375feeb00070f0c0f9186=
551b08b1ee5e" rel=3D"noreferrer" target=3D"_blank">https://github.com/lxc/l=
xc/commit/6ab1ca0375feeb00070f0c0f9186551b08b1ee5e</a>]<br>
+<br>
+Signed-off-by: Bogdan Purcareata &lt;<a href=3D"mailto:bogdan.purcareata@n=
xp.com">bogdan.purcareata@nxp.com</a>&gt;<br>
+---<br>
+ templates/<a href=3D"http://lxc-busybox.in" rel=3D"noreferrer" target=3D"=
_blank">lxc-busybox.in</a> | 3 +++<br>
+ 1 file changed, 3 insertions(+)<br>
+<br>
+diff --git a/templates/<a href=3D"http://lxc-busybox.in" rel=3D"noreferrer=
" target=3D"_blank">lxc-busybox.in</a> b/templates/<a href=3D"http://lxc-bu=
sybox.in" rel=3D"noreferrer" target=3D"_blank">lxc-busybox.in</a><br>
+index c020e66..f547f9e 100644<br>
+--- a/templates/<a href=3D"http://lxc-busybox.in" rel=3D"noreferrer" targe=
t=3D"_blank">lxc-busybox.in</a><br>
++++ b/templates/<a href=3D"http://lxc-busybox.in" rel=3D"noreferrer" targe=
t=3D"_blank">lxc-busybox.in</a><br>
+@@ -330,6 +330,9 @@ configure_busybox()<br>
+=C2=A0 =C2=A0 =C2=A0# relink /sbin/init<br>
+=C2=A0 =C2=A0 =C2=A0ln $rootfs/bin/busybox $rootfs/sbin/init<br>
+<br>
++=C2=A0 =C2=A0 # /etc/fstab must exist for &quot;mount -a&quot;<br>
++=C2=A0 =C2=A0 touch $rootfs/etc/fstab<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0# passwd exec must be setuid<br>
+=C2=A0 =C2=A0 =C2=A0chmod +s $rootfs/bin/passwd<br>
+=C2=A0 =C2=A0 =C2=A0touch $rootfs/etc/shadow<br>
+--<br>
+1.9.1<br>
+<br>
diff --git a/recipes-containers/lxc/files/open_without_symlink-Don-t-SYSERR=
OR-on-something-els.patch b/recipes-containers/lxc/files/open_without_symli=
nk-Don-t-SYSERROR-on-something-els.patch<br>
new file mode 100644<br>
index 0000000..098ead7<br>
--- /dev/null<br>
+++ b/recipes-containers/lxc/files/open_without_symlink-Don-t-SYSERROR-on-s=
omething-els.patch<br>
@@ -0,0 +1,49 @@<br>
+From 88e078ba865b675f9a0dc61caa0732d7052593f8 Mon Sep 17 00:00:00 2001<br>
+From: Christian Brauner &lt;<a href=3D"mailto:christian.brauner@mailbox.or=
g">christian.brauner@mailbox.org</a>&gt;<br>
+Date: Wed, 23 Mar 2016 16:37:09 +0100<br>
+Subject: [PATCH] open_without_symlink: Don&#39;t SYSERROR on something els=
e than<br>
+ ELOOP<br>
+<br>
+The open_without_symlink routine has been specifically created to prevent<=
br>
+mounts with synlinks as source or destination. Keep SYSERROR&#39;ing in th=
at<br>
+particular scenario, but leave error handling to calling functions for the=
<br>
+other ones - e.g. optional bind mount when the source dir doesn&#39;t exis=
t<br>
+throws a nasty error.<br>
+<br>
+Upstream-status: Accepted<br>
+[<a href=3D"https://github.com/lxc/lxc/commit/88e078ba865b675f9a0dc61caa07=
32d7052593f8" rel=3D"noreferrer" target=3D"_blank">https://github.com/lxc/l=
xc/commit/88e078ba865b675f9a0dc61caa0732d7052593f8</a>]<br>
+<br>
+Signed-off-by: Bogdan Purcareata &lt;<a href=3D"mailto:bogdan.purcareata@n=
xp.com">bogdan.purcareata@nxp.com</a>&gt;<br>
+---<br>
+ src/lxc/utils.c | 7 ++++---<br>
+ 1 file changed, 4 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/src/lxc/utils.c b/src/lxc/utils.c<br>
+index 6bee698..8e7ebbc 100644<br>
+--- a/src/lxc/utils.c<br>
++++ b/src/lxc/utils.c<br>
+@@ -1621,8 +1621,6 @@ static int open_without_symlink(const char *target, =
const char *prefix_skip)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0errno =3D saved_errno;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (errno =3D=3D ELOOP)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SYSERROR(&quot;%s in %s was a symboli=
c link!&quot;, nextpath, target);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SYSERROR(&quot;Error examining %s in %s&quo=
t;, nextpath, target);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto out;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -1667,8 +1665,11 @@ int safe_mount(const char *src, const char *dest, c=
onst char *fstype,<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0destfd =3D open_without_symlink(dest, rootfs);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (destfd &lt; 0) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (srcfd !=3D -1)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (srcfd !=3D -1) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 saved_errno =3D errno;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0close(srcfd);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 errno =3D saved_errno;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return destfd;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+--<br>
+1.9.1<br>
+<br>
diff --git a/recipes-containers/lxc/<a href=3D"http://lxc_1.1.4.bb" rel=3D"=
noreferrer" target=3D"_blank">lxc_1.1.4.bb</a> b/recipes-containers/lxc/<a =
href=3D"http://lxc_1.1.4.bb" rel=3D"noreferrer" target=3D"_blank">lxc_1.1.4=
.bb</a><br>
index e017dcf..2645f4b 100644<br>
--- a/recipes-containers/lxc/<a href=3D"http://lxc_1.1.4.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_1.1.4.bb</a><br>
+++ b/recipes-containers/lxc/<a href=3D"http://lxc_1.1.4.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_1.1.4.bb</a><br>
@@ -37,6 +37,9 @@ SRC_URI =3D &quot;<a href=3D"http://linuxcontainers.org/d=
ownloads/${BPN}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://l=
inuxcontainers.org/downloads/${BPN}-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://open_without_symlink-Account-when-prefix=
-is-empty-st.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lxc_setup_fs-Create-dev-shm-folder-if-it=
-doesn-t-exi.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://mount_proc_if_needed-only-safe-mount-whe=
n-rootfs-is-.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://open_without_symlink-Don-t-SYSERROR-on-s=
omething-els.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://lxc-busybox-Touch-etc-fstab-in-the-conta=
iner-rootfs.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://lxc-busybox-Remove-warning-for-dynamical=
ly-linked-Bu.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;d33c4bd9c57755c0e2b0e2acbc3f171d&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
</font></span><br>--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
<br></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div cla=
ss=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end&quot;</div>
</div></div>

--001a113dda08e5ad73052f32a50e--
