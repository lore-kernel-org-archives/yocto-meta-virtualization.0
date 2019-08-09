Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 11B99E00AE6; Fri,  9 Aug 2019 07:21:20 -0700 (PDT)
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
	*      [209.85.208.196 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 516D4E0074B
	for <meta-virtualization@yoctoproject.org>;
	Fri,  9 Aug 2019 07:21:18 -0700 (PDT)
Received: by mail-lj1-f196.google.com with SMTP id 15so476029ljr.9
	for <meta-virtualization@yoctoproject.org>;
	Fri, 09 Aug 2019 07:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BvA0x1RFSx3+1rPto/LlzgEaFrSyeE8T/J5rJn07Q4k=;
	b=ZDHqgt4bUlQIgNq43u3axIZzREqWcxjNVCFoqReHV5CcID20S1Akx7pd6gznkeIohw
	rLwo8GmCG+3LKWGjnLz6WL4aJPKWJDocQa46k0IL1Q5OnjukjY5yPRmC0SwCyZfzrQ3x
	kRwSmbPMJ01m0hdfJzeVsRzv/27MrS2n590Bw9tErkN9zI5r63eNbfTfdowsGqaGP9hz
	gJEyKlnNqyLT2uMcFkbVT+J39DvWkzFarp0ITUAtRK8SQldDE2LzGqwFsBNSZY+lpY91
	94Nn9hF6wWjAEJlQUAUSDaln7rq87DM7CA4bvT+rBmE7qB++GVEB0X4sdqHheO1AwGfk
	3eIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BvA0x1RFSx3+1rPto/LlzgEaFrSyeE8T/J5rJn07Q4k=;
	b=JEkJRl92MhLsWWbC+UPD2pEkqFUkIAIlBAbYJiXXQTnYQ9qC4bsAsGPnxJMlrOB2/F
	/KmR90OOHzoECsc/5b4KwdjevsLYT8y0sqVqt+4TplRz9lHEJg6nWFGJ1ffcU2D0950W
	+lPFY/mLujg01Gg0YftYA66iAhVOnNucjRWZ4k17KtzDvDTo0twzlRLrlMeAR+naaw9Q
	qtz5DoIj26uWx1usivr0KAfGBxPfUJN7uqSV72RjxwzbL7OHOcRzmhih0wtyR86FLI9W
	sV4qlpHUd+mchdfL0Fz89/SLOCLVlKyz1pOrQ2ndZqtuN/9gFkqxsbFPYJNZ/Vw+VFtj
	3Zpw==
X-Gm-Message-State: APjAAAW/NyhlC/VeXcBakPtMhexHjei+nqGdVCP4PB4MNeO51iExKEJD
	fUpZhYYvNOlqZvkBok6G54GVsmbGGXzTyESpogM=
X-Google-Smtp-Source: APXvYqwdSaqX0waQcBKq/7kvHx94peYpFyjO3nVl257Y2cMWNOF0XI9/gKCuYYku729VtfYgqpO8lA1EwBbxIq25BXg=
X-Received: by 2002:a2e:9115:: with SMTP id m21mr3548856ljg.232.1565360476970; 
	Fri, 09 Aug 2019 07:21:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190809093615.11069-1-Qi.Chen@windriver.com>
In-Reply-To: <20190809093615.11069-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 9 Aug 2019 10:21:05 -0400
Message-ID: <CADkTA4PQ2Gmoz6J2GzDRG5VctyubP9mwLWJHHOArDxGRgi446g@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 1/2] cni: fix problem about cross compilation
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
X-List-Received-Date: Fri, 09 Aug 2019 14:21:20 -0000
Content-Type: multipart/alternative; boundary="0000000000002ce5a6058fafe39e"

--0000000000002ce5a6058fafe39e
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 9, 2019 at 5:37 AM Chen Qi <Qi.Chen@windriver.com> wrote:

> When setting up k8s, the following error appeared, failing
> to setup coredns pod.
>
>   NetworkPlugin cni failed to set up pod
> "coredns-5f7fc64c95-4nnfq_kube-system" network: fork/exec
> /opt/cni/bin/loopback: no such file or directory
>
> This is because the binary, /opt/cni/bin/loopback, has wrong interpreter.
>
> So fix do_compile to use ${GO} instead of go to fix this problem.
>
> Also clean up all unnecessary settings which have already been in
> go.bbclass.
>

