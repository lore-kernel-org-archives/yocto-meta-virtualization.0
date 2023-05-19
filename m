Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F9EC77B7F
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 08:07:47 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.20774.1684483665993284093
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 19 May 2023 01:07:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=NR5K4dBN;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f41dceb9caso3476475e9.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 19 May 2023 01:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684483664; x=1687075664;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tRv1BZBhV+uLDx4XxeJJZJkPd6os+hCv4nLUeeTcZrY=;
        b=NR5K4dBN2EDUPRlu4iCm2EZye1uhxd4Peb2WTAELQaeh92pbW3YRNnwF/CZgqHzMu+
         T9Pke6n+JzM+vM4gD0NcizpjL/IGS/T1tjzq7zmNd4bEy0wrIq8UrcAcdyST9IIW/TfU
         8WJ2GpKml7B7+orM2cHSGN2QmJ4+Y9/lwmGrO1fuu49yGCfubXgomWikGaznqn9+rC7D
         I9hfE55gw6XnQwAA87/AV9peQuoXP1w2rydLX8Zt+/SKQITM+rxgVeuXvJ2/9I3JLe3q
         pmwVvCQwqn9kKkCaznRtm2Spn0wH1xTb/f7G5YNGray0MSNletvwRgKo0RQRP9tIX4LW
         D3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684483664; x=1687075664;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tRv1BZBhV+uLDx4XxeJJZJkPd6os+hCv4nLUeeTcZrY=;
        b=hSlJXtcsNvHW1OeY0DYPlqZG9JGXyU5RqtPBXaOC9g3NVzImMbgnrhA7192xubKX4V
         25VASzM+MDpSJ4kk3gTWLf7C9VqAT9u4KX1woGaG4h7xEhRWlUkgf20Pj9HaaLg/nAiy
         5gIYPuoqVSr3/xp3feI2rCIFEJ8EEiXfm4sjRGdkFLecFUxriQLZHkM2pvxb54dcjY3g
         7u5XglfRO1Zwslkows4uNUpqXut5O6WtqiIORbfyxFeQk7Aj8n72PFA/+t7MLGtgxmPy
         OiCCe9K2wIc3iSu/EVcPpmkl07ROnYEQmtuOuKXWAM35gNuoUVfRZD6Q2InwFjIDJDVz
         y/Fw==
X-Gm-Message-State: AC+VfDzVpUjmSyhSNnT7MRDiV5cxbNukXe9GIJoTZjQaMnMtNNyPDU77
	8hQTLlGDuANqISHNiWRLCDmNxONkkxMQC/c2YwtbJq7Z
X-Google-Smtp-Source: ACHHUZ78xNewZWnfZjyEqjuFOlMDhA/BJl5766O0kBp7hWEewFoxOOEEBEMofWEIputxrLfnr4mrnokdyMKBYa/o6Z8=
X-Received: by 2002:a05:600c:1da5:b0:3f1:6fb4:5645 with SMTP id
 p37-20020a05600c1da500b003f16fb45645mr775797wms.1.1684483663960; Fri, 19 May
 2023 01:07:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230519073331.4868-1-thakur.virendra1810@gmail.com>
In-Reply-To: <20230519073331.4868-1-thakur.virendra1810@gmail.com>
From: virendra thakur <thakur.virendra1810@gmail.com>
Date: Fri, 19 May 2023 13:37:32 +0530
Message-ID: <CAJM8miVUEqNhPLpYiC2K7ZDAaQrKDBCytOK2pX1+h8wVkEFtgQ@mail.gmail.com>
Subject: meta-virtualization][PATCH 6/7] lxc: update to 4.0.12
To: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000006b9cd605fc076a70"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 19 May 2023 08:07:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8070

--0000000000006b9cd605fc076a70
Content-Type: text/plain; charset="UTF-8"

From: Bruce Ashfield <bruce.ashfield@gmail.com>

We refresh our wget -> curl patch for context, but otherwise, no other
changes are required.

