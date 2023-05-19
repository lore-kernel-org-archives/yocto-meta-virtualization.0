Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6218EC77B7A
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 08:06:47 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.20760.1684483605239102318
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 19 May 2023 01:06:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PtFgf7Tl;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3f475366514so19938755e9.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 19 May 2023 01:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684483603; x=1687075603;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mb38ptRvIdfZBqSmnPcsb6cxHy/3TkJCoqrrnUlcNm8=;
        b=PtFgf7Tl6PMU1uK4JcdRWNoMYBMQp514RRut2k/1bCD7COpvNJF7kJqwsKEPaGlSy5
         mjIaI+AWttzStGHowjWm/R1l2B6YXAQN9XQWgxW2sgiK5G7zR4R+hm0kc5OiD2T+5DN6
         LxqifR/F9G4oAQk8iaj69gdw0yMATt3VXLsHzuJxOEo4wByI3eAQ3OMYH4NpcjpC7NBU
         pGbejxbcNjE7j8sSt1eMq8l37o0TEsgkSbQ1rHW4FyN87ke6cN0+boer9Ik1daHLSUdU
         yICRTiIi2JEvpmUXYxLRpXJZZsVPQVTRIkxKay4/qryinJXj8wh+sipDHwZfW8sZpVYP
         IDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684483603; x=1687075603;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mb38ptRvIdfZBqSmnPcsb6cxHy/3TkJCoqrrnUlcNm8=;
        b=d+6mT9UJFWiiJEjZtItFWECeskfTcQYHB1JWJreVYvValopos89YJ+7lGOZCmx5e5a
         4OTJqDBfM1uFht98SLtAzDAtPf6yjGsD467SD7/qaf0VdGIcM8bv1PWKdYpvpGlzf73W
         VMsnGDCSsjOP3ShWWMdYp0Z3Nj63nI63Pz9Vjk9HyxIir5OwEZRV/XEbyjV2/DcEKhok
         wx96fOJ8O5TJkpTRkfc4K1QFpA4ylGTOI60BKzvu13QC5kS0Xfs5VnACwM9bhUSL8rlX
         baVMBN2eAATBCyyLqCwak1kfRTgwz73K3U9S2DYMM7bKTScW37F+OhuVKIs2EMEBEXum
         gHEg==
X-Gm-Message-State: AC+VfDxHhVh2pLK1wTVASKrdlNWivLfx35HwlBcM3g0+IqJKWDmY/dkj
	E0RRxOC2oyqpUBxqX7YrOq8jdLQSatkNrmHuekBKA/Mu
X-Google-Smtp-Source: ACHHUZ4bw7kOYmr56t/v7dgD0uh8ZkTZTWaRnK/wSwWzU9Cm1Dkszf88S48PsnvazdS+chgE+nbtuTJuJFHMjL5H+DU=
X-Received: by 2002:a05:600c:b58:b0:3f4:294d:8524 with SMTP id
 k24-20020a05600c0b5800b003f4294d8524mr622689wmr.22.1684483603119; Fri, 19 May
 2023 01:06:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230519073245.4702-1-thakur.virendra1810@gmail.com>
In-Reply-To: <20230519073245.4702-1-thakur.virendra1810@gmail.com>
From: virendra thakur <thakur.virendra1810@gmail.com>
Date: Fri, 19 May 2023 13:36:31 +0530
Message-ID: <CAJM8miVHrL3YM8Jh9eK1rEtvSbthWC0zQ0kNQG5uo1dXPPkmFw@mail.gmail.com>
Subject: meta-virtualization][PATCH 5/7] lxc: update to 4.0.11
To: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000cb43d505fc07662b"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 19 May 2023 08:06:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8069

--000000000000cb43d505fc07662b
Content-Type: text/plain; charset="UTF-8"

From: "Xu, Yanfei" <yanfei.xu@windriver.com>

update to 4.0.11

1.drop two patches that have been integrated to upstream repo.
2.drop tests-add-no-validate-when-using-download-template.patch
  because it is no longer appropriate as the "download" has been
  replaced with "busybox"
