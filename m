Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 377C8C7EE2A
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 08:00:27 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.20794.1684483222867419993
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 19 May 2023 01:00:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=CmouhsbZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f4c6c4b51eso28342435e9.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 19 May 2023 01:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684483221; x=1687075221;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Pcxll6JqPOYivacWqPbGhjBUByAnv8MuCyqlAoPxeY=;
        b=CmouhsbZCfMbFCGheQQ/Lf4FTVIlqEhPuHt5e/pirwBsbmYLknRFR2CEhGyLSxq3lF
         g1sesM6MkESrWRGv+qUitO+/PgaPaMy6sSCZVcMd29ZJm/IOf52W4UnH4fRKJ7QLnFme
         u7QJnnqSRLiy6Q0RJuUsgvMIY+fvKmov/lMAJlhMRYrcgDFgoNho1nlXwnkNI0ht7w2W
         ezN5gqyJd2Yp2pVPHlHQ3Ik3wlHFMGWCb5K7byf3s+KU22b4R8iJgLJdxk8gRTDftInp
         Z6RURyXM4wvmtVCWKyDFL4IrMWzpHfBXkjFhQQT1sf4mUXXHyxsznwk1n1U8HqXDfp7e
         hWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684483221; x=1687075221;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Pcxll6JqPOYivacWqPbGhjBUByAnv8MuCyqlAoPxeY=;
        b=SFG2Y9FFO9bgHRO/qVs2YjVw36Bk9eYEmILSXPR5hGXcj/dGawUumQp8O79vmIscHe
         2WS3VtySliIiGLphkbbzRuHed9+itU//btAbfPWcwOH/sZR2HUZ6ozfTbdDQDIToqXy8
         yf67ceYdOqLmjgBAcFBkyWooaKMhY19uaiCOOmqTSQ5rCMXiIxJJU55logMX8VBmp8rG
         QfGDOCXeUte0oMtcYtG1hqR78QU0wW+UIdtO4T6dliA6ImTwDrYdqEbxcQ9O/Q2wMKUn
         DiSmjTWHahil6rYfL8m5Bk0LPg9W/RX1bAcP4zlRlQm5GmEAYu2GQV9R9PkD7NN7Qf87
         5rXA==
X-Gm-Message-State: AC+VfDxC1WLz3/xN1SVOculekxjalAbjsVFzoWCGN1134uP9C5ymfDQJ
	lcIxePb4rfae5xuqdb2/QE3Dd59byABZEB8G8nurS3ZI
X-Google-Smtp-Source: ACHHUZ7h2Sab7Gk87613gS+IBZ0CqvipSDVvkNWgWfXT59a8zUwjqe/Y2MIaOLbFF9X9R620iGP8wFfqwZp6gMxs7L8=
X-Received: by 2002:a1c:7908:0:b0:3f4:2254:bd86 with SMTP id
 l8-20020a1c7908000000b003f42254bd86mr682228wme.8.1684483219956; Fri, 19 May
 2023 01:00:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230519072724.4192-1-thakur.virendra1810@gmail.com>
In-Reply-To: <20230519072724.4192-1-thakur.virendra1810@gmail.com>
From: virendra thakur <thakur.virendra1810@gmail.com>
Date: Fri, 19 May 2023 13:30:08 +0530
Message-ID: <CAJM8miXDSJ_wtX3F4eQzNm6hA+cRnk-ayx=bLDtw877Uh4XS7w@mail.gmail.com>
Subject: meta-virtualization][PATCH 2/7] lxc: Enable seccomp support for lxc
To: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000f4a82705fc074f1a"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 19 May 2023 08:00:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8066

--000000000000f4a82705fc074f1a
Content-Type: text/plain; charset="UTF-8"

From: sana kazi <sanakazisk19@gmail.com>

