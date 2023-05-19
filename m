Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 540FEC77B7F
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 07:58:57 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.20689.1684483133148238732
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 19 May 2023 00:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=FZWZYJJH;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3f41dceb93bso19022695e9.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 19 May 2023 00:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684483131; x=1687075131;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uqd/bcJ7/dVlVFrXmIfc3ySjBPTTd7L9y1ollDqKyqk=;
        b=FZWZYJJHH7mfHxPY4TQ6DRgWWobPyXD10CWK7OplkX2vy36oQkDgSwYeOICo9cPoAg
         kALYAe5CDga4DYDHkBCLZxCK72seovSgvZkJi+mHOa5wgXYPHrB6kGx+1AjvGAyAFGiZ
         VeF8ZYNulj+G9G63pLfFOYEPvYl32ulh9XQbNPLhOD+DulrbaHeMY4EBO2Z/DZ2WNlUy
         YrHno+rgOljtQYAKxIlJBjb3yrE1ZFWjVyleA3GUobg+8qlOMvIhAwnr1qAFwz/ssli1
         d2QJUF0LC5pXpMC+Bm21tVtmWlO335GJTDUG9aQt1rI1Nt6KeQqEPKnr8SVkgRddMhLy
         iysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684483131; x=1687075131;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uqd/bcJ7/dVlVFrXmIfc3ySjBPTTd7L9y1ollDqKyqk=;
        b=VIn3+wUx3Fu3xTY021Xm/vOi+8F+a7O+Xx8iiloNL3YReStl5KIzLMVD+hFkrnlQBk
         of1RN38i48BPxEwX+SucTag4g1emnYsEhrqdGxOLmmSagoRxF+eD34BxD7e0hBnZMg6T
         FPbZNEdKRsgDaj6W6rsqUqflMJgqyJNkOzgAB+CqXCqEOyxFYqcI1hx+kl5Zr9DS5f71
         CDaESA7mOEFCEZfCkEgXzavO8Ge9OfaYEuvoSudXcNWRLHsb42OMMqOP2q3AJCgNudOB
         IUgCITPrqf6HBsarIqZvEL+MhiHx/md6KhZRacf/B2VlDCtnhAT+ui5KKezS0HPQt9F6
         +7UQ==
X-Gm-Message-State: AC+VfDwPjpVHrccpAndPVElsIk0bQnJqiCD2+iO4s0AK9vwdCzWKRsSZ
	HO5uHFyxpx94Ddgwpw5FYYWPrZXQhziHlqMapsyI5yRS
X-Google-Smtp-Source: ACHHUZ6MX7CaZxUgu18ykWX7K245cIM6XNS+Xg+1CKn+YOBGPeTC06qnf3TYmt/jInn7D6v5hveuWgb/NjHD/6VBQxA=
X-Received: by 2002:a7b:c014:0:b0:3f4:fd67:6d7c with SMTP id
 c20-20020a7bc014000000b003f4fd676d7cmr614504wmb.40.1684483130861; Fri, 19 May
 2023 00:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230519072337.4002-1-thakur.virendra1810@gmail.com>
In-Reply-To: <20230519072337.4002-1-thakur.virendra1810@gmail.com>
From: virendra thakur <thakur.virendra1810@gmail.com>
Date: Fri, 19 May 2023 13:28:38 +0530
Message-ID: <CAJM8miX2t38gYCdXG0zGRfHrSL-OBe88VNoK+8uCQ6PwarsNuA@mail.gmail.com>
Subject: meta-virtualization][PATCH 1/7] lxc: update to 4.0.9
To: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000a52c7805fc074a0d"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 19 May 2023 07:58:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8065

--000000000000a52c7805fc074a0d
Content-Type: text/plain; charset="UTF-8"

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping lxc to a newer 4.0 -stable release.

We drop two patches that have been integrated to the upstream repo, but
otherwise, things are the same.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
(cherry picked from commit baa8c9cd62988121c39ae848cd967859fbbf5250)
Signed-off-by: virendra thakur <virendrak@kpit.com>
---
 ...fix-check-for-seccomp-notify-support.patch | 44 ---------------
 ...p-libseccomp-tests-if-it-is-disabled.patch | 53 ------------------
 ...alidate-when-using-download-template.patch | 54 +++++++++----------
 .../lxc/{lxc_4.0.6.bb => lxc_4.0.9.bb}        |  6 +--
 4 files changed, 29 insertions(+), 128 deletions(-)
 delete mode 100644
recipes-containers/lxc/files/commands-fix-check-for-seccomp-notify-support.patch
 delete mode 100644
recipes-containers/lxc/files/configure-skip-libseccomp-tests-if-it-is-disabled.patch
 rename recipes-containers/lxc/{lxc_4.0.6.bb => lxc_4.0.9.bb} (96%)