Bumping lxc to version lxc-4.0.12-8-g5ba5725cb, which comprises the
following commits:

    5ba5725cb cgroups: modify cgroup2 attach logic
    1e4631641 ttys: ensure container_ttys= env variable is set correctly
    8ef019a6c doc: Fix reverse allowlist/denylist in Japanese man page
    f1c4a17e7 cgroups: log fd of newly created cgroup
    f7446b4e1 cgroups: check that opened file descriptor is a cgroup
filesystem
    71ba7f656 doc: Fix reverse allowlist/denylist
    f314419d1 lxc-checkconfig: Fix bashism
    ca4c25c6e lxc-net: don't start by default inside lxc
    7e37cc96b Release LXC 4.0.12
    d678aa61e lxccontainer: allow xdev when creating the container dir
    bc61d2354 github: Clear default ACL on /home
    fb0e0b3dd github: add systemd-coredump
    53e0d390c github: more detailed compilation instructions
    db84a8b6b github: log system info
    e9282b6a6 github: ensure system liblxc is wiped
    ad8a3bd68 lxccontainer: properly wrap lxcapi_create()
    bceb81cd2 build: simplify thread local storage handling
    919da35b0 build: only enable LTO for regular builds
    d0a1e9c44 lxccontainer: simplify partial file creation
    62b5c0051 lxccontainer: improve create_partial()
    bfe24cb6a lxccontainer: improve do_lxcapi_create()
    1a5c236ac lxccontainer: improve do_lxcapi_save_config()
    bae0d7196 conf: log termination status
    4eb09aaad conf: improve userns_exec_mapped_root()
    928943280 github: stop installing gnupg now that it's unused
    7c70b0d14 lxc-download: Rely on HTTPS only
    199d2077c Update README.md: Fix broken link (403 Forbidden)
    0b6b230e3 attach: don't pointlessly call cgroup_init()
    dbef704fb commands: log command during file descriptor retrieval
    733f9c909 lxc-checkconfig.in: CONFIG_NF_NAT_IPV4 was removed from the
kernel 2019-03-03
    ce392e230 (trivial) Fix error message, failure was connect not bind
    5628bff79 seccomp: close seccomp notifier fd in cleanup handler
    1f2af83a9 seccomp: only guard seccomp notify behind
HAVE_DECL_SECCOMP_NOTIFY_FD
    9451303d5 api-extensions: don't advertise seccomp notify support if
it's not compiled in
    23d07c315 use 2 sysfs instances for sys:mixed
    0dd3258bd Revert "api: ->save_config() doesn't need to create container
dir"
    93edd510a api: ->save_config() doesn't need to create container dir
    28b2e04f1 cgroups: fix compiler warning
    15515f9a3 Revert "initutils: use vfork() in lxc_container_init()"
    41d2530d1 macro: ensure necessary io_uring flags are defined
    fc4e948c9 autotools: Avoid multiple liblxc.so with --enable-pam
    a616a311a build: refuse to compile with unsupported liburing version
    93be4e512 tests: add lxc.proc.* test
    d8027e49c tests: add lxc.sysctls.* test
    6f580343e test: improve logging helpers
    a10ff3418 conf: improve logging setting sysctl and /proc/<pid>/
parameters
    334cf7beb conf: apply /proc/sys and /proc/<pid>/ parameters
    1b74e01ad tests: include config.h
    c36379431 build: move _FILE_OFFSET_BITS to common option
    f24c234ee start: log signal name and number
    4915c9112 process_utils: add signal_name() helper
    78baec37d build: improve liburing support detection
    1a102b310 mainloop: make ifdefs easier to follow
    cf931928f Replace last occurence of 'which' with 'command -v'
    1ec5939b4 Replace deprecated backticks with $() construct
    fdfb4a13d Replace 'which' with 'command -v' in tests too
    71743e811 start: check event loop type before closing fd
    f69e6b4d3 mainloop: make sure that descr->ring is allocated
    1a8895855 Replace 'which' with 'command -v'
    9219277cc build: add io-uring-event-loop option
    d04eb166c build: add static libcap to output
    bc51048b7 confile: don't use path_simplify() on lxc.{execute,init}.cmd
    48728e988 conf: add cgroup2, cgroup2:ro, cgroup2:force,
