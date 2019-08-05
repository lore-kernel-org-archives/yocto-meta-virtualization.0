Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 77844E00C81; Mon,  5 Aug 2019 04:30:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.67 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D0EB4E00C81
	for <meta-virtualization@yoctoproject.org>;
	Mon,  5 Aug 2019 04:30:11 -0700 (PDT)
Received: by mail-lf1-f67.google.com with SMTP id 62so52787833lfa.8
	for <meta-virtualization@yoctoproject.org>;
	Mon, 05 Aug 2019 04:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=m+Wa6HDpv9ELIJQAtzyr2vUG01YqYvBYLVx4Ljna+g4=;
	b=AYrhsnaRKie98n5Njw2xmpkFUx6cJY7bvX/QNLWBaZB4ZoXIO4Scx897feWfhbbUrH
	1D0oRXT8Gxs4VbQaWuTadc4vUqwV0p5z+06PNu+hARm/Hgfix98OcQWO1fNpkoTh7lNy
	qRpyo1GXIxwyDZlMZxeW2ocq3KAR9jrMWU/3W3teIyU79lHnFmN6QePxrFZig+xo5ULf
	bG6wJcaZ77zAQNc23yLV8mnjAgpIh5C5X2qsvJMtCovU4P03VfwFn8M0YBK7fcnSvx44
	v8gVG2VtliTaKmpNPbttnKSWeQH+oAzcCvE7CBNmzQOVMt68hlIIjubYvpV4nEHP90qd
	1uHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=m+Wa6HDpv9ELIJQAtzyr2vUG01YqYvBYLVx4Ljna+g4=;
	b=DOMcZ1cFgeQUoyi3reqpUVjBYQkILMCyJognjQ7RR8pbIXAtaycge1X4F6+8kfmqT7
	humL6hQQDoxvO6q88nv7XmH+tDXQyx3IaTUWB0nJN5WtsoXzXvNIk9F0pQlCg5oXxKvR
	D09gG0vya0YFlMgvIbIb01J4tH0OvB1hS7GTmMokJjRRd7AJXGdIqMqQNul8QfJFhsPq
	QqEeZ39Gotf48VGdYeBLmIuCFv5BQfS0i/Peo5qjk+wfqtM/ajTmrO4tqwkVK7ovoQbz
	zmwyZ4oif7qVb1v/7I5GVmBwDhQqLGcUi6M74ICAYMAdfcOSw64tBYYsEUYqzoueou32
	Mddw==
X-Gm-Message-State: APjAAAU5NC7T7ZaMBM8fSkjd0+OFgjm3QXcDPwniFHP2fpMhW5zfL1tm
	CFnf9AkBhrHqRtuUHyDEBo9h3G5zfgc2Er69Cm8=
X-Google-Smtp-Source: APXvYqwntOGBFcSyTn2//WBbWGmlymidfYxAHYxJhBI18GRrWfQ53J7YTDNG0adimaGcn6f22jqXQ0VUbYV1WXtJUTc=
X-Received: by 2002:a19:4aca:: with SMTP id
	x193mr66008696lfa.146.1565004610654; 
	Mon, 05 Aug 2019 04:30:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190805060143.24108-1-Qi.Chen@windriver.com>
	<20190805060143.24108-3-Qi.Chen@windriver.com>
In-Reply-To: <20190805060143.24108-3-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 5 Aug 2019 08:29:58 -0300
Message-ID: <CADkTA4Nbv1WRMi0hMuT8vYSAEyog8J1G7R4+q=qHhwoK_QcKLw@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 3/4] runc-docker: respect GOBUILDFLAGS and do not compile recvtty
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Aug 2019 11:30:13 -0000
Content-Type: multipart/alternative; boundary="000000000000e3db51058f5d07b9"

--000000000000e3db51058f5d07b9
Content-Type: text/plain; charset="UTF-8"

On Mon., Aug. 5, 2019, 3:02 a.m. Chen Qi, <Qi.Chen@windriver.com> wrote:

> Previsously, runc uses 'make static' to compile things out, and
> the 0001-build-drop-recvtty-and-use-GOBUILDFLAGS.patch removes the
> recvtty target, although that patch does not respect GOBUILDFLAGS
> as its name suggests.
>
> Now we have changed to remove 'static' because we want to have
> systemd support. So we explicitly only compile 'runc' and make
> this target respect 'GOBUILDFLAGS'.
>

No .. actually we won't drop static . So this needs to be reworked to
account for both cases .

Bruce


> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../0001-Makefile-respect-GOBUILDFLAGS.patch  | 28 +++++++++++++++++++
>  ...ld-drop-recvtty-and-use-GOBUILDFLAGS.patch | 22 ---------------
>  recipes-containers/runc/runc-docker_git.bb    |  2 +-
>  recipes-containers/runc/runc.inc              |  2 +-
>  4 files changed, 30 insertions(+), 24 deletions(-)
>  create mode 100644
> recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS.patch
>  delete mode 100644
> recipes-containers/runc/runc-docker/0001-build-drop-recvtty-and-use-GOBUILDFLAGS.patch
>
> diff --git
> a/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS.patch
> b/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS.patch
> new file mode 100644
> index 0000000..ac9aa3d
> --- /dev/null
> +++
> b/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS.patch
> @@ -0,0 +1,28 @@
> +From 7d6f130ebe427412c41cd11148be6db7711e32c1 Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Mon, 5 Aug 2019 13:29:50 +0800
> +Subject: [PATCH] Makefile: respect GOBUILDFLAGS
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +
> +Upstream-Status: Inappropriate [OE Specific]
> +---
> + Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 0f26a1c8..45c6c221 100644
> +--- a/src/import/Makefile
> ++++ b/src/import/Makefile
> +@@ -30,7 +30,7 @@ SHELL := $(shell command -v bash 2>/dev/null)
> + .DEFAULT: runc
> +
> + runc: $(SOURCES)
> +-      $(GO) build -buildmode=pie $(EXTRA_FLAGS) -ldflags "-X
> main.gitCommit=${COMMIT} -X main.version=${VERSION} $(EXTRA_LDFLAGS)" -tags
> "$(BUILDTAGS)" -o runc .
> ++      $(GO) build $(GOBUILDFLAGS) $(EXTRA_FLAGS) -ldflags "-X
> main.gitCommit=${COMMIT} -X main.version=${VERSION} $(EXTRA_LDFLAGS)" -tags
> "$(BUILDTAGS)" -o runc .
> +
> + all: runc recvtty
> +
> +--
> +2.17.1
> +
> diff --git
> a/recipes-containers/runc/runc-docker/0001-build-drop-recvtty-and-use-GOBUILDFLAGS.patch
> b/recipes-containers/runc/runc-docker/0001-build-drop-recvtty-and-use-GOBUILDFLAGS.patch
> deleted file mode 100644
> index 9ba9957..0000000
> ---
> a/recipes-containers/runc/runc-docker/0001-build-drop-recvtty-and-use-GOBUILDFLAGS.patch
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -From a9a2b9e72027d0b2357f6dfe8b154762aaa8dd02 Mon Sep 17 00:00:00 2001
> -From: Bruce Ashfield <bruce.ashfield@windriver.com>
> -Date: Thu, 19 Apr 2018 16:39:41 -0400
> -Subject: [PATCH] build: drop recvtty and use GOBUILDFLAGS
> -
> -Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ----
> - Makefile | 3 +--
> - 1 file changed, 1 insertion(+), 2 deletions(-)
> -
> -Index: git/src/import/Makefile
> -===================================================================
> ---- git.orig/src/import/Makefile
> -+++ git/src/import/Makefile
> -@@ -41,7 +41,6 @@
> -
> - static: $(SOURCES)
> -       CGO_ENABLED=1 $(GO) build $(EXTRA_FLAGS) -tags "$(BUILDTAGS) netgo
> osusergo static_build" -installsuffix netgo -ldflags "-w -extldflags
> -static -X main.gitCommit=${COMMIT} -X main.version=${VERSION}
> $(EXTRA_LDFLAGS)" -o runc .
> --      CGO_ENABLED=1 $(GO) build $(EXTRA_FLAGS) -tags "$(BUILDTAGS) netgo
> osusergo static_build" -installsuffix netgo -ldflags "-w -extldflags
> -static -X main.gitCommit=${COMMIT} -X main.version=${VERSION}
> $(EXTRA_LDFLAGS)" -o contrib/cmd/recvtty/recvtty ./contrib/cmd/recvtty
> -
> - release:
> -       script/release.sh -r release/$(VERSION) -v $(VERSION)
> diff --git a/recipes-containers/runc/runc-docker_git.bb
> b/recipes-containers/runc/runc-docker_git.bb
> index 2bf6222..d4e4d24 100644
> --- a/recipes-containers/runc/runc-docker_git.bb
> +++ b/recipes-containers/runc/runc-docker_git.bb
> @@ -5,8 +5,8 @@ include runc.inc
>  SRCREV_runc-docker = "425e105d5a03fabd737a126ad93d62a9eeede87f"
>  SRC_URI = "git://
> github.com/opencontainers/runc;nobranch=1;name=runc-docker \
>             file://0001-runc-Add-console-socket-dev-null.patch \
> -           file://0001-build-drop-recvtty-and-use-GOBUILDFLAGS.patch \
>             file://0001-runc-docker-SIGUSR1-daemonize.patch \
> +           file://0001-Makefile-respect-GOBUILDFLAGS.patch \
>            "
>
>  RUNC_VERSION = "1.0.0-rc8"
> diff --git a/recipes-containers/runc/runc.inc
> b/recipes-containers/runc/runc.inc
> index 1f2f944..fe997f1 100644
> --- a/recipes-containers/runc/runc.inc
> +++ b/recipes-containers/runc/runc.inc
> @@ -54,7 +54,7 @@ do_compile() {
>         export CFLAGS=""
>         export LDFLAGS=""
>
> -       oe_runmake
> +       oe_runmake runc
>  }
>
>  do_install() {
> --
> 2.17.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

--000000000000e3db51058f5d07b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon., Aug. 5, 2019, 3:02 a.m. Chen Qi, &lt;<a href=
=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">Previsously, runc uses &#39;make static=
&#39; to compile things out, and<br>
the 0001-build-drop-recvtty-and-use-GOBUILDFLAGS.patch removes the<br>
recvtty target, although that patch does not respect GOBUILDFLAGS<br>
as its name suggests.<br>
<br>
Now we have changed to remove &#39;static&#39; because we want to have<br>
systemd support. So we explicitly only compile &#39;runc&#39; and make<br>
this target respect &#39;GOBUILDFLAGS&#39;.<br></blockquote></div></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">No .. actually we won&#39;t drop=
 static . So this needs to be reworked to account for both cases .</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Bruce</div><div dir=3D"auto"><br=
></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank" rel=3D"noreferrer">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../0001-Makefile-respect-GOBUILDFLAGS.patch=C2=A0 | 28 +++++++++++++=
++++++<br>
=C2=A0...ld-drop-recvtty-and-use-GOBUILDFLAGS.patch | 22 ---------------<br=
>
=C2=A0recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"=
noreferrer noreferrer" target=3D"_blank">runc-docker_git.bb</a>=C2=A0 =C2=
=A0 |=C2=A0 2 +-<br>
=C2=A0recipes-containers/runc/runc.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A04 files changed, 30 insertions(+), 24 deletions(-)<br>
=C2=A0create mode 100644 recipes-containers/runc/files/0001-Makefile-respec=
t-GOBUILDFLAGS.patch<br>
=C2=A0delete mode 100644 recipes-containers/runc/runc-docker/0001-build-dro=
p-recvtty-and-use-GOBUILDFLAGS.patch<br>
<br>
diff --git a/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLA=
GS.patch b/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS=
.patch<br>
new file mode 100644<br>
index 0000000..ac9aa3d<br>
--- /dev/null<br>
+++ b/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS.patc=
h<br>
@@ -0,0 +1,28 @@<br>
+From 7d6f130ebe427412c41cd11148be6db7711e32c1 Mon Sep 17 00:00:00 2001<br>
+From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blan=
k" rel=3D"noreferrer">Qi.Chen@windriver.com</a>&gt;<br>
+Date: Mon, 5 Aug 2019 13:29:50 +0800<br>
+Subject: [PATCH] Makefile: respect GOBUILDFLAGS<br>
+<br>
+Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank" rel=3D"noreferrer">Qi.Chen@windriver.com</a>&gt;<br>
+<br>
+Upstream-Status: Inappropriate [OE Specific]<br>
+---<br>
+ Makefile | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/Makefile b/Makefile<br>
+index 0f26a1c8..45c6c221 100644<br>
+--- a/src/import/Makefile<br>
++++ b/src/import/Makefile<br>
+@@ -30,7 +30,7 @@ SHELL :=3D $(shell command -v bash 2&gt;/dev/null)<br>
+ .DEFAULT: runc<br>
+ <br>
+ runc: $(SOURCES)<br>
+-=C2=A0 =C2=A0 =C2=A0 $(GO) build -buildmode=3Dpie $(EXTRA_FLAGS) -ldflags=
 &quot;-X main.gitCommit=3D${COMMIT} -X main.version=3D${VERSION} $(EXTRA_L=
DFLAGS)&quot; -tags &quot;$(BUILDTAGS)&quot; -o runc .<br>
++=C2=A0 =C2=A0 =C2=A0 $(GO) build $(GOBUILDFLAGS) $(EXTRA_FLAGS) -ldflags =
&quot;-X main.gitCommit=3D${COMMIT} -X main.version=3D${VERSION} $(EXTRA_LD=
FLAGS)&quot; -tags &quot;$(BUILDTAGS)&quot; -o runc .<br>
+ <br>
+ all: runc recvtty<br>
+ <br>
+-- <br>
+2.17.1<br>
+<br>
diff --git a/recipes-containers/runc/runc-docker/0001-build-drop-recvtty-an=
d-use-GOBUILDFLAGS.patch b/recipes-containers/runc/runc-docker/0001-build-d=
rop-recvtty-and-use-GOBUILDFLAGS.patch<br>
deleted file mode 100644<br>
index 9ba9957..0000000<br>
--- a/recipes-containers/runc/runc-docker/0001-build-drop-recvtty-and-use-G=
OBUILDFLAGS.patch<br>
+++ /dev/null<br>
@@ -1,22 +0,0 @@<br>
-From a9a2b9e72027d0b2357f6dfe8b154762aaa8dd02 Mon Sep 17 00:00:00 2001<br>
-From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@windriver.com" t=
arget=3D"_blank" rel=3D"noreferrer">bruce.ashfield@windriver.com</a>&gt;<br=
>
-Date: Thu, 19 Apr 2018 16:39:41 -0400<br>
-Subject: [PATCH] build: drop recvtty and use GOBUILDFLAGS<br>
-<br>
-Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@windriv=
er.com" target=3D"_blank" rel=3D"noreferrer">bruce.ashfield@windriver.com</=
a>&gt;<br>
----<br>
- Makefile | 3 +--<br>
- 1 file changed, 1 insertion(+), 2 deletions(-)<br>
-<br>
-Index: git/src/import/Makefile<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- git.orig/src/import/Makefile<br>
-+++ git/src/import/Makefile<br>
-@@ -41,7 +41,6 @@<br>
- <br>
- static: $(SOURCES)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0CGO_ENABLED=3D1 $(GO) build $(EXTRA_FLAGS) -tag=
s &quot;$(BUILDTAGS) netgo osusergo static_build&quot; -installsuffix netgo=
 -ldflags &quot;-w -extldflags -static -X main.gitCommit=3D${COMMIT} -X mai=
n.version=3D${VERSION} $(EXTRA_LDFLAGS)&quot; -o runc .<br>
--=C2=A0 =C2=A0 =C2=A0 CGO_ENABLED=3D1 $(GO) build $(EXTRA_FLAGS) -tags &qu=
ot;$(BUILDTAGS) netgo osusergo static_build&quot; -installsuffix netgo -ldf=
lags &quot;-w -extldflags -static -X main.gitCommit=3D${COMMIT} -X main.ver=
sion=3D${VERSION} $(EXTRA_LDFLAGS)&quot; -o contrib/cmd/recvtty/recvtty ./c=
ontrib/cmd/recvtty<br>
- <br>
- release:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0script/release.sh -r release/$(VERSION) -v $(VE=
RSION)<br>
diff --git a/recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" =
rel=3D"noreferrer noreferrer" target=3D"_blank">runc-docker_git.bb</a> b/re=
cipes-containers/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"noreferr=
er noreferrer" target=3D"_blank">runc-docker_git.bb</a><br>
index 2bf6222..d4e4d24 100644<br>
--- a/recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"=
noreferrer noreferrer" target=3D"_blank">runc-docker_git.bb</a><br>
+++ b/recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"=
noreferrer noreferrer" target=3D"_blank">runc-docker_git.bb</a><br>
@@ -5,8 +5,8 @@ include runc.inc<br>
=C2=A0SRCREV_runc-docker =3D &quot;425e105d5a03fabd737a126ad93d62a9eeede87f=
&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/opencontainers/r=
unc;nobranch=3D1;name=3Drunc-docker" rel=3D"noreferrer noreferrer" target=
=3D"_blank">github.com/opencontainers/runc;nobranch=3D1;name=3Drunc-docker<=
/a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-runc-Add-console-sock=
et-dev-null.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-build-drop-recvtty-an=
d-use-GOBUILDFLAGS.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-runc-docker-SIGUSR1-d=
aemonize.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Makefile-respect-GOBU=
ILDFLAGS.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0RUNC_VERSION =3D &quot;1.0.0-rc8&quot;<br>
diff --git a/recipes-containers/runc/runc.inc b/recipes-containers/runc/run=
c.inc<br>
index 1f2f944..fe997f1 100644<br>
--- a/recipes-containers/runc/runc.inc<br>
+++ b/recipes-containers/runc/runc.inc<br>
@@ -54,7 +54,7 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export CFLAGS=3D&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export LDFLAGS=3D&quot;&quot;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake runc<br>
=C2=A0}<br>
<br>
=C2=A0do_install() {<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank" r=
el=3D"noreferrer">meta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoctoproject.org=
/listinfo/meta-virtualization</a><br>
</blockquote></div></div></div>

--000000000000e3db51058f5d07b9--