These need to be separate patches.

In particular, I want the CGO_ENABLED flag to remain, as well as GOPATH,
since on uprev, I'm constantly tweaking them.

Bruce


>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-networking/cni/cni_git.bb | 25 +++----------------------
>  1 file changed, 3 insertions(+), 22 deletions(-)
>
> diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/
> cni_git.bb
> index d07154b..f392ea6 100644
> --- a/recipes-networking/cni/cni_git.bb
> +++ b/recipes-networking/cni/cni_git.bb
> @@ -29,18 +29,6 @@ inherit go
>  inherit goarch
>
>  do_compile() {
> -       export GOARCH="${TARGET_GOARCH}"
> -       export GOROOT="${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
> -       export GOPATH="${S}/src/import:${S}/src/import/vendor"
> -
> -       # Pass the needed cflags/ldflags so that cgo
> -       # can find the needed headers files and libraries
> -       export CGO_ENABLED="1"
> -       export CFLAGS=""
> -       export LDFLAGS=""
> -       export CGO_CFLAGS="${BUILDSDK_CFLAGS}
> --sysroot=${STAGING_DIR_TARGET}"
> -       export CGO_LDFLAGS="${BUILDSDK_LDFLAGS}
> --sysroot=${STAGING_DIR_TARGET}"
> -
>         # link fixups for compilation
>         rm -f ${S}/src/import/vendor/src
>         mkdir -p ${S}/src/import/vendor/
> @@ -56,19 +44,12 @@ do_compile() {
>         ln -sf ${WORKDIR}/plugins ${S}/src/import/vendor/
> github.com/containernetworking/plugins
>
>         export
> GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
> -       export
> GOROOT="${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_SYS}/go"
> -
> -       # Pass the needed cflags/ldflags so that cgo
> -       # can find the needed headers files and libraries
> -       export CGO_ENABLED="1"
> -       export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> -       export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
>
>         cd ${S}/src/import/vendor/
> github.com/containernetworking/cni/libcni
> -       go build
> +       ${GO} build
>
>         cd ${S}/src/import/vendor/
> github.com/containernetworking/cni/cnitool
> -       go build
> +       ${GO} build
>
>         cd ${S}/src/import/vendor/github.com/containernetworking/plugins/
>         PLUGINS="$(ls -d plugins/meta/*; ls -d plugins/main/* | grep -v
> windows)"
> @@ -76,7 +57,7 @@ do_compile() {
>         for p in $PLUGINS; do
>             plugin="$(basename "$p")"
>             echo "building: $p"
> -           go build -o ${WORKDIR}/plugins/bin/$plugin
> github.com/containernetworking/plugins/$p
> +           ${GO} build -o ${WORKDIR}/plugins/bin/$plugin
> github.com/containernetworking/plugins/$p
>         done
>  }
>
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

--0000000000002ce5a6058fafe39e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Aug 9, 2019 at 5:37 AM Chen Qi &lt;<a href=
=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">When setting up k8s,=
 the following error appeared, failing<br>
to setup coredns pod.<br>
<br>
=C2=A0 NetworkPlugin cni failed to set up pod &quot;coredns-5f7fc64c95-4nnf=
q_kube-system&quot; network: fork/exec /opt/cni/bin/loopback: no such file =
or directory<br>
<br>
This is because the binary, /opt/cni/bin/loopback, has wrong interpreter.<b=
r>
<br>
So fix do_compile to use ${GO} instead of go to fix this problem.<br>
<br>
Also clean up all unnecessary settings which have already been in go.bbclas=
s.<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">These need to be separate patches.=C2=A0</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmai=
l_default" style=3D"font-size:small">In particular, I want the CGO_ENABLED =
flag to remain, as well as GOPATH, since on uprev, I&#39;m constantly tweak=
ing them.</div></div><div class=3D"gmail_default" style=3D"font-size:small"=
><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-networking/cni/<a href=3D"http://cni_git.bb" rel=3D"noreferre=
r" target=3D"_blank">cni_git.bb</a> | 25 +++----------------------<br>
=C2=A01 file changed, 3 insertions(+), 22 deletions(-)<br>
<br>
diff --git a/recipes-networking/cni/<a href=3D"http://cni_git.bb" rel=3D"no=
referrer" target=3D"_blank">cni_git.bb</a> b/recipes-networking/cni/<a href=
=3D"http://cni_git.bb" rel=3D"noreferrer" target=3D"_blank">cni_git.bb</a><=
br>
index d07154b..f392ea6 100644<br>
--- a/recipes-networking/cni/<a href=3D"http://cni_git.bb" rel=3D"noreferre=
r" target=3D"_blank">cni_git.bb</a><br>
+++ b/recipes-networking/cni/<a href=3D"http://cni_git.bb" rel=3D"noreferre=
r" target=3D"_blank">cni_git.bb</a><br>
@@ -29,18 +29,6 @@ inherit go<br>
=C2=A0inherit goarch<br>
<br>
=C2=A0do_compile() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOARCH=3D&quot;${TARGET_GOARCH}&quot;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOROOT=3D&quot;${STAGING_LIBDIR_NATIVE}/=
${TARGET_SYS}/go&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOPATH=3D&quot;${S}/src/import:${S}/src/=
import/vendor&quot;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Pass the needed cflags/ldflags so that cgo<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# can find the needed headers files and librari=
es<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D&quot;1&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CFLAGS=3D&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export LDFLAGS=3D&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_CFLAGS=3D&quot;${BUILDSDK_CFLAGS} --=
sysroot=3D${STAGING_DIR_TARGET}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_LDFLAGS=3D&quot;${BUILDSDK_LDFLAGS} =
--sysroot=3D${STAGING_DIR_TARGET}&quot;<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # link fixups for compilation<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ${S}/src/import/vendor/src<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${S}/src/import/vendor/<br>
@@ -56,19 +44,12 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf ${WORKDIR}/plugins ${S}/src/import/vendo=
r/<a href=3D"http://github.com/containernetworking/plugins" rel=3D"noreferr=
er" target=3D"_blank">github.com/containernetworking/plugins</a><br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOPATH=3D&quot;${S}/src/import/.gopath:$=
{S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOROOT=3D&quot;${STAGING_DIR_NATIVE}/${n=
onarch_libdir}/${HOST_SYS}/go&quot;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Pass the needed cflags/ldflags so that cgo<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# can find the needed headers files and librari=
es<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D&quot;1&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_CFLAGS=3D&quot;${CFLAGS} --sysroot=
=3D${STAGING_DIR_TARGET}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_LDFLAGS=3D&quot;${LDFLAGS} --sysroot=
=3D${STAGING_DIR_TARGET}&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${S}/src/import/vendor/<a href=3D"http://git=
hub.com/containernetworking/cni/libcni" rel=3D"noreferrer" target=3D"_blank=
">github.com/containernetworking/cni/libcni</a><br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0go build<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${GO} build<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${S}/src/import/vendor/<a href=3D"http://git=
hub.com/containernetworking/cni/cnitool" rel=3D"noreferrer" target=3D"_blan=
k">github.com/containernetworking/cni/cnitool</a><br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0go build<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${GO} build<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${S}/src/import/vendor/<a href=3D"http://git=
hub.com/containernetworking/plugins/" rel=3D"noreferrer" target=3D"_blank">=
github.com/containernetworking/plugins/</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 PLUGINS=3D&quot;$(ls -d plugins/meta/*; ls -d p=
lugins/main/* | grep -v windows)&quot;<br>
@@ -76,7 +57,7 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for p in $PLUGINS; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 plugin=3D&quot;$(basename &quot;$=
p&quot;)&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;building: $p&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0go build -o ${WORKDIR}/plugins/bi=
n/$plugin <a href=3D"http://github.com/containernetworking/plugins/$p" rel=
=3D"noreferrer" target=3D"_blank">github.com/containernetworking/plugins/$p=
</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${GO} build -o ${WORKDIR}/plugins=
/bin/$plugin <a href=3D"http://github.com/containernetworking/plugins/$p" r=
el=3D"noreferrer" target=3D"_blank">github.com/containernetworking/plugins/=
$p</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
=C2=A0}<br>
<br>
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

--0000000000002ce5a6058fafe39e--
