Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D9705E00B4C; Tue, 29 May 2018 07:25:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.82.68 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E991BE009D4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 May 2018 07:25:58 -0700 (PDT)
Received: by mail-wm0-f68.google.com with SMTP id t11-v6so41216071wmt.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 May 2018 07:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xDBJxqmScUbzWrJpmKcTsbfza9eomeVYdit+hg1qf6Q=;
	b=Nxpse4wXBkitdcxer85ej5Awaa7QJHnVYMKiy39+kiqT+boDZApVzE4MozKAEpYyKa
	nDNamAJSe/qMymaGBp4szOvJRpIojVo0w9gwq6vgP3KZA1vftBnK9xKsLXzWyliv0QM4
	A8vpJQh4QwevPvv3QVEvCUE6su9yoMxUNsqeNlOZD28gFwSwWVCMw4ZjCwHdn/YUyh/b
	N3l8iDf6b/hsgrHvgHM6kUg26g1CotdzhPRAOlBIowVDQQ/tUwsWm0+hN5UDzM0iiSkH
	7W4C2U7rZXjQgXvBUrot5krcKaTU/d5XydoJuQ/UGAFBRNhO++bnB4WbCyc/f3EL9Igv
	OMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xDBJxqmScUbzWrJpmKcTsbfza9eomeVYdit+hg1qf6Q=;
	b=gjeWK92SDz0oT7CVawBTQerjJLQjXkOV5EYyd6RPg//ohdM+ZSlrTXiCltD0ee2y/j
	eCvuyQp9Pmsf1M6hljRHyuubRVv+qLnwQzo40rTMoy0K+H+Z6ZLu+nzSBswtgoIj5MQa
	sY6EK72E4hzGUBNIjK10ggsIDNl3UkoLihfL7eqx24Q4XeW8GEVKsOhCz1V4oTKqX+S3
	z5LgI0Q1hdbgR9G1WADOHiWUjGl9caRc66Xau/6tQdmh2tOKBF/uPQcjPnalg9EWAbTs
	uAWC3d0R7lvVHFIu1NdQq/18YWL0vI44GYqhdzZpxxOwZ6iwU3ucuI/RDy/uFONeX4ya
	1oxw==
X-Gm-Message-State: ALKqPwf+zD4DZbzH3XOArd8KriVe3B5HBlI0PezFnwhtNyhWUVqgSUYP
	4CT4YR+pbnBqUw6MkAxNIUsNC5DFOE//EzkHEY0=
X-Google-Smtp-Source: ADUXVKIf6jagnBCMjzu3YMwhug/8ZOz+DvGxbAyU8zg9oO9qULLDnzW/MkfacxKcC8PEhax7RER6COzUyvrEFm7Kpm4=
X-Received: by 2002:a2e:82d6:: with SMTP id
	n22-v6mr11394140ljh.142.1527603957823; 
	Tue, 29 May 2018 07:25:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:3307:0:0:0:0:0 with HTTP; Tue, 29 May 2018 07:25:57
	-0700 (PDT)
In-Reply-To: <20180525135820.9279-1-pascal.bach@siemens.com>
References: <20180525135820.9279-1-pascal.bach@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 29 May 2018 10:25:57 -0400
Message-ID: <CADkTA4POi2ym7_hXqNuwMT-4dCMnMBVWMkEsuvuhqVGNnym3EQ@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 1/2] runc: allow enabling seccomp
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
X-List-Received-Date: Tue, 29 May 2018 14:25:59 -0000
Content-Type: multipart/alternative; boundary="000000000000437d9c056d59030b"

--000000000000437d9c056d59030b
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Fri, May 25, 2018 at 9:58 AM, Pascal Bach <pascal.bach@siemens.com>
wrote:

> This requires libseccomp from meta-security so it is not enabled by
> default.
>
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  recipes-containers/runc/runc.inc | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-containers/runc/runc.inc b/recipes-containers/runc/
> runc.inc
> index 9199cef..6d11a6e 100644
> --- a/recipes-containers/runc/runc.inc
> +++ b/recipes-containers/runc/runc.inc
> @@ -12,6 +12,10 @@ PV = "${RUNC_VERSION}+git${SRCPV}"
>
>  inherit go
>  inherit goarch
> +inherit pkgconfig
> +
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[seccomp] = "seccomp,,libseccomp"
>
>  RRECOMMENDS_${PN} = "lxc docker"
>  PROVIDES += "virtual/runc"
> @@ -22,7 +26,7 @@ GO_IMPORT = "import"
>  LIBCONTAINER_PACKAGE="github.com/opencontainers/runc/libcontainer"
>
>  do_configure[noexec] = "1"
> -EXTRA_OEMAKE="BUILDTAGS='' GO=${GO}"
> +EXTRA_OEMAKE="BUILDTAGS='${PACKAGECONFIG_CONFARGS}' GO=${GO}"
>
>  do_compile() {
>         # Set GOPATH. See 'PACKAGERS.md'. Don't rely on
> --
> 2.11.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--000000000000437d9c056d59030b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Fri, May 25, 2018 at 9:58 AM=
, Pascal Bach <span dir=3D"ltr">&lt;<a href=3D"mailto:pascal.bach@siemens.c=
om" target=3D"_blank">pascal.bach@siemens.com</a>&gt;</span> wrote:<br><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">This requires libseccomp from meta-security so i=
t is not enabled by default.<br>
<br>
Signed-off-by: Pascal Bach &lt;<a href=3D"mailto:pascal.bach@siemens.com">p=
ascal.bach@siemens.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/runc/runc.<wbr>inc | 6 +++++-<br>
=C2=A01 file changed, 5 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-containers/runc/<wbr>runc.inc b/recipes-containers/run=
c/<wbr>runc.inc<br>
index 9199cef..6d11a6e 100644<br>
--- a/recipes-containers/runc/<wbr>runc.inc<br>
+++ b/recipes-containers/runc/<wbr>runc.inc<br>
@@ -12,6 +12,10 @@ PV =3D &quot;${RUNC_VERSION}+git${SRCPV}&quot;<br>
<br>
=C2=A0inherit go<br>
=C2=A0inherit goarch<br>
+inherit pkgconfig<br>
+<br>
+PACKAGECONFIG ??=3D &quot;&quot;<br>
+PACKAGECONFIG[seccomp] =3D &quot;seccomp,,libseccomp&quot;<br>
<br>
=C2=A0RRECOMMENDS_${PN} =3D &quot;lxc docker&quot;<br>
=C2=A0PROVIDES +=3D &quot;virtual/runc&quot;<br>
@@ -22,7 +26,7 @@ GO_IMPORT =3D &quot;import&quot;<br>
=C2=A0LIBCONTAINER_PACKAGE=3D&quot;<a href=3D"http://github.com/opencontain=
ers/runc/libcontainer" rel=3D"noreferrer" target=3D"_blank">github.<wbr>com=
/opencontainers/runc/<wbr>libcontainer</a>&quot;<br>
<br>
=C2=A0do_configure[noexec] =3D &quot;1&quot;<br>
-EXTRA_OEMAKE=3D&quot;BUILDTAGS=3D&#39;&#39; GO=3D${GO}&quot;<br>
+EXTRA_OEMAKE=3D&quot;BUILDTAGS=3D&#39;${<wbr>PACKAGECONFIG_CONFARGS}&#39; =
GO=3D${GO}&quot;<br>
<br>
=C2=A0do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Set GOPATH. See &#39;PACKAGERS.md&#39;. Don&#=
39;t rely on<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
2.11.0<br>
<br>
-- <br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--000000000000437d9c056d59030b--