Enabled seccomp support for lxc.
Also added a patch to enable seccomp.profile only when compiled with
libseccomp. Currently, seccomp.profile is silently ignored. This
could lead to the false impression that the seccomp filter is
applied while it actually isn't.

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
(cherry picked from commit 88a8ccb980038b2b91056f7df7fe96bbcc2744d8)
Signed-off-by: virendra thakur <virendrak@kpit.com>
---
 ...omp_profile_when_compiled_libseccomp.patch | 46 +++++++++++++++++++
 recipes-containers/lxc/lxc_4.0.9.bb           |  2 +
 2 files changed, 48 insertions(+)
 create mode 100644
recipes-containers/lxc/files/enable_seccomp_profile_when_compiled_libseccomp.patch

diff --git
a/recipes-containers/lxc/files/enable_seccomp_profile_when_compiled_libseccomp.patch
b/recipes-containers/lxc/files/enable_seccomp_profile_when_compiled_libseccomp.patch
new file mode 100644
index 0000000..f0a5813
--- /dev/null
+++
b/recipes-containers/lxc/files/enable_seccomp_profile_when_compiled_libseccomp.patch
@@ -0,0 +1,46 @@
+From 3d46e1d1f8e904fddd4fab3e8d0c6cf57d2ddd4e Mon Sep 17 00:00:00 2001
+From: Maximilian Blenk <Maximilian.Blenk@bmw.de>
+Date: Mon, 23 Aug 2021 22:04:40 +0200
+Subject: [PATCH] config: enable seccomp profile only when compiled with
+ libseccomp
+
+Make lxc fail if seccomp.profile is specified but lxc is compiled
+without seccomp support. Currently, seccomp.profile is silently ignored
+if is specified in such a scenario. This could lead to the false
+impression that the seccomp filter is applied while it actually isn't.
+
+Signed-off-by: Maximilian Blenk <Maximilian.Blenk@bmw.de>
+---
+ src/lxc/confile.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+Upstream-Status: Submitted [
https://github.com/lxc/lxc/pull/3947/commits/3d46e1d1f8e904fddd4fab3e8d0c6cf57d2ddd4e
]
+
+diff --git a/src/lxc/confile.c b/src/lxc/confile.c
+index d8b96c6921..1cc8da15f1 100644
+--- a/src/lxc/confile.c
++++ b/src/lxc/confile.c
+@@ -1211,7 +1211,11 @@ static int set_config_seccomp_notify_proxy(const
char *key, const char *value,
+ static int set_config_seccomp_profile(const char *key, const char *value,
+                                     struct lxc_conf *lxc_conf, void *data)
+ {
++#ifdef HAVE_SECCOMP
+       return set_config_path_item(&lxc_conf->seccomp.seccomp, value);
++#else
++      return ret_set_errno(-1, ENOSYS);
++#endif
+ }
+
+ static int set_config_execute_cmd(const char *key, const char *value,
+@@ -4383,7 +4387,11 @@ static int get_config_seccomp_notify_proxy(const
char *key, char *retv, int inle
+ static int get_config_seccomp_profile(const char *key, char *retv, int
inlen,
+                                     struct lxc_conf *c, void *data)
+ {
++#ifdef HAVE_SECCOMP
+       return lxc_get_conf_str(retv, inlen, c->seccomp.seccomp);
++#else
++      return ret_errno(ENOSYS);
++#endif
+ }
+
+ static int get_config_autodev(const char *key, char *retv, int inlen,
diff --git a/recipes-containers/lxc/lxc_4.0.9.bb b/recipes-containers/lxc/
lxc_4.0.9.bb
index 7907291..8b165e2 100644
--- a/recipes-containers/lxc/lxc_4.0.9.bb
+++ b/recipes-containers/lxc/lxc_4.0.9.bb
@@ -49,6 +49,7 @@ SRC_URI = "
http://linuxcontainers.org/downloads/${BPN}/${BPN}-${PV}.tar.gz \
        file://tests-add-no-validate-when-using-download-template.patch \
        file://dnsmasq.conf \
        file://lxc-net \
+        file://enable_seccomp_profile_when_compiled_libseccomp.patch \
        "

 SRC_URI[md5sum] = "365fcca985038910e19a1e0fff15ed07"
@@ -72,6 +73,7 @@ EXTRA_OECONF += "--enable-log-src-basename
--disable-werror"
 PACKAGECONFIG ??= "templates \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', 'seccomp', '', d)} \
 "
 PACKAGECONFIG[doc] = "--enable-doc --enable-api-docs,--disable-doc
--disable-api-docs,,"
 PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath,,"
-- 
2.17.1

--000000000000f4a82705fc074f1a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote">From: sana kazi &lt;<a hr=
ef=3D"mailto:sanakazisk19@gmail.com" target=3D"_blank" rel=3D"noreferrer">s=
anakazisk19@gmail.com</a>&gt;<br>
<br>
Enabled seccomp support for lxc.<br>
Also added a patch to enable seccomp.profile only when compiled with<br>
libseccomp. Currently, seccomp.profile is silently ignored. This<br>
could lead to the false impression that the seccomp filter is<br>
applied while it actually isn&#39;t.<br>
<br>
Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com" target=
=3D"_blank" rel=3D"noreferrer">Sana.Kazi@kpit.com</a>&gt;<br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.co=
m" target=3D"_blank" rel=3D"noreferrer">bruce.ashfield@gmail.com</a>&gt;<br=
>
(cherry picked from commit 88a8ccb980038b2b91056f7df7fe96bbcc2744d8)<br>
Signed-off-by: virendra thakur &lt;<a href=3D"mailto:virendrak@kpit.com" ta=
rget=3D"_blank" rel=3D"noreferrer">virendrak@kpit.com</a>&gt;<br>
---<br>
=C2=A0...omp_profile_when_compiled_libseccomp.patch | 46 ++++++++++++++++++=
+<br>
=C2=A0recipes-containers/lxc/<a href=3D"http://lxc_4.0.9.bb" rel=3D"norefer=
rer noreferrer" target=3D"_blank">lxc_4.0.9.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 2 +<br>
=C2=A02 files changed, 48 insertions(+)<br>
=C2=A0create mode 100644 recipes-containers/lxc/files/enable_seccomp_profil=
e_when_compiled_libseccomp.patch<br>
<br>
diff --git a/recipes-containers/lxc/files/enable_seccomp_profile_when_compi=
led_libseccomp.patch b/recipes-containers/lxc/files/enable_seccomp_profile_=
when_compiled_libseccomp.patch<br>
new file mode 100644<br>
index 0000000..f0a5813<br>
--- /dev/null<br>
+++ b/recipes-containers/lxc/files/enable_seccomp_profile_when_compiled_lib=
seccomp.patch<br>
@@ -0,0 +1,46 @@<br>
+From 3d46e1d1f8e904fddd4fab3e8d0c6cf57d2ddd4e Mon Sep 17 00:00:00 2001<br>
+From: Maximilian Blenk &lt;<a href=3D"mailto:Maximilian.Blenk@bmw.de" targ=
et=3D"_blank" rel=3D"noreferrer">Maximilian.Blenk@bmw.de</a>&gt;<br>
+Date: Mon, 23 Aug 2021 22:04:40 +0200<br>
+Subject: [PATCH] config: enable seccomp profile only when compiled with<br=
>
+ libseccomp<br>
+<br>
+Make lxc fail if seccomp.profile is specified but lxc is compiled<br>
+without seccomp support. Currently, seccomp.profile is silently ignored<br=
>
+if is specified in such a scenario. This could lead to the false<br>
+impression that the seccomp filter is applied while it actually isn&#39;t.=
<br>
+<br>
+Signed-off-by: Maximilian Blenk &lt;<a href=3D"mailto:Maximilian.Blenk@bmw=
.de" target=3D"_blank" rel=3D"noreferrer">Maximilian.Blenk@bmw.de</a>&gt;<b=
r>
+---<br>
+ src/lxc/confile.c | 8 ++++++++<br>
+ 1 file changed, 8 insertions(+)<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/lxc/lxc/pull/394=
7/commits/3d46e1d1f8e904fddd4fab3e8d0c6cf57d2ddd4e" rel=3D"noreferrer noref=
errer" target=3D"_blank">https://github.com/lxc/lxc/pull/3947/commits/3d46e=
1d1f8e904fddd4fab3e8d0c6cf57d2ddd4e</a>]<br>
+<br>
+diff --git a/src/lxc/confile.c b/src/lxc/confile.c<br>
+index d8b96c6921..1cc8da15f1 100644<br>
+--- a/src/lxc/confile.c<br>
++++ b/src/lxc/confile.c<br>
+@@ -1211,7 +1211,11 @@ static int set_config_seccomp_notify_proxy(const ch=
ar *key, const char *value,<br>
+ static int set_config_seccomp_profile(const char *key, const char *value,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct lxc_conf =
*lxc_conf, void *data)<br>
+ {<br>
++#ifdef HAVE_SECCOMP<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return set_config_path_item(&amp;lxc_conf-&gt;s=
eccomp.seccomp, value);<br>
++#else<br>
++=C2=A0 =C2=A0 =C2=A0 return ret_set_errno(-1, ENOSYS);<br>
++#endif<br>
+ }<br>
+ <br>
+ static int set_config_execute_cmd(const char *key, const char *value,<br>
+@@ -4383,7 +4387,11 @@ static int get_config_seccomp_notify_proxy(const ch=
ar *key, char *retv, int inle<br>
+ static int get_config_seccomp_profile(const char *key, char *retv, int in=
len,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct lxc_conf =
*c, void *data)<br>
+ {<br>
++#ifdef HAVE_SECCOMP<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return lxc_get_conf_str(retv, inlen, c-&gt;secc=
omp.seccomp);<br>
++#else<br>
++=C2=A0 =C2=A0 =C2=A0 return ret_errno(ENOSYS);<br>
++#endif<br>
+ }<br>
+ <br>
+ static int get_config_autodev(const char *key, char *retv, int inlen,<br>
diff --git a/recipes-containers/lxc/<a href=3D"http://lxc_4.0.9.bb" rel=3D"=
noreferrer noreferrer" target=3D"_blank">lxc_4.0.9.bb</a> b/recipes-contain=
ers/lxc/<a href=3D"http://lxc_4.0.9.bb" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">lxc_4.0.9.bb</a><br>
index 7907291..8b165e2 100644<br>
--- a/recipes-containers/lxc/<a href=3D"http://lxc_4.0.9.bb" rel=3D"norefer=
rer noreferrer" target=3D"_blank">lxc_4.0.9.bb</a><br>
+++ b/recipes-containers/lxc/<a href=3D"http://lxc_4.0.9.bb" rel=3D"norefer=
rer noreferrer" target=3D"_blank">lxc_4.0.9.bb</a><br>
@@ -49,6 +49,7 @@ SRC_URI =3D &quot;<a href=3D"http://linuxcontainers.org/d=
ownloads/$%7BBPN%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer noreferr=
er" target=3D"_blank">http://linuxcontainers.org/downloads/${BPN}/${BPN}-${=
PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://tests-add-no-validate-when-using-downloa=
d-template.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://dnsmasq.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lxc-net \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://enable_seccomp_profile_when_compiled_li=
bseccomp.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;365fcca985038910e19a1e0fff15ed07&quot;<br>
@@ -72,6 +73,7 @@ EXTRA_OECONF +=3D &quot;--enable-log-src-basename --disab=
le-werror&quot;<br>
=C2=A0PACKAGECONFIG ??=3D &quot;templates \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;sy=
stemd&#39;, &#39;systemd&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;se=
linux&#39;, &#39;selinux&#39;, &#39;&#39;, d)} \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;seccomp=
&#39;, &#39;seccomp&#39;, &#39;&#39;, d)} \<br>
=C2=A0&quot;<br>
=C2=A0PACKAGECONFIG[doc] =3D &quot;--enable-doc --enable-api-docs,--disable=
-doc --disable-api-docs,,&quot;<br>
=C2=A0PACKAGECONFIG[rpath] =3D &quot;--enable-rpath,--disable-rpath,,&quot;=
<br>
-- <br>
2.17.1<br>
<br>
</div></div></div>

--000000000000f4a82705fc074f1a--

