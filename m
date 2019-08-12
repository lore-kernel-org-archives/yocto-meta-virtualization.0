Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 009D1E009EA; Mon, 12 Aug 2019 08:05:30 -0700 (PDT)
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
	*      [209.85.208.195 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 869E0E0090E
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Aug 2019 08:05:29 -0700 (PDT)
Received: by mail-lj1-f195.google.com with SMTP id e24so1914785ljg.11
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Aug 2019 08:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9OlAIjN4ePLiesVg1RJ/QoS43KdLiCVXXUK+9aUkV0w=;
	b=jvQqWYhXd61QuKBnYB8FtELHOv7uPxaT++HVKG04au4XhMgIoGPoehy9siZICUcXee
	D0R0SmUtBjo3+QR471rOGnSRT5NxJFwbZ4WkGaJJw1aj4nXbHXtGfyAD6sG+hbhF5YpS
	BXA6vCpMkZGsYEQ1WomkHgHmf/6RWEZa2b5EyWXWDC1VGDQAgsQ8m0JLdIUAtqP4U8Hi
	rMeP3D0cGb8YFzY0Jl+dxrg9r28CS5BCuEt2uQ5auix4/JaC3IfSB0MIlTFGo5sY58uR
	Fvl1S9qtTV9Lhs/Uk+AJSw0oum+yxnrRp7YQ4Q0kI9TX9NqudAEP0829b1I7DXGGTz7N
	FFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9OlAIjN4ePLiesVg1RJ/QoS43KdLiCVXXUK+9aUkV0w=;
	b=TXxYBRG8VsGb7QmFaFSDtirkE7rRjyd2HN+CMtKslO2xr/boHKkfeTHaFhjY+uHMGr
	fcX8F0wiZ5Cvm3kNrO6ocToQhIA/szGROMZdYmoDEdDY4lStaEtQbvyY3iFBRuFuQ/9B
	MarCmtzb29od9dz1IQQ1sxcLl5NAw1dwmo15downfwsiXa4c1gndMEt5Ra2bng8P6rJy
	E1NzcsF/EL9aE0Sj4C0v07tbQWJ7itdDEkQw8h5FRB2h0QuTYRpZU6778E9RTp6lBHyM
	osixSzPR76VkwVSya1lm9O6KC8hmZogw565PrdQqCert6jpCkV+GhD5yw1x05LaVQb3p
	ey1Q==
X-Gm-Message-State: APjAAAUjYsQCDT1HST4w9yHkajuHvd7iwz9iXJz4FkpxNNACXLNiieo+
	UR1TdfjpA8KpytcfmFMxDbSQwXM0d+j1ZnQ2dHWZJUjE8Zw=
X-Google-Smtp-Source: APXvYqxiJN+/04Abrzn8+yOJgs/1mYtzkk6tNwc4wIWtMCc+1gxk2IM2/v4h/RkOFzvE0qDnuU5L763Gp+yF22AxF+I=
X-Received: by 2002:a2e:8449:: with SMTP id u9mr12786296ljh.104.1565622328397; 
	Mon, 12 Aug 2019 08:05:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190807011444.31930-1-Qi.Chen@windriver.com>
In-Reply-To: <20190807011444.31930-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 12 Aug 2019 11:05:16 -0400
Message-ID: <CADkTA4NSJ+GhXxuDG_J0mE-8ZhN2qVrd5yShFT1uaRngS-zZQA@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH V2 1/2] kubernetes: clean up environment settings in do_compile
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
X-List-Received-Date: Mon, 12 Aug 2019 15:05:31 -0000
Content-Type: multipart/alternative; boundary="000000000000bc9311058fecdaf1"

--000000000000bc9311058fecdaf1
Content-Type: text/plain; charset="UTF-8"

staged in master-next for testing.

Bruce

On Tue, Aug 6, 2019 at 9:14 PM Chen Qi <Qi.Chen@windriver.com> wrote:

> There are unnessary and incorrect settings like GOOS and GOROOT.
> There are also redundant settings like GOPATH, CGO_CFLAGS, etc,
> whose latter setting will cover the previous one.
>
> So clean all these up.
>
> Also, remove the comment which suggests settings GOVERSION to "1.10%",
> as it's no longer valid for current OE.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../kubernetes/kubernetes_git.bb              | 36 +++++++------------
>  1 file changed, 12 insertions(+), 24 deletions(-)
>
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb
> b/recipes-containers/kubernetes/kubernetes_git.bb
> index 5b4c3a9..0aa7c00 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -5,8 +5,6 @@ applications across multiple hosts, providing basic
> mechanisms for deployment, \
>  maintenance, and scaling of applications. \
>  "
>
> -# Note: 1.11+ requires go 1.10.2+, so the following must be set
> -#       in your configuration: GOVERSION = "1.10%"
>  PV = "v1.16.0-alpha+git${SRCREV_kubernetes}"
>  SRCREV_kubernetes = "7054e3ead7e1a00ca6ac3ec47ea355b76061a35a"
>
> @@ -31,39 +29,29 @@ inherit goarch
>  COMPATIBLE_HOST = '(x86_64.*|arm.*|aarch64.*)-linux'
>
>  do_compile() {
> -       export GOARCH="${TARGET_GOARCH}"
> -       export GOOS="${TARGET_GOOS}"
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
>         ln -sf ./ ${S}/src/import/vendor/src
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
> -
>         cd ${S}/src/import
> +
>         # Build the host tools first, using the host compiler
>         export GOARCH="${BUILD_GOARCH}"
> +       # Pass the needed cflags/ldflags so that cgo can find the needed
> headers files and libraries
> +       export CGO_ENABLED="1"
> +       export CFLAGS=""
> +       export LDFLAGS=""
> +       export CGO_CFLAGS="${BUILDSDK_CFLAGS}
> --sysroot=${STAGING_DIR_TARGET}"
> +       export CGO_LDFLAGS="${BUILDSDK_LDFLAGS}
> --sysroot=${STAGING_DIR_TARGET}"
>         make generated_files
> KUBE_BUILD_PLATFORMS="${HOST_GOOS}/${BUILD_GOARCH}"
>
> -       # Reset GOARCH to the target one
> +       # Build the target binaries
>         export GOARCH="${TARGET_GOARCH}"
> +       # Pass the needed cflags/ldflags so that cgo can find the needed
> headers files and libraries
> +       export CGO_ENABLED="1"
> +       export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> +       export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
>         # to limit what is built, use 'WHAT', i.e. make WHAT=cmd/kubelet
>         make cross KUBE_BUILD_PLATFORMS=${GOOS}/${GOARCH}
>  }
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

