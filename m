Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EFE73E00927; Mon, 12 Aug 2019 08:04:06 -0700 (PDT)
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
	*      [209.85.167.66 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1853E0090E
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Aug 2019 08:04:05 -0700 (PDT)
Received: by mail-lf1-f66.google.com with SMTP id c9so74398840lfh.4
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Aug 2019 08:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xa5/DyXLYnUnWIPWMaPCTyFYteN4wyRxJlUVmB2IVIc=;
	b=RUYuGmpPU0mlLUdbYnebyey4pwPDy0T0NsQQS7wsJ0Ay4A3/bgKaZH5xejvRnx63MJ
	lXva6Mjvv6BSpQ1H6FCleaY4hi//vPdi23ijjUVP9FLFCUCCbuCYxsHKJPFwA2+Il/hf
	6FbzfYg5hZK2PZHZ0beSBZc5jw59nG13bswIhK0s/p6oajjKqe6qK9J2orn+2myD2BDB
	B58ZsyWrrsuRgZpS0+30KCVGvMoLyx6pi0txsOH8rgwpqYJwEtP4DAw+MkQC/4wfzdKu
	/z0IuXvK4m/BA2ciWmrFp99RkW+cRnmsqmxTgAoHvGeVcBrtVjOEiB8x/pCeOCF8TRNk
	zCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xa5/DyXLYnUnWIPWMaPCTyFYteN4wyRxJlUVmB2IVIc=;
	b=lF0qDw4IJyfKiyopG4fTH8JCAeY6AiJPDwk74MPCR29AynCqGj0yn35ay2LmDm8TXV
	n3W2QMQZY33HZzbOiEYieiuL9h9Y6qFTV1LBcbIc0rOu4cUGAOoAT14RlAbkp0TI7OXQ
	QK8xXf48w6PKj4Zqpd+YWPSycnZNkr9H6a6qlUx7XtzUIzps33iRwtIH83oqXI5+L3ks
	MTZkkJdG7vXY70ozwwfTMDYUxr6EcoLOmV7zYlmnmBjOzxykSQn+5TOll6/8v6Oqgd6o
	OjAZN+m9XbFzCupC0NX5LisSzkelq83ZPq9ko/njCn8yVMQXOgCjCBuW4xwHuGE5/GRy
	IhOw==
X-Gm-Message-State: APjAAAUdKJREQg9RFTYBprghLIOuu404QikCXbadwA5Iuj5Vk9XmFDKf
	CHvSWoog5oDdjlCZLdPRtdIH7n+qEgFaXy7sI9h1wWEC1I8=
X-Google-Smtp-Source: APXvYqztx98mDzquY/fdhHxOiUZOCbATzWxJH0uND5al7h+wuxATcDggeFpHHvS9I4W2cnMIzWGv9yaLH0LUttMFA4c=
X-Received: by 2002:ac2:545b:: with SMTP id d27mr20402929lfn.36.1565622244409; 
	Mon, 12 Aug 2019 08:04:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190812023313.17108-1-Qi.Chen@windriver.com>
In-Reply-To: <20190812023313.17108-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 12 Aug 2019 11:03:52 -0400
Message-ID: <CADkTA4NBR7AL1Sg8FPcjCGZsXshs7LYCaNs2XHD3DbJ8M9Kqtw@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH V2 1/3] cni: remove unnecessary GO settings
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
X-List-Received-Date: Mon, 12 Aug 2019 15:04:07 -0000
Content-Type: multipart/alternative; boundary="000000000000bb05ea058fecd5cd"

--000000000000bb05ea058fecd5cd
Content-Type: text/plain; charset="UTF-8"

v2 is staged for testing. See my master-next branch for details.

Bruce

On Sun, Aug 11, 2019 at 10:33 PM Chen Qi <Qi.Chen@windriver.com> wrote:

> These settings are either in go.bbclass or duplicate, thus
> removing them.
>
> Keep only CGO_ENABLED and GOPATH to easier manipulation while
> upgrading cni.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-networking/cni/cni_git.bb | 18 ------------------
>  1 file changed, 18 deletions(-)
>
> diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/
> cni_git.bb
> index d07154b..266ee69 100644
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
> @@ -56,13 +44,7 @@ do_compile() {
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
>         export CGO_ENABLED="1"
> -       export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> -       export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
>
>         cd ${S}/src/import/vendor/
> github.com/containernetworking/cni/libcni
>         go build
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

--000000000000bb05ea058fecd5cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">v2 =
is staged for testing. See my master-next branch for details.</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmai=
l_default" style=3D"font-size:small">Bruce</div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 11, 2019 at 10:=
33 PM Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windrive=
r.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">These settings are either in go.bbclass or duplicate, thus<br>
removing them.<br>
<br>
Keep only CGO_ENABLED and GOPATH to easier manipulation while<br>
upgrading cni.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-networking/cni/<a href=3D"http://cni_git.bb" rel=3D"noreferre=
r" target=3D"_blank">cni_git.bb</a> | 18 ------------------<br>
=C2=A01 file changed, 18 deletions(-)<br>
<br>
diff --git a/recipes-networking/cni/<a href=3D"http://cni_git.bb" rel=3D"no=
referrer" target=3D"_blank">cni_git.bb</a> b/recipes-networking/cni/<a href=
=3D"http://cni_git.bb" rel=3D"noreferrer" target=3D"_blank">cni_git.bb</a><=
br>
index d07154b..266ee69 100644<br>
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
@@ -56,13 +44,7 @@ do_compile() {<br>
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
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export CGO_ENABLED=3D&quot;1&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_CFLAGS=3D&quot;${CFLAGS} --sysroot=
=3D${STAGING_DIR_TARGET}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export CGO_LDFLAGS=3D&quot;${LDFLAGS} --sysroot=
=3D${STAGING_DIR_TARGET}&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${S}/src/import/vendor/<a href=3D"http://git=
hub.com/containernetworking/cni/libcni" rel=3D"noreferrer" target=3D"_blank=
">github.com/containernetworking/cni/libcni</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 go build<br>
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

--000000000000bb05ea058fecd5cd--
