Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A64C77B7F
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 14:44:29 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web10.28225.1684507465885235552
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 19 May 2023 07:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=H14BbtD5;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-76fe43b85e4so279342939f.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 19 May 2023 07:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684507465; x=1687099465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnmi4F0tDla7UQc1pzlNl/x8L9BLrsyuQXvbn3fL0gk=;
        b=H14BbtD5ygQvKswRdt7f4e01LGFtTJyxvG+d3PI2YxC41mU1UV2xHBahK0oPoBSRuR
         N1p8qC6vMqC+/Qd+dqslvqAwwn1589E6NlbgSxrRB/kJXsZfki5fKuyd1q5fQBG1Wfks
         MxNpgHMBhgwQwMroQEho9oT8oJmpAzC4GXMiCQgYOGrNYUvgrb4rn9mcHcyoVkQh2qJ5
         Po9o52Wnpqfw6PXQyl5Wu03rs3a5If27/EM4sfh6XP7BidFJeeD+9PwEp3WhbcvdzJYk
         ssZVynCWs231QEtWT4/9L2/SxQvTEzNiKxJxJgIgWmTx4Lbr9XCohAe70q8e5rfpQGJN
         zr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684507465; x=1687099465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wnmi4F0tDla7UQc1pzlNl/x8L9BLrsyuQXvbn3fL0gk=;
        b=ic/nq307KcaI0Hvq65+zujWgKlAiFUig21CN0+H8FjuXc80Q5ZwSZ2wv7DU4OE3SRs
         cnU+I5EbBg13CB8YBxfqWzAKRfN8ZKB1V+qMD3kJvsPfMw2IutTGUFH+3rF/0EbnPEzV
         4k7YwhUkH+5F84ltK2pvRd7UBSFZVzTaCcSgbhaBzyj3KG1LhGs7vr+d9+L51sJRetVY
         w2PM1fl2aFblwgmAQF/iWgh2PTAp9piWXiG62+Lm9lOs+qrkIJ9s+aK3QKG1DH/h038o
         WEjevY0iWyfZwwSDKLWcFV0yhgW1aqNKaKLtlQ/lVxftrhF9AjErj6+8YplIyGnz1icM
         LVUg==
X-Gm-Message-State: AC+VfDzsBvwTGvIDbo1gfd6blaSHvMBrDO6dXGQnXo4hLi7pTSs6TJur
	mr3YnSW6HvPvXWhoL/j5mD363Q5D4VpY8sIocAHet1kHr9c=
X-Google-Smtp-Source: ACHHUZ74EfbTebH6E8Ka3oEPY5KBOZiaAdl41I/sc6zSn4Z/ag4n+dkO4RPdXFjqSbkysFcYkgFPFi080Q7Wv9umLWM=
X-Received: by 2002:a92:c891:0:b0:338:a244:6edd with SMTP id
 w17-20020a92c891000000b00338a2446eddmr1222918ilo.1.1684507464802; Fri, 19 May
 2023 07:44:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230519072337.4002-1-thakur.virendra1810@gmail.com> <CAJM8miX2t38gYCdXG0zGRfHrSL-OBe88VNoK+8uCQ6PwarsNuA@mail.gmail.com>
In-Reply-To: <CAJM8miX2t38gYCdXG0zGRfHrSL-OBe88VNoK+8uCQ6PwarsNuA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 19 May 2023 10:44:13 -0400
Message-ID: <CADkTA4NLEYCN9xXiyYXVYTLu3udXYzaVivGXvD+X_j8QQZf=5g@mail.gmail.com>
Subject: Re: [meta-virtualization] meta-virtualization][PATCH 1/7] lxc: update
 to 4.0.9
To: virendra thakur <thakur.virendra1810@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 19 May 2023 14:44:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8072

Something was wrong with the format of the patches, git am refused to apply=
 them
(it complains about missing information for paths).

