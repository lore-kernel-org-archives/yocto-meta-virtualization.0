Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.8081.1635948300605156733
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 03 Nov 2021 07:05:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JP0AvJGv;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id d21so5377200lfg.7
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 03 Nov 2021 07:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tp8cpY/f0aOlafc2mcJnO1BwB2hZJkCpKNZh4wf0RNw=;
        b=JP0AvJGvLqSf8tZ+AfJTYzP9VLM3DiXGseyBi87vyHlT3g4PkJW6OjCoHD6/npvuXf
         95xLx9rkElNA0yPEccexNc5URlB1ixIPl5fRBMgMRFgV8+vKcnIXFrgJCoqBPTsXk/wO
         Z5jF9GMG6ok3rmdYitm99d4t0GgyqzMeo75S+4smZJ10dMwYIY3NVhkAkbN/DZ9mu75b
         kWVED+D+9ImFm+VWoKHpIqcGxYK9Mhw1vKSK+SrrE4eoFqFY47/qr+n1OgrjR8JrYc7H
         7eipUESvGmu3fpL0Tc2XbBXFtRrpR95rlVCIWjM3WUxTVN7o0DfrPBmw2SBMOyWUUHkx
         kUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tp8cpY/f0aOlafc2mcJnO1BwB2hZJkCpKNZh4wf0RNw=;
        b=Oby/EfmX/VdpVaUTMMsJ+hlDfWjKdugRboAI54RK0aj8qA7cC+pF+KI11fedyiIR8h
         qQqbM68UKXm+4INvyoemRe0urokfaFsJzN9XD1fYqmrOxpJYIfkyNIr3AhSqkqSzsInV
         Dbh5Sls8LpeLq1zAs72isVFfoaQ8GSvhisdqO5brvQC3p9h8p/DJJK+xhMTvPO+gBUKD
         ysxBXAwFQazdrdNQv++kV0hQ64oNKN2Iw9YNYqLZACoLsKikwSFAGNyseDxD30dLuUf2
         bctAFYk88ZGHh7AxjVeRxOUCbHowqMbVv8bsjmgUUKGk0L7wVTQc4EkcyRORwBcuZ0q6
         W30A==
X-Gm-Message-State: AOAM530v9lTiqfoFdegA7asMjE4UHyShmtngmndEHevx8pV5levbwznS
	FS3gPNogLUi3zHu9dnVu+tCCFSHWCH9KQ7MyyV4=
X-Google-Smtp-Source: ABdhPJwZ/UhHGVp1OLJuQVQCx20rp8Ngc21m/aZy47jMof8FOClNwfzCO6XCOnBMjM/BGiVn8BDrlLj/y+ojwuFz5tk=
X-Received: by 2002:a19:c211:: with SMTP id l17mr3041456lfc.627.1635948298177;
 Wed, 03 Nov 2021 07:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <20211101101319.3449912-1-yanfei.xu@windriver.com>
In-Reply-To: <20211101101319.3449912-1-yanfei.xu@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 3 Nov 2021 10:04:46 -0400
Message-ID: <CADkTA4N-ub4LJotPqcnmB7kypECvnmHVFmH9QfrEQ6=moAecLw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] lxc: update to 4.0.11
To: "Xu, Yanfei" <yanfei.xu@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000002f11ed05cfe2e5ea"

--0000000000002f11ed05cfe2e5ea
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 1, 2021 at 6:13 AM Xu, Yanfei <yanfei.xu@windriver.com> wrote:

> update to 4.0.11
>
> 1.drop two patches that have been integrated to upstream repo.
> 2.drop tests-add-no-validate-when-using-download-template.patch
>   because it is no longer appropriate as the "download" has been
>   replaced with "busybox"
> 3.fix the apply failure of templates-use-curl-instead-of-wget.patch
> 4.update lxc from 4.0.10 to 4.0.11
>
>
Thanks for the patch! (and the explanation above).

I've merged this to master and honister.

Bruce



> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> ---
>  ...omp_profile_when_compiled_libseccomp.patch | 46 ----------
>  .../lxc/files/fix_c_command.patch             | 36 --------
>  .../templates-use-curl-instead-of-wget.patch  | 23 ++---
>  ...alidate-when-using-download-template.patch | 85 -------------------
>  recipes-containers/lxc/lxc_git.bb             |  7 +-
>  5 files changed, 15 insertions(+), 182 deletions(-)
>  delete mode 100644
> recipes-containers/lxc/files/enable_seccomp_profile_when_compiled_libseccomp.patch
>  delete mode 100644 recipes-containers/lxc/files/fix_c_command.patch
>  delete mode 100644
> recipes-containers/lxc/files/tests-add-no-validate-when-using-download-template.patch
>
> diff --git
> a/recipes-containers/lxc/files/enable_seccomp_profile_when_compiled_libseccomp.patch
> b/recipes-containers/lxc/files/enable_seccomp_profile_when_compiled_libseccomp.patch
> deleted file mode 100644
> index f0a58139..00000000
> ---
> a/recipes-containers/lxc/files/enable_seccomp_profile_when_compiled_libseccomp.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From 3d46e1d1f8e904fddd4fab3e8d0c6cf57d2ddd4e Mon Sep 17 00:00:00 2001
> -From: Maximilian Blenk <Maximilian.Blenk@bmw.de>
> -Date: Mon, 23 Aug 2021 22:04:40 +0200
> -Subject: [PATCH] config: enable seccomp profile only when compiled with
> - libseccomp
> -
> -Make lxc fail if seccomp.profile is specified but lxc is compiled
> -without seccomp support. Currently, seccomp.profile is silently ignored
> -if is specified in such a scenario. This could lead to the false
> -impression that the seccomp filter is applied while it actually isn't.
> -
> -Signed-off-by: Maximilian Blenk <Maximilian.Blenk@bmw.de>
> ----
> - src/lxc/confile.c | 8 ++++++++
> - 1 file changed, 8 insertions(+)
> -
> -Upstream-Status: Submitted [
> https://github.com/lxc/lxc/pull/3947/commits/3d46e1d1f8e904fddd4fab3e8d0c6cf57d2ddd4e
> ]
> -
> -diff --git a/src/lxc/confile.c b/src/lxc/confile.c
> -index d8b96c6921..1cc8da15f1 100644
> ---- a/src/lxc/confile.c
> -+++ b/src/lxc/confile.c
> -@@ -1211,7 +1211,11 @@ static int set_config_seccomp_notify_proxy(const
> char *key, const char *value,
> - static int set_config_seccomp_profile(const char *key, const char *value,
> -                                     struct lxc_conf *lxc_conf, void
> *data)
> - {
> -+#ifdef HAVE_SECCOMP
> -       return set_config_path_item(&lxc_conf->seccomp.seccomp, value);
> -+#else
> -+      return ret_set_errno(-1, ENOSYS);
> -+#endif
> - }
> -
> - static int set_config_execute_cmd(const char *key, const char *value,
> -@@ -4383,7 +4387,11 @@ static int get_config_seccomp_notify_proxy(const
> char *key, char *retv, int inle
> - static int get_config_seccomp_profile(const char *key, char *retv, int
> inlen,
> -                                     struct lxc_conf *c, void *data)
> - {
> -+#ifdef HAVE_SECCOMP
> -       return lxc_get_conf_str(retv, inlen, c->seccomp.seccomp);
> -+#else
> -+      return ret_errno(ENOSYS);
> -+#endif
> - }
> -
> - static int get_config_autodev(const char *key, char *retv, int inlen,
> diff --git a/recipes-containers/lxc/files/fix_c_command.patch
> b/recipes-containers/lxc/files/fix_c_command.patch
> deleted file mode 100644
> index 1ed8dafd..00000000
> --- a/recipes-containers/lxc/files/fix_c_command.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 9becf309a81806ef08acf9ca99ab95c1bcfa1f65 Mon Sep 17 00:00:00 2001
> -From: Maximilian Blenk <Maximilian.Blenk@bmw.de>
> -Date: Mon, 23 Aug 2021 15:39:28 +0200
> -Subject: [PATCH] attach: Fix -c command
> -
> -Currently, the -c command (to set the selinux context) seems to be
> -broken because the passed context is ignored and always overwritten by
> -the context specified in the config file. The intention behind the -c
> -imho was to be able to manually overwrite this behavior. This patch
> -ensures that the selinux context will be set if passed via the command
> -line.
> -
> -Signed-off-by: Maximilian Blenk <Maximilian.Blenk@bmw.de>
> ----
> - src/lxc/tools/lxc_attach.c | 5 ++++-
> - 1 file changed, 4 insertions(+), 1 deletion(-)
> -
> -Upstream-Status: Backport [
> https://github.com/lxc/lxc/commit/9becf309a81806ef08acf9ca99ab95c1bcfa1f65.patch
> ]
> -Comment: No change in any hunk
> -
> -diff --git a/src/lxc/tools/lxc_attach.c b/src/lxc/tools/lxc_attach.c
> -index 0374d980b4..e6b388b20c 100644
> ---- a/src/lxc/tools/lxc_attach.c
> -+++ b/src/lxc/tools/lxc_attach.c
> -@@ -379,7 +379,10 @@ int main(int argc, char *argv[])
> -               attach_options.gid = my_args.gid;
> -
> -       // selinux_context will be NULL if not set
> --      attach_options.lsm_label = selinux_context;
> -+      if (selinux_context) {
> -+              attach_options.attach_flags |= LXC_ATTACH_LSM_LABEL;
> -+              attach_options.lsm_label = selinux_context;
> -+      }
> -
> -       if (command.program) {
> -               ret = c->attach_run_wait(c, &attach_options,
> command.program,
> diff --git
> a/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch
> b/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch
> index 156df82f..4556293a 100644
> --- a/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch
> +++ b/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch
> @@ -1,4 +1,4 @@
> -From 07890dd8ffdcd08b7be1ddbd9f56ac55482c76bb Mon Sep 17 00:00:00 2001
> +From 1db2db7783bd7ec2aa1da86e640019891634c659 Mon Sep 17 00:00:00 2001
>  From: Joakim Roubert <joakimr@axis.com>
>  Date: Fri, 16 Aug 2019 07:52:48 +0200
>  Subject: [PATCH] Use curl instead of wget
> @@ -7,16 +7,16 @@ When curl's MIT license is preferable to wget's GPLv3.
>
>  Change-Id: I4684ae7569704514fdcc63e0655c556efcaf44f8
>  Signed-off-by: Joakim Roubert <joakimr@axis.com>
> -
> +Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
>  ---
>   templates/lxc-download.in | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
>  diff --git a/templates/lxc-download.in b/templates/lxc-download.in
> -index d7e6128..8a4b567 100644
> +index e8570692a..f7291b0cc 100755
>  --- a/templates/lxc-download.in
>  +++ b/templates/lxc-download.in
> -@@ -74,9 +74,9 @@ cleanup() {
> +@@ -75,9 +75,9 @@ cleanup() {
>     fi
>   }
>
> @@ -28,18 +28,18 @@ index d7e6128..8a4b567 100644
>         return 0
>       fi
>     done
> -@@ -85,8 +85,8 @@ wget_wrapper() {
> +@@ -86,8 +86,8 @@ wget_wrapper() {
>   }
>
>   download_file() {
> --  if ! wget_wrapper -T 30 -q "https://${DOWNLOAD_SERVER}/$1" -O "$2"
> >/dev/null 2>&1; then
> --    if ! wget_wrapper -T 30 -q "http://${DOWNLOAD_SERVER}/$1" -O "$2"
> >/dev/null 2>&1; then
> -+  if ! curl_wrapper -m 30 -s "https://${DOWNLOAD_SERVER}/$1" -o "$2"
> >/dev/null 2>&1; then
> -+    if ! curl_wrapper -m 30 -s "http://${DOWNLOAD_SERVER}/$1" -o "$2"
> >/dev/null 2>&1; then
> +-  if ! wget_wrapper --user-agent="lxc/@PACKAGE_VERSION@
> compat:${DOWNLOAD_COMPAT_LEVEL}" -T 30 -q "https://${DOWNLOAD_SERVER}/$1"
> -O "$2" >/dev/null 2>&1; then
> +-    if ! wget_wrapper --user-agent="lxc/@PACKAGE_VERSION@
> compat:${DOWNLOAD_COMPAT_LEVEL}" -T 30 -q "http://${DOWNLOAD_SERVER}/$1"
> -O "$2" >/dev/null 2>&1; then
> ++  if ! curl_wrapper --user-agent="lxc/@PACKAGE_VERSION@
> compat:${DOWNLOAD_COMPAT_LEVEL}" -m 30 -s "https://${DOWNLOAD_SERVER}/$1"
> -o "$2" >/dev/null 2>&1; then
> ++    if ! curl_wrapper --user-agent="lxc/@PACKAGE_VERSION@
> compat:${DOWNLOAD_COMPAT_LEVEL}" -m 30 -s "http://${DOWNLOAD_SERVER}/$1"
> -o "$2" >/dev/null 2>&1; then
>         if [ "$3" = "noexit" ]; then
>           return 1
>         else
> -@@ -271,7 +271,7 @@ while :; do
> +@@ -277,7 +277,7 @@ while :; do
>   done
>
>   # Check for required binaries
> @@ -48,3 +48,6 @@ index d7e6128..8a4b567 100644
>     if ! command -V "${bin}" >/dev/null 2>&1; then
>       echo "ERROR: Missing required tool: ${bin}" 1>&2
>       exit 1
> +--
> +2.27.0
> +
> diff --git
> a/recipes-containers/lxc/files/tests-add-no-validate-when-using-download-template.patch
> b/recipes-containers/lxc/files/tests-add-no-validate-when-using-download-template.patch
> deleted file mode 100644
> index f335e796..00000000
> ---
> a/recipes-containers/lxc/files/tests-add-no-validate-when-using-download-template.patch
> +++ /dev/null
> @@ -1,85 +0,0 @@
> -From 1c2506434e744d8c6a86e42c9d8bae4cde7553f6 Mon Sep 17 00:00:00 2001
> -From: Mark Asselstine <mark.asselstine@windriver.com>
> -Date: Thu, 31 May 2018 15:14:26 -0400
> -Subject: [PATCH] tests: add '--no-validate' when using download template
> -
> -We are usually running the ptests with core-image-minimal which has no
> -mechanism to validate the downloads. Validation isn't really of
> -interest to this test at any rate so simply add '--no-validate' to
> -avoid failing due to no GPG validation.
> -
> -Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> -
> ----
> - src/tests/lxc-test-apparmor-mount | 2 +-
> - src/tests/lxc-test-autostart      | 2 +-
> - src/tests/lxc-test-no-new-privs   | 2 +-
> - src/tests/lxc-test-unpriv         | 2 +-
> - src/tests/lxc-test-usernic.in     | 2 +-
> - 5 files changed, 5 insertions(+), 5 deletions(-)
> -
> -Index: lxc-4.0.9/src/tests/lxc-test-apparmor-mount
> -===================================================================
> ---- lxc-4.0.9.orig/src/tests/lxc-test-apparmor-mount
> -+++ lxc-4.0.9/src/tests/lxc-test-apparmor-mount
> -@@ -170,7 +170,7 @@
> -     done
> - fi
> -
> --run_cmd lxc-create -t download -n $cname -- -d ubuntu -r $release -a
> $ARCH
> -+run_cmd lxc-create -t download -n $cname -- --no-validate -d ubuntu -r
> $release -a $ARCH
> -
> - echo "test default confined container"
> - run_cmd lxc-start -n $cname -d -lDEBUG -o "$logfile"
> -Index: lxc-4.0.9/src/tests/lxc-test-autostart
> -===================================================================
> ---- lxc-4.0.9.orig/src/tests/lxc-test-autostart
> -+++ lxc-4.0.9/src/tests/lxc-test-autostart
> -@@ -55,7 +55,7 @@
> -     done
> - fi
> -
> --lxc-create -t download -n $CONTAINER_NAME -B dir -- -d ubuntu -r
> $release -a $ARCH
> -+lxc-create -t download -n $CONTAINER_NAME -B dir -- --no-validate -d
> ubuntu -r $release -a $ARCH
> - CONTAINER_PATH=$(dirname $(lxc-info -n $CONTAINER_NAME -c
> lxc.rootfs.path -H) | sed -e 's/dir://')
> - cp $CONTAINER_PATH/config $CONTAINER_PATH/config.bak
> -
> -Index: lxc-4.0.9/src/tests/lxc-test-no-new-privs
> -===================================================================
> ---- lxc-4.0.9.orig/src/tests/lxc-test-no-new-privs
> -+++ lxc-4.0.9/src/tests/lxc-test-no-new-privs
> -@@ -49,7 +49,7 @@
> -       ARCH=$(dpkg --print-architecture)
> - fi
> -
> --lxc-create -t download -n c1 -- -d ubuntu -r xenial -a $ARCH
> -+lxc-create -t download -n c1 -- --no-validate -d ubuntu -r xenial -a
> $ARCH
> - echo "lxc.no_new_privs = 1" >> /var/lib/lxc/c1/config
> -
> - lxc-start -n c1
> -Index: lxc-4.0.9/src/tests/lxc-test-unpriv
> -===================================================================
> ---- lxc-4.0.9.orig/src/tests/lxc-test-unpriv
> -+++ lxc-4.0.9/src/tests/lxc-test-unpriv
> -@@ -178,7 +178,7 @@
> -     cp -R /var/cache/lxc/download $HDIR/.cache/lxc && \
> -     chown -R $TUSER: $HDIR/.cache/lxc
> -
> --run_cmd lxc-create -t download -n c1 -l trace -o "${UNPRIV_LOG}" -- -d
> ubuntu -r $release -a $ARCH
> -+run_cmd lxc-create -t download -n c1 -l trace -o "${UNPRIV_LOG}" --
> --no-validate -d ubuntu -r $release -a $ARCH
> -
> - # Make sure we can start it - twice
> -
> -Index: lxc-4.0.9/src/tests/lxc-test-usernic.in
> -===================================================================
> ---- lxc-4.0.9.orig/src/tests/lxc-test-usernic.in
> -+++ lxc-4.0.9/src/tests/lxc-test-usernic.in
> -@@ -147,7 +147,7 @@
> - fi
> -
> - # Create three containers
> --run_cmd "lxc-create -t download -n b1 -- -d ubuntu -r $release -a $ARCH"
> -+run_cmd "lxc-create -t download -n b1 -- --no-validate -d ubuntu -r
> $release -a $ARCH"
> - run_cmd "lxc-start -n b1 -d"
> - p1=$(run_cmd "lxc-info -n b1 -p -H")
> -
> diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/
> lxc_git.bb
> index f5b5128b..ba1cef5a 100644
> --- a/recipes-containers/lxc/lxc_git.bb
> +++ b/recipes-containers/lxc/lxc_git.bb
> @@ -46,15 +46,12 @@ SRC_URI = "git://
> github.com/lxc/lxc.git;branch=stable-4.0 \
>         file://template-make-busybox-template-compatible-with-core-.patch \
>         file://templates-use-curl-instead-of-wget.patch \
>         file://tests-our-init-is-not-busybox.patch \
> -       file://tests-add-no-validate-when-using-download-template.patch \
>         file://dnsmasq.conf \
>         file://lxc-net \
> -        file://enable_seccomp_profile_when_compiled_libseccomp.patch \
> -        file://fix_c_command.patch \
>         "
>
> -SRCREV = "cec7cb14b2a4367d4cb21a90e1b90d0f98a9d874"
> -PV = "4.0.10+git${SRCPV}"
> +SRCREV = "48e079bf318982ae7d5684feeb7358870fa71c10"
> +PV = "4.0.11+git${SRCPV}"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.27.0
>
>
> 
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000002f11ed05cfe2e5ea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Nov 1, 2021 at 6:13 AM Xu, Yanfei &lt;<a hr=
ef=3D"mailto:yanfei.xu@windriver.com">yanfei.xu@windriver.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">update to 4.0.=
11<br>
<br>
1.drop two patches that have been integrated to upstream repo.<br>
2.drop tests-add-no-validate-when-using-download-template.patch<br>
=C2=A0 because it is no longer appropriate as the &quot;download&quot; has =
been<br>
=C2=A0 replaced with &quot;busybox&quot;<br>
3.fix the apply failure of templates-use-curl-instead-of-wget.patch<br>
4.update lxc from 4.0.10 to 4.0.11<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">Thanks for the patch! (and the explanation above).</div><d=
iv class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">I&#39;ve merged this to master=
 and honister.</div><div class=3D"gmail_default" style=3D"font-size:small">=
<br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div=
><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
Signed-off-by: Yanfei Xu &lt;<a href=3D"mailto:yanfei.xu@windriver.com" tar=
get=3D"_blank">yanfei.xu@windriver.com</a>&gt;<br>
---<br>
=C2=A0...omp_profile_when_compiled_libseccomp.patch | 46 ----------<br>
=C2=A0.../lxc/files/fix_c_command.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 36 --------<br>
=C2=A0.../templates-use-curl-instead-of-wget.patch=C2=A0 | 23 ++---<br>
=C2=A0...alidate-when-using-download-template.patch | 85 ------------------=
-<br>
=C2=A0recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"noreferre=
r" target=3D"_blank">lxc_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 7 +-<br>
=C2=A05 files changed, 15 insertions(+), 182 deletions(-)<br>
=C2=A0delete mode 100644 recipes-containers/lxc/files/enable_seccomp_profil=
e_when_compiled_libseccomp.patch<br>
=C2=A0delete mode 100644 recipes-containers/lxc/files/fix_c_command.patch<b=
r>
=C2=A0delete mode 100644 recipes-containers/lxc/files/tests-add-no-validate=
-when-using-download-template.patch<br>
<br>
diff --git a/recipes-containers/lxc/files/enable_seccomp_profile_when_compi=
led_libseccomp.patch b/recipes-containers/lxc/files/enable_seccomp_profile_=
when_compiled_libseccomp.patch<br>
deleted file mode 100644<br>
index f0a58139..00000000<br>
--- a/recipes-containers/lxc/files/enable_seccomp_profile_when_compiled_lib=
seccomp.patch<br>
+++ /dev/null<br>
@@ -1,46 +0,0 @@<br>
-From 3d46e1d1f8e904fddd4fab3e8d0c6cf57d2ddd4e Mon Sep 17 00:00:00 2001<br>
-From: Maximilian Blenk &lt;<a href=3D"mailto:Maximilian.Blenk@bmw.de" targ=
et=3D"_blank">Maximilian.Blenk@bmw.de</a>&gt;<br>
-Date: Mon, 23 Aug 2021 22:04:40 +0200<br>
-Subject: [PATCH] config: enable seccomp profile only when compiled with<br=
>
- libseccomp<br>
-<br>
-Make lxc fail if seccomp.profile is specified but lxc is compiled<br>
-without seccomp support. Currently, seccomp.profile is silently ignored<br=
>
-if is specified in such a scenario. This could lead to the false<br>
-impression that the seccomp filter is applied while it actually isn&#39;t.=
<br>
-<br>
-Signed-off-by: Maximilian Blenk &lt;<a href=3D"mailto:Maximilian.Blenk@bmw=
.de" target=3D"_blank">Maximilian.Blenk@bmw.de</a>&gt;<br>
----<br>
- src/lxc/confile.c | 8 ++++++++<br>
- 1 file changed, 8 insertions(+)<br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://github.com/lxc/lxc/pull/394=
7/commits/3d46e1d1f8e904fddd4fab3e8d0c6cf57d2ddd4e" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/lxc/lxc/pull/3947/commits/3d46e1d1f8e904fd=
dd4fab3e8d0c6cf57d2ddd4e</a>]<br>
-<br>
-diff --git a/src/lxc/confile.c b/src/lxc/confile.c<br>
-index d8b96c6921..1cc8da15f1 100644<br>
---- a/src/lxc/confile.c<br>
-+++ b/src/lxc/confile.c<br>
-@@ -1211,7 +1211,11 @@ static int set_config_seccomp_notify_proxy(const ch=
ar *key, const char *value,<br>
- static int set_config_seccomp_profile(const char *key, const char *value,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct lxc_conf =
*lxc_conf, void *data)<br>
- {<br>
-+#ifdef HAVE_SECCOMP<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return set_config_path_item(&amp;lxc_conf-&gt;s=
eccomp.seccomp, value);<br>
-+#else<br>
-+=C2=A0 =C2=A0 =C2=A0 return ret_set_errno(-1, ENOSYS);<br>
-+#endif<br>
- }<br>
- <br>
- static int set_config_execute_cmd(const char *key, const char *value,<br>
-@@ -4383,7 +4387,11 @@ static int get_config_seccomp_notify_proxy(const ch=
ar *key, char *retv, int inle<br>
- static int get_config_seccomp_profile(const char *key, char *retv, int in=
len,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct lxc_conf =
*c, void *data)<br>
- {<br>
-+#ifdef HAVE_SECCOMP<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return lxc_get_conf_str(retv, inlen, c-&gt;secc=
omp.seccomp);<br>
-+#else<br>
-+=C2=A0 =C2=A0 =C2=A0 return ret_errno(ENOSYS);<br>
-+#endif<br>
- }<br>
- <br>
- static int get_config_autodev(const char *key, char *retv, int inlen,<br>
diff --git a/recipes-containers/lxc/files/fix_c_command.patch b/recipes-con=
tainers/lxc/files/fix_c_command.patch<br>
deleted file mode 100644<br>
index 1ed8dafd..00000000<br>
--- a/recipes-containers/lxc/files/fix_c_command.patch<br>
+++ /dev/null<br>
@@ -1,36 +0,0 @@<br>
-From 9becf309a81806ef08acf9ca99ab95c1bcfa1f65 Mon Sep 17 00:00:00 2001<br>
-From: Maximilian Blenk &lt;<a href=3D"mailto:Maximilian.Blenk@bmw.de" targ=
et=3D"_blank">Maximilian.Blenk@bmw.de</a>&gt;<br>
-Date: Mon, 23 Aug 2021 15:39:28 +0200<br>
-Subject: [PATCH] attach: Fix -c command<br>
-<br>
-Currently, the -c command (to set the selinux context) seems to be<br>
-broken because the passed context is ignored and always overwritten by<br>
-the context specified in the config file. The intention behind the -c<br>
-imho was to be able to manually overwrite this behavior. This patch<br>
-ensures that the selinux context will be set if passed via the command<br>
-line.<br>
-<br>
-Signed-off-by: Maximilian Blenk &lt;<a href=3D"mailto:Maximilian.Blenk@bmw=
.de" target=3D"_blank">Maximilian.Blenk@bmw.de</a>&gt;<br>
----<br>
- src/lxc/tools/lxc_attach.c | 5 ++++-<br>
- 1 file changed, 4 insertions(+), 1 deletion(-)<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/lxc/lxc/commit/9b=
ecf309a81806ef08acf9ca99ab95c1bcfa1f65.patch" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/lxc/lxc/commit/9becf309a81806ef08acf9ca99ab95c1b=
cfa1f65.patch</a>]<br>
-Comment: No change in any hunk<br>
-<br>
-diff --git a/src/lxc/tools/lxc_attach.c b/src/lxc/tools/lxc_attach.c<br>
-index 0374d980b4..e6b388b20c 100644<br>
---- a/src/lxc/tools/lxc_attach.c<br>
-+++ b/src/lxc/tools/lxc_attach.c<br>
-@@ -379,7 +379,10 @@ int main(int argc, char *argv[])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0attach_options.gid =
=3D my_args.gid;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// selinux_context will be NULL if not set<br>
--=C2=A0 =C2=A0 =C2=A0 attach_options.lsm_label =3D selinux_context;<br>
-+=C2=A0 =C2=A0 =C2=A0 if (selinux_context) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 attach_options.attach_fl=
ags |=3D LXC_ATTACH_LSM_LABEL;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 attach_options.lsm_label=
 =3D selinux_context;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (command.program) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D c-&gt;attac=
h_run_wait(c, &amp;attach_options, command.program,<br>
diff --git a/recipes-containers/lxc/files/templates-use-curl-instead-of-wge=
t.patch b/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.p=
atch<br>
index 156df82f..4556293a 100644<br>
--- a/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch=
<br>
+++ b/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch=
<br>
@@ -1,4 +1,4 @@<br>
-From 07890dd8ffdcd08b7be1ddbd9f56ac55482c76bb Mon Sep 17 00:00:00 2001<br>
+From 1db2db7783bd7ec2aa1da86e640019891634c659 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Joakim Roubert &lt;<a href=3D"mailto:joakimr@axis.com" target=
=3D"_blank">joakimr@axis.com</a>&gt;<br>
=C2=A0Date: Fri, 16 Aug 2019 07:52:48 +0200<br>
=C2=A0Subject: [PATCH] Use curl instead of wget<br>
@@ -7,16 +7,16 @@ When curl&#39;s MIT license is preferable to wget&#39;s G=
PLv3.<br>
<br>
=C2=A0Change-Id: I4684ae7569704514fdcc63e0655c556efcaf44f8<br>
=C2=A0Signed-off-by: Joakim Roubert &lt;<a href=3D"mailto:joakimr@axis.com"=
 target=3D"_blank">joakimr@axis.com</a>&gt;<br>
-<br>
+Signed-off-by: Yanfei Xu &lt;<a href=3D"mailto:yanfei.xu@windriver.com" ta=
rget=3D"_blank">yanfei.xu@windriver.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 templates/<a href=3D"http://lxc-download.in" rel=3D"noreferrer" targ=
et=3D"_blank">lxc-download.in</a> | 10 +++++-----<br>
=C2=A0 1 file changed, 5 insertions(+), 5 deletions(-)<br>
<br>
=C2=A0diff --git a/templates/<a href=3D"http://lxc-download.in" rel=3D"nore=
ferrer" target=3D"_blank">lxc-download.in</a> b/templates/<a href=3D"http:/=
/lxc-download.in" rel=3D"noreferrer" target=3D"_blank">lxc-download.in</a><=
br>
-index d7e6128..8a4b567 100644<br>
+index e8570692a..f7291b0cc 100755<br>
=C2=A0--- a/templates/<a href=3D"http://lxc-download.in" rel=3D"noreferrer"=
 target=3D"_blank">lxc-download.in</a><br>
=C2=A0+++ b/templates/<a href=3D"http://lxc-download.in" rel=3D"noreferrer"=
 target=3D"_blank">lxc-download.in</a><br>
-@@ -74,9 +74,9 @@ cleanup() {<br>
+@@ -75,9 +75,9 @@ cleanup() {<br>
=C2=A0 =C2=A0 fi<br>
=C2=A0 }<br>
<br>
@@ -28,18 +28,18 @@ index d7e6128..8a4b567 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0<br>
=C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 done<br>
-@@ -85,8 +85,8 @@ wget_wrapper() {<br>
+@@ -86,8 +86,8 @@ wget_wrapper() {<br>
=C2=A0 }<br>
<br>
=C2=A0 download_file() {<br>
--=C2=A0 if ! wget_wrapper -T 30 -q &quot;https://${DOWNLOAD_SERVER}/$1&quo=
t; -O &quot;$2&quot; &gt;/dev/null 2&gt;&amp;1; then<br>
--=C2=A0 =C2=A0 if ! wget_wrapper -T 30 -q &quot;http://${DOWNLOAD_SERVER}/=
$1&quot; -O &quot;$2&quot; &gt;/dev/null 2&gt;&amp;1; then<br>
-+=C2=A0 if ! curl_wrapper -m 30 -s &quot;https://${DOWNLOAD_SERVER}/$1&quo=
t; -o &quot;$2&quot; &gt;/dev/null 2&gt;&amp;1; then<br>
-+=C2=A0 =C2=A0 if ! curl_wrapper -m 30 -s &quot;http://${DOWNLOAD_SERVER}/=
$1&quot; -o &quot;$2&quot; &gt;/dev/null 2&gt;&amp;1; then<br>
+-=C2=A0 if ! wget_wrapper --user-agent=3D&quot;lxc/@PACKAGE_VERSION@ compa=
t:${DOWNLOAD_COMPAT_LEVEL}&quot; -T 30 -q &quot;https://${DOWNLOAD_SERVER}/=
$1&quot; -O &quot;$2&quot; &gt;/dev/null 2&gt;&amp;1; then<br>
+-=C2=A0 =C2=A0 if ! wget_wrapper --user-agent=3D&quot;lxc/@PACKAGE_VERSION=
@ compat:${DOWNLOAD_COMPAT_LEVEL}&quot; -T 30 -q &quot;http://${DOWNLOAD_SE=
RVER}/$1&quot; -O &quot;$2&quot; &gt;/dev/null 2&gt;&amp;1; then<br>
++=C2=A0 if ! curl_wrapper --user-agent=3D&quot;lxc/@PACKAGE_VERSION@ compa=
t:${DOWNLOAD_COMPAT_LEVEL}&quot; -m 30 -s &quot;https://${DOWNLOAD_SERVER}/=
$1&quot; -o &quot;$2&quot; &gt;/dev/null 2&gt;&amp;1; then<br>
++=C2=A0 =C2=A0 if ! curl_wrapper --user-agent=3D&quot;lxc/@PACKAGE_VERSION=
@ compat:${DOWNLOAD_COMPAT_LEVEL}&quot; -m 30 -s &quot;http://${DOWNLOAD_SE=
RVER}/$1&quot; -o &quot;$2&quot; &gt;/dev/null 2&gt;&amp;1; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;$3&quot; =3D &quot;noexit&quot; ]; t=
hen<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
-@@ -271,7 +271,7 @@ while :; do<br>
+@@ -277,7 +277,7 @@ while :; do<br>
=C2=A0 done<br>
<br>
=C2=A0 # Check for required binaries<br>
@@ -48,3 +48,6 @@ index d7e6128..8a4b567 100644<br>
=C2=A0 =C2=A0 if ! command -V &quot;${bin}&quot; &gt;/dev/null 2&gt;&amp;1;=
 then<br>
=C2=A0 =C2=A0 =C2=A0 echo &quot;ERROR: Missing required tool: ${bin}&quot; =
1&gt;&amp;2<br>
=C2=A0 =C2=A0 =C2=A0 exit 1<br>
+-- <br>
+2.27.0<br>
+<br>
diff --git a/recipes-containers/lxc/files/tests-add-no-validate-when-using-=
download-template.patch b/recipes-containers/lxc/files/tests-add-no-validat=
e-when-using-download-template.patch<br>
deleted file mode 100644<br>
index f335e796..00000000<br>
--- a/recipes-containers/lxc/files/tests-add-no-validate-when-using-downloa=
d-template.patch<br>
+++ /dev/null<br>
@@ -1,85 +0,0 @@<br>
-From 1c2506434e744d8c6a86e42c9d8bae4cde7553f6 Mon Sep 17 00:00:00 2001<br>
-From: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windriver.com"=
 target=3D"_blank">mark.asselstine@windriver.com</a>&gt;<br>
-Date: Thu, 31 May 2018 15:14:26 -0400<br>
-Subject: [PATCH] tests: add &#39;--no-validate&#39; when using download te=
mplate<br>
-<br>
-We are usually running the ptests with core-image-minimal which has no<br>
-mechanism to validate the downloads. Validation isn&#39;t really of<br>
-interest to this test at any rate so simply add &#39;--no-validate&#39; to=
<br>
-avoid failing due to no GPG validation.<br>
-<br>
-Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windr=
iver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;<br>
-<br>
----<br>
- src/tests/lxc-test-apparmor-mount | 2 +-<br>
- src/tests/lxc-test-autostart=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
- src/tests/lxc-test-no-new-privs=C2=A0 =C2=A0| 2 +-<br>
- src/tests/lxc-test-unpriv=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
- src/tests/<a href=3D"http://lxc-test-usernic.in" rel=3D"noreferrer" targe=
t=3D"_blank">lxc-test-usernic.in</a>=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
- 5 files changed, 5 insertions(+), 5 deletions(-)<br>
-<br>
-Index: lxc-4.0.9/src/tests/lxc-test-apparmor-mount<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- lxc-4.0.9.orig/src/tests/lxc-test-apparmor-mount<br>
-+++ lxc-4.0.9/src/tests/lxc-test-apparmor-mount<br>
-@@ -170,7 +170,7 @@<br>
-=C2=A0 =C2=A0 =C2=A0done<br>
- fi<br>
- <br>
--run_cmd lxc-create -t download -n $cname -- -d ubuntu -r $release -a $ARC=
H<br>
-+run_cmd lxc-create -t download -n $cname -- --no-validate -d ubuntu -r $r=
elease -a $ARCH<br>
- <br>
- echo &quot;test default confined container&quot;<br>
- run_cmd lxc-start -n $cname -d -lDEBUG -o &quot;$logfile&quot;<br>
-Index: lxc-4.0.9/src/tests/lxc-test-autostart<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- lxc-4.0.9.orig/src/tests/lxc-test-autostart<br>
-+++ lxc-4.0.9/src/tests/lxc-test-autostart<br>
-@@ -55,7 +55,7 @@<br>
-=C2=A0 =C2=A0 =C2=A0done<br>
- fi<br>
- <br>
--lxc-create -t download -n $CONTAINER_NAME -B dir -- -d ubuntu -r $release=
 -a $ARCH<br>
-+lxc-create -t download -n $CONTAINER_NAME -B dir -- --no-validate -d ubun=
tu -r $release -a $ARCH<br>
- CONTAINER_PATH=3D$(dirname $(lxc-info -n $CONTAINER_NAME -c lxc.rootfs.pa=
th -H) | sed -e &#39;s/dir://&#39;)<br>
- cp $CONTAINER_PATH/config $CONTAINER_PATH/config.bak<br>
- <br>
-Index: lxc-4.0.9/src/tests/lxc-test-no-new-privs<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- lxc-4.0.9.orig/src/tests/lxc-test-no-new-privs<br>
-+++ lxc-4.0.9/src/tests/lxc-test-no-new-privs<br>
-@@ -49,7 +49,7 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ARCH=3D$(dpkg --print-architecture)<br>
- fi<br>
- <br>
--lxc-create -t download -n c1 -- -d ubuntu -r xenial -a $ARCH<br>
-+lxc-create -t download -n c1 -- --no-validate -d ubuntu -r xenial -a $ARC=
H<br>
- echo &quot;lxc.no_new_privs =3D 1&quot; &gt;&gt; /var/lib/lxc/c1/config<b=
r>
- <br>
- lxc-start -n c1<br>
-Index: lxc-4.0.9/src/tests/lxc-test-unpriv<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- lxc-4.0.9.orig/src/tests/lxc-test-unpriv<br>
-+++ lxc-4.0.9/src/tests/lxc-test-unpriv<br>
-@@ -178,7 +178,7 @@<br>
-=C2=A0 =C2=A0 =C2=A0cp -R /var/cache/lxc/download $HDIR/.cache/lxc &amp;&a=
mp; \<br>
-=C2=A0 =C2=A0 =C2=A0chown -R $TUSER: $HDIR/.cache/lxc<br>
- <br>
--run_cmd lxc-create -t download -n c1 -l trace -o &quot;${UNPRIV_LOG}&quot=
; -- -d ubuntu -r $release -a $ARCH<br>
-+run_cmd lxc-create -t download -n c1 -l trace -o &quot;${UNPRIV_LOG}&quot=
; -- --no-validate -d ubuntu -r $release -a $ARCH<br>
- <br>
- # Make sure we can start it - twice<br>
- <br>
-Index: lxc-4.0.9/src/tests/<a href=3D"http://lxc-test-usernic.in" rel=3D"n=
oreferrer" target=3D"_blank">lxc-test-usernic.in</a><br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- lxc-4.0.9.orig/src/tests/<a href=3D"http://lxc-test-usernic.in" rel=3D=
"noreferrer" target=3D"_blank">lxc-test-usernic.in</a><br>
-+++ lxc-4.0.9/src/tests/<a href=3D"http://lxc-test-usernic.in" rel=3D"nore=
ferrer" target=3D"_blank">lxc-test-usernic.in</a><br>
-@@ -147,7 +147,7 @@<br>
- fi<br>
- <br>
- # Create three containers<br>
--run_cmd &quot;lxc-create -t download -n b1 -- -d ubuntu -r $release -a $A=
RCH&quot;<br>
-+run_cmd &quot;lxc-create -t download -n b1 -- --no-validate -d ubuntu -r =
$release -a $ARCH&quot;<br>
- run_cmd &quot;lxc-start -n b1 -d&quot;<br>
- p1=3D$(run_cmd &quot;lxc-info -n b1 -p -H&quot;)<br>
- <br>
diff --git a/recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"no=
referrer" target=3D"_blank">lxc_git.bb</a> b/recipes-containers/lxc/<a href=
=3D"http://lxc_git.bb" rel=3D"noreferrer" target=3D"_blank">lxc_git.bb</a><=
br>
index f5b5128b..ba1cef5a 100644<br>
--- a/recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"noreferre=
r" target=3D"_blank">lxc_git.bb</a><br>
+++ b/recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"noreferre=
r" target=3D"_blank">lxc_git.bb</a><br>
@@ -46,15 +46,12 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/lx=
c/lxc.git;branch=3Dstable-4.0" rel=3D"noreferrer" target=3D"_blank">github.=
com/lxc/lxc.git;branch=3Dstable-4.0</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://template-make-busybox-template-compatibl=
e-with-core-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://templates-use-curl-instead-of-wget.patch=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://tests-our-init-is-not-busybox.patch \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0file://tests-add-no-validate-when-using-downloa=
d-template.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://dnsmasq.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lxc-net \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://enable_seccomp_profile_when_compiled_li=
bseccomp.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix_c_command.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRCREV =3D &quot;cec7cb14b2a4367d4cb21a90e1b90d0f98a9d874&quot;<br>
-PV =3D &quot;4.0.10+git${SRCPV}&quot;<br>
+SRCREV =3D &quot;48e079bf318982ae7d5684feeb7358870fa71c10&quot;<br>
+PV =3D &quot;4.0.11+git${SRCPV}&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-- <br>
2.27.0<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--0000000000002f11ed05cfe2e5ea--
