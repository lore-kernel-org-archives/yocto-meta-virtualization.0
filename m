Return-Path: <pbarker@toganlabs.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9571BE00A9C; Thu, 12 Oct 2017 11:13:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.54 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.82.54 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 34AC3E007EF
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Oct 2017 11:13:32 -0700 (PDT)
Received: by mail-wm0-f54.google.com with SMTP id t69so15433306wmt.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Oct 2017 11:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=J209r0sbBDTzNntsoWq/c4tUHu2U5BDBMBiOOzLvS3o=;
	b=Pp3HylKOpRubslWND0wqWDaUxkaM2/BbiVlebTQXcxr+2wOd9HKMJGVOZiZmREveNs
	KV1c+0FtssdnS/88P9D0IpjczUN6HPYJm4CCD1adOh+i0+/gTVAJQ0FMMIxSkc0b1BNy
	iBYiiwTOLe2D5mjcYCTXvGwzHZm/6TOBky+KdeYzvtUnMl7+zcD2WPfIj1p9GGyEXNfx
	+KsUbzrnmlTj+gcet6W87puydg8gLo/ixpIV7OMVlGVuqr/SRjsPkLkhmLoVf3JfF3WU
	5ozIlOB9KkpsdQT+0dqUlCwX4aCasESK38dl6Ue0ATodn9/NNGorzi6I3hpvo/WgdtED
	D4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=J209r0sbBDTzNntsoWq/c4tUHu2U5BDBMBiOOzLvS3o=;
	b=Lz5yhJqh6ta5LbBwkYTgr22EDxl/p8VM+O4Ey5uElH7qkcavWS6pKmcjIe1qzgc00+
	Vw63CKkEgU6JvEGx4Ul/xyIM6RK7NdaSp4DaJa3xl6rWSQ5Oa/ATul9DsiCZT+xWby2L
	no66g1X8p3vx8HS4fNr9blrnENVhiTEG6tIrqd6YNXGdSCuz7dfk7+6d6MQ/x4lBhnf8
	6n0La4h/YqfUUQ2E+OkWwCYlMsDiVjCI65t3jXGP2iFzeXbBURJcUypLxPzxLX4Z04D0
	FSAMmaWNPj2qbftORMX064lFlxS1jFZsYv8v4vQmyji3KFJCZhJ6F9E7iRtUneDfSUCE
	YV6g==
X-Gm-Message-State: AMCzsaW8npFACNij1S4lhwuYDAQmVp8PgWDIxbal6/QM/AspFbR7b6TM
	BMMELxgQ7aX33FtW9cuqbDfgOMm1J4RUQh+5LkzKpg==
X-Google-Smtp-Source: AOwi7QAVf5p0d/zqF3KIqBR0xfFfjxVw8MQuNdvnptKnWf6lDdQimYwEigzHJhXcuo0Cgu1ziQgmEiSwl8Wltjj8ifI=
X-Received: by 10.28.156.67 with SMTP id f64mr2445883wme.42.1507832012050;
	Thu, 12 Oct 2017 11:13:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.160.132 with HTTP; Thu, 12 Oct 2017 11:13:31 -0700 (PDT)
Received: by 10.223.160.132 with HTTP; Thu, 12 Oct 2017 11:13:31 -0700 (PDT)
In-Reply-To: <CADkTA4N07AyeVWHsTBNBde5a6=OvhY4d+PA1B-Lj2unV-HC9Ag@mail.gmail.com>
References: <1507826997-28383-1-git-send-email-pbarker@toganlabs.com>
	<1507826997-28383-5-git-send-email-pbarker@toganlabs.com>
	<CADkTA4N07AyeVWHsTBNBde5a6=OvhY4d+PA1B-Lj2unV-HC9Ag@mail.gmail.com>
From: Paul Barker <pbarker@toganlabs.com>
Date: Thu, 12 Oct 2017 19:13:31 +0100
Message-ID: <CAPyrkgxXdMOVrekC_gFLdRY_1C4dcTnZ==57fkgWOg94Q+PPvg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 4/4] runc: Simplify recipes
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
X-List-Received-Date: Thu, 12 Oct 2017 18:13:34 -0000
Content-Type: multipart/alternative; boundary="001a114b320875b938055b5d7ffa"

--001a114b320875b938055b5d7ffa
Content-Type: text/plain; charset="UTF-8"

