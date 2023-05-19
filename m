Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FDBEC77B7F
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 08:08:47 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.20883.1684483721700355836
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 19 May 2023 01:08:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=T0ePdrfu;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f50020e0f8so3305655e9.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 19 May 2023 01:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684483720; x=1687075720;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kpBUEbcMS052G4+uUCW5MRfiUauMzw3iVKnzMA+Dyxc=;
        b=T0ePdrfuumlMSZDuMU0PamWkzVPK06RdsuQi/YqF/gb3fPh2OCzHVUacHc6UNFxugh
         lfQDgTUANo98VqkUpRtRo/iEICONx77Gp67Rfb3fgrMcKSnOEen1htSsWwc6yAcj7Fxp
         JcRteN3ragzAEAEpGCJ/RKrOAMEl7UnON3M//ZvBaM9lGIzybmNknSAFEUgXawbHOaG3
         07i8ksYCWzhDBwqewAg9A6Bxo58PVmSVtfjcJpPsrW44f6YtihZA8zprIvXUPMe5cg7Y
         1C0fE3rn+I/bbEJxfVeTCyFuoIP0KVMuu58ihAJ6SwjxUfgRMKgE9MPHwGgBEC/Pij2s
         XAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684483720; x=1687075720;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kpBUEbcMS052G4+uUCW5MRfiUauMzw3iVKnzMA+Dyxc=;
        b=CSEkrl0LLShN4gnZY8zVkYHi57mYjQ3Jyy2iZXPPhs2byL8TvnHVuryGEnM+WUfipZ
         jBjo1MQL7TVhU8JGrgG/vEwyiiNxmUNfnvlGDS1CEYjzkQaTOdh0wiqDOLV6GLDUvFK8
         f67n2/Xd8AFP1JmLtVnNZ2+iEkBWTvv99dBUMLOlBlte1ijjbd8PVBfKuV5Om0Ka2uPM
         VRLV3T7m1dp3v84EgnsnK1fNJBTzW0SdcPry5cyrr6S5ep4t6dy89ClBIJjvuKzt/Og1
         WVIOOmYwWjcZjakdR9Q1TRwfh1ZsDDER35jrqowrKQSipdnCdmvTYssPX1hE9WjSHWQ5
         FS0w==
X-Gm-Message-State: AC+VfDxFMTpz165serwwX4IWGRReHdVYC9a7yrvj6r8J1bh888dVahyn
	qHTogGGkn2tGt8nx6Viv1L/YsejShHHCj7fQfvxL7EKK
X-Google-Smtp-Source: ACHHUZ5tiAtRNcvrppkWzQQ62xGrjbkLSZ4WMoJHg82i+apengWV97Y3PaLfr3CigA5LJhofNL70KAeq2CX2LkzpNdk=
X-Received: by 2002:a5d:6e01:0:b0:309:48eb:993d with SMTP id
 h1-20020a5d6e01000000b0030948eb993dmr3043170wrz.15.1684483719551; Fri, 19 May
 2023 01:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230519073403.5065-1-thakur.virendra1810@gmail.com>
In-Reply-To: <20230519073403.5065-1-thakur.virendra1810@gmail.com>
From: virendra thakur <thakur.virendra1810@gmail.com>
Date: Fri, 19 May 2023 13:38:28 +0530
Message-ID: <CAJM8miUyPQOjVrLE9e0cJ4TNfnr5=eVXZbck-3iQsZr7-QfksQ@mail.gmail.com>
Subject: meta-virtualization][PATCH 7/7] lxc: backport patch to fix CVE-2022-47952
To: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000bbdc9e05fc076dd2"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 19 May 2023 08:08:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8071

--000000000000bbdc9e05fc076dd2
Content-Type: text/plain; charset="UTF-8"

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
(cherry picked from commit 9a94fa2ad76990b0eca40837a98aaf4cd83a7248)
Signed-off-by: virendra thakur <virendrak@kpit.com>
---
 ...ching-an-incoming-CVE-CVE-2022-47952.patch | 76 +++++++++++++++++++
 recipes-containers/lxc/lxc_git.bb             |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644
recipes-containers/lxc/files/0001-Patching-an-incoming-CVE-CVE-2022-47952.patch

