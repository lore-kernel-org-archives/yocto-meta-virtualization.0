Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD13C4345F
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 01:29:18 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.8638.1713749356724174388
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 21 Apr 2024 18:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZpsrxLSY;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6edc61d0ff6so3879351b3a.2
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 21 Apr 2024 18:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713749356; x=1714354156; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pJGGzrOWRKDs42s4N8z4QPFs1phZlEDa5UD4tDGKmWo=;
        b=ZpsrxLSYLXAQf7vgKipXZEP4EfhMKCWpKTeXZmphIIPexo+ESHJOrESn6J0d4Vtc1/
         qlcf8AFlJdWHhUCfcReesRbm7fCb+IY2vmoANTaL2b4nktJ44XvJ4S9TPBhLchWXOPOB
         Ycx4FFEEycZDVgxUUFkk3AhzYo5BleugvK8hyNLe1TaSF1IxtoqcenIBuZUo5KqlKdg2
         6q+e4NYB8LF1IyifjJ4pwtCiatzrglCvqpLRhDv5xyMoOdu8n93zytha8pZ7YkbdfD9B
         kYJF4VmLGj+fpZLUOleqcEb0QkNcIA9HwtcgekYZRYE96WRSvObwEW0oql0jLLUV2EjO
         KFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713749356; x=1714354156;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pJGGzrOWRKDs42s4N8z4QPFs1phZlEDa5UD4tDGKmWo=;
        b=a2If9n56LG1NN88AtAy7bTuzUVfzeE7S4xYHjEzqo3GjLBxzaeBo4lIouSpU87oszH
         TKaQbrsocuCZ3xkbtdCD8CwaIfawqEVmokGDr8vQBhJBGTvG9E5XW0+1SgE0IPyCWhkf
         fY4Yl/Cz5O4a0oUe9M42lLFRPqI81xB185mRZFhSkG+xTcfHVz7XFfG28OG98/TWrs0p
         fgW41ha2S+af3UHNfUIakQcfDI7ZiOoqF/Ol/XgpXWEJbGYmLI0j4/Vo7VC+QoPK3lCz
         HQZ2XC8pbq7i/5IaDWITg56kM24jfRE3ZGvGlFq4tsQTyNftjQTznG5qJ0Mx155LncS/
         nv4w==
X-Gm-Message-State: AOJu0YxWNjp5jDYtIZoBSGKTxx8L2b3R/cJVV3dwX/6haAwVTFfVZZuy
	dhgVo5TGhZFc5JYXV/tF/XnIirSuzhWUEjpn6+15pdcGKCh7pLgR9wwlHsafQcMjR+YGuxApey6
	KMtG0gHnZiNGGBjGpW5Nn+/irn18=
X-Google-Smtp-Source: AGHT+IF/aQyacVT8VsD7/dpqrJ9YVPo7WO8eKOev3oYMsepMyfN/ec13dylqkXOY5AjRWKBdxrdKsaPrma1ao28w4cE=
X-Received: by 2002:a05:6a20:a123:b0:1a7:892b:5f89 with SMTP id
 q35-20020a056a20a12300b001a7892b5f89mr12778530pzk.11.1713749355745; Sun, 21
 Apr 2024 18:29:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240420072917.914160-1-martin.jansa@gmail.com>
In-Reply-To: <20240420072917.914160-1-martin.jansa@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 21 Apr 2024 21:29:04 -0400
Message-ID: <CADkTA4O0aONd4+4u4ZnTTiDNv2CqoQZvUVKSZM=5Dk08QpWDog@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCHv2] diod: Build in 32bit systems with
 64bit time_t
To: martin.jansa@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org, Ola x Nilsson <olani@axis.com>
Content-Type: multipart/alternative; boundary="000000000000955be50616a55d40"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Apr 2024 01:29:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8688

--000000000000955be50616a55d40
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 20, 2024 at 3:29=E2=80=AFAM Martin Jansa via lists.yoctoproject=
.org
<martin.jansa=3Dgmail.com@lists.yoctoproject.org> wrote:

> From: Ola x Nilsson <olani@axis.com>
>
> Signed-off-by: Ola x Nilsson <olani@axis.com>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
> v2: just fixed Author
>
>
While I appreciate the fix,  I'm going to wait until Ola ack's this, as I
need to know that their setup is fixed so that future patches have a
correct author field.

Otherwise, we are just pushing the issue of their configuration down the
road.

Bruce



>  recipes-extended/diod/diod_1.0.24.bb          |   1 +
>  ...ous-time_t-sizes-in-printf-and-scanf.patch | 100 ++++++++++++++++++
>  2 files changed, 101 insertions(+)
>  create mode 100644
> recipes-extended/diod/files/0002-Handle-various-time_t-sizes-in-printf-an=
d-scanf.patch
>
> diff --git a/recipes-extended/diod/diod_1.0.24.bb b/recipes-extended/diod=
/
> diod_1.0.24.bb
> index 5e191dc0..6019fbfb 100644
> --- a/recipes-extended/diod/diod_1.0.24.bb
> +++ b/recipes-extended/diod/diod_1.0.24.bb
> @@ -14,6 +14,7 @@ SRC_URI =3D "git://
> github.com/chaos/diod.git;protocol=3Dhttps;branch=3Dmaster \
>             file://diod \
>             file://diod.conf \
>             file://0001-build-Find-lua-with-pkg-config.patch \
> +
>  file://0002-Handle-various-time_t-sizes-in-printf-and-scanf.patch \
>             "
>  DEPENDS =3D "libcap ncurses tcp-wrappers lua"
>
> diff --git
> a/recipes-extended/diod/files/0002-Handle-various-time_t-sizes-in-printf-=
and-scanf.patch
> b/recipes-extended/diod/files/0002-Handle-various-time_t-sizes-in-printf-=
and-scanf.patch
> new file mode 100644
> index 00000000..3c13c101
> --- /dev/null
> +++
> b/recipes-extended/diod/files/0002-Handle-various-time_t-sizes-in-printf-=
and-scanf.patch
> @@ -0,0 +1,100 @@
> +From 04b0c5a5cb9e32090b177ff7327ad3260783abe0 Mon Sep 17 00:00:00 2001
> +From: Ola x Nilsson <olani@axis.com>
> +Date: Mon, 15 Apr 2024 17:31:44 +0200
> +Subject: [PATCH] Handle various time_t sizes in printf and scanf
> +
> +The members of the timeval struct are both signed (defined by POSIX)
> +and typically both 64 bits on a system where time_t is 64 bits.  This
> +is possible also on 32 bit systems where time_t is larger to handle
> +the 2038 problem.
> +
> +It's practically impossible to find a type and printf format that
> +works even on all glibc systems.  Play it safe and always use printf
> +with intmax_t and explict int64_t variables for scanf.
> +
> +Upstream-Status: Submitted [https://github.com/chaos/diod/pull/100]
> +Signed-off-by: Ola x Nilsson <olani@axis.com>
> +---
> + libnpfs/conn.c   | 5 +++--
> + libnpfs/ctl.c    | 7 ++++---
> + utils/dioddate.c | 8 +++++++-
> + 3 files changed, 14 insertions(+), 6 deletions(-)
> +
> +diff --git a/libnpfs/conn.c b/libnpfs/conn.c
> +index 6e85fff..c34c840 100644
> +--- a/libnpfs/conn.c
> ++++ b/libnpfs/conn.c
> +@@ -16,6 +16,7 @@
> + #include <stdio.h>
> + #include <string.h>
> + #include <stdint.h>
> ++#include <inttypes.h>
> + #include <stdarg.h>
> + #include <errno.h>
> + #include <pthread.h>
> +@@ -133,8 +134,8 @@ _debug_trace (Npsrv *srv, Npfcall *fc)
> +                               (void)gettimeofday(&b, NULL);
> +                       (void)gettimeofday(&a, NULL);
> +                       timersub(&a, &b, &c);
> +-                      np_logmsg(srv, "[%lu.%-3lu] %s",
> +-                                c.tv_sec, c.tv_usec/1000, s);
> ++                      np_logmsg(srv, "[%"PRIdMAX".%-3"PRIdMAX"] %s",
> ++                                (intmax_t)c.tv_sec,
> (intmax_t)c.tv_usec/1000, s);
> +               } else
> +                       np_logmsg(srv, "%s", s);
> +       }
> +diff --git a/libnpfs/ctl.c b/libnpfs/ctl.c
> +index f40cde4..317a22e 100644
> +--- a/libnpfs/ctl.c
> ++++ b/libnpfs/ctl.c
> +@@ -16,6 +16,7 @@
> + #include <stdio.h>
> + #include <string.h>
> + #include <stdint.h>
> ++#include <inttypes.h>
> + #include <stdarg.h>
> + #include <pthread.h>
> + #include <errno.h>
> +@@ -291,9 +292,9 @@ _ctl_get_date (char *name, void *a)
> +               np_uerror (errno);
> +               goto error;
> +       }
> +-      if (aspf (&s, &len, "%lu.%lu %d.%d\n",
> +-                                      tv.tv_sec,         tv.tv_usec,
> +-                                      tz.tz_minuteswest, tz.tz_dsttime)
> < 0) {
> ++      if (aspf (&s, &len, "%"PRIdMAX".%"PRIdMAX" %d.%d\n",
> ++                                      (uintmax_t)tv.tv_sec,
> (uintmax_t)tv.tv_usec,
> ++                                      tz.tz_minuteswest,
> tz.tz_dsttime) < 0) {
> +               np_uerror (ENOMEM);
> +               goto error;
> +       }
> +diff --git a/utils/dioddate.c b/utils/dioddate.c
> +index bde002f..f392792 100644
> +--- a/utils/dioddate.c
> ++++ b/utils/dioddate.c
> +@@ -21,6 +21,7 @@
> + #include <unistd.h>
> + #include <stdlib.h>
> + #include <stdint.h>
> ++#include <inttypes.h>
> + #include <stdarg.h>
> + #include <stdio.h>
> + #if HAVE_GETOPT_H
> +@@ -142,11 +143,16 @@ main (int argc, char *argv[])
> +         errn (np_rerror (), "error reading date");
> +         goto done;
> +     }
> +-    if (sscanf (buf, "%lu.%lu %d.%d", &tv.tv_sec, &tv.tv_usec,
> ++
> ++    int64_t sec =3D 0, usec =3D 0;
> ++    if (sscanf (buf, "%"SCNd64".%"SCNd64" %d.%d", &sec, &usec,
> +                                     &tz.tz_minuteswest, &tz.tz_dsttime)
> !=3D 4) {
> +         msg ("error scanning returned date: %s", buf);
> +         goto done;
> +     }
> ++    tv.tv_sec =3D sec;
> ++    tv.tv_usec =3D usec;
> ++
> +     if (Sopt) {
> +         if (settimeofday (&tv, &tz) < 0)
> +             err_exit ("settimeofday");
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8686):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8686
> Mute This Topic: https://lists.yoctoproject.org/mt/105632595/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000955be50616a55d40
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sat, Apr 20, 2024 at 3:29=E2=80=AFAM Martin Jans=
a via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> =
&lt;martin.jansa=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org">gmai=
l.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">From: Ola x Nilsson &lt;<a href=3D"mailto:olani=
@axis.com" target=3D"_blank">olani@axis.com</a>&gt;<br>
<br>
Signed-off-by: Ola x Nilsson &lt;<a href=3D"mailto:olani@axis.com" target=
=3D"_blank">olani@axis.com</a>&gt;<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" t=
arget=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
---<br>
v2: just fixed Author<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">While I appreciate the fix,=C2=A0 I&#39;m going to wait un=
til=C2=A0Ola ack&#39;s this, as I need to know that their setup is fixed so=
 that future patches have a correct author field.</div></div><div class=3D"=
gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">Otherwise, we are just pushing the issue of =
their configuration down the road.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Bruce</div><div><br></div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
=C2=A0recipes-extended/diod/<a href=3D"http://diod_1.0.24.bb" rel=3D"norefe=
rrer" target=3D"_blank">diod_1.0.24.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0...ous-time_t-sizes-in-printf-and-scanf.patch | 100 +++++++++++++++++=
+<br>
=C2=A02 files changed, 101 insertions(+)<br>
=C2=A0create mode 100644 recipes-extended/diod/files/0002-Handle-various-ti=
me_t-sizes-in-printf-and-scanf.patch<br>
<br>
diff --git a/recipes-extended/diod/<a href=3D"http://diod_1.0.24.bb" rel=3D=
"noreferrer" target=3D"_blank">diod_1.0.24.bb</a> b/recipes-extended/diod/<=
a href=3D"http://diod_1.0.24.bb" rel=3D"noreferrer" target=3D"_blank">diod_=
1.0.24.bb</a><br>
index 5e191dc0..6019fbfb 100644<br>
--- a/recipes-extended/diod/<a href=3D"http://diod_1.0.24.bb" rel=3D"norefe=
rrer" target=3D"_blank">diod_1.0.24.bb</a><br>
+++ b/recipes-extended/diod/<a href=3D"http://diod_1.0.24.bb" rel=3D"norefe=
rrer" target=3D"_blank">diod_1.0.24.bb</a><br>
@@ -14,6 +14,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/chao=
s/diod.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_=
blank">github.com/chaos/diod.git;protocol=3Dhttps;branch=3Dmaster</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://diod \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://diod.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-build-Find-lua-with-p=
kg-config.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Handle-various-time_t=
-sizes-in-printf-and-scanf.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0DEPENDS =3D &quot;libcap ncurses tcp-wrappers lua&quot;<br>
<br>
diff --git a/recipes-extended/diod/files/0002-Handle-various-time_t-sizes-i=
n-printf-and-scanf.patch b/recipes-extended/diod/files/0002-Handle-various-=
time_t-sizes-in-printf-and-scanf.patch<br>
new file mode 100644<br>
index 00000000..3c13c101<br>
--- /dev/null<br>
+++ b/recipes-extended/diod/files/0002-Handle-various-time_t-sizes-in-print=
f-and-scanf.patch<br>
@@ -0,0 +1,100 @@<br>
+From 04b0c5a5cb9e32090b177ff7327ad3260783abe0 Mon Sep 17 00:00:00 2001<br>
+From: Ola x Nilsson &lt;<a href=3D"mailto:olani@axis.com" target=3D"_blank=
">olani@axis.com</a>&gt;<br>
+Date: Mon, 15 Apr 2024 17:31:44 +0200<br>
+Subject: [PATCH] Handle various time_t sizes in printf and scanf<br>
+<br>
+The members of the timeval struct are both signed (defined by POSIX)<br>
+and typically both 64 bits on a system where time_t is 64 bits.=C2=A0 This=
<br>
+is possible also on 32 bit systems where time_t is larger to handle<br>
+the 2038 problem.<br>
+<br>
+It&#39;s practically impossible to find a type and printf format that<br>
+works even on all glibc systems.=C2=A0 Play it safe and always use printf<=
br>
+with intmax_t and explict int64_t variables for scanf.<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/chaos/diod/pull/=
100" rel=3D"noreferrer" target=3D"_blank">https://github.com/chaos/diod/pul=
l/100</a>]<br>
+Signed-off-by: Ola x Nilsson &lt;<a href=3D"mailto:olani@axis.com" target=
=3D"_blank">olani@axis.com</a>&gt;<br>
+---<br>
+ libnpfs/conn.c=C2=A0 =C2=A0| 5 +++--<br>
+ libnpfs/ctl.c=C2=A0 =C2=A0 | 7 ++++---<br>
+ utils/dioddate.c | 8 +++++++-<br>
+ 3 files changed, 14 insertions(+), 6 deletions(-)<br>
+<br>
+diff --git a/libnpfs/conn.c b/libnpfs/conn.c<br>
+index 6e85fff..c34c840 100644<br>
+--- a/libnpfs/conn.c<br>
++++ b/libnpfs/conn.c<br>
+@@ -16,6 +16,7 @@<br>
+ #include &lt;stdio.h&gt;<br>
+ #include &lt;string.h&gt;<br>
+ #include &lt;stdint.h&gt;<br>
++#include &lt;inttypes.h&gt;<br>
+ #include &lt;stdarg.h&gt;<br>
+ #include &lt;errno.h&gt;<br>
+ #include &lt;pthread.h&gt;<br>
+@@ -133,8 +134,8 @@ _debug_trace (Npsrv *srv, Npfcall *fc)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void)gettimeofday(&amp;b, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(void)gettimeofday(&amp;a, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0timersub(&amp;a, &amp;b, &amp;c);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 np_logmsg(srv, &quot;[%lu.%-3lu] %s&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c.tv_sec, c.tv_usec/1000, s);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 np_logmsg(srv, &quot;[%&quot;PRIdMAX&quot;.%-3&quot;PRIdMAX&quot;] %s&q=
uot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (intmax_t)c.tv_sec, (intmax_t)c.tv_u=
sec/1000, s);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0np_logmsg(srv, &quot;%s&quot;, s);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+diff --git a/libnpfs/ctl.c b/libnpfs/ctl.c<br>
+index f40cde4..317a22e 100644<br>
+--- a/libnpfs/ctl.c<br>
++++ b/libnpfs/ctl.c<br>
+@@ -16,6 +16,7 @@<br>
+ #include &lt;stdio.h&gt;<br>
+ #include &lt;string.h&gt;<br>
+ #include &lt;stdint.h&gt;<br>
++#include &lt;inttypes.h&gt;<br>
+ #include &lt;stdarg.h&gt;<br>
+ #include &lt;pthread.h&gt;<br>
+ #include &lt;errno.h&gt;<br>
+@@ -291,9 +292,9 @@ _ctl_get_date (char *name, void *a)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0np_uerror (errno);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 if (aspf (&amp;s, &amp;len, &quot;%lu.%lu %d.%d\n&qu=
ot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tv.tv_sec,=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tv.tv_usec,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tz.tz_minuteswe=
st, tz.tz_dsttime) &lt; 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 if (aspf (&amp;s, &amp;len, &quot;%&quot;PRIdMAX&quo=
t;.%&quot;PRIdMAX&quot; %d.%d\n&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (uintmax_t)tv.t=
v_sec, (uintmax_t)tv.tv_usec,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tz.tz_minuteswe=
st,=C2=A0 =C2=A0 tz.tz_dsttime) &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0np_uerror (ENOMEM);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+diff --git a/utils/dioddate.c b/utils/dioddate.c<br>
+index bde002f..f392792 100644<br>
+--- a/utils/dioddate.c<br>
++++ b/utils/dioddate.c<br>
+@@ -21,6 +21,7 @@<br>
+ #include &lt;unistd.h&gt;<br>
+ #include &lt;stdlib.h&gt;<br>
+ #include &lt;stdint.h&gt;<br>
++#include &lt;inttypes.h&gt;<br>
+ #include &lt;stdarg.h&gt;<br>
+ #include &lt;stdio.h&gt;<br>
+ #if HAVE_GETOPT_H<br>
+@@ -142,11 +143,16 @@ main (int argc, char *argv[])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errn (np_rerror (), &quot;error reading =
date&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto done;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 if (sscanf (buf, &quot;%lu.%lu %d.%d&quot;, &amp;tv.tv_sec,=
 &amp;tv.tv_usec,<br>
++<br>
++=C2=A0 =C2=A0 int64_t sec =3D 0, usec =3D 0;<br>
++=C2=A0 =C2=A0 if (sscanf (buf, &quot;%&quot;SCNd64&quot;.%&quot;SCNd64&qu=
ot; %d.%d&quot;, &amp;sec, &amp;usec,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;tz.tz_minut=
eswest, &amp;tz.tz_dsttime) !=3D 4) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg (&quot;error scanning returned date:=
 %s&quot;, buf);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto done;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 tv.tv_sec =3D sec;<br>
++=C2=A0 =C2=A0 tv.tv_usec =3D usec;<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0if (Sopt) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (settimeofday (&amp;tv, &amp;tz) &lt;=
 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err_exit (&quot;settimeofd=
ay&quot;);<br>
-- <br>
2.44.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8686): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8686" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8686</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/105632595/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/105632595/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--000000000000955be50616a55d40--

