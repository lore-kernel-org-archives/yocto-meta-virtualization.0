Return-Path: <limon.anibal@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0F8C4E00C78; Thu, 12 Oct 2017 12:22:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (limon.anibal[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.82.49 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.82.49 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2AFDAE00A9C
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Oct 2017 12:22:10 -0700 (PDT)
Received: by mail-wm0-f49.google.com with SMTP id u138so16130069wmu.4
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Oct 2017 12:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YAnF4fQ6POhLKt2Kg6RtXramXnzMyJec1IzQtivfB4E=;
	b=ELkxD4TvgsXOoWZ6O9vN83O6cZJQX93nvAOgoKR/6BTJSWs6kUIkXCTVHon5ti2kJa
	jfVwIWBcby4uXC5Fk/0p2aN/tHqOKPOhRB294VsgvD55JO62nqJKKeTV2XXwPcxvnMWO
	1Gd7pYA1zkfCDYLDSwL+QGmlyvWPoiARfFB7aIL+VF3KF5xRMCMnuHx+orT2v0RZUZ+v
	TYd5ETNj2IeT/mUb7W2BBUmtaPjVDPa6vVHB4aHc39JeREE4TDQS746AW+P1Oq7/u46L
	th9QofnIqAwxekni3igG9r+Xspz0Qv8l6Eag8g/DI8Y4Tfx/vY2cR6oG0zRCB91Qf7Xe
	YhTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YAnF4fQ6POhLKt2Kg6RtXramXnzMyJec1IzQtivfB4E=;
	b=SHCE7uvsWqF9r+NsHkokGaGbgmeNr2eET40dZL+jwFaBQhlKr1KZ1lP6dN/4xQHxSr
	TTtWOED+5JVCSyay3SGC9y9prf2FCU6qFfL7wkgBi5mjxVHx70Am9ZZdI/6KUpodlWpT
	jwRFHoUnFOys0RvJP+Ie1yIDNSH/0Z/QvRcMWErT8EMOgZ+f1ujXs57Rcx3th6eR7NCJ
	rtswEF/Wf9otkIMsAxd7+r7qASrBSmMBeMeOnr/9wxWApzAYXt5x3ZNc8lS3ekx8s9/K
	cloje1b76nFMmbO9Wlry3U5n2dNjE142+o5CbWbow+8Tb89tQcpvfr9Efxj4kO13/1Cc
	NomA==
X-Gm-Message-State: AMCzsaU2ijTnZk4p8t5a8zR+Qgq4o4trDgovvv8AC2icF03kyZh35s7v
	3JobJXaGK7K9hvgkXZ0Lza24LcGMb9K4d2ErU9c=
X-Google-Smtp-Source: AOwi7QBbqHQ3vCE535bytnOZxOWAwiBWKeC0LbnsLdHBXmy2y/8vOQaxVoChkhmS9cLlOCcVP1d0rbDq6d8+/eSIIsY=
X-Received: by 10.80.166.209 with SMTP id f17mr4067539edc.278.1507836129924;
	Thu, 12 Oct 2017 12:22:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.142.72 with HTTP; Thu, 12 Oct 2017 12:22:09 -0700 (PDT)
In-Reply-To: <1507826997-28383-4-git-send-email-pbarker@toganlabs.com>
References: <1507826997-28383-1-git-send-email-pbarker@toganlabs.com>
	<1507826997-28383-4-git-send-email-pbarker@toganlabs.com>
From: =?UTF-8?Q?Anibal_Lim=C3=B3n?= <limon.anibal@gmail.com>
Date: Thu, 12 Oct 2017 14:22:09 -0500
Message-ID: <CAPS-YPATbLJstu6NybXDzk-mOfWqAQqGqB7nYp8N_coL+1vKqg@mail.gmail.com>
To: Paul Barker <pbarker@toganlabs.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 3/4] runc-docker: Disable building recvtty
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
X-List-Received-Date: Thu, 12 Oct 2017 19:22:12 -0000
Content-Type: multipart/alternative; boundary="94eb2c198f2ae75ab3055b5e7419"

--94eb2c198f2ae75ab3055b5e7419
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2017 at 11:49 AM, Paul Barker <pbarker@toganlabs.com> wrote=
:

> The recvtty demo/reference application has cross compilation issues when
> targeting aarch64 platforms. As it is just a demo application and is not
> usually
> used, we can just patch the Makefile to disable building this application=
.
>
> Signed-off-by: Paul Barker <pbarker@toganlabs.com>
>
Acked-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>

> ---
>  .../0001-Disable-building-recvtty.patch            | 26
> ++++++++++++++++++++++
>  recipes-containers/runc/runc-docker_git.bb         |  1 +
>  2 files changed, 27 insertions(+)
>  create mode 100644 recipes-containers/runc/runc-
> docker/0001-Disable-building-recvtty.patch
>
> diff --git a/recipes-containers/runc/runc-docker/0001-Disable-building-re=
cvtty.patch
> b/recipes-containers/runc/runc-docker/0001-Disable-building-recvtty.patch
> new file mode 100644
> index 0000000..fa1f695
> --- /dev/null
> +++ b/recipes-containers/runc/runc-docker/0001-Disable-
> building-recvtty.patch
> @@ -0,0 +1,26 @@
> +From aa2fc7b0eacba61175f083cc8d8adc233bcd0575 Mon Sep 17 00:00:00 2001
> +From: Paul Barker <pbarker@toganlabs.com>
> +Date: Thu, 12 Oct 2017 11:34:24 +0000
> +Subject: [PATCH] Disable building recvtty
> +
> +Signed-off-by: Paul Barker <pbarker@toganlabs.com>
> +Upstream-status: Inappropriate
> +---
> + Makefile | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 0fcf508..24f47dc 100644
> +--- a/src/import/Makefile
> ++++ b/src/import/Makefile
> +@@ -38,7 +38,6 @@ contrib/cmd/recvtty/recvtty: $(SOURCES)
> +
> + static: $(SOURCES)
> +       CGO_ENABLED=3D1 $(GO) build -i $(EXTRA_FLAGS) -tags "$(BUILDTAGS)
> cgo static_build" -ldflags "-w -extldflags -static -X
> main.gitCommit=3D${COMMIT} -X main.version=3D${VERSION} $(EXTRA_LDFLAGS)"=
 -o
> runc .
> +-      CGO_ENABLED=3D1 $(GO) build -i $(EXTRA_FLAGS) -tags "$(BUILDTAGS)
> cgo static_build" -ldflags "-w -extldflags -static -X
> main.gitCommit=3D${COMMIT} -X main.version=3D${VERSION} $(EXTRA_LDFLAGS)"=
 -o
> contrib/cmd/recvtty/recvtty ./contrib/cmd/recvtty
> +
> + release:
> +       @flag_list=3D(seccomp selinux apparmor static); \
> +--
> +2.7.4
> +
> diff --git a/recipes-containers/runc/runc-docker_git.bb
> b/recipes-containers/runc/runc-docker_git.bb
> index 0198652..28232d9 100644
> --- a/recipes-containers/runc/runc-docker_git.bb
> +++ b/recipes-containers/runc/runc-docker_git.bb
> @@ -9,6 +9,7 @@ SRC_URI =3D "git://github.com/docker/runc.
> git;nobranch=3D1;name=3Drunc-docker \
>             file://0003-Update-memory-specs-to-use-int64-not-uint64.patch
> \
>             file://0001-runc-Add-console-socket-dev-null.patch \
>             file://0001-Use-correct-go-cross-compiler.patch \
> +           file://0001-Disable-building-recvtty.patch \
>            "
>
>  GO_IMPORT =3D "import"
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

--94eb2c198f2ae75ab3055b5e7419
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Oct 12, 2017 at 11:49 AM, Paul Barker <span dir=3D"ltr">&lt;<a =
href=3D"mailto:pbarker@toganlabs.com" target=3D"_blank">pbarker@toganlabs.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The recvtty demo=
/reference application has cross compilation issues when<br>
targeting aarch64 platforms. As it is just a demo application and is not us=
ually<br>
used, we can just patch the Makefile to disable building this application.<=
br>
<br>
Signed-off-by: Paul Barker &lt;<a href=3D"mailto:pbarker@toganlabs.com">pba=
rker@toganlabs.com</a>&gt;<br></blockquote><div>Acked-by: An=C3=ADbal Lim=
=C3=B3n &lt;<a href=3D"mailto:anibal.limon@linaro.org">anibal.limon@linaro.=
org</a>&gt;=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
---<br>
=C2=A0.../0001-Disable-building-<wbr>recvtty.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 26 ++++++++++++++++++++++<br>
=C2=A0recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"=
noreferrer" target=3D"_blank">runc-<wbr>docker_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 27 insertions(+)<br>
=C2=A0create mode 100644 recipes-containers/runc/runc-<wbr>docker/0001-Disa=
ble-building-<wbr>recvtty.patch<br>
<br>
diff --git a/recipes-containers/runc/<wbr>runc-docker/0001-Disable-<wbr>bui=
lding-recvtty.patch b/recipes-containers/runc/<wbr>runc-docker/0001-Disable=
-<wbr>building-recvtty.patch<br>
new file mode 100644<br>
index 0000000..fa1f695<br>
--- /dev/null<br>
+++ b/recipes-containers/runc/<wbr>runc-docker/0001-Disable-<wbr>building-r=
ecvtty.patch<br>
@@ -0,0 +1,26 @@<br>
+From aa2fc7b0eacba61175f083cc8d8adc<wbr>233bcd0575 Mon Sep 17 00:00:00 200=
1<br>
+From: Paul Barker &lt;<a href=3D"mailto:pbarker@toganlabs.com">pbarker@tog=
anlabs.com</a>&gt;<br>
+Date: Thu, 12 Oct 2017 11:34:24 +0000<br>
+Subject: [PATCH] Disable building recvtty<br>
+<br>
+Signed-off-by: Paul Barker &lt;<a href=3D"mailto:pbarker@toganlabs.com">pb=
arker@toganlabs.com</a>&gt;<br>
+Upstream-status: Inappropriate<br>
+---<br>
+ Makefile | 1 -<br>
+ 1 file changed, 1 deletion(-)<br>
+<br>
+diff --git a/Makefile b/Makefile<br>
+index 0fcf508..24f47dc 100644<br>
+--- a/src/import/Makefile<br>
++++ b/src/import/Makefile<br>
+@@ -38,7 +38,6 @@ contrib/cmd/recvtty/recvtty: $(SOURCES)<br>
+<br>
+ static: $(SOURCES)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0CGO_ENABLED=3D1 $(GO) build -i $(EXTRA_FLAGS) -=
tags &quot;$(BUILDTAGS) cgo static_build&quot; -ldflags &quot;-w -extldflag=
s -static -X main.gitCommit=3D${COMMIT} -X main.version=3D${VERSION} $(EXTR=
A_LDFLAGS)&quot; -o runc .<br>
+-=C2=A0 =C2=A0 =C2=A0 CGO_ENABLED=3D1 $(GO) build -i $(EXTRA_FLAGS) -tags =
&quot;$(BUILDTAGS) cgo static_build&quot; -ldflags &quot;-w -extldflags -st=
atic -X main.gitCommit=3D${COMMIT} -X main.version=3D${VERSION} $(EXTRA_LDF=
LAGS)&quot; -o contrib/cmd/recvtty/recvtty ./contrib/cmd/recvtty<br>
+<br>
+ release:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@flag_list=3D(seccomp selinux apparmor static);=
 \<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" =
rel=3D"noreferrer" target=3D"_blank">runc<wbr>-docker_git.bb</a> b/recipes-=
containers/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">runc<wbr>-docker_git.bb</a><br>
index 0198652..28232d9 100644<br>
--- a/recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"=
noreferrer" target=3D"_blank">runc<wbr>-docker_git.bb</a><br>
+++ b/recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"=
noreferrer" target=3D"_blank">runc<wbr>-docker_git.bb</a><br>
@@ -9,6 +9,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/docker=
/runc.git;nobranch=3D1;name=3Drunc-docker" rel=3D"noreferrer" target=3D"_bl=
ank">github.com/docker/runc.<wbr>git;nobranch=3D1;name=3Drunc-<wbr>docker</=
a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-Update-memory-<wbr>sp=
ecs-to-use-int64-not-uint64.<wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-runc-Add-console-<wbr=
>socket-dev-null.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Use-correct-go-<wbr>c=
ross-compiler.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Disable-building-<wbr=
>recvtty.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0GO_IMPORT =3D &quot;import&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br></div></div>

--94eb2c198f2ae75ab3055b5e7419--
