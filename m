Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A00C77B7F
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 08:05:37 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.20851.1684483532781348821
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 19 May 2023 01:05:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=XfOJzEKt;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3f423ac6e2dso19030385e9.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 19 May 2023 01:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684483531; x=1687075531;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CNAKIiD9QRIQwgj9OC1eSCaj9FzGoaWuACyjNE7PUwE=;
        b=XfOJzEKtqJlJb7JJHGnZpT+19OWauzs4TudRy9sTOXWB8XFWBNR2VskP7U2Am8BH6l
         Hkgn/HcmvT7UOsKbP5B8PBv0YNXEjF5qIOXz3jrvMEvESlvH+7UMIsdJg5cfcQgHbvRt
         0kABxpWVPWxXR7BeezPzxLVRR7jIvGnOepTG3iPXyokbcrgjwMAMENQnimHeVEbjvWX7
         WRYkb8vZORyVbgDQXrg+iid0y487VeBZXndpeGXfD2k694Fi+PU7W+LY8IClHkqzdu1b
         BkLyJkzwqQG8e+xV7edCqchmcbV+P4OpFpOP5nQrufoJixs1XZf8+jPxSNg3PhrJ8Qzl
         9sfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684483531; x=1687075531;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CNAKIiD9QRIQwgj9OC1eSCaj9FzGoaWuACyjNE7PUwE=;
        b=UBbwOpIwGEtDwpCD9qP+HYpDkqwEACj32W4A28y6KfwUSYgzv1YeFYoMF6/ewrsIPV
         RpH0E0VjSgfrUDkN6LzuBqTFnVAfmvUioUvPUjPvQ8uNyLJyHoM7m0s7vZ4VJr0+LBbT
         kngMVSzhU/3nCcbC8WzWkshoM26dMEedXpD+B/lURtZlXGJcuw2rFUXTkIK4rnWG3DeY
         2NZgMb07y5++6toQqJc+f3iBJdfsm1Y3zb64tQ9fT3wmgNzFYtil9TfZ7fU29wN3Hw+9
         6XYpPpMmfXpSAdLP6Kb1IcATJ0I6ErLH33WO4hJKsFtgZz6HHRA8ZXsfcNEsC5nko6el
         qY2w==
X-Gm-Message-State: AC+VfDwNwiQhd8snneSC9sMKCzgSHZ8CZy9OagfeB8S51zlk4pDJtPe8
	Y+qOShYrB7JB0NFjTPjUKpvQko3zM/dY91WX1r14Gl8M
X-Google-Smtp-Source: ACHHUZ4y4clxByYnTaoX7iobLPUWR/je2AiFv//BxsMYPSada26gLRcN3oSqF2ts49OwWiPH0LOUlq/araAraOxFfDs=
X-Received: by 2002:a7b:c3ce:0:b0:3f4:e850:64e4 with SMTP id
 t14-20020a7bc3ce000000b003f4e85064e4mr631623wmj.37.1684483530748; Fri, 19 May
 2023 01:05:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230519073104.4535-1-thakur.virendra1810@gmail.com>
In-Reply-To: <20230519073104.4535-1-thakur.virendra1810@gmail.com>
From: virendra thakur <thakur.virendra1810@gmail.com>
Date: Fri, 19 May 2023 13:35:17 +0530
Message-ID: <CAJM8miUjWBQ5U59zfjntmTjB2=zAyUrYPEVz46owPiUcMP4WHA@mail.gmail.com>
Subject: meta-virtualization][PATCH 4/7] lxc: Fix -c command for lxc-attach
To: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000007af79905fc076292"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 19 May 2023 08:05:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8068

--0000000000007af79905fc076292
Content-Type: text/plain; charset="UTF-8"

From: sana kazi <sanakazisk19@gmail.com>

Added fix_c_command.patch the -c command seems to be broken because
the passed context is ignored and always overwritten by the context
specified in the config file.

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
(cherry picked from commit 807506c777a45d805400ec6f47b45420e300c2e5)
Signed-off-by: virendra thakur <virendrak@kpit.com>
---
 .../lxc/files/fix_c_command.patch             | 36 +++++++++++++++++++
 recipes-containers/lxc/lxc_git.bb             |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 recipes-containers/lxc/files/fix_c_command.patch

