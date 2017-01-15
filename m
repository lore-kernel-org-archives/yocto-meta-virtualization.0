Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 66B58E008F2; Sat, 14 Jan 2017 16:27:16 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_05_10, 
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.172 listed in list.dnswl.org]
	* 0.3 HTML_OBFUSCATE_05_10 BODY: Message is 5% to 10% HTML obfuscation
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 72778E006EA
	for <meta-virtualization@yoctoproject.org>;
	Sat, 14 Jan 2017 16:27:14 -0800 (PST)
Received: by mail-qt0-f172.google.com with SMTP id x49so77675447qtc.2
	for <meta-virtualization@yoctoproject.org>;
	Sat, 14 Jan 2017 16:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mbn3FH/Z0Cnrog7a54mx507ENjlRaeL/Gi8RVGCRUoM=;
	b=a5k6BVlTKQEQtwGmMCB7XOaIY3Xq10l1r3wkqULR4nYdwJFmcFYhqwKZAidlRtPSgf
	3p4BcuHh0RDuT+5bj1lSYXZbOVWMe5zj4Mbq0g1bihofY+N0SpUW/H52gLy5lzaLmNU1
	/Oa1IMPZUqaUZIiFEWYJP3ixJufu9El0fXXAPzQ5oHiWnsNfHIX++XJCpmO2lefMij6A
	3dSGuQLdxlD22/J0/Rg8wp9ddlwvDypqwrYC/0cYmYkrVmZuq2mQIktouS1iAXTLjyRg
	tLMfgVW5mWrq5+dklALB1gkOQOzz7vltV6dLWUYq05jEzSBfAYj0wI9B/swTz2aHrNIr
	+pHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mbn3FH/Z0Cnrog7a54mx507ENjlRaeL/Gi8RVGCRUoM=;
	b=YBXF9bc4almZPYVVNsOAgIDm+2sAd6zCZMmNE7AtKLaXq/jBjid43TubQ9+x9/HU7j
	jj+Z+KXXra0Bhc2HL/2ZiY/SfUjrKlRbfI/M3ozkO96/3RRFSzKKuh+vuGtgOP0cs3Iu
	SmBv/TGOTlODbBU+bt+4mWlk+3IudSl0+ikH3FCMBBQUDfIJ2lErtzGZGQwErI4bLZmL
	PkiKQrF/P9UKpKIC5em3xs64mn/eYvvJbYy3x0NYFpj393uqSfYV653KYfidkXIbY/wo
	LsGgZmHnu+tgGb/UvNXat9PKGE3WxLkAAHsXAREbsl0vwiJfCzgImQbo0drxolAHm4Pl
	D6EQ==
X-Gm-Message-State: AIkVDXJ0XhzRs40hV+DJMq7TLhQbUf6lHTw+a4al0//F1EU2SsntBBo7hSU6REjfhRnlUJQfnE4gx/uOlx3q3g==
X-Received: by 10.200.58.231 with SMTP id x94mr26208658qte.87.1484440033603;
	Sat, 14 Jan 2017 16:27:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.135.153 with HTTP; Sat, 14 Jan 2017 16:27:13 -0800 (PST)
In-Reply-To: <1484299229-1132-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1484299229-1132-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 14 Jan 2017 19:27:13 -0500
Message-ID: <CADkTA4MYM5BwcXvg37kTbLBeznwGY4zzgOwai2A-NGQ=u_mqPw@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH V2] python-sphinx: 1.3.1 -> 1.4.1
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
X-List-Received-Date: Sun, 15 Jan 2017 00:27:16 -0000
Content-Type: multipart/alternative; boundary=94eb2c1254c8e4bbca054617200a

--94eb2c1254c8e4bbca054617200a
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Fri, Jan 13, 2017 at 4:20 AM, Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
wrote:

> 1) Upgrade python-sphinx from 1.3.1 to 1.4.1
> 2) License checksum changed,since the copyright years were updated.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-sphinx_1.3.1.bb => python-sphinx_1.4.1.bb}       | 6
> +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename recipes-devtools/python/{python-sphinx_1.3.1.bb =>
> python-sphinx_1.4.1.bb} (62%)
>
> diff --git a/recipes-devtools/python/python-sphinx_1.3.1.bb
> b/recipes-devtools/python/python-sphinx_1.4.1.bb
> similarity index 62%
> rename from recipes-devtools/python/python-sphinx_1.3.1.bb
> rename to recipes-devtools/python/python-sphinx_1.4.1.bb
> index fe8ad94..835b369 100644
> --- a/recipes-devtools/python/python-sphinx_1.3.1.bb
> +++ b/recipes-devtools/python/python-sphinx_1.4.1.bb
> @@ -2,15 +2,15 @@ DESCRIPTION = "Python documentation generator"
>  HOMEPAGE = "http://sphinx-doc.org/"
>  SECTION = "devel/python"
>  LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=6dd095eaa1e7a662b279daf80ecad7e6"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=72f034adc6f7b05b09bc00d1a05bb065"
>
>  PR = "r0"
>  SRCNAME = "Sphinx"
>
>  SRC_URI = "http://pypi.python.org/packages/source/S/${SRCNAME}/$
> {SRCNAME}-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "8786a194acf9673464c5455b11fd4332"
> -SRC_URI[sha256sum] = "1a6e5130c2b42d2de301693c299f78
> cc4bd3501e78b610c08e45efc70e2b5114"
> +SRC_URI[md5sum] = "4c4988e0306a04cef8dccc384281e585"
> +SRC_URI[sha256sum] = "c6871a784d24aba9270b6b28541537
> a57e2fcf4d7c799410eba18236bc76d6bc"
>
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
> --
> 2.7.4
>
>
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