diff --git
a/recipes-containers/lxc/files/0001-Patching-an-incoming-CVE-CVE-2022-47952.patch
b/recipes-containers/lxc/files/0001-Patching-an-incoming-CVE-CVE-2022-47952.patch
new file mode 100644
index 0000000..d5a02f4
--- /dev/null
+++
b/recipes-containers/lxc/files/0001-Patching-an-incoming-CVE-CVE-2022-47952.patch
@@ -0,0 +1,76 @@
+From 1b0469530d7a38b8f8990e114b52530d1bf7f3b8 Mon Sep 17 00:00:00 2001
+From: Maher Azzouzi <maherazz04@gmail.com>
+Date: Sun, 25 Dec 2022 13:50:25 +0100
+Subject: [PATCH] Patching an incoming CVE (CVE-2022-47952)
+
+lxc-user-nic in lxc through 5.0.1 is installed setuid root, and may
+allow local users to infer whether any file exists, even within a
+protected directory tree, because "Failed to open" often indicates
+that a file does not exist, whereas "does not refer to a network
+namespace path" often indicates that a file exists. NOTE: this is
+different from CVE-2018-6556 because the CVE-2018-6556 fix design was
+based on the premise that "we will report back to the user that the
+open() failed but the user has no way of knowing why it failed";
+however, in many realistic cases, there are no plausible reasons for
+failing except that the file does not exist.
+
+PoC:
+> % ls /l
+> ls: cannot open directory '/l': Permission denied
+> % /usr/lib/x86_64-linux-gnu/lxc/lxc-user-nic delete lol lol /l/h/tt h h
+> cmd/lxc_user_nic.c: 1096: main: Failed to open "/l/h/tt" <----- file
does not exist.
+> % /usr/lib/x86_64-linux-gnu/lxc/lxc-user-nic delete lol lol /l/h/t h h
+> cmd/lxc_user_nic.c: 1101: main: Path "/l/h/t" does not refer to a
network namespace path <---- file exist!
+
+Upstream-Status: Backport from
https://github.com/lxc/lxc/commit/1b0469530d7a38b8f8990e114b52530d1bf7f3b8
+CVE: CVE-2022-47952
+
+Signed-off-by: MaherAzzouzi <maherazz04@gmail.com>
+Acked-by: Serge Hallyn <serge@hallyn.com>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ src/lxc/cmd/lxc_user_nic.c | 15 ++++++---------
+ 1 file changed, 6 insertions(+), 9 deletions(-)
+
+diff --git a/src/lxc/cmd/lxc_user_nic.c b/src/lxc/cmd/lxc_user_nic.c
+index a91e2259d..69bc6f17d 100644
+--- a/src/lxc/cmd/lxc_user_nic.c
++++ b/src/lxc/cmd/lxc_user_nic.c
+@@ -1085,20 +1085,17 @@ int main(int argc, char *argv[])
+       } else if (request == LXC_USERNIC_DELETE) {
+               char opath[LXC_PROC_PID_FD_LEN];
+
+-              /* Open the path with O_PATH which will not trigger an
actual
+-               * open(). Don't report an errno to the caller to not leak
+-               * information whether the path exists or not.
+-               * When stracing setuid is stripped so this is not a concern
+-               * either.
+-               */
++              // Keep in mind CVE-2022-47952: It's crucial not to leak any
++              // information whether open() succeeded of failed.
++
+               netns_fd = open(args.pid, O_PATH | O_CLOEXEC);
+               if (netns_fd < 0) {
+-                      usernic_error("Failed to open \"%s\"\n", args.pid);
++                      usernic_error("Failed while opening netns file for
\"%s\"\n", args.pid);
+                       _exit(EXIT_FAILURE);
+               }
+
+               if (!fhas_fs_type(netns_fd, NSFS_MAGIC)) {
+-                      usernic_error("Path \"%s\" does not refer to a
network namespace path\n", args.pid);
++                      usernic_error("Failed while opening netns file for
\"%s\"\n", args.pid);
+                       close(netns_fd);
+                       _exit(EXIT_FAILURE);
+               }
+@@ -1112,7 +1109,7 @@ int main(int argc, char *argv[])
+               /* Now get an fd that we can use in setns() calls. */
+               ret = open(opath, O_RDONLY | O_CLOEXEC);
+               if (ret < 0) {
+-                      CMD_SYSERROR("Failed to open \"%s\"\n", args.pid);
++                      CMD_SYSERROR("Failed while opening netns file for
\"%s\"\n", args.pid);
+                       close(netns_fd);
+                       _exit(EXIT_FAILURE);
+               }
+--
+2.34.1
+
diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/
lxc_git.bb
index 397ff36..29fcb04 100644
--- a/recipes-containers/lxc/lxc_git.bb
+++ b/recipes-containers/lxc/lxc_git.bb
@@ -48,6 +48,7 @@ SRC_URI = "git://github.com/lxc/lxc.git;branch=stable-4.0
\
        file://tests-our-init-is-not-busybox.patch \
        file://dnsmasq.conf \
        file://lxc-net \
+       file://0001-Patching-an-incoming-CVE-CVE-2022-47952.patch \
        "

 SRCREV = "5ba5725cb4a210c25707beeca64fde5f561d1c71"
-- 
2.17.1

--000000000000bbdc9e05fc076dd2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote">From: Xiangyu Chen &lt;<a=
 href=3D"mailto:xiangyu.chen@windriver.com" target=3D"_blank" rel=3D"norefe=
rrer">xiangyu.chen@windriver.com</a>&gt;<br>
<br>
Signed-off-by: Xiangyu Chen &lt;<a href=3D"mailto:xiangyu.chen@windriver.co=
m" target=3D"_blank" rel=3D"noreferrer">xiangyu.chen@windriver.com</a>&gt;<=
br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.co=
m" target=3D"_blank" rel=3D"noreferrer">bruce.ashfield@gmail.com</a>&gt;<br=
>
(cherry picked from commit 9a94fa2ad76990b0eca40837a98aaf4cd83a7248)<br>
Signed-off-by: virendra thakur &lt;<a href=3D"mailto:virendrak@kpit.com" ta=
rget=3D"_blank" rel=3D"noreferrer">virendrak@kpit.com</a>&gt;<br>
---<br>
=C2=A0...ching-an-incoming-CVE-CVE-2022-47952.patch | 76 ++++++++++++++++++=
+<br>
=C2=A0recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"noreferre=
r noreferrer" target=3D"_blank">lxc_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 77 insertions(+)<br>
=C2=A0create mode 100644 recipes-containers/lxc/files/0001-Patching-an-inco=
ming-CVE-CVE-2022-47952.patch<br>
<br>
diff --git a/recipes-containers/lxc/files/0001-Patching-an-incoming-CVE-CVE=
-2022-47952.patch b/recipes-containers/lxc/files/0001-Patching-an-incoming-=
CVE-CVE-2022-47952.patch<br>
new file mode 100644<br>
index 0000000..d5a02f4<br>
--- /dev/null<br>
+++ b/recipes-containers/lxc/files/0001-Patching-an-incoming-CVE-CVE-2022-4=
7952.patch<br>
@@ -0,0 +1,76 @@<br>
+From 1b0469530d7a38b8f8990e114b52530d1bf7f3b8 Mon Sep 17 00:00:00 2001<br>
+From: Maher Azzouzi &lt;<a href=3D"mailto:maherazz04@gmail.com" target=3D"=
_blank" rel=3D"noreferrer">maherazz04@gmail.com</a>&gt;<br>
+Date: Sun, 25 Dec 2022 13:50:25 +0100<br>
+Subject: [PATCH] Patching an incoming CVE (CVE-2022-47952)<br>
+<br>
+lxc-user-nic in lxc through 5.0.1 is installed setuid root, and may<br>
+allow local users to infer whether any file exists, even within a<br>
+protected directory tree, because &quot;Failed to open&quot; often indicat=
es<br>
+that a file does not exist, whereas &quot;does not refer to a network<br>
+namespace path&quot; often indicates that a file exists. NOTE: this is<br>
+different from CVE-2018-6556 because the CVE-2018-6556 fix design was<br>
+based on the premise that &quot;we will report back to the user that the<b=
r>
+open() failed but the user has no way of knowing why it failed&quot;;<br>
+however, in many realistic cases, there are no plausible reasons for<br>
+failing except that the file does not exist.<br>
+<br>
+PoC:<br>
+&gt; % ls /l<br>
+&gt; ls: cannot open directory &#39;/l&#39;: Permission denied<br>
+&gt; % /usr/lib/x86_64-linux-gnu/lxc/lxc-user-nic delete lol lol /l/h/tt h=
 h<br>
+&gt; cmd/lxc_user_nic.c: 1096: main: Failed to open &quot;/l/h/tt&quot; &l=
t;----- file does not exist.<br>
+&gt; % /usr/lib/x86_64-linux-gnu/lxc/lxc-user-nic delete lol lol /l/h/t h =
h<br>
+&gt; cmd/lxc_user_nic.c: 1101: main: Path &quot;/l/h/t&quot; does not refe=
r to a network namespace path &lt;---- file exist!<br>
+<br>
+Upstream-Status: Backport from <a href=3D"https://github.com/lxc/lxc/commi=
t/1b0469530d7a38b8f8990e114b52530d1bf7f3b8" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">https://github.com/lxc/lxc/commit/1b0469530d7a38b8f8990e11=
4b52530d1bf7f3b8</a><br>
+CVE: CVE-2022-47952<br>
+<br>
+Signed-off-by: MaherAzzouzi &lt;<a href=3D"mailto:maherazz04@gmail.com" ta=
rget=3D"_blank" rel=3D"noreferrer">maherazz04@gmail.com</a>&gt;<br>
+Acked-by: Serge Hallyn &lt;<a href=3D"mailto:serge@hallyn.com" target=3D"_=
blank" rel=3D"noreferrer">serge@hallyn.com</a>&gt;<br>
+Signed-off-by: Xiangyu Chen &lt;<a href=3D"mailto:xiangyu.chen@windriver.c=
om" target=3D"_blank" rel=3D"noreferrer">xiangyu.chen@windriver.com</a>&gt;=
<br>
+---<br>
+ src/lxc/cmd/lxc_user_nic.c | 15 ++++++---------<br>
+ 1 file changed, 6 insertions(+), 9 deletions(-)<br>
+<br>
+diff --git a/src/lxc/cmd/lxc_user_nic.c b/src/lxc/cmd/lxc_user_nic.c<br>
+index a91e2259d..69bc6f17d 100644<br>
+--- a/src/lxc/cmd/lxc_user_nic.c<br>
++++ b/src/lxc/cmd/lxc_user_nic.c<br>
+@@ -1085,20 +1085,17 @@ int main(int argc, char *argv[])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (request =3D=3D LXC_USERNIC_DELETE) {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char opath[LXC_PROC=
_PID_FD_LEN];<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Open the path with O_=
PATH which will not trigger an actual<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* open(). Don&#39;=
t report an errno to the caller to not leak<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* information whet=
her the path exists or not.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* When stracing se=
tuid is stripped so this is not a concern<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* either.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Keep in mind CVE-2022=
-47952: It&#39;s crucial not to leak any<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // information whether o=
pen() succeeded of failed.<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0netns_fd =3D open(a=
rgs.pid, O_PATH | O_CLOEXEC);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (netns_fd &lt; 0=
) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 usernic_error(&quot;Failed to open \&quot;%s\&quot;\n&quot;, args.pid);=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 usernic_error(&quot;Failed while opening netns file for \&quot;%s\&quot=
;\n&quot;, args.pid);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0_exit(EXIT_FAILURE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!fhas_fs_type(n=
etns_fd, NSFS_MAGIC)) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 usernic_error(&quot;Path \&quot;%s\&quot; does not refer to a network n=
amespace path\n&quot;, args.pid);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 usernic_error(&quot;Failed while opening netns file for \&quot;%s\&quot=
;\n&quot;, args.pid);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0close(netns_fd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0_exit(EXIT_FAILURE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -1112,7 +1109,7 @@ int main(int argc, char *argv[])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Now get an fd th=
at we can use in setns() calls. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D open(opath,=
 O_RDONLY | O_CLOEXEC);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 CMD_SYSERROR(&quot;Failed to open \&quot;%s\&quot;\n&quot;, args.pid);<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 CMD_SYSERROR(&quot;Failed while opening netns file for \&quot;%s\&quot;=
\n&quot;, args.pid);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0close(netns_fd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0_exit(EXIT_FAILURE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-- <br>
+2.34.1<br>
+<br>
diff --git a/recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"no=
referrer noreferrer" target=3D"_blank">lxc_git.bb</a> b/recipes-containers/=
lxc/<a href=3D"http://lxc_git.bb" rel=3D"noreferrer noreferrer" target=3D"_=
blank">lxc_git.bb</a><br>
index 397ff36..29fcb04 100644<br>
--- a/recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"noreferre=
r noreferrer" target=3D"_blank">lxc_git.bb</a><br>
+++ b/recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"noreferre=
r noreferrer" target=3D"_blank">lxc_git.bb</a><br>
@@ -48,6 +48,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/lxc/=
lxc.git;branch=3Dstable-4.0" rel=3D"noreferrer noreferrer" target=3D"_blank=
">github.com/lxc/lxc.git;branch=3Dstable-4.0</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://tests-our-init-is-not-busybox.patch \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://dnsmasq.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lxc-net \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Patching-an-incoming-CVE-CVE-2022-4=
7952.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRCREV =3D &quot;5ba5725cb4a210c25707beeca64fde5f561d1c71&quot;<br>
-- <br>
2.17.1<br>
<br>
</div></div></div>

--000000000000bbdc9e05fc076dd2--