3.fix the apply failure of templates-use-curl-instead-of-wget.patch
4.update lxc from 4.0.10 to 4.0.11

Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
(cherry picked from commit 3bff112a44699e8df63e125580699cc5e288bf0f)
Signed-off-by: virendra thakur <virendrak@kpit.com>
---
 ...omp_profile_when_compiled_libseccomp.patch | 46 ----------
 .../lxc/files/fix_c_command.patch             | 36 --------
 .../templates-use-curl-instead-of-wget.patch  | 23 ++---
 ...alidate-when-using-download-template.patch | 85 -------------------
 recipes-containers/lxc/lxc_git.bb             |  7 +-
 5 files changed, 15 insertions(+), 182 deletions(-)
 delete mode 100644
recipes-containers/lxc/files/enable_seccomp_profile_when_compiled_libseccomp.patch
 delete mode 100644 recipes-containers/lxc/files/fix_c_command.patch
 delete mode 100644
recipes-containers/lxc/files/tests-add-no-validate-when-using-download-template.patch

diff --git
a/recipes-containers/lxc/files/enable_seccomp_profile_when_compiled_libseccomp.patch
b/recipes-containers/lxc/files/enable_seccomp_profile_when_compiled_libseccomp.patch
deleted file mode 100644
index f0a5813..0000000
---
a/recipes-containers/lxc/files/enable_seccomp_profile_when_compiled_libseccomp.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 3d46e1d1f8e904fddd4fab3e8d0c6cf57d2ddd4e Mon Sep 17 00:00:00 2001
-From: Maximilian Blenk <Maximilian.Blenk@bmw.de>
-Date: Mon, 23 Aug 2021 22:04:40 +0200
-Subject: [PATCH] config: enable seccomp profile only when compiled with
- libseccomp
-
-Make lxc fail if seccomp.profile is specified but lxc is compiled
-without seccomp support. Currently, seccomp.profile is silently ignored
-if is specified in such a scenario. This could lead to the false
-impression that the seccomp filter is applied while it actually isn't.
-
-Signed-off-by: Maximilian Blenk <Maximilian.Blenk@bmw.de>
----
- src/lxc/confile.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-Upstream-Status: Submitted [
https://github.com/lxc/lxc/pull/3947/commits/3d46e1d1f8e904fddd4fab3e8d0c6cf57d2ddd4e
]
-
-diff --git a/src/lxc/confile.c b/src/lxc/confile.c
-index d8b96c6921..1cc8da15f1 100644
---- a/src/lxc/confile.c
-+++ b/src/lxc/confile.c
-@@ -1211,7 +1211,11 @@ static int set_config_seccomp_notify_proxy(const
char *key, const char *value,
- static int set_config_seccomp_profile(const char *key, const char *value,
-                                     struct lxc_conf *lxc_conf, void *data)
- {
-+#ifdef HAVE_SECCOMP
-       return set_config_path_item(&lxc_conf->seccomp.seccomp, value);
-+#else
-+      return ret_set_errno(-1, ENOSYS);
-+#endif
- }
-
- static int set_config_execute_cmd(const char *key, const char *value,
-@@ -4383,7 +4387,11 @@ static int get_config_seccomp_notify_proxy(const
char *key, char *retv, int inle
- static int get_config_seccomp_profile(const char *key, char *retv, int
inlen,
-                                     struct lxc_conf *c, void *data)
- {
-+#ifdef HAVE_SECCOMP
-       return lxc_get_conf_str(retv, inlen, c->seccomp.seccomp);
-+#else
-+      return ret_errno(ENOSYS);
-+#endif
- }
-
- static int get_config_autodev(const char *key, char *retv, int inlen,
diff --git a/recipes-containers/lxc/files/fix_c_command.patch
b/recipes-containers/lxc/files/fix_c_command.patch
deleted file mode 100644
index 1ed8daf..0000000
--- a/recipes-containers/lxc/files/fix_c_command.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 9becf309a81806ef08acf9ca99ab95c1bcfa1f65 Mon Sep 17 00:00:00 2001
-From: Maximilian Blenk <Maximilian.Blenk@bmw.de>
-Date: Mon, 23 Aug 2021 15:39:28 +0200
-Subject: [PATCH] attach: Fix -c command
-
-Currently, the -c command (to set the selinux context) seems to be
-broken because the passed context is ignored and always overwritten by
-the context specified in the config file. The intention behind the -c
-imho was to be able to manually overwrite this behavior. This patch
-ensures that the selinux context will be set if passed via the command
-line.
-
-Signed-off-by: Maximilian Blenk <Maximilian.Blenk@bmw.de>
----
- src/lxc/tools/lxc_attach.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-Upstream-Status: Backport [
https://github.com/lxc/lxc/commit/9becf309a81806ef08acf9ca99ab95c1bcfa1f65.patch
]
-Comment: No change in any hunk
-
-diff --git a/src/lxc/tools/lxc_attach.c b/src/lxc/tools/lxc_attach.c
-index 0374d980b4..e6b388b20c 100644
---- a/src/lxc/tools/lxc_attach.c
-+++ b/src/lxc/tools/lxc_attach.c
-@@ -379,7 +379,10 @@ int main(int argc, char *argv[])
-               attach_options.gid = my_args.gid;
-
-       // selinux_context will be NULL if not set
--      attach_options.lsm_label = selinux_context;
-+      if (selinux_context) {
-+              attach_options.attach_flags |= LXC_ATTACH_LSM_LABEL;
-+              attach_options.lsm_label = selinux_context;
-+      }
-
-       if (command.program) {
-               ret = c->attach_run_wait(c, &attach_options,
command.program,
diff --git
a/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch
b/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch
index 156df82..4556293 100644
--- a/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch
+++ b/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch
@@ -1,4 +1,4 @@
-From 07890dd8ffdcd08b7be1ddbd9f56ac55482c76bb Mon Sep 17 00:00:00 2001
+From 1db2db7783bd7ec2aa1da86e640019891634c659 Mon Sep 17 00:00:00 2001
 From: Joakim Roubert <joakimr@axis.com>
 Date: Fri, 16 Aug 2019 07:52:48 +0200
 Subject: [PATCH] Use curl instead of wget
@@ -7,16 +7,16 @@ When curl's MIT license is preferable to wget's GPLv3.

 Change-Id: I4684ae7569704514fdcc63e0655c556efcaf44f8
 Signed-off-by: Joakim Roubert <joakimr@axis.com>
-
+Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
 ---
  templates/lxc-download.in | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)

 diff --git a/templates/lxc-download.in b/templates/lxc-download.in
-index d7e6128..8a4b567 100644
+index e8570692a..f7291b0cc 100755
 --- a/templates/lxc-download.in
 +++ b/templates/lxc-download.in
-@@ -74,9 +74,9 @@ cleanup() {
+@@ -75,9 +75,9 @@ cleanup() {
    fi
  }

@@ -28,18 +28,18 @@ index d7e6128..8a4b567 100644
        return 0
      fi
    done
-@@ -85,8 +85,8 @@ wget_wrapper() {
+@@ -86,8 +86,8 @@ wget_wrapper() {
  }

  download_file() {
--  if ! wget_wrapper -T 30 -q "https://${DOWNLOAD_SERVER}/$1" -O "$2"
>/dev/null 2>&1; then
--    if ! wget_wrapper -T 30 -q "http://${DOWNLOAD_SERVER}/$1" -O "$2"
>/dev/null 2>&1; then
-+  if ! curl_wrapper -m 30 -s "https://${DOWNLOAD_SERVER}/$1" -o "$2"
>/dev/null 2>&1; then
-+    if ! curl_wrapper -m 30 -s "http://${DOWNLOAD_SERVER}/$1" -o "$2"
>/dev/null 2>&1; then
+-  if ! wget_wrapper --user-agent="lxc/@PACKAGE_VERSION@
compat:${DOWNLOAD_COMPAT_LEVEL}" -T 30 -q "https://${DOWNLOAD_SERVER}/$1"
-O "$2" >/dev/null 2>&1; then
+-    if ! wget_wrapper --user-agent="lxc/@PACKAGE_VERSION@
compat:${DOWNLOAD_COMPAT_LEVEL}" -T 30 -q "http://${DOWNLOAD_SERVER}/$1" -O
"$2" >/dev/null 2>&1; then
++  if ! curl_wrapper --user-agent="lxc/@PACKAGE_VERSION@
compat:${DOWNLOAD_COMPAT_LEVEL}" -m 30 -s "https://${DOWNLOAD_SERVER}/$1"
-o "$2" >/dev/null 2>&1; then
++    if ! curl_wrapper --user-agent="lxc/@PACKAGE_VERSION@
compat:${DOWNLOAD_COMPAT_LEVEL}" -m 30 -s "http://${DOWNLOAD_SERVER}/$1" -o
"$2" >/dev/null 2>&1; then
        if [ "$3" = "noexit" ]; then
          return 1
        else
-@@ -271,7 +271,7 @@ while :; do
+@@ -277,7 +277,7 @@ while :; do
  done

  # Check for required binaries
@@ -48,3 +48,6 @@ index d7e6128..8a4b567 100644
    if ! command -V "${bin}" >/dev/null 2>&1; then
      echo "ERROR: Missing required tool: ${bin}" 1>&2
      exit 1
+--
+2.27.0
+
diff --git
a/recipes-containers/lxc/files/tests-add-no-validate-when-using-download-template.patch
b/recipes-containers/lxc/files/tests-add-no-validate-when-using-download-template.patch
deleted file mode 100644
index f335e79..0000000
---
a/recipes-containers/lxc/files/tests-add-no-validate-when-using-download-template.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From 1c2506434e744d8c6a86e42c9d8bae4cde7553f6 Mon Sep 17 00:00:00 2001
-From: Mark Asselstine <mark.asselstine@windriver.com>
-Date: Thu, 31 May 2018 15:14:26 -0400
-Subject: [PATCH] tests: add '--no-validate' when using download template
-
-We are usually running the ptests with core-image-minimal which has no
-mechanism to validate the downloads. Validation isn't really of
-interest to this test at any rate so simply add '--no-validate' to
-avoid failing due to no GPG validation.
-
-Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
-
----
- src/tests/lxc-test-apparmor-mount | 2 +-
- src/tests/lxc-test-autostart      | 2 +-
- src/tests/lxc-test-no-new-privs   | 2 +-
- src/tests/lxc-test-unpriv         | 2 +-
- src/tests/lxc-test-usernic.in     | 2 +-
- 5 files changed, 5 insertions(+), 5 deletions(-)
-
-Index: lxc-4.0.9/src/tests/lxc-test-apparmor-mount
-===================================================================
---- lxc-4.0.9.orig/src/tests/lxc-test-apparmor-mount
-+++ lxc-4.0.9/src/tests/lxc-test-apparmor-mount
-@@ -170,7 +170,7 @@
-     done
- fi
-
--run_cmd lxc-create -t download -n $cname -- -d ubuntu -r $release -a $ARCH
-+run_cmd lxc-create -t download -n $cname -- --no-validate -d ubuntu -r
$release -a $ARCH
-
- echo "test default confined container"
- run_cmd lxc-start -n $cname -d -lDEBUG -o "$logfile"
-Index: lxc-4.0.9/src/tests/lxc-test-autostart
-===================================================================
---- lxc-4.0.9.orig/src/tests/lxc-test-autostart
-+++ lxc-4.0.9/src/tests/lxc-test-autostart
-@@ -55,7 +55,7 @@
-     done
- fi
-
--lxc-create -t download -n $CONTAINER_NAME -B dir -- -d ubuntu -r $release
-a $ARCH
-+lxc-create -t download -n $CONTAINER_NAME -B dir -- --no-validate -d
ubuntu -r $release -a $ARCH
- CONTAINER_PATH=$(dirname $(lxc-info -n $CONTAINER_NAME -c lxc.rootfs.path
-H) | sed -e 's/dir://')
- cp $CONTAINER_PATH/config $CONTAINER_PATH/config.bak
-
-Index: lxc-4.0.9/src/tests/lxc-test-no-new-privs
-===================================================================
---- lxc-4.0.9.orig/src/tests/lxc-test-no-new-privs
-+++ lxc-4.0.9/src/tests/lxc-test-no-new-privs
-@@ -49,7 +49,7 @@
-       ARCH=$(dpkg --print-architecture)
- fi
-
--lxc-create -t download -n c1 -- -d ubuntu -r xenial -a $ARCH
-+lxc-create -t download -n c1 -- --no-validate -d ubuntu -r xenial -a $ARCH
- echo "lxc.no_new_privs = 1" >> /var/lib/lxc/c1/config
-
- lxc-start -n c1
-Index: lxc-4.0.9/src/tests/lxc-test-unpriv
-===================================================================
---- lxc-4.0.9.orig/src/tests/lxc-test-unpriv
-+++ lxc-4.0.9/src/tests/lxc-test-unpriv
-@@ -178,7 +178,7 @@
-     cp -R /var/cache/lxc/download $HDIR/.cache/lxc && \
-     chown -R $TUSER: $HDIR/.cache/lxc
-
--run_cmd lxc-create -t download -n c1 -l trace -o "${UNPRIV_LOG}" -- -d
ubuntu -r $release -a $ARCH
-+run_cmd lxc-create -t download -n c1 -l trace -o "${UNPRIV_LOG}" --
--no-validate -d ubuntu -r $release -a $ARCH
-
- # Make sure we can start it - twice
-
-Index: lxc-4.0.9/src/tests/lxc-test-usernic.in
-===================================================================
---- lxc-4.0.9.orig/src/tests/lxc-test-usernic.in
-+++ lxc-4.0.9/src/tests/lxc-test-usernic.in
-@@ -147,7 +147,7 @@
- fi
-
- # Create three containers
--run_cmd "lxc-create -t download -n b1 -- -d ubuntu -r $release -a $ARCH"
-+run_cmd "lxc-create -t download -n b1 -- --no-validate -d ubuntu -r
$release -a $ARCH"
- run_cmd "lxc-start -n b1 -d"
- p1=$(run_cmd "lxc-info -n b1 -p -H")
-
diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/
lxc_git.bb
index f98cba0..94a1e1e 100644
--- a/recipes-containers/lxc/lxc_git.bb
+++ b/recipes-containers/lxc/lxc_git.bb
@@ -46,15 +46,12 @@ SRC_URI = "git://
github.com/lxc/lxc.git;branch=stable-4.0 \
        file://template-make-busybox-template-compatible-with-core-.patch \
        file://templates-use-curl-instead-of-wget.patch \
        file://tests-our-init-is-not-busybox.patch \
-       file://tests-add-no-validate-when-using-download-template.patch \
        file://dnsmasq.conf \
        file://lxc-net \
-        file://enable_seccomp_profile_when_compiled_libseccomp.patch \
-        file://fix_c_command.patch \
        "

-SRCREV = "cec7cb14b2a4367d4cb21a90e1b90d0f98a9d874"
-PV = "4.0.10+git${SRCPV}"
+SRCREV = "48e079bf318982ae7d5684feeb7358870fa71c10"
+PV = "4.0.11+git${SRCPV}"

 S = "${WORKDIR}/git"

-- 
2.17.1

--000000000000cb43d505fc07662b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote">From: &quot;Xu, Yanfei&qu=
ot; &lt;<a href=3D"mailto:yanfei.xu@windriver.com" target=3D"_blank" rel=3D=
"noreferrer">yanfei.xu@windriver.com</a>&gt;<br>
<br>
update to 4.0.11<br>
<br>
1.drop two patches that have been integrated to upstream repo.<br>
2.drop tests-add-no-validate-when-using-download-template.patch<br>
=C2=A0 because it is no longer appropriate as the &quot;download&quot; has =
been<br>
=C2=A0 replaced with &quot;busybox&quot;<br>
3.fix the apply failure of templates-use-curl-instead-of-wget.patch<br>
4.update lxc from 4.0.10 to 4.0.11<br>
<br>
Signed-off-by: Yanfei Xu &lt;<a href=3D"mailto:yanfei.xu@windriver.com" tar=
get=3D"_blank" rel=3D"noreferrer">yanfei.xu@windriver.com</a>&gt;<br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.co=
m" target=3D"_blank" rel=3D"noreferrer">bruce.ashfield@gmail.com</a>&gt;<br=
>
(cherry picked from commit 3bff112a44699e8df63e125580699cc5e288bf0f)<br>
Signed-off-by: virendra thakur &lt;<a href=3D"mailto:virendrak@kpit.com" ta=
rget=3D"_blank" rel=3D"noreferrer">virendrak@kpit.com</a>&gt;<br>
---<br>
=C2=A0...omp_profile_when_compiled_libseccomp.patch | 46 ----------<br>
=C2=A0.../lxc/files/fix_c_command.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 36 --------<br>
=C2=A0.../templates-use-curl-instead-of-wget.patch=C2=A0 | 23 ++---<br>
=C2=A0...alidate-when-using-download-template.patch | 85 ------------------=
-<br>
=C2=A0recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"noreferre=
r noreferrer" target=3D"_blank">lxc_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 7 +-<br>
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
index f0a5813..0000000<br>
--- a/recipes-containers/lxc/files/enable_seccomp_profile_when_compiled_lib=
seccomp.patch<br>
+++ /dev/null<br>
@@ -1,46 +0,0 @@<br>
-From 3d46e1d1f8e904fddd4fab3e8d0c6cf57d2ddd4e Mon Sep 17 00:00:00 2001<br>
-From: Maximilian Blenk &lt;<a href=3D"mailto:Maximilian.Blenk@bmw.de" targ=
et=3D"_blank" rel=3D"noreferrer">Maximilian.Blenk@bmw.de</a>&gt;<br>
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
.de" target=3D"_blank" rel=3D"noreferrer">Maximilian.Blenk@bmw.de</a>&gt;<b=
r>
----<br>
- src/lxc/confile.c | 8 ++++++++<br>
- 1 file changed, 8 insertions(+)<br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://github.com/lxc/lxc/pull/394=
7/commits/3d46e1d1f8e904fddd4fab3e8d0c6cf57d2ddd4e" rel=3D"noreferrer noref=
errer" target=3D"_blank">https://github.com/lxc/lxc/pull/3947/commits/3d46e=
1d1f8e904fddd4fab3e8d0c6cf57d2ddd4e</a>]<br>
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
index 1ed8daf..0000000<br>
--- a/recipes-containers/lxc/files/fix_c_command.patch<br>
+++ /dev/null<br>
@@ -1,36 +0,0 @@<br>
-From 9becf309a81806ef08acf9ca99ab95c1bcfa1f65 Mon Sep 17 00:00:00 2001<br>
-From: Maximilian Blenk &lt;<a href=3D"mailto:Maximilian.Blenk@bmw.de" targ=
et=3D"_blank" rel=3D"noreferrer">Maximilian.Blenk@bmw.de</a>&gt;<br>
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
.de" target=3D"_blank" rel=3D"noreferrer">Maximilian.Blenk@bmw.de</a>&gt;<b=
r>
----<br>
- src/lxc/tools/lxc_attach.c | 5 ++++-<br>
- 1 file changed, 4 insertions(+), 1 deletion(-)<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/lxc/lxc/commit/9b=
ecf309a81806ef08acf9ca99ab95c1bcfa1f65.patch" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">https://github.com/lxc/lxc/commit/9becf309a81806ef08acf9=
ca99ab95c1bcfa1f65.patch</a>]<br>
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
index 156df82..4556293 100644<br>
--- a/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch=
<br>
+++ b/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch=
<br>
@@ -1,4 +1,4 @@<br>
-From 07890dd8ffdcd08b7be1ddbd9f56ac55482c76bb Mon Sep 17 00:00:00 2001<br>
+From 1db2db7783bd7ec2aa1da86e640019891634c659 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Joakim Roubert &lt;<a href=3D"mailto:joakimr@axis.com" target=
=3D"_blank" rel=3D"noreferrer">joakimr@axis.com</a>&gt;<br>
=C2=A0Date: Fri, 16 Aug 2019 07:52:48 +0200<br>
=C2=A0Subject: [PATCH] Use curl instead of wget<br>
@@ -7,16 +7,16 @@ When curl&#39;s MIT license is preferable to wget&#39;s G=
PLv3.<br>
<br>
=C2=A0Change-Id: I4684ae7569704514fdcc63e0655c556efcaf44f8<br>
=C2=A0Signed-off-by: Joakim Roubert &lt;<a href=3D"mailto:joakimr@axis.com"=
 target=3D"_blank" rel=3D"noreferrer">joakimr@axis.com</a>&gt;<br>
-<br>
+Signed-off-by: Yanfei Xu &lt;<a href=3D"mailto:yanfei.xu@windriver.com" ta=
rget=3D"_blank" rel=3D"noreferrer">yanfei.xu@windriver.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 templates/<a href=3D"http://lxc-download.in" rel=3D"noreferrer noref=
errer" target=3D"_blank">lxc-download.in</a> | 10 +++++-----<br>
=C2=A0 1 file changed, 5 insertions(+), 5 deletions(-)<br>
<br>
=C2=A0diff --git a/templates/<a href=3D"http://lxc-download.in" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">lxc-download.in</a> b/templates/<a hre=
f=3D"http://lxc-download.in" rel=3D"noreferrer noreferrer" target=3D"_blank=
">lxc-download.in</a><br>
-index d7e6128..8a4b567 100644<br>
+index e8570692a..f7291b0cc 100755<br>
=C2=A0--- a/templates/<a href=3D"http://lxc-download.in" rel=3D"noreferrer =
noreferrer" target=3D"_blank">lxc-download.in</a><br>
=C2=A0+++ b/templates/<a href=3D"http://lxc-download.in" rel=3D"noreferrer =
noreferrer" target=3D"_blank">lxc-download.in</a><br>
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
index f335e79..0000000<br>
--- a/recipes-containers/lxc/files/tests-add-no-validate-when-using-downloa=
d-template.patch<br>
+++ /dev/null<br>
@@ -1,85 +0,0 @@<br>
-From 1c2506434e744d8c6a86e42c9d8bae4cde7553f6 Mon Sep 17 00:00:00 2001<br>
-From: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windriver.com"=
 target=3D"_blank" rel=3D"noreferrer">mark.asselstine@windriver.com</a>&gt;=
<br>
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
iver.com" target=3D"_blank" rel=3D"noreferrer">mark.asselstine@windriver.co=
m</a>&gt;<br>
-<br>
----<br>
- src/tests/lxc-test-apparmor-mount | 2 +-<br>
- src/tests/lxc-test-autostart=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
- src/tests/lxc-test-no-new-privs=C2=A0 =C2=A0| 2 +-<br>
- src/tests/lxc-test-unpriv=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
- src/tests/<a href=3D"http://lxc-test-usernic.in" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">lxc-test-usernic.in</a>=C2=A0 =C2=A0 =C2=A0| 2 +-<b=
r>
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
oreferrer noreferrer" target=3D"_blank">lxc-test-usernic.in</a><br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- lxc-4.0.9.orig/src/tests/<a href=3D"http://lxc-test-usernic.in" rel=3D=
"noreferrer noreferrer" target=3D"_blank">lxc-test-usernic.in</a><br>
-+++ lxc-4.0.9/src/tests/<a href=3D"http://lxc-test-usernic.in" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">lxc-test-usernic.in</a><br>
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
referrer noreferrer" target=3D"_blank">lxc_git.bb</a> b/recipes-containers/=
lxc/<a href=3D"http://lxc_git.bb" rel=3D"noreferrer noreferrer" target=3D"_=
blank">lxc_git.bb</a><br>
index f98cba0..94a1e1e 100644<br>
--- a/recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"noreferre=
r noreferrer" target=3D"_blank">lxc_git.bb</a><br>
+++ b/recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"noreferre=
r noreferrer" target=3D"_blank">lxc_git.bb</a><br>
@@ -46,15 +46,12 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/lx=
c/lxc.git;branch=3Dstable-4.0" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">github.com/lxc/lxc.git;branch=3Dstable-4.0</a> \<br>
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
2.17.1<br>
<br>
</div></div></div>

--000000000000cb43d505fc07662b--