diff --git a/recipes-containers/lxc/files/fix_c_command.patch
b/recipes-containers/lxc/files/fix_c_command.patch
new file mode 100644
index 0000000..1ed8daf
--- /dev/null
+++ b/recipes-containers/lxc/files/fix_c_command.patch
@@ -0,0 +1,36 @@
+From 9becf309a81806ef08acf9ca99ab95c1bcfa1f65 Mon Sep 17 00:00:00 2001
+From: Maximilian Blenk <Maximilian.Blenk@bmw.de>
+Date: Mon, 23 Aug 2021 15:39:28 +0200
+Subject: [PATCH] attach: Fix -c command
+
+Currently, the -c command (to set the selinux context) seems to be
+broken because the passed context is ignored and always overwritten by
+the context specified in the config file. The intention behind the -c
+imho was to be able to manually overwrite this behavior. This patch
+ensures that the selinux context will be set if passed via the command
+line.
+
+Signed-off-by: Maximilian Blenk <Maximilian.Blenk@bmw.de>
+---
+ src/lxc/tools/lxc_attach.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+Upstream-Status: Backport [
https://github.com/lxc/lxc/commit/9becf309a81806ef08acf9ca99ab95c1bcfa1f65.patch
]
+Comment: No change in any hunk
+
+diff --git a/src/lxc/tools/lxc_attach.c b/src/lxc/tools/lxc_attach.c
+index 0374d980b4..e6b388b20c 100644
+--- a/src/lxc/tools/lxc_attach.c
++++ b/src/lxc/tools/lxc_attach.c
+@@ -379,7 +379,10 @@ int main(int argc, char *argv[])
+               attach_options.gid = my_args.gid;
+
+       // selinux_context will be NULL if not set
+-      attach_options.lsm_label = selinux_context;
++      if (selinux_context) {
++              attach_options.attach_flags |= LXC_ATTACH_LSM_LABEL;
++              attach_options.lsm_label = selinux_context;
++      }
+
+       if (command.program) {
+               ret = c->attach_run_wait(c, &attach_options,
command.program,
diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/
lxc_git.bb
index 76e0493..f98cba0 100644
--- a/recipes-containers/lxc/lxc_git.bb
+++ b/recipes-containers/lxc/lxc_git.bb
@@ -50,6 +50,7 @@ SRC_URI = "git://github.com/lxc/lxc.git;branch=stable-4.0
\
        file://dnsmasq.conf \
        file://lxc-net \
         file://enable_seccomp_profile_when_compiled_libseccomp.patch \
+        file://fix_c_command.patch \
        "

 SRCREV = "cec7cb14b2a4367d4cb21a90e1b90d0f98a9d874"
-- 
2.17.1

--0000000000007af79905fc076292
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">From: sana kazi &lt;<a href=3D"mailto:sanakazisk19@gmail.com" =
target=3D"_blank" rel=3D"noreferrer">sanakazisk19@gmail.com</a>&gt;</div>
<br>
Added fix_c_command.patch the -c command seems to be broken because<br>
the passed context is ignored and always overwritten by the context<br>
specified in the config file.<br>
<br>
Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com" target=
=3D"_blank" rel=3D"noreferrer">Sana.Kazi@kpit.com</a>&gt;<br>
Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:sanakazisk19@gmail.com" targ=
et=3D"_blank" rel=3D"noreferrer">sanakazisk19@gmail.com</a>&gt;<br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.co=
m" target=3D"_blank" rel=3D"noreferrer">bruce.ashfield@gmail.com</a>&gt;<br=
>
(cherry picked from commit 807506c777a45d805400ec6f47b45420e300c2e5)<br>
Signed-off-by: virendra thakur &lt;<a href=3D"mailto:virendrak@kpit.com" ta=
rget=3D"_blank" rel=3D"noreferrer">virendrak@kpit.com</a>&gt;<br>
---<br>
=C2=A0.../lxc/files/fix_c_command.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 36 +++++++++++++++++++<br>
=C2=A0recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"noreferre=
r noreferrer" target=3D"_blank">lxc_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 37 insertions(+)<br>
=C2=A0create mode 100644 recipes-containers/lxc/files/fix_c_command.patch<b=
r>
<br>
diff --git a/recipes-containers/lxc/files/fix_c_command.patch b/recipes-con=
tainers/lxc/files/fix_c_command.patch<br>
new file mode 100644<br>
index 0000000..1ed8daf<br>
--- /dev/null<br>
+++ b/recipes-containers/lxc/files/fix_c_command.patch<br>
@@ -0,0 +1,36 @@<br>
+From 9becf309a81806ef08acf9ca99ab95c1bcfa1f65 Mon Sep 17 00:00:00 2001<br>
+From: Maximilian Blenk &lt;<a href=3D"mailto:Maximilian.Blenk@bmw.de" targ=
et=3D"_blank" rel=3D"noreferrer">Maximilian.Blenk@bmw.de</a>&gt;<br>
+Date: Mon, 23 Aug 2021 15:39:28 +0200<br>
+Subject: [PATCH] attach: Fix -c command<br>
+<br>
+Currently, the -c command (to set the selinux context) seems to be<br>
+broken because the passed context is ignored and always overwritten by<br>
+the context specified in the config file. The intention behind the -c<br>
+imho was to be able to manually overwrite this behavior. This patch<br>
+ensures that the selinux context will be set if passed via the command<br>
+line.<br>
+<br>
+Signed-off-by: Maximilian Blenk &lt;<a href=3D"mailto:Maximilian.Blenk@bmw=
.de" target=3D"_blank" rel=3D"noreferrer">Maximilian.Blenk@bmw.de</a>&gt;<b=
r>
+---<br>
+ src/lxc/tools/lxc_attach.c | 5 ++++-<br>
+ 1 file changed, 4 insertions(+), 1 deletion(-)<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/lxc/lxc/commit/9b=
ecf309a81806ef08acf9ca99ab95c1bcfa1f65.patch" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">https://github.com/lxc/lxc/commit/9becf309a81806ef08acf9=
ca99ab95c1bcfa1f65.patch</a>]<br>
+Comment: No change in any hunk<br>
+<br>
+diff --git a/src/lxc/tools/lxc_attach.c b/src/lxc/tools/lxc_attach.c<br>
+index 0374d980b4..e6b388b20c 100644<br>
+--- a/src/lxc/tools/lxc_attach.c<br>
++++ b/src/lxc/tools/lxc_attach.c<br>
+@@ -379,7 +379,10 @@ int main(int argc, char *argv[])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0attach_options.gid =
=3D my_args.gid;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// selinux_context will be NULL if not set<br>
+-=C2=A0 =C2=A0 =C2=A0 attach_options.lsm_label =3D selinux_context;<br>
++=C2=A0 =C2=A0 =C2=A0 if (selinux_context) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 attach_options.attach_fl=
ags |=3D LXC_ATTACH_LSM_LABEL;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 attach_options.lsm_label=
 =3D selinux_context;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (command.program) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D c-&gt;attac=
h_run_wait(c, &amp;attach_options, command.program,<br>
diff --git a/recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"no=
referrer noreferrer" target=3D"_blank">lxc_git.bb</a> b/recipes-containers/=
lxc/<a href=3D"http://lxc_git.bb" rel=3D"noreferrer noreferrer" target=3D"_=
blank">lxc_git.bb</a><br>
index 76e0493..f98cba0 100644<br>
--- a/recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"noreferre=
r noreferrer" target=3D"_blank">lxc_git.bb</a><br>
+++ b/recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"noreferre=
r noreferrer" target=3D"_blank">lxc_git.bb</a><br>
@@ -50,6 +50,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/lxc/=
lxc.git;branch=3Dstable-4.0" rel=3D"noreferrer noreferrer" target=3D"_blank=
">github.com/lxc/lxc.git;branch=3Dstable-4.0</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://dnsmasq.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lxc-net \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://enable_seccomp_profile_when_compil=
ed_libseccomp.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix_c_command.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRCREV =3D &quot;cec7cb14b2a4367d4cb21a90e1b90d0f98a9d874&quot;<br>
-- <br>
2.17.1<br>
<br>
</div></div></div>

--0000000000007af79905fc076292--