On 12 Oct 2017 6:02 p.m., "Bruce Ashfield" <bruce.ashfield@gmail.com> wrote:

On Thu, Oct 12, 2017 at 12:49 PM, Paul Barker <pbarker@toganlabs.com> wrote:
> * All common settings are merged into the runc.inc file.
>
> * SRC_URI and SRCREV settings are normalised, dropping unnecessary
arguments.

I'm going to keep the named SRCREVs, since we very often have multiple
different
git upstreams in a single build. You'll see that in my new recipes
that I've been
adding.

It does no harm, so it stays.

>
> * Variables in runc.inc are re-ordered slightly to make things clearer.

Extra churn. I'd rather leave things be.

>
> * Drop unused EXTRA_FLAGS variable in runc-docker which isn't picked up
by the
>   runc Makefile anyway as it isn't exported.

This could be a separate patch.

>
> * Drop unnecessary do_compile_prepend in runc-opencontainers as the
"vendor/src"
>   symlink is already created in do_compile in runc.inc.

As could this.

Bruce

>
> Signed-off-by: Paul Barker <pbarker@toganlabs.com>
> ---
>  recipes-containers/runc/runc-docker_git.bb         | 10 ++--------
>  recipes-containers/runc/runc-opencontainers_git.bb | 19
++++---------------
>  recipes-containers/runc/runc.inc                   |  9 ++++++---
>  3 files changed, 12 insertions(+), 26 deletions(-)
>
> diff --git a/recipes-containers/runc/runc-docker_git.bb
b/recipes-containers/runc/runc-docker_git.bb
> index 28232d9..b1fb624 100644
> --- a/recipes-containers/runc/runc-docker_git.bb
> +++ b/recipes-containers/runc/runc-docker_git.bb
> @@ -2,8 +2,8 @@ include runc.inc
>
>  # Note: this rev is before the required protocol field, update when all
components
>  #       have been updated to match.
> -SRCREV_runc-docker = "9d6821d1b53908e249487741eccd567249ca1d99"
> -SRC_URI = "git://github.com/docker/runc.git;nobranch=1;name=runc-docker \
> +SRCREV = "9d6821d1b53908e249487741eccd567249ca1d99"
> +SRC_URI = "git://github.com/docker/runc.git \
>             file://0001-Update-to-runtime-spec-
198f23f827eea397d4331d7eb048d.patch \
>             file://0002-Remove-Platform-as-no-longer-in-OCI-spec.patch \
>             file://0003-Update-memory-specs-to-use-int64-not-uint64.patch
\
> @@ -12,10 +12,4 @@ SRC_URI = "git://github.com/docker/runc.
git;nobranch=1;name=runc-docker \
>             file://0001-Disable-building-recvtty.patch \
>            "
>
> -GO_IMPORT = "import"
> -
> -EXTRA_FLAGS = "-v -x -work"
> -
>  RUNC_VERSION = "1.0.0-rc3"
> -PROVIDES += "virtual/runc"
> -RPROVIDES_${PN} = "virtual/runc"
> diff --git a/recipes-containers/runc/runc-opencontainers_git.bb
b/recipes-containers/runc/runc-opencontainers_git.bb
> index 2cfceea..ea093ee 100644
> --- a/recipes-containers/runc/runc-opencontainers_git.bb
> +++ b/recipes-containers/runc/runc-opencontainers_git.bb
> @@ -1,19 +1,8 @@
>  include runc.inc
>
>  SRCREV = "2e7cfe036e2c6dc51ccca6eb7fa3ee6b63976dcd"
> -SRC_URI = " \
> -    git://github.com/opencontainers/runc;branch=master \
> -    file://0001-Use-correct-go-cross-compiler.patch \
> -    "
> -RUNC_VERSION = "1.0.0-rc4"
> -PROVIDES += "virtual/runc"
> -RPROVIDES_${PN} = "virtual/runc"
> -
> -GO_IMPORT = "import"
> +SRC_URI = "git://github.com/opencontainers/runc \
> +           file://0001-Use-correct-go-cross-compiler.patch \
> +          "
>
> -do_compile_prepend() {
> -       # Go looks in a src directory under any directory in GOPATH but
> -       # runc-opencontainers uses 'vendor' instead of 'vendor/src'. We
can fix
> -       # this with a symlink.
> -       ln -sfn . "${S}/src/import/vendor/src"
> -}
> +RUNC_VERSION = "1.0.0-rc4"
> diff --git a/recipes-containers/runc/runc.inc b/recipes-containers/runc/
runc.inc
> index b1f2ba8..7901bc7 100644
> --- a/recipes-containers/runc/runc.inc
> +++ b/recipes-containers/runc/runc.inc
> @@ -2,6 +2,10 @@ HOMEPAGE = "https://github.com/opencontainers/runc"
>  SUMMARY = "runc container cli tools"
>  DESCRIPTION = "runc is a CLI tool for spawning and running containers
according to the OCI specification."
>
> +PROVIDES += "virtual/runc"
> +RPROVIDES_${PN} = "virtual/runc"
> +RRECOMMENDS_${PN} = "lxc docker"
> +
>  # Apache-2.0 for containerd
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=
435b266b3899aa8a959f17d41c56def8"
> @@ -11,14 +15,13 @@ S = "${WORKDIR}/git"
>  PV = "${RUNC_VERSION}+git${SRCREV}"
>
>  inherit go
> -RRECOMMENDS_${PN} = "lxc docker"
> +GO_IMPORT = "import"
>
>  LIBCONTAINER_PACKAGE="github.com/opencontainers/runc/libcontainer"
>
> -do_configure[noexec] = "1"
>  EXTRA_OEMAKE="BUILDTAGS=''"
>
> -inherit goarch
> +do_configure[noexec] = "1"
>
>  do_compile() {
>         # Set GOPATH. See 'PACKAGERS.md'. Don't rely on
> --


I'll edit this a bit and resubmit as a couple of smaller commits. Do you
want to take 1-3 of this series rather than me resending the whole series?

--001a114b320875b938055b5d7ffa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div class=3D"gmail_extra" dir=3D"auto"><div class=3D"gma=
il_quote">On 12 Oct 2017 6:02 p.m., &quot;Bruce Ashfield&quot; &lt;<a href=
=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote=
:<br type=3D"attribution"><blockquote class=3D"quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"quoted-tex=
t">On Thu, Oct 12, 2017 at 12:49 PM, Paul Barker &lt;<a href=3D"mailto:pbar=
ker@toganlabs.com">pbarker@toganlabs.com</a>&gt; wrote:<br>
&gt; * All common settings are merged into the runc.inc file.<br>
&gt;<br>
&gt; * SRC_URI and SRCREV settings are normalised, dropping unnecessary arg=
uments.<br>
<br>
</div>I&#39;m going to keep the named SRCREVs, since we very often have mul=
tiple different<br>
git upstreams in a single build. You&#39;ll see that in my new recipes<br>
that I&#39;ve been<br>
adding.<br>
<br>
It does no harm, so it stays.<br>
<div class=3D"quoted-text"><br>
&gt;<br>
&gt; * Variables in runc.inc are re-ordered slightly to make things clearer=
.<br>
<br>
</div>Extra churn. I&#39;d rather leave things be.<br>
<div class=3D"quoted-text"><br>
&gt;<br>
&gt; * Drop unused EXTRA_FLAGS variable in runc-docker which isn&#39;t pick=
ed up by the<br>
&gt;=C2=A0 =C2=A0runc Makefile anyway as it isn&#39;t exported.<br>
<br>
</div>This could be a separate patch.<br>
<div class=3D"quoted-text"><br>
&gt;<br>
&gt; * Drop unnecessary do_compile_prepend in runc-opencontainers as the &q=
uot;vendor/src&quot;<br>
&gt;=C2=A0 =C2=A0symlink is already created in do_compile in runc.inc.<br>
<br>
</div>As could this.<br>
<br>
Bruce<br>
<div class=3D"elided-text"><br>
&gt;<br>
&gt; Signed-off-by: Paul Barker &lt;<a href=3D"mailto:pbarker@toganlabs.com=
">pbarker@toganlabs.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" re=
l=3D"noreferrer" target=3D"_blank">runc-<wbr>docker_git.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 10 ++--------<br>
&gt;=C2=A0 recipes-containers/runc/<a href=3D"http://runc-opencontainers_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">runc-<wbr>opencontainers_git.bb<=
/a> | 19 ++++---------------<br>
&gt;=C2=A0 recipes-containers/runc/runc.<wbr>inc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 9 ++++++---<br>
&gt;=C2=A0 3 files changed, 12 insertions(+), 26 deletions(-)<br>
&gt;<br>
&gt; diff --git a/recipes-containers/runc/<a href=3D"http://runc-docker_git=
.bb" rel=3D"noreferrer" target=3D"_blank">runc<wbr>-docker_git.bb</a> b/rec=
ipes-containers/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"noreferre=
r" target=3D"_blank">runc<wbr>-docker_git.bb</a><br>
&gt; index 28232d9..b1fb624 100644<br>
&gt; --- a/recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" re=
l=3D"noreferrer" target=3D"_blank">runc<wbr>-docker_git.bb</a><br>
&gt; +++ b/recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" re=
l=3D"noreferrer" target=3D"_blank">runc<wbr>-docker_git.bb</a><br>
&gt; @@ -2,8 +2,8 @@ include runc.inc<br>
&gt;<br>
&gt;=C2=A0 # Note: this rev is before the required protocol field, update w=
hen all components<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0have been updated to match.<br>
&gt; -SRCREV_runc-docker =3D &quot;<wbr>9d6821d1b53908e249487741eccd56<wbr>=
7249ca1d99&quot;<br>
&gt; -SRC_URI =3D &quot;git://<a href=3D"http://github.com/docker/runc.git;=
nobranch=3D1;name=3Drunc-docker" rel=3D"noreferrer" target=3D"_blank">githu=
b.com/docker/runc.<wbr>git;nobranch=3D1;name=3Drunc-<wbr>docker</a> \<br>
&gt; +SRCREV =3D &quot;<wbr>9d6821d1b53908e249487741eccd56<wbr>7249ca1d99&q=
uot;<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/docker/runc.git"=
 rel=3D"noreferrer" target=3D"_blank">github.com/docker/runc.<wbr>git</a> \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Update-to-r=
untime-<wbr>spec-<wbr>198f23f827eea397d4331d7eb048d.<wbr>patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Remove-Plat=
form-<wbr>as-no-longer-in-OCI-spec.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-Update-memo=
ry-<wbr>specs-to-use-int64-not-uint64.<wbr>patch \<br>
&gt; @@ -12,10 +12,4 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.co=
m/docker/runc.git;nobranch=3D1;name=3Drunc-docker" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/docker/runc.<wbr>git;nobranch=3D1;name=3Drunc-<wbr>=
docker</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Disable-bui=
lding-<wbr>recvtty.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;<br>
&gt; -GO_IMPORT =3D &quot;import&quot;<br>
&gt; -<br>
&gt; -EXTRA_FLAGS =3D &quot;-v -x -work&quot;<br>
&gt; -<br>
&gt;=C2=A0 RUNC_VERSION =3D &quot;1.0.0-rc3&quot;<br>
&gt; -PROVIDES +=3D &quot;virtual/runc&quot;<br>
&gt; -RPROVIDES_${PN} =3D &quot;virtual/runc&quot;<br>
&gt; diff --git a/recipes-containers/runc/<a href=3D"http://runc-opencontai=
ners_git.bb" rel=3D"noreferrer" target=3D"_blank">runc<wbr>-opencontainers_=
git.bb</a> b/recipes-containers/runc/<a href=3D"http://runc-opencontainers_=
git.bb" rel=3D"noreferrer" target=3D"_blank">runc<wbr>-opencontainers_git.b=
b</a><br>
&gt; index 2cfceea..ea093ee 100644<br>
&gt; --- a/recipes-containers/runc/<a href=3D"http://runc-opencontainers_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">runc<wbr>-opencontainers_git.bb<=
/a><br>
&gt; +++ b/recipes-containers/runc/<a href=3D"http://runc-opencontainers_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">runc<wbr>-opencontainers_git.bb<=
/a><br>
&gt; @@ -1,19 +1,8 @@<br>
&gt;=C2=A0 include runc.inc<br>
&gt;<br>
&gt;=C2=A0 SRCREV =3D &quot;<wbr>2e7cfe036e2c6dc51ccca6eb7fa3ee<wbr>6b63976=
dcd&quot;<br>
&gt; -SRC_URI =3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 git://<a href=3D"http://github.com/opencontainers/runc;=
branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">github.com/<wbr>openc=
ontainers/runc;branch=3D<wbr>master</a> \<br>
&gt; -=C2=A0 =C2=A0 file://0001-Use-correct-go-<wbr>cross-compiler.patch \<=
br>
&gt; -=C2=A0 =C2=A0 &quot;<br>
&gt; -RUNC_VERSION =3D &quot;1.0.0-rc4&quot;<br>
&gt; -PROVIDES +=3D &quot;virtual/runc&quot;<br>
&gt; -RPROVIDES_${PN} =3D &quot;virtual/runc&quot;<br>
&gt; -<br>
&gt; -GO_IMPORT =3D &quot;import&quot;<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/opencontainers/r=
unc" rel=3D"noreferrer" target=3D"_blank">github.com/<wbr>opencontainers/ru=
nc</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Use-correct-go-<=
wbr>cross-compiler.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;<br>
&gt; -do_compile_prepend() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# Go looks in a src directory under any di=
rectory in GOPATH but<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# runc-opencontainers uses &#39;vendor&#39=
; instead of &#39;vendor/src&#39;. We can fix<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# this with a symlink.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sfn . &quot;${S}/src/import/vendor/src=
&quot;<br>
&gt; -}<br>
&gt; +RUNC_VERSION =3D &quot;1.0.0-rc4&quot;<br>
&gt; diff --git a/recipes-containers/runc/<wbr>runc.inc b/recipes-container=
s/runc/<wbr>runc.inc<br>
&gt; index b1f2ba8..7901bc7 100644<br>
&gt; --- a/recipes-containers/runc/<wbr>runc.inc<br>
&gt; +++ b/recipes-containers/runc/<wbr>runc.inc<br>
&gt; @@ -2,6 +2,10 @@ HOMEPAGE =3D &quot;<a href=3D"https://github.com/open=
containers/runc" rel=3D"noreferrer" target=3D"_blank">https://github.com/<w=
br>opencontainers/runc</a>&quot;<br>
&gt;=C2=A0 SUMMARY =3D &quot;runc container cli tools&quot;<br>
&gt;=C2=A0 DESCRIPTION =3D &quot;runc is a CLI tool for spawning and runnin=
g containers according to the OCI specification.&quot;<br>
&gt;<br>
&gt; +PROVIDES +=3D &quot;virtual/runc&quot;<br>
&gt; +RPROVIDES_${PN} =3D &quot;virtual/runc&quot;<br>
&gt; +RRECOMMENDS_${PN} =3D &quot;lxc docker&quot;<br>
&gt; +<br>
&gt;=C2=A0 # Apache-2.0 for containerd<br>
&gt;=C2=A0 LICENSE =3D &quot;Apache-2.0&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://src/import/LICENSE;<wbr>md5=3D=
<wbr>435b266b3899aa8a959f17d41c56de<wbr>f8&quot;<br>
&gt; @@ -11,14 +15,13 @@ S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;=C2=A0 PV =3D &quot;${RUNC_VERSION}+git${SRCREV}&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit go<br>
&gt; -RRECOMMENDS_${PN} =3D &quot;lxc docker&quot;<br>
&gt; +GO_IMPORT =3D &quot;import&quot;<br>
&gt;<br>
&gt;=C2=A0 LIBCONTAINER_PACKAGE=3D&quot;<a href=3D"http://github.com/openco=
ntainers/runc/libcontainer" rel=3D"noreferrer" target=3D"_blank">github.<wb=
r>com/opencontainers/runc/<wbr>libcontainer</a>&quot;<br>
&gt;<br>
&gt; -do_configure[noexec] =3D &quot;1&quot;<br>
&gt;=C2=A0 EXTRA_OEMAKE=3D&quot;BUILDTAGS=3D&#39;&#39;&quot;<br>
&gt;<br>
&gt; -inherit goarch<br>
&gt; +do_configure[noexec] =3D &quot;1&quot;<br>
&gt;<br>
&gt;=C2=A0 do_compile() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Set GOPATH. See &#39;PACKAGERS.md&#=
39;. Don&#39;t rely on<br>
&gt; --<br></div></blockquote></div></div><div dir=3D"auto"><br></div><div =
dir=3D"auto">I&#39;ll edit this a bit and resubmit as a couple of smaller c=
ommits. Do you want to take 1-3 of this series rather than me resending the=
 whole series?</div><div class=3D"gmail_extra" dir=3D"auto"><div class=3D"g=
mail_quote"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div class=3D"elided-text"></div></blo=
ckquote></div></div></div>

--001a114b320875b938055b5d7ffa--