cgroup2:ro:force options
    4d3aad49d AUTHORS: Update to point to git history
    e328a988e conf: handle kernels without or not using SMT
    d40b0deb4 doc: fix typo in English lxc.container.conf(5)
    49fab27fc doc: Add lxc.sched.core to Japanese lxc.container.conf(5)
    1ad1cab80 doc: add loglevels to ja and ko common options
    1505f0780 conf: make it more obvious how auto-mount flags are defined
    429233cf0 criu: support restoring containers with pre-created veth
devices
    48e079bf3 Release LXC 4.0.11

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
(cherry picked from commit 3ca7a147e0e4cb6c9d39871b74a72e4fea5094ab)
Signed-off-by: virendra thakur <virendrak@kpit.com>
---
 .../templates-use-curl-instead-of-wget.patch  | 26 +++++++++----------
 recipes-containers/lxc/lxc_git.bb             |  4 +--
 2 files changed, 14 insertions(+), 16 deletions(-)

diff --git
a/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch
b/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch
index 4556293..f06e596 100644
--- a/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch
+++ b/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch
@@ -12,11 +12,11 @@ Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
  templates/lxc-download.in | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)

-diff --git a/templates/lxc-download.in b/templates/lxc-download.in
-index e8570692a..f7291b0cc 100755
---- a/templates/lxc-download.in
-+++ b/templates/lxc-download.in
-@@ -75,9 +75,9 @@ cleanup() {
+Index: git/templates/lxc-download.in
+===================================================================
+--- git.orig/templates/lxc-download.in
++++ git/templates/lxc-download.in
+@@ -59,9 +59,9 @@
    fi
  }

@@ -28,18 +28,19 @@ index e8570692a..f7291b0cc 100755
        return 0
      fi
    done