But because you had the right information in the commit logs, I just
did the cherry-picks
directly.

These are now on dunfell.

Bruce

On Fri, May 19, 2023 at 3:58=E2=80=AFAM virendra thakur
<thakur.virendra1810@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Bumping lxc to a newer 4.0 -stable release.
>
> We drop two patches that have been integrated to the upstream repo, but
> otherwise, things are the same.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> (cherry picked from commit baa8c9cd62988121c39ae848cd967859fbbf5250)
> Signed-off-by: virendra thakur <virendrak@kpit.com>
> ---
>  ...fix-check-for-seccomp-notify-support.patch | 44 ---------------
>  ...p-libseccomp-tests-if-it-is-disabled.patch | 53 ------------------
>  ...alidate-when-using-download-template.patch | 54 +++++++++----------
>  .../lxc/{lxc_4.0.6.bb =3D> lxc_4.0.9.bb}        |  6 +--
>  4 files changed, 29 insertions(+), 128 deletions(-)
>  delete mode 100644 recipes-containers/lxc/files/commands-fix-check-for-s=
eccomp-notify-support.patch
>  delete mode 100644 recipes-containers/lxc/files/configure-skip-libseccom=
p-tests-if-it-is-disabled.patch
>  rename recipes-containers/lxc/{lxc_4.0.6.bb =3D> lxc_4.0.9.bb} (96%)
>
> diff --git a/recipes-containers/lxc/files/commands-fix-check-for-seccomp-=
notify-support.patch b/recipes-containers/lxc/files/commands-fix-check-for-=
seccomp-notify-support.patch
> deleted file mode 100644
> index 391af38..0000000
> --- a/recipes-containers/lxc/files/commands-fix-check-for-seccomp-notify-=
support.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From a342b11fedb3010630de4909ca707ebdc0862060 Mon Sep 17 00:00:00 2001
> -From: Eneas U de Queiroz <cotequeiroz@gmail.com>
> -Date: Fri, 25 Dec 2020 13:54:14 -0300
> -Subject: [PATCH] commands: fix check for seccomp notify support
> -
> -Use HAVE_SECCOMP_NOTIFY instead of HAVE_DECL_SECCOMP_NOTIFY_FD.
> -Currently the latter will be true if the declaration is found by
> -configure, even if 'configure --disable-seccomp' is used.
> -
> -HAVE_SECCOMP_NOTIFY is defined in lxcseccomp.h if both HAVE_SECCOMP and
> -HAVE_DECL_SECCOMP_NOTIFY_FD are true, which is the correct behavior.
> -
> -Upstream-status: submitted https://github.com/lxc/lxc/pull/3623
> -
> -Signed-off-by: Eneas U de Queiroz <cotequeiroz@gmail.com>
> ----
> - src/lxc/commands.c | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/lxc/commands.c b/src/lxc/commands.c
> -index a9a03ca2c..37d1abcef 100644
> ---- a/src/lxc/commands.c
> -+++ b/src/lxc/commands.c
> -@@ -501,7 +501,7 @@ static int lxc_cmd_get_devpts_fd_callback(int fd, st=
ruct lxc_cmd_req *req,
> -
> - int lxc_cmd_get_seccomp_notify_fd(const char *name, const char *lxcpath=
)
> - {
> --#if HAVE_DECL_SECCOMP_NOTIFY_FD
> -+#ifdef HAVE_SECCOMP_NOTIFY
> -       int ret, stopped;
> -       struct lxc_cmd_rr cmd =3D {
> -               .req =3D {
> -@@ -526,7 +526,7 @@ static int lxc_cmd_get_seccomp_notify_fd_callback(in=
t fd, struct lxc_cmd_req *re
> -                                                 struct lxc_handler *han=
dler,
> -                                                 struct lxc_epoll_descr =
*descr)
> - {
> --#if HAVE_DECL_SECCOMP_NOTIFY_FD
> -+#ifdef HAVE_SECCOMP_NOTIFY
> -       struct lxc_cmd_rsp rsp =3D {
> -               .ret =3D 0,
> -       };
> ---
> -2.17.1
> -
> diff --git a/recipes-containers/lxc/files/configure-skip-libseccomp-tests=
-if-it-is-disabled.patch b/recipes-containers/lxc/files/configure-skip-libs=
eccomp-tests-if-it-is-disabled.patch
> deleted file mode 100644
> index 43c91ba..0000000
> --- a/recipes-containers/lxc/files/configure-skip-libseccomp-tests-if-it-=
is-disabled.patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -From 67cd8bde2d46983df8fa9f647e9fc0b96370ec29 Mon Sep 17 00:00:00 2001
> -From: Eneas U de Queiroz <cotequeiroz@gmail.com>
> -Date: Sat, 16 Jan 2021 13:54:07 -0300
> -Subject: [PATCH] configure: skip libseccomp tests if it is disabled
> -
> -Move the block checking for libseccomp api compatibility inside
> -AM_COND_IF([ENABLE_SECCOMP] ... ).
> -
> -Upstream-Status: submitted [https://github.com/lxc/lxc/pull/3623]
> -
> -Signed-off-by: Eneas U de Queiroz <cotequeiroz@gmail.com>
> ----
> - configure.ac | 17 ++++++++---------
> - 1 file changed, 8 insertions(+), 9 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index f58487f5d..ce6363136 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -312,6 +312,14 @@ AM_COND_IF([ENABLE_SECCOMP],
> -               AC_CHECK_LIB([seccomp], [seccomp_init],[],[AC_MSG_ERROR([=
You must install the seccomp development package in order to compile lxc])]=
)
> -               AC_SUBST([SECCOMP_LIBS], [-lseccomp])
> -               ])
> -+      # HAVE_SCMP_FILTER_CTX=3D1 will tell us we have libseccomp api >=
=3D 1.0.0
> -+      OLD_CFLAGS=3D"$CFLAGS"
> -+      CFLAGS=3D"$CFLAGS $SECCOMP_CFLAGS"
> -+      AC_CHECK_TYPES([scmp_filter_ctx], [], [], [[#include <seccomp.h>]=
])
> -+      AC_CHECK_DECLS([seccomp_notify_fd], [], [], [[#include <seccomp.h=
>]])
> -+      AC_CHECK_TYPES([struct seccomp_notif_sizes], [], [], [[#include <=
seccomp.h>]])
> -+      AC_CHECK_DECLS([seccomp_syscall_resolve_name_arch], [], [], [[#in=
clude <seccomp.h>]])
> -+      CFLAGS=3D"$OLD_CFLAGS"
> -       ])
> -
> - AC_MSG_CHECKING(for static libcap)
> -@@ -359,15 +367,6 @@ AM_COND_IF([ENABLE_CAP],
> -         AC_CHECK_LIB(cap,cap_get_file, AC_DEFINE(LIBCAP_SUPPORTS_FILE_C=
APABILITIES,1,[Have cap_get_file]),[],[])
> -         AC_SUBST([CAP_LIBS], [-lcap])])
> -
> --# HAVE_SCMP_FILTER_CTX=3D1 will tell us we have libseccomp api >=3D 1.0=
.0
> --OLD_CFLAGS=3D"$CFLAGS"
> --CFLAGS=3D"$CFLAGS $SECCOMP_CFLAGS"
> --AC_CHECK_TYPES([scmp_filter_ctx], [], [], [[#include <seccomp.h>]])
> --AC_CHECK_DECLS([seccomp_notify_fd], [], [], [[#include <seccomp.h>]])
> --AC_CHECK_TYPES([struct seccomp_notif_sizes], [], [], [[#include <seccom=
p.h>]])
> --AC_CHECK_DECLS([seccomp_syscall_resolve_name_arch], [], [], [[#include =
<seccomp.h>]])
> --CFLAGS=3D"$OLD_CFLAGS"
> --
> - AC_CHECK_HEADERS([linux/bpf.h], [
> -       AC_CHECK_TYPES([struct bpf_cgroup_dev_ctx], [], [], [[#include <l=
inux/bpf.h>]])
> - ], [], [])
> ---
> -2.17.1
> -
> diff --git a/recipes-containers/lxc/files/tests-add-no-validate-when-usin=
g-download-template.patch b/recipes-containers/lxc/files/tests-add-no-valid=
ate-when-using-download-template.patch
> index 8caeb2b..f335e79 100644
> --- a/recipes-containers/lxc/files/tests-add-no-validate-when-using-downl=
oad-template.patch
> +++ b/recipes-containers/lxc/files/tests-add-no-validate-when-using-downl=
oad-template.patch
> @@ -18,11 +18,11 @@ Signed-off-by: Mark Asselstine <mark.asselstine@windr=
iver.com>
>   src/tests/lxc-test-usernic.in     | 2 +-
>   5 files changed, 5 insertions(+), 5 deletions(-)
>
> -diff --git a/src/tests/lxc-test-apparmor-mount b/src/tests/lxc-test-appa=
rmor-mount
> -index d21c948..9e1969b 100755
> ---- a/src/tests/lxc-test-apparmor-mount
> -+++ b/src/tests/lxc-test-apparmor-mount
> -@@ -169,7 +169,7 @@ if [ -f /etc/lsb-release ]; then
> +Index: lxc-4.0.9/src/tests/lxc-test-apparmor-mount
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- lxc-4.0.9.orig/src/tests/lxc-test-apparmor-mount
> ++++ lxc-4.0.9/src/tests/lxc-test-apparmor-mount
> +@@ -170,7 +170,7 @@
>       done
>   fi
>
> @@ -31,11 +31,11 @@ index d21c948..9e1969b 100755
>
>   echo "test default confined container"
>   run_cmd lxc-start -n $cname -d -lDEBUG -o "$logfile"
> -diff --git a/src/tests/lxc-test-autostart b/src/tests/lxc-test-autostart
> -index e5b651b..d15b79b 100755
> ---- a/src/tests/lxc-test-autostart
> -+++ b/src/tests/lxc-test-autostart
> -@@ -55,7 +55,7 @@ if [ -f /etc/lsb-release ]; then
> +Index: lxc-4.0.9/src/tests/lxc-test-autostart
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- lxc-4.0.9.orig/src/tests/lxc-test-autostart
> ++++ lxc-4.0.9/src/tests/lxc-test-autostart
> +@@ -55,7 +55,7 @@
>       done
>   fi
>
> @@ -44,11 +44,11 @@ index e5b651b..d15b79b 100755
>   CONTAINER_PATH=3D$(dirname $(lxc-info -n $CONTAINER_NAME -c lxc.rootfs.=
path -H) | sed -e 's/dir://')
>   cp $CONTAINER_PATH/config $CONTAINER_PATH/config.bak
>
> -diff --git a/src/tests/lxc-test-no-new-privs b/src/tests/lxc-test-no-new=
-privs
> -index 8642992..e72bdf0 100755
> ---- a/src/tests/lxc-test-no-new-privs
> -+++ b/src/tests/lxc-test-no-new-privs
> -@@ -47,7 +47,7 @@ if type dpkg >/dev/null 2>&1; then
> +Index: lxc-4.0.9/src/tests/lxc-test-no-new-privs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- lxc-4.0.9.orig/src/tests/lxc-test-no-new-privs
> ++++ lxc-4.0.9/src/tests/lxc-test-no-new-privs
> +@@ -49,7 +49,7 @@
>         ARCH=3D$(dpkg --print-architecture)
>   fi
>
> @@ -57,24 +57,24 @@ index 8642992..e72bdf0 100755
>   echo "lxc.no_new_privs =3D 1" >> /var/lib/lxc/c1/config
>
>   lxc-start -n c1
> -diff --git a/src/tests/lxc-test-unpriv b/src/tests/lxc-test-unpriv
> -index 16ff12d..0958d48 100755
> ---- a/src/tests/lxc-test-unpriv
> -+++ b/src/tests/lxc-test-unpriv
> -@@ -173,7 +173,7 @@ run_cmd mkdir -p $HDIR/.cache/lxc
> +Index: lxc-4.0.9/src/tests/lxc-test-unpriv
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- lxc-4.0.9.orig/src/tests/lxc-test-unpriv
> ++++ lxc-4.0.9/src/tests/lxc-test-unpriv
> +@@ -178,7 +178,7 @@
>       cp -R /var/cache/lxc/download $HDIR/.cache/lxc && \
>       chown -R $TUSER: $HDIR/.cache/lxc
>
> --run_cmd lxc-create -t download -n c1 -- -d ubuntu -r $release -a $ARCH
> -+run_cmd lxc-create -t download -n c1 -- --no-validate -d ubuntu -r $rel=
ease -a $ARCH
> +-run_cmd lxc-create -t download -n c1 -l trace -o "${UNPRIV_LOG}" -- -d =
ubuntu -r $release -a $ARCH
> ++run_cmd lxc-create -t download -n c1 -l trace -o "${UNPRIV_LOG}" -- --n=
o-validate -d ubuntu -r $release -a $ARCH
>
>   # Make sure we can start it - twice
>
> -diff --git a/src/tests/lxc-test-usernic.in b/src/tests/lxc-test-usernic.=
in
> -index 3e35008..f489286 100755
> ---- a/src/tests/lxc-test-usernic.in
> -+++ b/src/tests/lxc-test-usernic.in
> -@@ -146,7 +146,7 @@ if [ -f /etc/lsb-release ]; then
> +Index: lxc-4.0.9/src/tests/lxc-test-usernic.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- lxc-4.0.9.orig/src/tests/lxc-test-usernic.in
> ++++ lxc-4.0.9/src/tests/lxc-test-usernic.in
> +@@ -147,7 +147,7 @@
>   fi
>
>   # Create three containers
> diff --git a/recipes-containers/lxc/lxc_4.0.6.bb b/recipes-containers/lxc=
/lxc_4.0.9.bb
> similarity index 96%
> rename from recipes-containers/lxc/lxc_4.0.6.bb
> rename to recipes-containers/lxc/lxc_4.0.9.bb
> index c9bf3d0..7907291 100644
> --- a/recipes-containers/lxc/lxc_4.0.6.bb
> +++ b/recipes-containers/lxc/lxc_4.0.9.bb
> @@ -49,12 +49,10 @@ SRC_URI =3D "http://linuxcontainers.org/downloads/${B=
PN}/${BPN}-${PV}.tar.gz \
>         file://tests-add-no-validate-when-using-download-template.patch \
>         file://dnsmasq.conf \
>         file://lxc-net \
> -       file://configure-skip-libseccomp-tests-if-it-is-disabled.patch \
> -       file://commands-fix-check-for-seccomp-notify-support.patch \
>         "
>
> -SRC_URI[md5sum] =3D "732571c7cb4ab845068afb227bf35256"
> -SRC_URI[sha256sum] =3D "9165dabc0bb6ef7f2fda2009aee90b20fbefe77ed8008347=
e9f06048eba1e463"
> +SRC_URI[md5sum] =3D "365fcca985038910e19a1e0fff15ed07"
> +SRC_URI[sha256sum] =3D "1fcf0610e9140eceb4be2334eb537bb9c5a213faea77c793=
ab3c62b86f37e52b"
>
>
>
> --
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8065): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8065
> Mute This Topic: https://lists.yoctoproject.org/mt/99007943/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