--000000000000bc9311058fecdaf1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">sta=
ged in master-next for testing.</div><div class=3D"gmail_default" style=3D"=
font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:=
small">Bruce</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Tue, Aug 6, 2019 at 9:14 PM Chen Qi &lt;<a href=3D"mai=
lto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">There are unnessary and inc=
orrect settings like GOOS and GOROOT.<br>
There are also redundant settings like GOPATH, CGO_CFLAGS, etc,<br>
whose latter setting will cover the previous one.<br>
<br>
So clean all these up.<br>
<br>
Also, remove the comment which suggests settings GOVERSION to &quot;1.10%&q=
uot;,<br>
as it&#39;s no longer valid for current OE.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../kubernetes/<a href=3D"http://kubernetes_git.bb" rel=3D"noreferrer=
" target=3D"_blank">kubernetes_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | 36 +++++++------------<br>
=C2=A01 file changed, 12 insertions(+), 24 deletions(-)<br>
<br>
diff --git a/recipes-containers/kubernetes/<a href=3D"http://kubernetes_git=
.bb" rel=3D"noreferrer" target=3D"_blank">kubernetes_git.bb</a> b/recipes-c=
ontainers/kubernetes/<a href=3D"http://kubernetes_git.bb" rel=3D"noreferrer=
" target=3D"_blank">kubernetes_git.bb</a><br>
index 5b4c3a9..0aa7c00 100644<br>
--- a/recipes-containers/kubernetes/<a href=3D"http://kubernetes_git.bb" re=
l=3D"noreferrer" target=3D"_blank">kubernetes_git.bb</a><br>
+++ b/recipes-containers/kubernetes/<a href=3D"http://kubernetes_git.bb" re=
l=3D"noreferrer" target=3D"_blank">kubernetes_git.bb</a><br>
@@ -5,8 +5,6 @@ applications across multiple hosts, providing basic mechani=
sms for deployment, \<br>
=C2=A0maintenance, and scaling of applications. \<br>
=C2=A0&quot;<br>
<br>
-# Note: 1.11+ requires go 1.10.2+, so the following must be set<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0in your configuration: GOVERSION =3D &quot;1.1=
0%&quot;<br>
=C2=A0PV =3D &quot;v1.16.0-alpha+git${SRCREV_kubernetes}&quot;<br>
=C2=A0SRCREV_kubernetes =3D &quot;7054e3ead7e1a00ca6ac3ec47ea355b76061a35a&=
quot;<br>
<br>
@@ -31,39 +29,29 @@ inherit goarch<br>
=C2=A0COMPATIBLE_HOST =3D &#39;(x86_64.*|arm.*|aarch64.*)-linux&#39;<br>
<br>
=C2=A0do_compile() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOARCH=3D&quot;${TARGET_GOARCH}&quot;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export GOOS=3D&quot;${TARGET_GOOS}&quot;<br>
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
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf ./ ${S}/src/import/vendor/src<br>
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
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${S}/src/import<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Build the host tools first, using the host co=
mpiler<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOARCH=3D&quot;${BUILD_GOARCH}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Pass the needed cflags/ldflags so that cgo ca=
n find the needed headers files and libraries<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D&quot;1&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export CFLAGS=3D&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export LDFLAGS=3D&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_CFLAGS=3D&quot;${BUILDSDK_CFLAGS} --=
sysroot=3D${STAGING_DIR_TARGET}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_LDFLAGS=3D&quot;${BUILDSDK_LDFLAGS} =
--sysroot=3D${STAGING_DIR_TARGET}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 make generated_files KUBE_BUILD_PLATFORMS=3D&qu=
ot;${HOST_GOOS}/${BUILD_GOARCH}&quot;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Reset GOARCH to the target one<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Build the target binaries<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOARCH=3D&quot;${TARGET_GOARCH}&quot;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Pass the needed cflags/ldflags so that cgo ca=
n find the needed headers files and libraries<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_ENABLED=3D&quot;1&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_CFLAGS=3D&quot;${CFLAGS} --sysroot=
=3D${STAGING_DIR_TARGET}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_LDFLAGS=3D&quot;${LDFLAGS} --sysroot=
=3D${STAGING_DIR_TARGET}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # to limit what is built, use &#39;WHAT&#39;, i=
.e. make WHAT=3Dcmd/kubelet<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 make cross KUBE_BUILD_PLATFORMS=3D${GOOS}/${GOA=
RCH}<br>
=C2=A0}<br>
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
- Gandalf, Star Trek II<br><br></div>

--000000000000bc9311058fecdaf1--