-@@ -86,8 +86,8 @@ wget_wrapper() {
+@@ -70,8 +70,9 @@
  }

  download_file() {
 -  if ! wget_wrapper --user-agent="lxc/@PACKAGE_VERSION@
compat:${DOWNLOAD_COMPAT_LEVEL}" -T 30 -q "https://${DOWNLOAD_SERVER}/$1"
-O "$2" >/dev/null 2>&1; then
--    if ! wget_wrapper --user-agent="lxc/@PACKAGE_VERSION@
compat:${DOWNLOAD_COMPAT_LEVEL}" -T 30 -q "http://${DOWNLOAD_SERVER}/$1" -O
"$2" >/dev/null 2>&1; then
+-    if [ "$3" = "noexit" ]; then
 +  if ! curl_wrapper --user-agent="lxc/@PACKAGE_VERSION@
compat:${DOWNLOAD_COMPAT_LEVEL}" -m 30 -s "https://${DOWNLOAD_SERVER}/$1"
-o "$2" >/dev/null 2>&1; then
 +    if ! curl_wrapper --user-agent="lxc/@PACKAGE_VERSION@
compat:${DOWNLOAD_COMPAT_LEVEL}" -m 30 -s "http://${DOWNLOAD_SERVER}/$1" -o
"$2" >/dev/null 2>&1; then
-       if [ "$3" = "noexit" ]; then
-         return 1
-       else
-@@ -277,7 +277,7 @@ while :; do
++      if [ "$3" = "noexit" ]; then
+       return 1
+     else
+       echo "ERROR: Failed to download https://${DOWNLOAD_SERVER}/$1" 1>&2
+@@ -176,7 +177,7 @@
  done

  # Check for required binaries
@@ -48,6 +49,3 @@ index e8570692a..f7291b0cc 100755
    if ! command -V "${bin}" >/dev/null 2>&1; then
      echo "ERROR: Missing required tool: ${bin}" 1>&2
      exit 1
---
-2.27.0
-
diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/
lxc_git.bb
index 94a1e1e..397ff36 100644
--- a/recipes-containers/lxc/lxc_git.bb
+++ b/recipes-containers/lxc/lxc_git.bb
@@ -50,8 +50,8 @@ SRC_URI = "git://github.com/lxc/lxc.git;branch=stable-4.0
\
        file://lxc-net \
        "

-SRCREV = "48e079bf318982ae7d5684feeb7358870fa71c10"
-PV = "4.0.11+git${SRCPV}"
+SRCREV = "5ba5725cb4a210c25707beeca64fde5f561d1c71"
+PV = "4.0.12+git${SRCPV}"

 S = "${WORKDIR}/git"

-- 
2.17.1

--0000000000006b9cd605fc076a70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote">From: Bruce Ashfield &lt;=
<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank" rel=3D"norefe=
rrer">bruce.ashfield@gmail.com</a>&gt;<br>
<br>
We refresh our wget -&gt; curl patch for context, but otherwise, no other<b=
r>
changes are required.<br>
<br>
Bumping lxc to version lxc-4.0.12-8-g5ba5725cb, which comprises the followi=
ng commits:<br>
<br>
=C2=A0 =C2=A0 5ba5725cb cgroups: modify cgroup2 attach logic<br>
=C2=A0 =C2=A0 1e4631641 ttys: ensure container_ttys=3D env variable is set =
correctly<br>
=C2=A0 =C2=A0 8ef019a6c doc: Fix reverse allowlist/denylist in Japanese man=
 page<br>
=C2=A0 =C2=A0 f1c4a17e7 cgroups: log fd of newly created cgroup<br>
=C2=A0 =C2=A0 f7446b4e1 cgroups: check that opened file descriptor is a cgr=
oup filesystem<br>
=C2=A0 =C2=A0 71ba7f656 doc: Fix reverse allowlist/denylist<br>
=C2=A0 =C2=A0 f314419d1 lxc-checkconfig: Fix bashism<br>
=C2=A0 =C2=A0 ca4c25c6e lxc-net: don&#39;t start by default inside lxc<br>
=C2=A0 =C2=A0 7e37cc96b Release LXC 4.0.12<br>
=C2=A0 =C2=A0 d678aa61e lxccontainer: allow xdev when creating the containe=
r dir<br>
=C2=A0 =C2=A0 bc61d2354 github: Clear default ACL on /home<br>
=C2=A0 =C2=A0 fb0e0b3dd github: add systemd-coredump<br>
=C2=A0 =C2=A0 53e0d390c github: more detailed compilation instructions<br>
=C2=A0 =C2=A0 db84a8b6b github: log system info<br>
=C2=A0 =C2=A0 e9282b6a6 github: ensure system liblxc is wiped<br>
=C2=A0 =C2=A0 ad8a3bd68 lxccontainer: properly wrap lxcapi_create()<br>
=C2=A0 =C2=A0 bceb81cd2 build: simplify thread local storage handling<br>
=C2=A0 =C2=A0 919da35b0 build: only enable LTO for regular builds<br>
=C2=A0 =C2=A0 d0a1e9c44 lxccontainer: simplify partial file creation<br>
=C2=A0 =C2=A0 62b5c0051 lxccontainer: improve create_partial()<br>
=C2=A0 =C2=A0 bfe24cb6a lxccontainer: improve do_lxcapi_create()<br>
=C2=A0 =C2=A0 1a5c236ac lxccontainer: improve do_lxcapi_save_config()<br>
=C2=A0 =C2=A0 bae0d7196 conf: log termination status<br>
=C2=A0 =C2=A0 4eb09aaad conf: improve userns_exec_mapped_root()<br>
=C2=A0 =C2=A0 928943280 github: stop installing gnupg now that it&#39;s unu=
sed<br>
=C2=A0 =C2=A0 7c70b0d14 lxc-download: Rely on HTTPS only<br>
=C2=A0 =C2=A0 199d2077c Update README.md: Fix broken link (403 Forbidden)<b=
r>
=C2=A0 =C2=A0 0b6b230e3 attach: don&#39;t pointlessly call cgroup_init()<br=
>
=C2=A0 =C2=A0 dbef704fb commands: log command during file descriptor retrie=
val<br>
=C2=A0 =C2=A0 733f9c909 <a href=3D"http://lxc-checkconfig.in" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">lxc-checkconfig.in</a>: CONFIG_NF_NAT_IP=
V4 was removed from the kernel 2019-03-03<br>
=C2=A0 =C2=A0 ce392e230 (trivial) Fix error message, failure was connect no=
t bind<br>
=C2=A0 =C2=A0 5628bff79 seccomp: close seccomp notifier fd in cleanup handl=
er<br>
=C2=A0 =C2=A0 1f2af83a9 seccomp: only guard seccomp notify behind HAVE_DECL=
_SECCOMP_NOTIFY_FD<br>
=C2=A0 =C2=A0 9451303d5 api-extensions: don&#39;t advertise seccomp notify =
support if it&#39;s not compiled in<br>
=C2=A0 =C2=A0 23d07c315 use 2 sysfs instances for sys:mixed<br>
=C2=A0 =C2=A0 0dd3258bd Revert &quot;api: -&gt;save_config() doesn&#39;t ne=
ed to create container dir&quot;<br>
=C2=A0 =C2=A0 93edd510a api: -&gt;save_config() doesn&#39;t need to create =
container dir<br>
=C2=A0 =C2=A0 28b2e04f1 cgroups: fix compiler warning<br>
=C2=A0 =C2=A0 15515f9a3 Revert &quot;initutils: use vfork() in lxc_containe=
r_init()&quot;<br>
=C2=A0 =C2=A0 41d2530d1 macro: ensure necessary io_uring flags are defined<=
br>
=C2=A0 =C2=A0 fc4e948c9 autotools: Avoid multiple liblxc.so with --enable-p=
am<br>
=C2=A0 =C2=A0 a616a311a build: refuse to compile with unsupported liburing =
version<br>
=C2=A0 =C2=A0 93be4e512 tests: add lxc.proc.* test<br>
=C2=A0 =C2=A0 d8027e49c tests: add lxc.sysctls.* test<br>
=C2=A0 =C2=A0 6f580343e test: improve logging helpers<br>
=C2=A0 =C2=A0 a10ff3418 conf: improve logging setting sysctl and /proc/&lt;=
pid&gt;/ parameters<br>
=C2=A0 =C2=A0 334cf7beb conf: apply /proc/sys and /proc/&lt;pid&gt;/ parame=
ters<br>
=C2=A0 =C2=A0 1b74e01ad tests: include config.h<br>
=C2=A0 =C2=A0 c36379431 build: move _FILE_OFFSET_BITS to common option<br>
=C2=A0 =C2=A0 f24c234ee start: log signal name and number<br>
=C2=A0 =C2=A0 4915c9112 process_utils: add signal_name() helper<br>
=C2=A0 =C2=A0 78baec37d build: improve liburing support detection<br>
=C2=A0 =C2=A0 1a102b310 mainloop: make ifdefs easier to follow<br>
=C2=A0 =C2=A0 cf931928f Replace last occurence of &#39;which&#39; with &#39=
;command -v&#39;<br>
=C2=A0 =C2=A0 1ec5939b4 Replace deprecated backticks with $() construct<br>
=C2=A0 =C2=A0 fdfb4a13d Replace &#39;which&#39; with &#39;command -v&#39; i=
n tests too<br>
=C2=A0 =C2=A0 71743e811 start: check event loop type before closing fd<br>
=C2=A0 =C2=A0 f69e6b4d3 mainloop: make sure that descr-&gt;ring is allocate=
d<br>
=C2=A0 =C2=A0 1a8895855 Replace &#39;which&#39; with &#39;command -v&#39;<b=
r>
=C2=A0 =C2=A0 9219277cc build: add io-uring-event-loop option<br>
=C2=A0 =C2=A0 d04eb166c build: add static libcap to output<br>
=C2=A0 =C2=A0 bc51048b7 confile: don&#39;t use path_simplify() on lxc.{exec=
ute,init}.cmd<br>
=C2=A0 =C2=A0 48728e988 conf: add cgroup2, cgroup2:ro, cgroup2:force, cgrou=
p2:ro:force options<br>
=C2=A0 =C2=A0 4d3aad49d AUTHORS: Update to point to git history<br>
=C2=A0 =C2=A0 e328a988e conf: handle kernels without or not using SMT<br>
=C2=A0 =C2=A0 d40b0deb4 doc: fix typo in English lxc.container.conf(5)<br>
=C2=A0 =C2=A0 49fab27fc doc: Add lxc.sched.core to Japanese lxc.container.c=
onf(5)<br>
=C2=A0 =C2=A0 1ad1cab80 doc: add loglevels to ja and ko common options<br>
=C2=A0 =C2=A0 1505f0780 conf: make it more obvious how auto-mount flags are=
 defined<br>