diff --git
a/recipes-containers/lxc/files/commands-fix-check-for-seccomp-notify-support.patch
b/recipes-containers/lxc/files/commands-fix-check-for-seccomp-notify-support.patch
deleted file mode 100644
index 391af38..0000000
---
a/recipes-containers/lxc/files/commands-fix-check-for-seccomp-notify-support.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From a342b11fedb3010630de4909ca707ebdc0862060 Mon Sep 17 00:00:00 2001
-From: Eneas U de Queiroz <cotequeiroz@gmail.com>
-Date: Fri, 25 Dec 2020 13:54:14 -0300
-Subject: [PATCH] commands: fix check for seccomp notify support
-
-Use HAVE_SECCOMP_NOTIFY instead of HAVE_DECL_SECCOMP_NOTIFY_FD.
-Currently the latter will be true if the declaration is found by
-configure, even if 'configure --disable-seccomp' is used.
-
-HAVE_SECCOMP_NOTIFY is defined in lxcseccomp.h if both HAVE_SECCOMP and
-HAVE_DECL_SECCOMP_NOTIFY_FD are true, which is the correct behavior.
-
-Upstream-status: submitted https://github.com/lxc/lxc/pull/3623
-
-Signed-off-by: Eneas U de Queiroz <cotequeiroz@gmail.com>
----
- src/lxc/commands.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/lxc/commands.c b/src/lxc/commands.c
-index a9a03ca2c..37d1abcef 100644
---- a/src/lxc/commands.c
-+++ b/src/lxc/commands.c
-@@ -501,7 +501,7 @@ static int lxc_cmd_get_devpts_fd_callback(int fd,
struct lxc_cmd_req *req,
-
- int lxc_cmd_get_seccomp_notify_fd(const char *name, const char *lxcpath)
- {
--#if HAVE_DECL_SECCOMP_NOTIFY_FD
-+#ifdef HAVE_SECCOMP_NOTIFY
-       int ret, stopped;
-       struct lxc_cmd_rr cmd = {
-               .req = {
-@@ -526,7 +526,7 @@ static int lxc_cmd_get_seccomp_notify_fd_callback(int
fd, struct lxc_cmd_req *re
-                                                 struct lxc_handler
*handler,
-                                                 struct lxc_epoll_descr
*descr)
- {
--#if HAVE_DECL_SECCOMP_NOTIFY_FD
-+#ifdef HAVE_SECCOMP_NOTIFY
-       struct lxc_cmd_rsp rsp = {
-               .ret = 0,
-       };
---
-2.17.1
-
diff --git
a/recipes-containers/lxc/files/configure-skip-libseccomp-tests-if-it-is-disabled.patch
b/recipes-containers/lxc/files/configure-skip-libseccomp-tests-if-it-is-disabled.patch
deleted file mode 100644
index 43c91ba..0000000
---
a/recipes-containers/lxc/files/configure-skip-libseccomp-tests-if-it-is-disabled.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 67cd8bde2d46983df8fa9f647e9fc0b96370ec29 Mon Sep 17 00:00:00 2001
-From: Eneas U de Queiroz <cotequeiroz@gmail.com>
-Date: Sat, 16 Jan 2021 13:54:07 -0300
-Subject: [PATCH] configure: skip libseccomp tests if it is disabled
-
-Move the block checking for libseccomp api compatibility inside
-AM_COND_IF([ENABLE_SECCOMP] ... ).
-
-Upstream-Status: submitted [https://github.com/lxc/lxc/pull/3623]
-
-Signed-off-by: Eneas U de Queiroz <cotequeiroz@gmail.com>
----
- configure.ac | 17 ++++++++---------
- 1 file changed, 8 insertions(+), 9 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index f58487f5d..ce6363136 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -312,6 +312,14 @@ AM_COND_IF([ENABLE_SECCOMP],
-               AC_CHECK_LIB([seccomp],
[seccomp_init],[],[AC_MSG_ERROR([You must install the seccomp development
package in order to compile lxc])])
-               AC_SUBST([SECCOMP_LIBS], [-lseccomp])
-               ])
-+      # HAVE_SCMP_FILTER_CTX=1 will tell us we have libseccomp api >=
1.0.0
-+      OLD_CFLAGS="$CFLAGS"
-+      CFLAGS="$CFLAGS $SECCOMP_CFLAGS"
-+      AC_CHECK_TYPES([scmp_filter_ctx], [], [], [[#include <seccomp.h>]])
-+      AC_CHECK_DECLS([seccomp_notify_fd], [], [], [[#include
<seccomp.h>]])
-+      AC_CHECK_TYPES([struct seccomp_notif_sizes], [], [], [[#include
<seccomp.h>]])
-+      AC_CHECK_DECLS([seccomp_syscall_resolve_name_arch], [], [],
[[#include <seccomp.h>]])
-+      CFLAGS="$OLD_CFLAGS"
-       ])
-
- AC_MSG_CHECKING(for static libcap)
-@@ -359,15 +367,6 @@ AM_COND_IF([ENABLE_CAP],
-         AC_CHECK_LIB(cap,cap_get_file,
AC_DEFINE(LIBCAP_SUPPORTS_FILE_CAPABILITIES,1,[Have cap_get_file]),[],[])
-         AC_SUBST([CAP_LIBS], [-lcap])])
-
--# HAVE_SCMP_FILTER_CTX=1 will tell us we have libseccomp api >= 1.0.0
--OLD_CFLAGS="$CFLAGS"
--CFLAGS="$CFLAGS $SECCOMP_CFLAGS"
--AC_CHECK_TYPES([scmp_filter_ctx], [], [], [[#include <seccomp.h>]])
--AC_CHECK_DECLS([seccomp_notify_fd], [], [], [[#include <seccomp.h>]])
--AC_CHECK_TYPES([struct seccomp_notif_sizes], [], [], [[#include
<seccomp.h>]])
--AC_CHECK_DECLS([seccomp_syscall_resolve_name_arch], [], [], [[#include
<seccomp.h>]])
--CFLAGS="$OLD_CFLAGS"
--
- AC_CHECK_HEADERS([linux/bpf.h], [
-       AC_CHECK_TYPES([struct bpf_cgroup_dev_ctx], [], [], [[#include
<linux/bpf.h>]])
- ], [], [])
---
-2.17.1
-
diff --git
a/recipes-containers/lxc/files/tests-add-no-validate-when-using-download-template.patch
b/recipes-containers/lxc/files/tests-add-no-validate-when-using-download-template.patch
index 8caeb2b..f335e79 100644
---
a/recipes-containers/lxc/files/tests-add-no-validate-when-using-download-template.patch
+++
b/recipes-containers/lxc/files/tests-add-no-validate-when-using-download-template.patch
@@ -18,11 +18,11 @@ Signed-off-by: Mark Asselstine <
mark.asselstine@windriver.com>
  src/tests/lxc-test-usernic.in     | 2 +-
  5 files changed, 5 insertions(+), 5 deletions(-)

-diff --git a/src/tests/lxc-test-apparmor-mount
b/src/tests/lxc-test-apparmor-mount
-index d21c948..9e1969b 100755
---- a/src/tests/lxc-test-apparmor-mount
-+++ b/src/tests/lxc-test-apparmor-mount
-@@ -169,7 +169,7 @@ if [ -f /etc/lsb-release ]; then
+Index: lxc-4.0.9/src/tests/lxc-test-apparmor-mount
+===================================================================
+--- lxc-4.0.9.orig/src/tests/lxc-test-apparmor-mount
++++ lxc-4.0.9/src/tests/lxc-test-apparmor-mount
+@@ -170,7 +170,7 @@
      done
  fi

@@ -31,11 +31,11 @@ index d21c948..9e1969b 100755

  echo "test default confined container"
  run_cmd lxc-start -n $cname -d -lDEBUG -o "$logfile"
-diff --git a/src/tests/lxc-test-autostart b/src/tests/lxc-test-autostart
-index e5b651b..d15b79b 100755
---- a/src/tests/lxc-test-autostart
-+++ b/src/tests/lxc-test-autostart
-@@ -55,7 +55,7 @@ if [ -f /etc/lsb-release ]; then
+Index: lxc-4.0.9/src/tests/lxc-test-autostart
+===================================================================
+--- lxc-4.0.9.orig/src/tests/lxc-test-autostart
++++ lxc-4.0.9/src/tests/lxc-test-autostart
+@@ -55,7 +55,7 @@
      done
  fi

@@ -44,11 +44,11 @@ index e5b651b..d15b79b 100755
  CONTAINER_PATH=$(dirname $(lxc-info -n $CONTAINER_NAME -c lxc.rootfs.path
-H) | sed -e 's/dir://')
  cp $CONTAINER_PATH/config $CONTAINER_PATH/config.bak

-diff --git a/src/tests/lxc-test-no-new-privs
b/src/tests/lxc-test-no-new-privs
-index 8642992..e72bdf0 100755
---- a/src/tests/lxc-test-no-new-privs
-+++ b/src/tests/lxc-test-no-new-privs
-@@ -47,7 +47,7 @@ if type dpkg >/dev/null 2>&1; then
+Index: lxc-4.0.9/src/tests/lxc-test-no-new-privs
+===================================================================
+--- lxc-4.0.9.orig/src/tests/lxc-test-no-new-privs
++++ lxc-4.0.9/src/tests/lxc-test-no-new-privs
+@@ -49,7 +49,7 @@
        ARCH=$(dpkg --print-architecture)
  fi

@@ -57,24 +57,24 @@ index 8642992..e72bdf0 100755
  echo "lxc.no_new_privs = 1" >> /var/lib/lxc/c1/config

  lxc-start -n c1
-diff --git a/src/tests/lxc-test-unpriv b/src/tests/lxc-test-unpriv
-index 16ff12d..0958d48 100755
---- a/src/tests/lxc-test-unpriv
-+++ b/src/tests/lxc-test-unpriv
-@@ -173,7 +173,7 @@ run_cmd mkdir -p $HDIR/.cache/lxc
+Index: lxc-4.0.9/src/tests/lxc-test-unpriv
+===================================================================
+--- lxc-4.0.9.orig/src/tests/lxc-test-unpriv
++++ lxc-4.0.9/src/tests/lxc-test-unpriv
+@@ -178,7 +178,7 @@
      cp -R /var/cache/lxc/download $HDIR/.cache/lxc && \
      chown -R $TUSER: $HDIR/.cache/lxc

--run_cmd lxc-create -t download -n c1 -- -d ubuntu -r $release -a $ARCH
-+run_cmd lxc-create -t download -n c1 -- --no-validate -d ubuntu -r
$release -a $ARCH
+-run_cmd lxc-create -t download -n c1 -l trace -o "${UNPRIV_LOG}" -- -d
ubuntu -r $release -a $ARCH
++run_cmd lxc-create -t download -n c1 -l trace -o "${UNPRIV_LOG}" --
--no-validate -d ubuntu -r $release -a $ARCH

  # Make sure we can start it - twice

-diff --git a/src/tests/lxc-test-usernic.in b/src/tests/lxc-test-usernic.in
-index 3e35008..f489286 100755
---- a/src/tests/lxc-test-usernic.in
-+++ b/src/tests/lxc-test-usernic.in
-@@ -146,7 +146,7 @@ if [ -f /etc/lsb-release ]; then
+Index: lxc-4.0.9/src/tests/lxc-test-usernic.in
+===================================================================
+--- lxc-4.0.9.orig/src/tests/lxc-test-usernic.in
++++ lxc-4.0.9/src/tests/lxc-test-usernic.in
+@@ -147,7 +147,7 @@
  fi

  # Create three containers
diff --git a/recipes-containers/lxc/lxc_4.0.6.bb b/recipes-containers/lxc/
lxc_4.0.9.bb
similarity index 96%
rename from recipes-containers/lxc/lxc_4.0.6.bb
rename to recipes-containers/lxc/lxc_4.0.9.bb
index c9bf3d0..7907291 100644
--- a/recipes-containers/lxc/lxc_4.0.6.bb
+++ b/recipes-containers/lxc/lxc_4.0.9.bb
@@ -49,12 +49,10 @@ SRC_URI = "
http://linuxcontainers.org/downloads/${BPN}/${BPN}-${PV}.tar.gz \
        file://tests-add-no-validate-when-using-download-template.patch \
        file://dnsmasq.conf \
        file://lxc-net \
-       file://configure-skip-libseccomp-tests-if-it-is-disabled.patch \
-       file://commands-fix-check-for-seccomp-notify-support.patch \
        "

-SRC_URI[md5sum] = "732571c7cb4ab845068afb227bf35256"
-SRC_URI[sha256sum] =
"9165dabc0bb6ef7f2fda2009aee90b20fbefe77ed8008347e9f06048eba1e463"
+SRC_URI[md5sum] = "365fcca985038910e19a1e0fff15ed07"
+SRC_URI[sha256sum] =
"1fcf0610e9140eceb4be2334eb537bb9c5a213faea77c793ab3c62b86f37e52b"



-- 
2.17.1

--000000000000a52c7805fc074a0d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" =
class=3D"gmail_attr">From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfi=
eld@gmail.com" target=3D"_blank" rel=3D"noreferrer">bruce.ashfield@gmail.co=
m</a>&gt;<br></div>
<br>
Bumping lxc to a newer 4.0 -stable release.<br>
<br>
We drop two patches that have been integrated to the upstream repo, but<br>
otherwise, things are the same.<br>
<br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.co=
m" target=3D"_blank" rel=3D"noreferrer">bruce.ashfield@gmail.com</a>&gt;<br=
>
(cherry picked from commit baa8c9cd62988121c39ae848cd967859fbbf5250)<br>
Signed-off-by: virendra thakur &lt;<a href=3D"mailto:virendrak@kpit.com" ta=
rget=3D"_blank" rel=3D"noreferrer">virendrak@kpit.com</a>&gt;<br>
---<br>
=C2=A0...fix-check-for-seccomp-notify-support.patch | 44 ---------------<br=
>
=C2=A0...p-libseccomp-tests-if-it-is-disabled.patch | 53 ------------------=
<br>
=C2=A0...alidate-when-using-download-template.patch | 54 +++++++++---------=
-<br>
=C2=A0.../lxc/{<a href=3D"http://lxc_4.0.6.bb" rel=3D"noreferrer noreferrer=
" target=3D"_blank">lxc_4.0.6.bb</a> =3D&gt; <a href=3D"http://lxc_4.0.9.bb=
" rel=3D"noreferrer noreferrer" target=3D"_blank">lxc_4.0.9.bb</a>}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +--<br>
=C2=A04 files changed, 29 insertions(+), 128 deletions(-)<br>
=C2=A0delete mode 100644 recipes-containers/lxc/files/commands-fix-check-fo=
r-seccomp-notify-support.patch<br>
=C2=A0delete mode 100644 recipes-containers/lxc/files/configure-skip-libsec=
comp-tests-if-it-is-disabled.patch<br>
=C2=A0rename recipes-containers/lxc/{<a href=3D"http://lxc_4.0.6.bb" rel=3D=
"noreferrer noreferrer" target=3D"_blank">lxc_4.0.6.bb</a> =3D&gt; <a href=
=3D"http://lxc_4.0.9.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">lx=
c_4.0.9.bb</a>} (96%)<br>
<br>
diff --git a/recipes-containers/lxc/files/commands-fix-check-for-seccomp-no=
tify-support.patch b/recipes-containers/lxc/files/commands-fix-check-for-se=
ccomp-notify-support.patch<br>
deleted file mode 100644<br>
index 391af38..0000000<br>
--- a/recipes-containers/lxc/files/commands-fix-check-for-seccomp-notify-su=
pport.patch<br>
+++ /dev/null<br>
@@ -1,44 +0,0 @@<br>
-From a342b11fedb3010630de4909ca707ebdc0862060 Mon Sep 17 00:00:00 2001<br>
-From: Eneas U de Queiroz &lt;<a href=3D"mailto:cotequeiroz@gmail.com" targ=
et=3D"_blank" rel=3D"noreferrer">cotequeiroz@gmail.com</a>&gt;<br>
-Date: Fri, 25 Dec 2020 13:54:14 -0300<br>
-Subject: [PATCH] commands: fix check for seccomp notify support<br>
-<br>
-Use HAVE_SECCOMP_NOTIFY instead of HAVE_DECL_SECCOMP_NOTIFY_FD.<br>
-Currently the latter will be true if the declaration is found by<br>
-configure, even if &#39;configure --disable-seccomp&#39; is used.<br>
-<br>
-HAVE_SECCOMP_NOTIFY is defined in lxcseccomp.h if both HAVE_SECCOMP and<br=
>
-HAVE_DECL_SECCOMP_NOTIFY_FD are true, which is the correct behavior.<br>
-<br>
-Upstream-status: submitted <a href=3D"https://github.com/lxc/lxc/pull/3623=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/lxc/lx=
c/pull/3623</a><br>
-<br>
-Signed-off-by: Eneas U de Queiroz &lt;<a href=3D"mailto:cotequeiroz@gmail.=
com" target=3D"_blank" rel=3D"noreferrer">cotequeiroz@gmail.com</a>&gt;<br>
----<br>
- src/lxc/commands.c | 4 ++--<br>
- 1 file changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/src/lxc/commands.c b/src/lxc/commands.c<br>
-index a9a03ca2c..37d1abcef 100644<br>
---- a/src/lxc/commands.c<br>
-+++ b/src/lxc/commands.c<br>
-@@ -501,7 +501,7 @@ static int lxc_cmd_get_devpts_fd_callback(int fd, stru=
ct lxc_cmd_req *req,<br>
- <br>
- int lxc_cmd_get_seccomp_notify_fd(const char *name, const char *lxcpath)<=
br>
- {<br>
--#if HAVE_DECL_SECCOMP_NOTIFY_FD<br>
-+#ifdef HAVE_SECCOMP_NOTIFY<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret, stopped;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lxc_cmd_rr cmd =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.req =3D {<br>
-@@ -526,7 +526,7 @@ static int lxc_cmd_get_seccomp_notify_fd_callback(int =
fd, struct lxc_cmd_req *re<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lxc_handler *handler,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lxc_epoll_descr *descr)<br>
- {<br>
--#if HAVE_DECL_SECCOMP_NOTIFY_FD<br>
-+#ifdef HAVE_SECCOMP_NOTIFY<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct lxc_cmd_rsp rsp =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.ret =3D 0,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
--- <br>
-2.17.1<br>
-<br>
diff --git a/recipes-containers/lxc/files/configure-skip-libseccomp-tests-i=
f-it-is-disabled.patch b/recipes-containers/lxc/files/configure-skip-libsec=
comp-tests-if-it-is-disabled.patch<br>
deleted file mode 100644<br>
index 43c91ba..0000000<br>
--- a/recipes-containers/lxc/files/configure-skip-libseccomp-tests-if-it-is=
-disabled.patch<br>
+++ /dev/null<br>
@@ -1,53 +0,0 @@<br>
-From 67cd8bde2d46983df8fa9f647e9fc0b96370ec29 Mon Sep 17 00:00:00 2001<br>
-From: Eneas U de Queiroz &lt;<a href=3D"mailto:cotequeiroz@gmail.com" targ=
et=3D"_blank" rel=3D"noreferrer">cotequeiroz@gmail.com</a>&gt;<br>
-Date: Sat, 16 Jan 2021 13:54:07 -0300<br>
-Subject: [PATCH] configure: skip libseccomp tests if it is disabled<br>
-<br>
-Move the block checking for libseccomp api compatibility inside<br>
-AM_COND_IF([ENABLE_SECCOMP] ... ).<br>
-<br>
-Upstream-Status: submitted [<a href=3D"https://github.com/lxc/lxc/pull/362=
3" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/lxc/l=
xc/pull/3623</a>]<br>
-<br>
-Signed-off-by: Eneas U de Queiroz &lt;<a href=3D"mailto:cotequeiroz@gmail.=
com" target=3D"_blank" rel=3D"noreferrer">cotequeiroz@gmail.com</a>&gt;<br>
----<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer noreferrer" target=3D"_=
blank">configure.ac</a> | 17 ++++++++---------<br>
- 1 file changed, 8 insertions(+), 9 deletions(-)<br>
-<br>
-diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=
=3D"noreferrer noreferrer" target=3D"_blank">configure.ac</a><br>
-index f58487f5d..ce6363136 100644<br>
---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer noreferrer" target=
=3D"_blank">configure.ac</a><br>
-+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer noreferrer" target=
=3D"_blank">configure.ac</a><br>
-@@ -312,6 +312,14 @@ AM_COND_IF([ENABLE_SECCOMP],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_CHECK_LIB([secco=
mp], [seccomp_init],[],[AC_MSG_ERROR([You must install the seccomp developm=
ent package in order to compile lxc])])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_SUBST([SECCOMP_L=
IBS], [-lseccomp])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0])<br>
-+=C2=A0 =C2=A0 =C2=A0 # HAVE_SCMP_FILTER_CTX=3D1 will tell us we have libs=
eccomp api &gt;=3D 1.0.0<br>
-+=C2=A0 =C2=A0 =C2=A0 OLD_CFLAGS=3D&quot;$CFLAGS&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 CFLAGS=3D&quot;$CFLAGS $SECCOMP_CFLAGS&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 AC_CHECK_TYPES([scmp_filter_ctx], [], [], [[#include=
 &lt;seccomp.h&gt;]])<br>
-+=C2=A0 =C2=A0 =C2=A0 AC_CHECK_DECLS([seccomp_notify_fd], [], [], [[#inclu=
de &lt;seccomp.h&gt;]])<br>
-+=C2=A0 =C2=A0 =C2=A0 AC_CHECK_TYPES([struct seccomp_notif_sizes], [], [],=
 [[#include &lt;seccomp.h&gt;]])<br>
-+=C2=A0 =C2=A0 =C2=A0 AC_CHECK_DECLS([seccomp_syscall_resolve_name_arch], =
[], [], [[#include &lt;seccomp.h&gt;]])<br>
-+=C2=A0 =C2=A0 =C2=A0 CFLAGS=3D&quot;$OLD_CFLAGS&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0])<br>
- <br>
- AC_MSG_CHECKING(for static libcap)<br>
-@@ -359,15 +367,6 @@ AM_COND_IF([ENABLE_CAP],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_CHECK_LIB(cap,cap_get_file, AC_DEFINE=
(LIBCAP_SUPPORTS_FILE_CAPABILITIES,1,[Have cap_get_file]),[],[])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_SUBST([CAP_LIBS], [-lcap])])<br>
- <br>
--# HAVE_SCMP_FILTER_CTX=3D1 will tell us we have libseccomp api &gt;=3D 1.=
0.0<br>
--OLD_CFLAGS=3D&quot;$CFLAGS&quot;<br>
--CFLAGS=3D&quot;$CFLAGS $SECCOMP_CFLAGS&quot;<br>
--AC_CHECK_TYPES([scmp_filter_ctx], [], [], [[#include &lt;seccomp.h&gt;]])=
<br>
--AC_CHECK_DECLS([seccomp_notify_fd], [], [], [[#include &lt;seccomp.h&gt;]=
])<br>
--AC_CHECK_TYPES([struct seccomp_notif_sizes], [], [], [[#include &lt;secco=
mp.h&gt;]])<br>
--AC_CHECK_DECLS([seccomp_syscall_resolve_name_arch], [], [], [[#include &l=
t;seccomp.h&gt;]])<br>
--CFLAGS=3D&quot;$OLD_CFLAGS&quot;<br>
--<br>
- AC_CHECK_HEADERS([linux/bpf.h], [<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0AC_CHECK_TYPES([struct bpf_cgroup_dev_ctx], [],=
 [], [[#include &lt;linux/bpf.h&gt;]])<br>
- ], [], [])<br>
--- <br>
-2.17.1<br>
-<br>
diff --git a/recipes-containers/lxc/files/tests-add-no-validate-when-using-=
download-template.patch b/recipes-containers/lxc/files/tests-add-no-validat=
e-when-using-download-template.patch<br>
index 8caeb2b..f335e79 100644<br>
--- a/recipes-containers/lxc/files/tests-add-no-validate-when-using-downloa=
d-template.patch<br>
+++ b/recipes-containers/lxc/files/tests-add-no-validate-when-using-downloa=
d-template.patch<br>
@@ -18,11 +18,11 @@ Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:ma=
rk.asselstine@windriver.com" target=3D"_blank" rel=3D"noreferrer">mark.asse=
lstine@windriver.com</a>&gt;<br>
=C2=A0 src/tests/<a href=3D"http://lxc-test-usernic.in" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">lxc-test-usernic.in</a>=C2=A0 =C2=A0 =C2=A0| 2=
 +-<br>
=C2=A0 5 files changed, 5 insertions(+), 5 deletions(-)<br>
<br>
-diff --git a/src/tests/lxc-test-apparmor-mount b/src/tests/lxc-test-apparm=
or-mount<br>
-index d21c948..9e1969b 100755<br>
---- a/src/tests/lxc-test-apparmor-mount<br>
-+++ b/src/tests/lxc-test-apparmor-mount<br>
-@@ -169,7 +169,7 @@ if [ -f /etc/lsb-release ]; then<br>
+Index: lxc-4.0.9/src/tests/lxc-test-apparmor-mount<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- lxc-4.0.9.orig/src/tests/lxc-test-apparmor-mount<br>
++++ lxc-4.0.9/src/tests/lxc-test-apparmor-mount<br>
+@@ -170,7 +170,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 done<br>
=C2=A0 fi<br>
<br>
@@ -31,11 +31,11 @@ index d21c948..9e1969b 100755<br>
<br>
=C2=A0 echo &quot;test default confined container&quot;<br>
=C2=A0 run_cmd lxc-start -n $cname -d -lDEBUG -o &quot;$logfile&quot;<br>
-diff --git a/src/tests/lxc-test-autostart b/src/tests/lxc-test-autostart<b=
r>
-index e5b651b..d15b79b 100755<br>
---- a/src/tests/lxc-test-autostart<br>
-+++ b/src/tests/lxc-test-autostart<br>
-@@ -55,7 +55,7 @@ if [ -f /etc/lsb-release ]; then<br>
+Index: lxc-4.0.9/src/tests/lxc-test-autostart<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- lxc-4.0.9.orig/src/tests/lxc-test-autostart<br>
++++ lxc-4.0.9/src/tests/lxc-test-autostart<br>
+@@ -55,7 +55,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 done<br>
=C2=A0 fi<br>
<br>
@@ -44,11 +44,11 @@ index e5b651b..d15b79b 100755<br>
=C2=A0 CONTAINER_PATH=3D$(dirname $(lxc-info -n $CONTAINER_NAME -c lxc.root=
fs.path -H) | sed -e &#39;s/dir://&#39;)<br>
=C2=A0 cp $CONTAINER_PATH/config $CONTAINER_PATH/config.bak<br>
<br>
-diff --git a/src/tests/lxc-test-no-new-privs b/src/tests/lxc-test-no-new-p=
rivs<br>
-index 8642992..e72bdf0 100755<br>
---- a/src/tests/lxc-test-no-new-privs<br>
-+++ b/src/tests/lxc-test-no-new-privs<br>
-@@ -47,7 +47,7 @@ if type dpkg &gt;/dev/null 2&gt;&amp;1; then<br>
+Index: lxc-4.0.9/src/tests/lxc-test-no-new-privs<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- lxc-4.0.9.orig/src/tests/lxc-test-no-new-privs<br>
++++ lxc-4.0.9/src/tests/lxc-test-no-new-privs<br>
+@@ -49,7 +49,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ARCH=3D$(dpkg --print-architecture)<br>
=C2=A0 fi<br>
<br>
@@ -57,24 +57,24 @@ index 8642992..e72bdf0 100755<br>
=C2=A0 echo &quot;lxc.no_new_privs =3D 1&quot; &gt;&gt; /var/lib/lxc/c1/con=
fig<br>
<br>
=C2=A0 lxc-start -n c1<br>
-diff --git a/src/tests/lxc-test-unpriv b/src/tests/lxc-test-unpriv<br>
-index 16ff12d..0958d48 100755<br>
---- a/src/tests/lxc-test-unpriv<br>
-+++ b/src/tests/lxc-test-unpriv<br>
-@@ -173,7 +173,7 @@ run_cmd mkdir -p $HDIR/.cache/lxc<br>
+Index: lxc-4.0.9/src/tests/lxc-test-unpriv<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- lxc-4.0.9.orig/src/tests/lxc-test-unpriv<br>
++++ lxc-4.0.9/src/tests/lxc-test-unpriv<br>
+@@ -178,7 +178,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 cp -R /var/cache/lxc/download $HDIR/.cache/lxc &amp;&a=
mp; \<br>
=C2=A0 =C2=A0 =C2=A0 chown -R $TUSER: $HDIR/.cache/lxc<br>
<br>
--run_cmd lxc-create -t download -n c1 -- -d ubuntu -r $release -a $ARCH<br=
>
-+run_cmd lxc-create -t download -n c1 -- --no-validate -d ubuntu -r $relea=
se -a $ARCH<br>
+-run_cmd lxc-create -t download -n c1 -l trace -o &quot;${UNPRIV_LOG}&quot=
; -- -d ubuntu -r $release -a $ARCH<br>
++run_cmd lxc-create -t download -n c1 -l trace -o &quot;${UNPRIV_LOG}&quot=
; -- --no-validate -d ubuntu -r $release -a $ARCH<br>
<br>
=C2=A0 # Make sure we can start it - twice<br>
<br>
-diff --git a/src/tests/<a href=3D"http://lxc-test-usernic.in" rel=3D"noref=
errer noreferrer" target=3D"_blank">lxc-test-usernic.in</a> b/src/tests/<a =
href=3D"http://lxc-test-usernic.in" rel=3D"noreferrer noreferrer" target=3D=
"_blank">lxc-test-usernic.in</a><br>
-index 3e35008..f489286 100755<br>
---- a/src/tests/<a href=3D"http://lxc-test-usernic.in" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">lxc-test-usernic.in</a><br>
-+++ b/src/tests/<a href=3D"http://lxc-test-usernic.in" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">lxc-test-usernic.in</a><br>
-@@ -146,7 +146,7 @@ if [ -f /etc/lsb-release ]; then<br>
+Index: lxc-4.0.9/src/tests/<a href=3D"http://lxc-test-usernic.in" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">lxc-test-usernic.in</a><br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- lxc-4.0.9.orig/src/tests/<a href=3D"http://lxc-test-usernic.in" rel=3D=
"noreferrer noreferrer" target=3D"_blank">lxc-test-usernic.in</a><br>
++++ lxc-4.0.9/src/tests/<a href=3D"http://lxc-test-usernic.in" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">lxc-test-usernic.in</a><br>
+@@ -147,7 +147,7 @@<br>
=C2=A0 fi<br>
<br>
=C2=A0 # Create three containers<br>
diff --git a/recipes-containers/lxc/<a href=3D"http://lxc_4.0.6.bb" rel=3D"=
noreferrer noreferrer" target=3D"_blank">lxc_4.0.6.bb</a> b/recipes-contain=
ers/lxc/<a href=3D"http://lxc_4.0.9.bb" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">lxc_4.0.9.bb</a><br>
similarity index 96%<br>
rename from recipes-containers/lxc/<a href=3D"http://lxc_4.0.6.bb" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">lxc_4.0.6.bb</a><br>
rename to recipes-containers/lxc/<a href=3D"http://lxc_4.0.9.bb" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">lxc_4.0.9.bb</a><br>
index c9bf3d0..7907291 100644<br>
--- a/recipes-containers/lxc/<a href=3D"http://lxc_4.0.6.bb" rel=3D"norefer=
rer noreferrer" target=3D"_blank">lxc_4.0.6.bb</a><br>
+++ b/recipes-containers/lxc/<a href=3D"http://lxc_4.0.9.bb" rel=3D"norefer=
rer noreferrer" target=3D"_blank">lxc_4.0.9.bb</a><br>
@@ -49,12 +49,10 @@ SRC_URI =3D &quot;<a href=3D"http://linuxcontainers.org=
/downloads/$%7BBPN%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">http://linuxcontainers.org/downloads/${BPN}/${BPN}-=
${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://tests-add-no-validate-when-using-downloa=
d-template.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://dnsmasq.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lxc-net \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0file://configure-skip-libseccomp-tests-if-it-is=
-disabled.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0file://commands-fix-check-for-seccomp-notify-su=
pport.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;732571c7cb4ab845068afb227bf35256&quot;<br>
-SRC_URI[sha256sum] =3D &quot;9165dabc0bb6ef7f2fda2009aee90b20fbefe77ed8008=
347e9f06048eba1e463&quot;<br>
+SRC_URI[md5sum] =3D &quot;365fcca985038910e19a1e0fff15ed07&quot;<br>
+SRC_URI[sha256sum] =3D &quot;1fcf0610e9140eceb4be2334eb537bb9c5a213faea77c=
793ab3c62b86f37e52b&quot;<br>
<br>
<br>
<br>
-- <br>
2.17.1<br>
<br>
</div></div>

--000000000000a52c7805fc074a0d--

