Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.17723.1599078689654528172
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 02 Sep 2020 13:31:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kRMrBzNb;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id z22so545970ejl.7
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Sep 2020 13:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TyrzsXECm+RNvlT4OMofD4SMlOZhQEtiJXlJavlNFtw=;
        b=kRMrBzNbbW6Va4zabR0BJ1+sZ/hfQPukdHi5CxZqh0oAKMe3ERBmTulN9wQ6Qv+1Si
         9vCjUtIpMIsmrGFmb2YseJU5jDO2iwhG7OnzAM5DQS/Au3yx4LruNw87oTl/uAkFXVLU
         HgggjrBGvGheYm8hcx1PUobixoIbDbY4dOhBwcPOh7gIEuhuntpl8UUkT9RNslDHRy/y
         rpiUICVzMRTvhrtTLQzU12r6EPm3B/FtMyEf2k/2hS7CjJ53rMAe6Q5yINy48vkZqweZ
         h+msMgn8hpeth1AhsG6jy95AiVJcGCc1VMAWCmloXBOvy6QHO+gVKR+gJghdxrC9FsW3
         MJIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TyrzsXECm+RNvlT4OMofD4SMlOZhQEtiJXlJavlNFtw=;
        b=VRPc3wnYNFjtm7s77ZTmE40ZzZg3oLEe/nVpuLjRe0buZqTfRPi9PZA1gvllKt5G8D
         rsUS8b4xJninzjt7cq/K8IvJ+eQFi+3Z2Qy/1PsFj1m8nDZrr+LP8HCIysWjn1l+DS8M
         JOsiqt8d8CMP0ijvoO88aXJOG8hMjgm1jKUf//ZiBu64W2upA1RzLFifn5DInUCrgEoj
         qQcc84+QcNuOt+xCOVHY4pf/rYqnAZj1PYqB9A/RETQJY+QgcHIXCwVO6C08NQST3KtA
         fk3fhNtVztQxi3NenFsdMyn4USRW3Z+ZdmcqhDpqjYiBvsZw5YcDcpRm+PCAgXB3IHTX
         0ZxQ==
X-Gm-Message-State: AOAM533P8Zrvq+6I9zkT6RkOW7T7QE0dv8AtyzguOLft8ocMCuEG9jRM
	pGdFNoByAfPxJOA+MI9f79DKcvg6ksPf497XLkU=
X-Google-Smtp-Source: ABdhPJwiHbpw369VXH6kNnVrOln7ARWaeZPBUUqgvU17JU4Eb9E3TdaUA81t1Gf0YoIouQJTqv/CDyOFMKvoe/lZxZY=
X-Received: by 2002:a17:906:fa81:: with SMTP id lt1mr1789115ejb.459.1599078688034;
 Wed, 02 Sep 2020 13:31:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200901060805.43055-1-Qi.Chen@windriver.com>
In-Reply-To: <20200901060805.43055-1-Qi.Chen@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 2 Sep 2020 16:29:33 -0400
Message-ID: <CADkTA4Nvp95dcqGVZMFu46HpT7d9PYgGJ0UL3Ex02Tpx7v0G-A@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] criu: backport patch to fix build failure for gcc-10
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000002b12d105ae5a8575"

--0000000000002b12d105ae5a8575
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

merged

Bruce

On Tue, Sep 1, 2020 at 2:08 AM Chen Qi <Qi.Chen@windriver.com> wrote:

> Backport patch to fix build failure for gcc-10.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/criu/criu_git.bb           |  1 +
>  ...riu-fix-build-failure-against-gcc-10.patch | 87 +++++++++++++++++++
>  2 files changed, 88 insertions(+)
>  create mode 100644
> recipes-containers/criu/files/0001-criu-fix-build-failure-against-gcc-10=
.patch
>
> diff --git a/recipes-containers/criu/criu_git.bb
> b/recipes-containers/criu/criu_git.bb
> index 704a0f9..24aa301 100644
> --- a/recipes-containers/criu/criu_git.bb
> +++ b/recipes-containers/criu/criu_git.bb
> @@ -21,6 +21,7 @@ SRC_URI =3D "git://github.com/checkpoint-restore/criu.=
git
> \
>             file://0002-criu-Skip-documentation-install.patch \
>             file://0001-criu-Change-libraries-install-directory.patch \
>
> file://lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch \
> +           file://0001-criu-fix-build-failure-against-gcc-10.patch \
>            "
>
>  COMPATIBLE_HOST =3D "(x86_64|arm|aarch64).*-linux"
> diff --git
> a/recipes-containers/criu/files/0001-criu-fix-build-failure-against-gcc-=
10.patch
> b/recipes-containers/criu/files/0001-criu-fix-build-failure-against-gcc-=
10.patch
> new file mode 100644
> index 0000000..f1a2561
> --- /dev/null
> +++
> b/recipes-containers/criu/files/0001-criu-fix-build-failure-against-gcc-=
10.patch
> @@ -0,0 +1,87 @@
> +From c6b9c083ecbd2060c7dc77a9264ef10aafa19063 Mon Sep 17 00:00:00 2001
> +From: Sergei Trofimovich <slyfox@gentoo.org>
> +Date: Sun, 2 Feb 2020 18:45:59 +0000
> +Subject: [PATCH] criu: fix build failure against gcc-10
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +On gcc-10 (and gcc-9 -fno-common) build fails as:
> +
> +```
> +ld: criu/arch/x86/crtools.o:criu/include/cr_options.h:159:
> +  multiple definition of `rpc_cfg_file';
> criu/arch/x86/cpu.o:criu/include/cr_options.h:159: first defined here
> +make[2]: *** [scripts/nmk/scripts/build.mk:164:
> criu/arch/x86/crtools.built-in.o] Error 1
> +```
> +
> +gcc-10 will change the default from -fcommon to fno-common:
> +https://gcc.gnu.org/PR85678.
> +
> +The error also happens if CFLAGS=3D-fno-common passed explicitly.
> +
> +Reported-by: Toralf F=C3=B6rster
> +Bug: https://bugs.gentoo.org/707942
> +Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
> +
> +Upstream-Status: Backport [
> https://github.com/checkpoint-restore/criu/pull/936]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +
> +---
> + criu/config.c             | 1 +
> + criu/include/cr_options.h | 2 +-
> + criu/include/pstree.h     | 2 +-
> + criu/include/tun.h        | 2 +-
> + 4 files changed, 4 insertions(+), 3 deletions(-)
> +
> +diff --git a/criu/config.c b/criu/config.c
> +index 39aa071c..009a48a6 100644
> +--- a/criu/config.c
> ++++ b/criu/config.c
> +@@ -30,6 +30,7 @@
> + #include "common/xmalloc.h"
> +
> + struct cr_options opts;
> ++char *rpc_cfg_file;
> +
> + static int count_elements(char **to_count)
> + {
> +diff --git a/criu/include/cr_options.h b/criu/include/cr_options.h
> +index 82f76ad9..9c20aaea 100644
> +--- a/criu/include/cr_options.h
> ++++ b/criu/include/cr_options.h
> +@@ -147,7 +147,7 @@ struct cr_options {
> + };
> +
> + extern struct cr_options opts;
> +-char *rpc_cfg_file;
> ++extern char *rpc_cfg_file;
> +
> + extern int parse_options(int argc, char **argv, bool *usage_error, boo=
l
> *has_exec_cmd, int state);
> + extern int check_options();
> +diff --git a/criu/include/pstree.h b/criu/include/pstree.h
> +index 7303c1fe..61ab0ce0 100644
> +--- a/criu/include/pstree.h
> ++++ b/criu/include/pstree.h
> +@@ -42,7 +42,7 @@ enum {
> + };
> + #define FDS_EVENT (1 << FDS_EVENT_BIT)
> +
> +-struct pstree_item *current;
> ++extern struct pstree_item *current;
> +
> + struct rst_info;
> + /* See alloc_pstree_item() for details */
> +diff --git a/criu/include/tun.h b/criu/include/tun.h
> +index ce0b266a..b82c445a 100644
> +--- a/criu/include/tun.h
> ++++ b/criu/include/tun.h
> +@@ -5,7 +5,7 @@
> + #define TUN_MINOR     200
> + #endif
> +
> +-struct ns_id *ns;
> ++extern struct ns_id *ns;
> +
> + #include <linux/netlink.h>
> +
> --
> 2.21.0
>
>=20
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000002b12d105ae5a8575
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">mer=
ged</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Se=
p 1, 2020 at 2:08 AM Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Q=
i.Chen@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Backport patch to fix build failure for gcc-10.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=3D"norefe=
rrer" target=3D"_blank">criu_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 1 +<br>
=C2=A0...riu-fix-build-failure-against-gcc-10.patch | 87 +++++++++++++++++=
++<br>
=C2=A02 files changed, 88 insertions(+)<br>
=C2=A0create mode 100644 recipes-containers/criu/files/0001-criu-fix-build=
-failure-against-gcc-10.patch<br>
<br>
diff --git a/recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=3D=
"noreferrer" target=3D"_blank">criu_git.bb</a> b/recipes-containers/criu/<a=
 href=3D"http://criu_git.bb" rel=3D"noreferrer" target=3D"_blank">criu_git.=
bb</a><br>
index 704a0f9..24aa301 100644<br>
--- a/recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=3D"norefe=
rrer" target=3D"_blank">criu_git.bb</a><br>
+++ b/recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=3D"norefe=
rrer" target=3D"_blank">criu_git.bb</a><br>
@@ -21,6 +21,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/che=
ckpoint-restore/criu.git" rel=3D"noreferrer" target=3D"_blank">github.com/c=
heckpoint-restore/criu.git</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-criu-Skip-documentat=
ion-install.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-criu-Change-librarie=
s-install-directory.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lib-Makefile-overwrite-in=
stall-lib-to-allow-multiarc.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-criu-fix-build-failu=
re-against-gcc-10.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0COMPATIBLE_HOST =3D &quot;(x86_64|arm|aarch64).*-linux&quot;<br>
diff --git a/recipes-containers/criu/files/0001-criu-fix-build-failure-aga=
inst-gcc-10.patch b/recipes-containers/criu/files/0001-criu-fix-build-failu=
re-against-gcc-10.patch<br>
new file mode 100644<br>
index 0000000..f1a2561<br>
--- /dev/null<br>
+++ b/recipes-containers/criu/files/0001-criu-fix-build-failure-against-gc=
c-10.patch<br>
@@ -0,0 +1,87 @@<br>
+From c6b9c083ecbd2060c7dc77a9264ef10aafa19063 Mon Sep 17 00:00:00 2001<br=
>
+From: Sergei Trofimovich &lt;<a href=3D"mailto:slyfox@gentoo.org" target=
=3D"_blank">slyfox@gentoo.org</a>&gt;<br>
+Date: Sun, 2 Feb 2020 18:45:59 +0000<br>
+Subject: [PATCH] criu: fix build failure against gcc-10<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+On gcc-10 (and gcc-9 -fno-common) build fails as:<br>
+<br>
+```<br>
+ld: criu/arch/x86/crtools.o:criu/include/cr_options.h:159:<br>
+=C2=A0 multiple definition of `rpc_cfg_file&#39;; criu/arch/x86/cpu.o:cri=
u/include/cr_options.h:159: first defined here<br>
+make[2]: *** [scripts/nmk/scripts/<a href=3D"http://build.mk:164" rel=3D"=
noreferrer" target=3D"_blank">build.mk:164</a>: criu/arch/x86/crtools.built=
-in.o] Error 1<br>
+```<br>
+<br>
+gcc-10 will change the default from -fcommon to fno-common:<br>
+<a href=3D"https://gcc.gnu.org/PR85678" rel=3D"noreferrer" target=3D"_bla=
nk">https://gcc.gnu.org/PR85678</a>.<br>
+<br>
+The error also happens if CFLAGS=3D-fno-common passed explicitly.<br>
+<br>
+Reported-by: Toralf F=C3=B6rster<br>
+Bug: <a href=3D"https://bugs.gentoo.org/707942" rel=3D"noreferrer" target=
=
=3D"_blank">https://bugs.gentoo.org/707942</a><br>
+Signed-off-by: Sergei Trofimovich &lt;<a href=3D"mailto:slyfox@gentoo.org=
" target=3D"_blank">slyfox@gentoo.org</a>&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/checkpoint-resto=
re/criu/pull/936" rel=3D"noreferrer" target=3D"_blank">https://github.com/c=
heckpoint-restore/criu/pull/936</a>]<br>
+<br>
+Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" targe=
t=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
+<br>
+---<br>
+ criu/config.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
+ criu/include/cr_options.h | 2 +-<br>
+ criu/include/pstree.h=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ criu/include/tun.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
+ 4 files changed, 4 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/criu/config.c b/criu/config.c<br>
+index 39aa071c..009a48a6 100644<br>
+--- a/criu/config.c<br>
++++ b/criu/config.c<br>
+@@ -30,6 +30,7 @@<br>
+ #include &quot;common/xmalloc.h&quot;<br>
+ <br>
+ struct cr_options opts;<br>
++char *rpc_cfg_file;<br>
+ <br>
+ static int count_elements(char **to_count)<br>
+ {<br>
+diff --git a/criu/include/cr_options.h b/criu/include/cr_options.h<br>
+index 82f76ad9..9c20aaea 100644<br>
+--- a/criu/include/cr_options.h<br>
++++ b/criu/include/cr_options.h<br>
+@@ -147,7 +147,7 @@ struct cr_options {<br>
+ };<br>
+ <br>
+ extern struct cr_options opts;<br>
+-char *rpc_cfg_file;<br>
++extern char *rpc_cfg_file;<br>
+ <br>
+ extern int parse_options(int argc, char **argv, bool *usage_error, bool =
*has_exec_cmd, int state);<br>
+ extern int check_options();<br>
+diff --git a/criu/include/pstree.h b/criu/include/pstree.h<br>
+index 7303c1fe..61ab0ce0 100644<br>
+--- a/criu/include/pstree.h<br>
++++ b/criu/include/pstree.h<br>
+@@ -42,7 +42,7 @@ enum {<br>
+ };<br>
+ #define FDS_EVENT (1 &lt;&lt; FDS_EVENT_BIT)<br>
+ <br>
+-struct pstree_item *current;<br>
++extern struct pstree_item *current;<br>
+ <br>
+ struct rst_info;<br>
+ /* See alloc_pstree_item() for details */<br>
+diff --git a/criu/include/tun.h b/criu/include/tun.h<br>
+index ce0b266a..b82c445a 100644<br>
+--- a/criu/include/tun.h<br>
++++ b/criu/include/tun.h<br>
+@@ -5,7 +5,7 @@<br>
+ #define TUN_MINOR=C2=A0 =C2=A0 =C2=A0200<br>
+ #endif<br>
+ <br>
+-struct ns_id *ns;<br>
++extern struct ns_id *ns;<br>
+ <br>
+ #include &lt;linux/netlink.h&gt;<br>
+ <br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end<br>- &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II<br><br></div>

--0000000000002b12d105ae5a8575--