=C2=A0 =C2=A0 429233cf0 criu: support restoring containers with pre-created=
 veth devices<br>
=C2=A0 =C2=A0 48e079bf3 Release LXC 4.0.11<br>
<br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.co=
m" target=3D"_blank" rel=3D"noreferrer">bruce.ashfield@gmail.com</a>&gt;<br=
>
(cherry picked from commit 3ca7a147e0e4cb6c9d39871b74a72e4fea5094ab)<br>
Signed-off-by: virendra thakur &lt;<a href=3D"mailto:virendrak@kpit.com" ta=
rget=3D"_blank" rel=3D"noreferrer">virendrak@kpit.com</a>&gt;<br>
---<br>
=C2=A0.../templates-use-curl-instead-of-wget.patch=C2=A0 | 26 +++++++++----=
------<br>
=C2=A0recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"noreferre=
r noreferrer" target=3D"_blank">lxc_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +--<br>
=C2=A02 files changed, 14 insertions(+), 16 deletions(-)<br>
<br>
diff --git a/recipes-containers/lxc/files/templates-use-curl-instead-of-wge=
t.patch b/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.p=
atch<br>
index 4556293..f06e596 100644<br>
--- a/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch=
<br>
+++ b/recipes-containers/lxc/files/templates-use-curl-instead-of-wget.patch=
<br>
@@ -12,11 +12,11 @@ Signed-off-by: Yanfei Xu &lt;<a href=3D"mailto:yanfei.x=
u@windriver.com" target=3D"_blank" rel=3D"noreferrer">yanfei.xu@windriver.c=
om</a>&gt;<br>
=C2=A0 templates/<a href=3D"http://lxc-download.in" rel=3D"noreferrer noref=
errer" target=3D"_blank">lxc-download.in</a> | 10 +++++-----<br>
=C2=A0 1 file changed, 5 insertions(+), 5 deletions(-)<br>
<br>
-diff --git a/templates/<a href=3D"http://lxc-download.in" rel=3D"noreferre=
r noreferrer" target=3D"_blank">lxc-download.in</a> b/templates/<a href=3D"=
http://lxc-download.in" rel=3D"noreferrer noreferrer" target=3D"_blank">lxc=
-download.in</a><br>
-index e8570692a..f7291b0cc 100755<br>
---- a/templates/<a href=3D"http://lxc-download.in" rel=3D"noreferrer noref=
errer" target=3D"_blank">lxc-download.in</a><br>
-+++ b/templates/<a href=3D"http://lxc-download.in" rel=3D"noreferrer noref=
errer" target=3D"_blank">lxc-download.in</a><br>
-@@ -75,9 +75,9 @@ cleanup() {<br>
+Index: git/templates/<a href=3D"http://lxc-download.in" rel=3D"noreferrer =
noreferrer" target=3D"_blank">lxc-download.in</a><br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- git.orig/templates/<a href=3D"http://lxc-download.in" rel=3D"noreferre=
r noreferrer" target=3D"_blank">lxc-download.in</a><br>
++++ git/templates/<a href=3D"http://lxc-download.in" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">lxc-download.in</a><br>
+@@ -59,9 +59,9 @@<br>
=C2=A0 =C2=A0 fi<br>
=C2=A0 }<br>
<br>
@@ -28,18 +28,19 @@ index e8570692a..f7291b0cc 100755<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0<br>
=C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 done<br>
-@@ -86,8 +86,8 @@ wget_wrapper() {<br>
+@@ -70,8 +70,9 @@<br>
=C2=A0 }<br>
<br>
=C2=A0 download_file() {<br>
=C2=A0-=C2=A0 if ! wget_wrapper --user-agent=3D&quot;lxc/@PACKAGE_VERSION@ =
compat:${DOWNLOAD_COMPAT_LEVEL}&quot; -T 30 -q &quot;https://${DOWNLOAD_SER=
VER}/$1&quot; -O &quot;$2&quot; &gt;/dev/null 2&gt;&amp;1; then<br>
--=C2=A0 =C2=A0 if ! wget_wrapper --user-agent=3D&quot;lxc/@PACKAGE_VERSION=
@ compat:${DOWNLOAD_COMPAT_LEVEL}&quot; -T 30 -q &quot;http://${DOWNLOAD_SE=
RVER}/$1&quot; -O &quot;$2&quot; &gt;/dev/null 2&gt;&amp;1; then<br>
+-=C2=A0 =C2=A0 if [ &quot;$3&quot; =3D &quot;noexit&quot; ]; then<br>
=C2=A0+=C2=A0 if ! curl_wrapper --user-agent=3D&quot;lxc/@PACKAGE_VERSION@ =
compat:${DOWNLOAD_COMPAT_LEVEL}&quot; -m 30 -s &quot;https://${DOWNLOAD_SER=
VER}/$1&quot; -o &quot;$2&quot; &gt;/dev/null 2&gt;&amp;1; then<br>
=C2=A0+=C2=A0 =C2=A0 if ! curl_wrapper --user-agent=3D&quot;lxc/@PACKAGE_VE=
RSION@ compat:${DOWNLOAD_COMPAT_LEVEL}&quot; -m 30 -s &quot;http://${DOWNLO=
AD_SERVER}/$1&quot; -o &quot;$2&quot; &gt;/dev/null 2&gt;&amp;1; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$3&quot; =3D &quot;noexit&quot; ]; t=
hen<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-@@ -277,7 +277,7 @@ while :; do<br>
++=C2=A0 =C2=A0 =C2=A0 if [ &quot;$3&quot; =3D &quot;noexit&quot; ]; then<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1<br>
+=C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;ERROR: Failed to download https://${=
DOWNLOAD_SERVER}/$1&quot; 1&gt;&amp;2<br>
+@@ -176,7 +177,7 @@<br>
=C2=A0 done<br>
<br>
=C2=A0 # Check for required binaries<br>
@@ -48,6 +49,3 @@ index e8570692a..f7291b0cc 100755<br>
=C2=A0 =C2=A0 if ! command -V &quot;${bin}&quot; &gt;/dev/null 2&gt;&amp;1;=
 then<br>
