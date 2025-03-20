Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3DE3C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 19:28:44 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.3750.1742498919561724426
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 12:28:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QbGT+5xD;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ff784dc055so2228094a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Mar 2025 12:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742498919; x=1743103719; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wUoxTXvrWM5OnkSD/PaFBbF284W/mkctp8CJaLpDxHc=;
        b=QbGT+5xDjYwWsXGxylzo0QMDHJ/l67BmL3iSQhwgvuInFg+oR0MbuoeY7Nfpgzpg/t
         gLgqyYm80hleA4SXo4VaVH8vF/x2W62diaorhJSqmpUc0dTZJmfGJBC5iLr+pDxeivWS
         gMpAu8K3wjxjFf8WmN5csCLUFCHDIov37RNACp45mDni8qDMyMICl/ddkvNOxcu1W1iK
         pKEdVT8danI1VlmWAHysKXQ3vcbF7IkzMxvfskXZ2sYTJv0ZtMxUgLORNikIqiz7n0OT
         ochu3vNfcalW54E/2aXOZig6O5f1/zL6wDj450P2lNIwyM6fFC9UPMUyFcUPum127TOq
         f8Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742498919; x=1743103719;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wUoxTXvrWM5OnkSD/PaFBbF284W/mkctp8CJaLpDxHc=;
        b=Dlaf2PxIlby8CSzEntQu5oTawDLCCJNil26aVj16i4H1K9Sw0zcEChOfi7jlf3LUFb
         WYNy4+CDzLYwLDhNvhNqHISciWhNuyZicHUNqK0KIvD7ZyQErBGcn7vZonNJplztaw6h
         hTvZ1+1Rr6/8itfDTinvFc7fTbyg1Tgz9Iu8xZi6EwIDT8hnEBGJbMGsl3NxrXmaa2Eq
         SE0Vwo7OO4oxxInQdMFyos21BLhofogfQTp2pxHXnVRUtM5Mo58ZZ3t3wxlCsIz1jJy2
         r9zm6P26Kx2fe4DDqX9kvLv6tQs7EpF+D+OGQJR1wHj5RWfQ9ajMeJW9ILS4dHL5UFwK
         N5HQ==
X-Gm-Message-State: AOJu0Yxsi+N+UVcWfxqsou0xjHZqSaqSpi7qK9utFcoOj2Hf8n9C/NnF
	TUIAL2VV57GHpTIVMER4ONW90pgBYAZJfkF2KdkOBQAURJt8C+p0f5su16/Ebqe0WBpUl1Yn7hl
	x/d5feMotyO16ATpIeHrY+/pwTMY=
X-Gm-Gg: ASbGncuTKt/UAnnnDRzWDTUcfs8FMvrD/9ta1oGkSfLHZX4STlQIGf2gheagMLcuLag
	QmWDAq4Kz6NUvSOuwrH4wO3zxEQy8DeSdSNOD/eU+WV3fhXg9heEkdkIbytrg8AgrPlagm85aQf
	W1gKZFKYzRYbT+ZpK1Ml1stQXATAko5w27ag5cVw==
X-Google-Smtp-Source: AGHT+IGyigHcX2GgU5QVrdCBt4Hj2KHQDHSIdPC5wUoSSZVEbSuf4gGzIlEQM75Msidwqg8SgR9gsUv1/1xxdAfCshQ=
X-Received: by 2002:a17:90b:2703:b0:2ff:5a9d:937f with SMTP id
 98e67ed59e1d1-3030fefb7ddmr611521a91.24.1742498918641; Thu, 20 Mar 2025
 12:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250309234817.579683-1-dp.min@lge.com>
In-Reply-To: <20250309234817.579683-1-dp.min@lge.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 20 Mar 2025 15:28:27 -0400
X-Gm-Features: AQ5f1Jr4NKWiC2EFTHfUN9fplhzKHO4H21NNYBEi0d2z6f31viXzUec1jCRWGdc
Message-ID: <CADkTA4PMUHCZYWYFN-_JFXocLk54Ar1f89ydtXRsSXLZ_biz7Q@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] tini: Support posix basename from
 musl libc
To: dpmin7@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org, Kyungjik Min <dp.min@lge.com>
Content-Type: multipart/alternative; boundary="0000000000001150f50630cb251e"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Mar 2025 19:28:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9166

--0000000000001150f50630cb251e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I haven't forgotten about this, I'm just overloaded trying to complete some
package upgrades and will get to pending patches shortly.

Bruce

On Sun, Mar 9, 2025 at 7:48=E2=80=AFPM Kyungjik Min via lists.yoctoproject.=
org
<dpmin7=3Dgmail.com@lists.yoctoproject.org> wrote:

> This fixes building with musl libc.
>
> Signed-off-by: Kyungjik Min <dpmin7@gmail.com>
> ---
>  ...upport-POSIX-basename-from-musl-libc.patch | 76 +++++++++++++++++++
>  recipes-containers/tini/tini_0.19.0.bb        |  1 +
>  2 files changed, 77 insertions(+)
>  create mode 100644
> recipes-containers/tini/tini/0001-Support-POSIX-basename-from-musl-libc.p=
atch
>
> diff --git
> a/recipes-containers/tini/tini/0001-Support-POSIX-basename-from-musl-libc=
.patch
> b/recipes-containers/tini/tini/0001-Support-POSIX-basename-from-musl-libc=
.patch
> new file mode 100644
> index 00000000..b504c37a
> --- /dev/null
> +++
> b/recipes-containers/tini/tini/0001-Support-POSIX-basename-from-musl-libc=
.patch
> @@ -0,0 +1,76 @@
> +From 10479a6eef32f8e64fd5bf894dee9c7a6f21ce4c Mon Sep 17 00:00:00 2001
> +From: Hauke Mehrtens <hauke@hauke-m.de>
> +Date: Sun, 14 Apr 2024 15:33:51 +0200
> +Subject: [PATCH] Support POSIX basename() from musl libc
> +
> +Musl libc 1.2.5 removed the definition of the basename() function from
> +string.h and only provides it in libgen.h as the POSIX standard
> +defines it.
> +
> +This change fixes compilation with musl libc 1.2.5.
> +````
> +build_dir/target-mips_24kc_musl/tini-0.19.0/src/tini.c:227:36: error:
> implicit declaration of function 'basename'
> [-Wimplicit-function-declaration]
> +  227 |         fprintf(file, "%s (%s)\n", basename(name),
> TINI_VERSION_STRING);
> +build_dir/target-mips_24kc_musl/tini-0.19.0/src/tini.c:227:25: error:
> format '%s' expects argument of type 'char *', but argument 3 has type
> 'int' [-Werror=3Dformat=3D]
> +  227 |         fprintf(file, "%s (%s)\n", basename(name),
> TINI_VERSION_STRING);
> +      |                        ~^          ~~~~~~~~~~~~~~
> +      |                         |          |
> +      |                         char *     int
> +      |                        %d
> +
> +````
> +
> +basename() modifies the input string, copy it first with strdup(), If
> +strdup() returns NULL the code will handle it.
> +
> +Upstream-Status: Submitted [https://github.com/krallin/tini/pull/223]
> +
> +Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> +---
> + src/tini.c | 15 +++++++++++----
> + 1 file changed, 11 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/tini.c b/src/tini.c
> +index 7914d3a..41d1506 100644
> +--- a/src/tini.c
> ++++ b/src/tini.c
> +@@ -14,6 +14,7 @@
> + #include <stdlib.h>
> + #include <unistd.h>
> + #include <stdbool.h>
> ++#include <libgen.h>
> +
> + #include "tiniConfig.h"
> + #include "tiniLicense.h"
> +@@ -224,14 +225,19 @@ int spawn(const signal_configuration_t* const
> sigconf_ptr, char* const argv[], i
> + }
> +
> + void print_usage(char* const name, FILE* const file) {
> +-      fprintf(file, "%s (%s)\n", basename(name), TINI_VERSION_STRING);
> ++      char *dirc, *bname;
> ++
> ++      dirc =3D strdup(name);
> ++      bname =3D basename(dirc);
> ++
> ++      fprintf(file, "%s (%s)\n", bname, TINI_VERSION_STRING);
> +
> + #if TINI_MINIMAL
> +-      fprintf(file, "Usage: %s PROGRAM [ARGS] | --version\n\n",
> basename(name));
> ++      fprintf(file, "Usage: %s PROGRAM [ARGS] | --version\n\n", bname);
> + #else
> +-      fprintf(file, "Usage: %s [OPTIONS] PROGRAM -- [ARGS] |
> --version\n\n", basename(name));
> ++      fprintf(file, "Usage: %s [OPTIONS] PROGRAM -- [ARGS] |
> --version\n\n", bname);
> + #endif
> +-      fprintf(file, "Execute a program under the supervision of a valid
> init process (%s)\n\n", basename(name));
> ++      fprintf(file, "Execute a program under the supervision of a valid
> init process (%s)\n\n", bname);
> +
> +       fprintf(file, "Command line options:\n\n");
> +
> +@@ -261,6 +267,7 @@ void print_usage(char* const name, FILE* const file)=
 {
> +       fprintf(file, "  %s: Send signals to the child's process
> group.\n", KILL_PROCESS_GROUP_GROUP_ENV_VAR);
> +
> +       fprintf(file, "\n");
> ++      free(dirc);
> + }
> +
> + void print_license(FILE* const file) {
> diff --git a/recipes-containers/tini/tini_0.19.0.bb
> b/recipes-containers/tini/tini_0.19.0.bb
> index fd90f620..1f3ae8b2 100644
> --- a/recipes-containers/tini/tini_0.19.0.bb
> +++ b/recipes-containers/tini/tini_0.19.0.bb
> @@ -9,6 +9,7 @@ SRC_URI =3D " \
>    git://github.com/krallin/tini.git;branch=3Dmaster;protocol=3Dhttps \
>    file://0001-Do-not-strip-the-output-binary-allow-yocto-to-do-thi.patch=
 \
>    file://0001-tini.c-a-function-declaration-without-a-prototype-is.patch=
 \
> +  file://0001-Support-POSIX-basename-from-musl-libc.patch \
>    "
>
>  LICENSE =3D "MIT"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9160):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9160
> Mute This Topic: https://lists.yoctoproject.org/mt/111610536/1050810
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

--0000000000001150f50630cb251e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">I h=
aven&#39;t forgotten about this, I&#39;m just overloaded trying to complete=
 some package upgrades and will get to pending patches shortly.</div><div c=
lass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small">Bruce</div></div><br><div class=3D"g=
mail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On =
Sun, Mar 9, 2025 at 7:48=E2=80=AFPM Kyungjik Min via <a href=3D"http://list=
s.yoctoproject.org">lists.yoctoproject.org</a> &lt;dpmin7=3D<a href=3D"mail=
to:gmail.com@lists.yoctoproject.org">gmail.com@lists.yoctoproject.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This f=
ixes building with musl libc.<br>
<br>
Signed-off-by: Kyungjik Min &lt;<a href=3D"mailto:dpmin7@gmail.com" target=
=3D"_blank">dpmin7@gmail.com</a>&gt;<br>
---<br>
=C2=A0...upport-POSIX-basename-from-musl-libc.patch | 76 ++++++++++++++++++=
+<br>
=C2=A0recipes-containers/tini/<a href=3D"http://tini_0.19.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">tini_0.19.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
=C2=A02 files changed, 77 insertions(+)<br>
=C2=A0create mode 100644 recipes-containers/tini/tini/0001-Support-POSIX-ba=
sename-from-musl-libc.patch<br>
<br>
diff --git a/recipes-containers/tini/tini/0001-Support-POSIX-basename-from-=
musl-libc.patch b/recipes-containers/tini/tini/0001-Support-POSIX-basename-=
from-musl-libc.patch<br>
new file mode 100644<br>
index 00000000..b504c37a<br>
--- /dev/null<br>
+++ b/recipes-containers/tini/tini/0001-Support-POSIX-basename-from-musl-li=
bc.patch<br>
@@ -0,0 +1,76 @@<br>
+From 10479a6eef32f8e64fd5bf894dee9c7a6f21ce4c Mon Sep 17 00:00:00 2001<br>
+From: Hauke Mehrtens &lt;<a href=3D"mailto:hauke@hauke-m.de" target=3D"_bl=
ank">hauke@hauke-m.de</a>&gt;<br>
+Date: Sun, 14 Apr 2024 15:33:51 +0200<br>
+Subject: [PATCH] Support POSIX basename() from musl libc<br>
+<br>
+Musl libc 1.2.5 removed the definition of the basename() function from<br>
+string.h and only provides it in libgen.h as the POSIX standard<br>
+defines it.<br>
+<br>
+This change fixes compilation with musl libc 1.2.5.<br>
+````<br>
+build_dir/target-mips_24kc_musl/tini-0.19.0/src/tini.c:227:36: error: impl=
icit declaration of function &#39;basename&#39; [-Wimplicit-function-declar=
ation]<br>
+=C2=A0 227 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(file, &quot;%s (%s)\=
n&quot;, basename(name), TINI_VERSION_STRING);<br>
+build_dir/target-mips_24kc_musl/tini-0.19.0/src/tini.c:227:25: error: form=
at &#39;%s&#39; expects argument of type &#39;char *&#39;, but argument 3 h=
as type &#39;int&#39; [-Werror=3Dformat=3D]<br>
+=C2=A0 227 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(file, &quot;%s (%s)\=
n&quot;, basename(name), TINI_VERSION_STRING);<br>
+=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~^=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~~~~~~=
~~~~~~~~<br>
+=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
<br>
+=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *=C2=A0 =C2=A0 =C2=A0int<br>
+=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 %d<br>
+<br>
+````<br>
+<br>
+basename() modifies the input string, copy it first with strdup(), If<br>
+strdup() returns NULL the code will handle it.<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/krallin/tini/pul=
l/223" rel=3D"noreferrer" target=3D"_blank">https://github.com/krallin/tini=
/pull/223</a>]<br>
+<br>
+Signed-off-by: Hauke Mehrtens &lt;<a href=3D"mailto:hauke@hauke-m.de" targ=
et=3D"_blank">hauke@hauke-m.de</a>&gt;<br>
+---<br>
+ src/tini.c | 15 +++++++++++----<br>
+ 1 file changed, 11 insertions(+), 4 deletions(-)<br>
+<br>
+diff --git a/src/tini.c b/src/tini.c<br>
+index 7914d3a..41d1506 100644<br>
+--- a/src/tini.c<br>
++++ b/src/tini.c<br>
+@@ -14,6 +14,7 @@<br>
+ #include &lt;stdlib.h&gt;<br>
+ #include &lt;unistd.h&gt;<br>
+ #include &lt;stdbool.h&gt;<br>
++#include &lt;libgen.h&gt;<br>
+ <br>
+ #include &quot;tiniConfig.h&quot;<br>
+ #include &quot;tiniLicense.h&quot;<br>
+@@ -224,14 +225,19 @@ int spawn(const signal_configuration_t* const sigcon=
f_ptr, char* const argv[], i<br>
+ }<br>
+ <br>
+ void print_usage(char* const name, FILE* const file) {<br>
+-=C2=A0 =C2=A0 =C2=A0 fprintf(file, &quot;%s (%s)\n&quot;, basename(name),=
 TINI_VERSION_STRING);<br>
++=C2=A0 =C2=A0 =C2=A0 char *dirc, *bname;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 dirc =3D strdup(name);<br>
++=C2=A0 =C2=A0 =C2=A0 bname =3D basename(dirc);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 fprintf(file, &quot;%s (%s)\n&quot;, bname, TINI_VER=
SION_STRING);<br>
+ <br>
+ #if TINI_MINIMAL<br>
+-=C2=A0 =C2=A0 =C2=A0 fprintf(file, &quot;Usage: %s PROGRAM [ARGS] | --ver=
sion\n\n&quot;, basename(name));<br>
++=C2=A0 =C2=A0 =C2=A0 fprintf(file, &quot;Usage: %s PROGRAM [ARGS] | --ver=
sion\n\n&quot;, bname);<br>
+ #else<br>
+-=C2=A0 =C2=A0 =C2=A0 fprintf(file, &quot;Usage: %s [OPTIONS] PROGRAM -- [=
ARGS] | --version\n\n&quot;, basename(name));<br>
++=C2=A0 =C2=A0 =C2=A0 fprintf(file, &quot;Usage: %s [OPTIONS] PROGRAM -- [=
ARGS] | --version\n\n&quot;, bname);<br>
+ #endif<br>
+-=C2=A0 =C2=A0 =C2=A0 fprintf(file, &quot;Execute a program under the supe=
rvision of a valid init process (%s)\n\n&quot;, basename(name));<br>
++=C2=A0 =C2=A0 =C2=A0 fprintf(file, &quot;Execute a program under the supe=
rvision of a valid init process (%s)\n\n&quot;, bname);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(file, &quot;Command line options:\n\n&q=
uot;);<br>
+ <br>
+@@ -261,6 +267,7 @@ void print_usage(char* const name, FILE* const file) {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(file, &quot;=C2=A0 %s: Send signals to =
the child&#39;s process group.\n&quot;, KILL_PROCESS_GROUP_GROUP_ENV_VAR);<=
br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(file, &quot;\n&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 free(dirc);<br>
+ }<br>
+ <br>
+ void print_license(FILE* const file) {<br>
diff --git a/recipes-containers/tini/<a href=3D"http://tini_0.19.0.bb" rel=
=3D"noreferrer" target=3D"_blank">tini_0.19.0.bb</a> b/recipes-containers/t=
ini/<a href=3D"http://tini_0.19.0.bb" rel=3D"noreferrer" target=3D"_blank">=
tini_0.19.0.bb</a><br>
index fd90f620..1f3ae8b2 100644<br>
--- a/recipes-containers/tini/<a href=3D"http://tini_0.19.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">tini_0.19.0.bb</a><br>
+++ b/recipes-containers/tini/<a href=3D"http://tini_0.19.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">tini_0.19.0.bb</a><br>
@@ -9,6 +9,7 @@ SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0git://<a href=3D"http://github.com/krallin/tini.git;branch=3Dm=
aster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/kra=
llin/tini.git;branch=3Dmaster;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0file://0001-Do-not-strip-the-output-binary-allow-yocto-to-do-t=
hi.patch \<br>
=C2=A0 =C2=A0file://0001-tini.c-a-function-declaration-without-a-prototype-=
is.patch \<br>
+=C2=A0 file://0001-Support-POSIX-basename-from-musl-libc.patch \<br>
=C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9160): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9160" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9160</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/111610536/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/111610536/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div>

--0000000000001150f50630cb251e--

