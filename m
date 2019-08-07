Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8D2DBE00D8A; Tue,  6 Aug 2019 19:52:59 -0700 (PDT)
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
	*      [209.85.208.176 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
	[209.85.208.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AF844E00C22
	for <meta-virtualization@yoctoproject.org>;
	Tue,  6 Aug 2019 19:52:57 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id v18so83934837ljh.6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 06 Aug 2019 19:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sLPKvFSBSlOLNOXWx9rNFc/rS4znl7zIYEqWGAK2XC4=;
	b=bhh6Gv/XeCy/wIP/0a56a6jQjmWsAs3wWXhOWCNM6Fth558pkYRWiw2fxbQj2gpVPL
	V3JUBYtyeIa0BvqM3yCgnkdCl58QWfz6emOT/SCNEO6SR4RxY85tB0yKooDTNF3Huds9
	i1iG4S2AYi66CuZxAH9SaCIQ03LcJWN5hUSAHg3RRkzi8BdePs8F43p3aSg/LM5oTvWy
	Q72esAlvmzmilpYrBP60MGxfw4tgqk/jfjGzXEqGCPIkbvpYSkk4khn0NgwfJP3TA9Te
	Fxm7eTyGF9tqFVCgtX4MhXNwMnnc71MBdGoFeaZmC5MTO4RKovXbN9dw2DELOWG88Ybe
	eYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sLPKvFSBSlOLNOXWx9rNFc/rS4znl7zIYEqWGAK2XC4=;
	b=iwg8jKxCftlQr5IG+9rf52ud0iokIcBUCaTycV6jT7TgUknTcWVaX/QNs8PHy9mUiz
	9k7lukP2jUu8IRY5gXRz9/LLnEdYjH7UFOSz9UMF4MTw3O8/fHbAxlBTy9HqhSOSc1MS
	oKUJAJ0NF9UWdlwu38S7SBWE6AhsWqIFhE9rE72kGXTAWibkOb98fr7G9NzN5wtpTlvO
	ZAitW4Zf3st3BQ9647ygmGYopxFbDVRzfswaKzhFMUL83kqOjhBGgYiDy8AAx0pjRe08
	Ty9N9yWuhF/adLjIoPJU44FiTJJpdO8UEgh8iH05QdzV8LHBAyJrnoTIH12IN+gOKHyW
	EOXw==
X-Gm-Message-State: APjAAAXXFH3wHjKJNqQ8SchWc2y4gkJtQ3KLjVANBBHJCgKp0GnhYWcQ
	COAYZA+3oNoJIZq/Mx6LvW4xDpVYhY4EtawaZBs=
X-Google-Smtp-Source: APXvYqyDZGtM8dlDT9mShhuQjQOZJOZycv4inS1aLnLnd768mvVpidqCgRDyI1rkxcNgOD+/NG9Laox4Tios0tU3vsg=
X-Received: by 2002:a2e:9ac4:: with SMTP id p4mr3349312ljj.185.1565146376494; 
	Tue, 06 Aug 2019 19:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190807011444.31930-1-Qi.Chen@windriver.com>
	<20190807011444.31930-2-Qi.Chen@windriver.com>
In-Reply-To: <20190807011444.31930-2-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 6 Aug 2019 23:52:45 -0300
Message-ID: <CADkTA4OjwkDYW2884smfgauq1OXnHozBwnYnpBtUzsMnO45v+Q@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH V2 2/2] runc: add PACKAGECONFIG to allow building as static or not
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
X-List-Received-Date: Wed, 07 Aug 2019 02:52:59 -0000
Content-Type: multipart/alternative; boundary="000000000000cae333058f7e09da"

--000000000000cae333058f7e09da
Content-Type: text/plain; charset="UTF-8"

This looks better!

I'm traveling at the moment, and can't test this for a few days, so it will
be later this week, or early next before I can merge it. (Same comment
applies to the k8s patch).

Bruce

On Tue, Aug 6, 2019 at 10:15 PM Chen Qi <Qi.Chen@windriver.com> wrote:

> Add a new PACKAGECONFIG, static, which when enabled will build
> runc as static. Default to enable it.
>
> We need this because we should allow users to build runc as not
> static so that when docker's cgroup driver is set to systemd,
> we don't get error.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  ...-GOBUILDFLAGS-for-runc-and-remove-re.patch | 35 +++++++++++++++++++
>  ...ld-drop-recvtty-and-use-GOBUILDFLAGS.patch | 22 ------------
>  recipes-containers/runc/runc-docker_git.bb    |  2 +-
>  .../runc/runc-opencontainers_git.bb           |  1 +
>  recipes-containers/runc/runc.inc              | 10 ++++--
>  5 files changed, 45 insertions(+), 25 deletions(-)
>  create mode 100644
> recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch
>  delete mode 100644
> recipes-containers/runc/runc-docker/0001-build-drop-recvtty-and-use-GOBUILDFLAGS.patch
>
> diff --git
> a/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch
> b/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch
> new file mode 100644
> index 0000000..94cbb4c
> --- /dev/null
> +++
> b/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch
> @@ -0,0 +1,35 @@
> +From d2c47a973f354ffd505bb4e809c59e57b543726d Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Tue, 6 Aug 2019 19:01:45 +0800
> +Subject: [PATCH] Makefile: respect GOBUILDFLAGS for runc and remove
> recvtty
> + from static
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + Makefile | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 0f26a1c8..a0c6b40b 100644
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
> +@@ -41,7 +41,6 @@ contrib/cmd/recvtty/recvtty: $(SOURCES)
> +
> + static: $(SOURCES)
> +       CGO_ENABLED=1 $(GO) build $(EXTRA_FLAGS) -tags "$(BUILDTAGS) netgo
> osusergo static_build" -installsuffix netgo -ldflags "-w -extldflags
> -static -X main.gitCommit=${COMMIT} -X main.version=${VERSION}
> $(EXTRA_LDFLAGS)" -o runc .
> +-      CGO_ENABLED=1 $(GO) build $(EXTRA_FLAGS) -tags "$(BUILDTAGS) netgo
> osusergo static_build" -installsuffix netgo -ldflags "-w -extldflags
> -static -X main.gitCommit=${COMMIT} -X main.version=${VERSION}
> $(EXTRA_LDFLAGS)" -o contrib/cmd/recvtty/recvtty ./contrib/cmd/recvtty
> +
> + release:
> +       script/release.sh -r release/$(VERSION) -v $(VERSION)
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
> index 2bf6222..c9f460b 100644
> --- a/recipes-containers/runc/runc-docker_git.bb
> +++ b/recipes-containers/runc/runc-docker_git.bb
> @@ -5,7 +5,7 @@ include runc.inc
>  SRCREV_runc-docker = "425e105d5a03fabd737a126ad93d62a9eeede87f"
>  SRC_URI = "git://
> github.com/opencontainers/runc;nobranch=1;name=runc-docker \
>             file://0001-runc-Add-console-socket-dev-null.patch \
> -           file://0001-build-drop-recvtty-and-use-GOBUILDFLAGS.patch \
> +
>  file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
>             file://0001-runc-docker-SIGUSR1-daemonize.patch \
>            "
>
> diff --git a/recipes-containers/runc/runc-opencontainers_git.bb
> b/recipes-containers/runc/runc-opencontainers_git.bb
> index 76ab794..361bc94 100644
> --- a/recipes-containers/runc/runc-opencontainers_git.bb
> +++ b/recipes-containers/runc/runc-opencontainers_git.bb
> @@ -3,5 +3,6 @@ include runc.inc
>  SRCREV = "652297c7c7e6c94e8d064ad5916c32891a6fd388"
>  SRC_URI = " \
>      git://github.com/opencontainers/runc;branch=master \
> +
> file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
>      "
>  RUNC_VERSION = "1.0.0-rc8"
> diff --git a/recipes-containers/runc/runc.inc
> b/recipes-containers/runc/runc.inc
> index 46fd09d..41ea41b 100644
> --- a/recipes-containers/runc/runc.inc
> +++ b/recipes-containers/runc/runc.inc
> @@ -14,8 +14,10 @@ inherit go
>  inherit goarch
>  inherit pkgconfig
>
> -PACKAGECONFIG ??= ""
> +PACKAGECONFIG ??= "static"
>  PACKAGECONFIG[seccomp] = "seccomp,,libseccomp"
> +# This PACKAGECONFIG serves the purpose of whether building runc as
> static or not
> +PACKAGECONFIG[static] = ""
>
>  PROVIDES += "virtual/runc"
>  RPROVIDES_${PN} = "virtual/runc"
> @@ -54,7 +56,11 @@ do_compile() {
>         export CFLAGS=""
>         export LDFLAGS=""
>
> -       oe_runmake static
> +       if ${@bb.utils.contains('PACKAGECONFIG', 'static', 'true',
> 'false', d)}; then
> +               oe_runmake static
> +       else
> +               oe_runmake runc
> +       fi
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


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000cae333058f7e09da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">This looks better!</div><div class=3D"gmail_default" style=3D=
"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size=
:small">I&#39;m traveling at the moment, and can&#39;t test this for a few =
days, so it will be later this week, or early next before I can merge it. (=
Same comment applies to the k8s patch).</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">Bruce</div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Tue, Aug 6, 2019 at 10:15 PM Chen Qi &lt;<a hr=
ef=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Add a new PACKAGEC=
ONFIG, static, which when enabled will build<br>
runc as static. Default to enable it.<br>
<br>
We need this because we should allow users to build runc as not<br>
static so that when docker&#39;s cgroup driver is set to systemd,<br>
we don&#39;t get error.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0...-GOBUILDFLAGS-for-runc-and-remove-re.patch | 35 ++++++++++++++++++=
+<br>
=C2=A0...ld-drop-recvtty-and-use-GOBUILDFLAGS.patch | 22 ------------<br>
=C2=A0recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"=
noreferrer" target=3D"_blank">runc-docker_git.bb</a>=C2=A0 =C2=A0 |=C2=A0 2=
 +-<br>
=C2=A0.../runc/<a href=3D"http://runc-opencontainers_git.bb" rel=3D"norefer=
rer" target=3D"_blank">runc-opencontainers_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0recipes-containers/runc/runc.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 10 ++++--<br>
=C2=A05 files changed, 45 insertions(+), 25 deletions(-)<br>
=C2=A0create mode 100644 recipes-containers/runc/files/0001-Makefile-respec=
t-GOBUILDFLAGS-for-runc-and-remove-re.patch<br>
=C2=A0delete mode 100644 recipes-containers/runc/runc-docker/0001-build-dro=
p-recvtty-and-use-GOBUILDFLAGS.patch<br>
<br>
diff --git a/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLA=
GS-for-runc-and-remove-re.patch b/recipes-containers/runc/files/0001-Makefi=
le-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch<br>
new file mode 100644<br>
index 0000000..94cbb4c<br>
--- /dev/null<br>
+++ b/recipes-containers/runc/files/0001-Makefile-respect-GOBUILDFLAGS-for-=
runc-and-remove-re.patch<br>
@@ -0,0 +1,35 @@<br>
+From d2c47a973f354ffd505bb4e809c59e57b543726d Mon Sep 17 00:00:00 2001<br>
+From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blan=
k">Qi.Chen@windriver.com</a>&gt;<br>
+Date: Tue, 6 Aug 2019 19:01:45 +0800<br>
+Subject: [PATCH] Makefile: respect GOBUILDFLAGS for runc and remove recvtt=
y<br>
+ from static<br>
+<br>
+Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
+---<br>
+ Makefile | 3 +--<br>
+ 1 file changed, 1 insertion(+), 2 deletions(-)<br>
+<br>
+diff --git a/Makefile b/Makefile<br>
+index 0f26a1c8..a0c6b40b 100644<br>
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
+@@ -41,7 +41,6 @@ contrib/cmd/recvtty/recvtty: $(SOURCES)<br>
+ <br>
+ static: $(SOURCES)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0CGO_ENABLED=3D1 $(GO) build $(EXTRA_FLAGS) -tag=
s &quot;$(BUILDTAGS) netgo osusergo static_build&quot; -installsuffix netgo=
 -ldflags &quot;-w -extldflags -static -X main.gitCommit=3D${COMMIT} -X mai=
n.version=3D${VERSION} $(EXTRA_LDFLAGS)&quot; -o runc .<br>
+-=C2=A0 =C2=A0 =C2=A0 CGO_ENABLED=3D1 $(GO) build $(EXTRA_FLAGS) -tags &qu=
ot;$(BUILDTAGS) netgo osusergo static_build&quot; -installsuffix netgo -ldf=
lags &quot;-w -extldflags -static -X main.gitCommit=3D${COMMIT} -X main.ver=
sion=3D${VERSION} $(EXTRA_LDFLAGS)&quot; -o contrib/cmd/recvtty/recvtty ./c=
ontrib/cmd/recvtty<br>
+ <br>
+ release:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0script/release.sh -r release/$(VERSION) -v $(VE=
RSION)<br>
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
arget=3D"_blank">bruce.ashfield@windriver.com</a>&gt;<br>
-Date: Thu, 19 Apr 2018 16:39:41 -0400<br>
-Subject: [PATCH] build: drop recvtty and use GOBUILDFLAGS<br>
-<br>
-Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@windriv=
er.com" target=3D"_blank">bruce.ashfield@windriver.com</a>&gt;<br>
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
rel=3D"noreferrer" target=3D"_blank">runc-docker_git.bb</a> b/recipes-conta=
iners/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"noreferrer" target=
=3D"_blank">runc-docker_git.bb</a><br>
index 2bf6222..c9f460b 100644<br>
--- a/recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"=
noreferrer" target=3D"_blank">runc-docker_git.bb</a><br>
+++ b/recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"=
noreferrer" target=3D"_blank">runc-docker_git.bb</a><br>
@@ -5,7 +5,7 @@ include runc.inc<br>
=C2=A0SRCREV_runc-docker =3D &quot;425e105d5a03fabd737a126ad93d62a9eeede87f=
&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/opencontainers/r=
unc;nobranch=3D1;name=3Drunc-docker" rel=3D"noreferrer" target=3D"_blank">g=
ithub.com/opencontainers/runc;nobranch=3D1;name=3Drunc-docker</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-runc-Add-console-sock=
et-dev-null.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-build-drop-recvtty-an=
d-use-GOBUILDFLAGS.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Makefile-respect-GOBU=
ILDFLAGS-for-runc-and-remove-re.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-runc-docker-SIGUSR1-d=
aemonize.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
diff --git a/recipes-containers/runc/<a href=3D"http://runc-opencontainers_=
git.bb" rel=3D"noreferrer" target=3D"_blank">runc-opencontainers_git.bb</a>=
 b/recipes-containers/runc/<a href=3D"http://runc-opencontainers_git.bb" re=
l=3D"noreferrer" target=3D"_blank">runc-opencontainers_git.bb</a><br>
index 76ab794..361bc94 100644<br>
--- a/recipes-containers/runc/<a href=3D"http://runc-opencontainers_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">runc-opencontainers_git.bb</a><br>
+++ b/recipes-containers/runc/<a href=3D"http://runc-opencontainers_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">runc-opencontainers_git.bb</a><br>
@@ -3,5 +3,6 @@ include runc.inc<br>
=C2=A0SRCREV =3D &quot;652297c7c7e6c94e8d064ad5916c32891a6fd388&quot;<br>
=C2=A0SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/opencontainers/runc;=
branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">github.com/opencontai=
ners/runc;branch=3Dmaster</a> \<br>
+=C2=A0 =C2=A0 file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remov=
e-re.patch \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0RUNC_VERSION =3D &quot;1.0.0-rc8&quot;<br>
diff --git a/recipes-containers/runc/runc.inc b/recipes-containers/runc/run=
c.inc<br>
index 46fd09d..41ea41b 100644<br>
--- a/recipes-containers/runc/runc.inc<br>
+++ b/recipes-containers/runc/runc.inc<br>
@@ -14,8 +14,10 @@ inherit go<br>
=C2=A0inherit goarch<br>
=C2=A0inherit pkgconfig<br>
<br>
-PACKAGECONFIG ??=3D &quot;&quot;<br>
+PACKAGECONFIG ??=3D &quot;static&quot;<br>
=C2=A0PACKAGECONFIG[seccomp] =3D &quot;seccomp,,libseccomp&quot;<br>
+# This PACKAGECONFIG serves the purpose of whether building runc as static=
 or not<br>
+PACKAGECONFIG[static] =3D &quot;&quot;<br>
<br>
=C2=A0PROVIDES +=3D &quot;virtual/runc&quot;<br>
=C2=A0RPROVIDES_${PN} =3D &quot;virtual/runc&quot;<br>
@@ -54,7 +56,11 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export CFLAGS=3D&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export LDFLAGS=3D&quot;&quot;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake static<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;=
, &#39;static&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake static<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake runc<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}<br>
<br>
=C2=A0do_install() {<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000cae333058f7e09da--