--94eb2c1254c8e4bbca054617200a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Fri, Jan 13, 2017 at 4:20 AM=
, Huang Qiyu <span dir=3D"ltr">&lt;<a href=3D"mailto:huangqy.fnst@cn.fujits=
u.com" target=3D"_blank">huangqy.fnst@cn.fujitsu.com</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">1=
) Upgrade python-sphinx from 1.3.1 to 1.4.1<br>
2) License checksum changed,since the copyright years were updated.<br>
<br>
Signed-off-by: Huang Qiyu &lt;<a href=3D"mailto:huangqy.fnst@cn.fujitsu.com=
">huangqy.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../python/{<a href=3D"http://python-sphinx_1.3.1.bb" rel=3D"noreferr=
er" target=3D"_blank">python-sphinx_1.3.<wbr>1.bb</a> =3D&gt; <a href=3D"ht=
tp://python-sphinx_1.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python-sp=
hinx_1.4.1.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
=C2=A0rename recipes-devtools/python/{<a href=3D"http://python-sphinx_1.3.1=
.bb" rel=3D"noreferrer" target=3D"_blank">pytho<wbr>n-sphinx_1.3.1.bb</a> =
=3D&gt; <a href=3D"http://python-sphinx_1.4.1.bb" rel=3D"noreferrer" target=
=3D"_blank">python-sphinx_1.4.1.bb</a>} (62%)<br>
<br>
diff --git a/recipes-devtools/python/<a href=3D"http://python-sphinx_1.3.1.=
bb" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-sphinx_1.3.1.bb</a> b/=
recipes-devtools/python/<a href=3D"http://python-sphinx_1.4.1.bb" rel=3D"no=
referrer" target=3D"_blank">pyth<wbr>on-sphinx_1.4.1.bb</a><br>
similarity index 62%<br>
rename from recipes-devtools/python/<a href=3D"http://python-sphinx_1.3.1.b=
b" rel=3D"noreferrer" target=3D"_blank">python<wbr>-sphinx_1.3.1.bb</a><br>
rename to recipes-devtools/python/<a href=3D"http://python-sphinx_1.4.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">python<wbr>-sphinx_1.4.1.bb</a><br>
index fe8ad94..835b369 100644<br>
--- a/recipes-devtools/python/<a href=3D"http://python-sphinx_1.3.1.bb" rel=
=3D"noreferrer" target=3D"_blank">pyth<wbr>on-sphinx_1.3.1.bb</a><br>
+++ b/recipes-devtools/python/<a href=3D"http://python-sphinx_1.4.1.bb" rel=
=3D"noreferrer" target=3D"_blank">pyth<wbr>on-sphinx_1.4.1.bb</a><br>
@@ -2,15 +2,15 @@ DESCRIPTION =3D &quot;Python documentation generator&quot=
;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://sphinx-doc.org/" rel=3D"noreferr=
er" target=3D"_blank">http://sphinx-doc.org/</a>&quot;<br>
=C2=A0SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;BSD&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>6dd095eaa1e7a662b279d=
af80ecad7<wbr>e6&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>72f034adc6f7b05b09bc0=
0d1a05bb0<wbr>65&quot;<br>
<br>
=C2=A0PR =3D &quot;r0&quot;<br>
=C2=A0SRCNAME =3D &quot;Sphinx&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://pypi.python.org/packages/source/S=
/${SRCNAME}/${SRCNAME}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">h=
ttp://pypi.python.org/<wbr>packages/source/S/${SRCNAME}/$<wbr>{SRCNAME}-${P=
V}.tar.gz</a>&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>8786a194acf9673464c5455b11fd43<wbr>32&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>1a6e5130c2b42d2de301693c299f78<wbr>cc4bd=
3501e78b610c08e45efc70e2b<wbr>5114&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>4c4988e0306a04cef8dccc384281e5<wbr>85&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>c6871a784d24aba9270b6b28541537<wbr>a57e2=
fcf4d7c799410eba18236bc76<wbr>d6bc&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>
<br>
--<br>
2.7.4<br>
<br>
<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div>

--94eb2c1254c8e4bbca054617200a--