=C2=A0 =C2=A0 =C2=A0 echo &quot;ERROR: Missing required tool: ${bin}&quot; =
1&gt;&amp;2<br>
=C2=A0 =C2=A0 =C2=A0 exit 1<br>
--- <br>
-2.27.0<br>
-<br>
diff --git a/recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"no=
referrer noreferrer" target=3D"_blank">lxc_git.bb</a> b/recipes-containers/=
lxc/<a href=3D"http://lxc_git.bb" rel=3D"noreferrer noreferrer" target=3D"_=
blank">lxc_git.bb</a><br>
index 94a1e1e..397ff36 100644<br>
--- a/recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"noreferre=
r noreferrer" target=3D"_blank">lxc_git.bb</a><br>
+++ b/recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"noreferre=
r noreferrer" target=3D"_blank">lxc_git.bb</a><br>
@@ -50,8 +50,8 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/lxc/=
lxc.git;branch=3Dstable-4.0" rel=3D"noreferrer noreferrer" target=3D"_blank=
">github.com/lxc/lxc.git;branch=3Dstable-4.0</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lxc-net \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRCREV =3D &quot;48e079bf318982ae7d5684feeb7358870fa71c10&quot;<br>
-PV =3D &quot;4.0.11+git${SRCPV}&quot;<br>
+SRCREV =3D &quot;5ba5725cb4a210c25707beeca64fde5f561d1c71&quot;<br>
+PV =3D &quot;4.0.12+git${SRCPV}&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-- <br>
2.17.1<br>
<br>
</div></div></div>

--0000000000006b9cd605fc076a70--

