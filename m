Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 023DBE0092C; Tue,  3 Jan 2017 07:31:11 -0800 (PST)
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
	*      [209.85.220.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A532FE0091A
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Jan 2017 07:31:03 -0800 (PST)
Received: by mail-qk0-f194.google.com with SMTP id h201so50117800qke.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Jan 2017 07:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QXOIa6IvqARQxmrh/k90kIQII9syzsKAPUSNjNE5l14=;
	b=OV9EXgicjg8OArjweTQko1FqJOqxXQfrPgToLsGnkwLNjS79D1dSXSEgxd6j8F+ebb
	PB93+3ZLBO7hRWEVRWU9RCPXEGWwM3ZFJt8LPkyPXDxt431X3lILO7ZAaLjTBvxO6Tb7
	i1e5Mr1gHC9ZFSMaBxJrrdS/V8lUHcXvcXHSyhlg+fup4BPYquA4KB82HXu/hb+IQy5+
	vDQvbJcmIzH0p4kpDg7wyvSzHdJSI51ZWrrAcvF4QKaHrn8pFyaGl3/6E9mE+4hZ5gIv
	nxS2KZh3tcvnQrdQgTT5R8epwjPEW1WHaRlooXRX0itlGrYHhx6C6uFUJYO7Nx/sUs5O
	Ww3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QXOIa6IvqARQxmrh/k90kIQII9syzsKAPUSNjNE5l14=;
	b=AddGhfxgzhMKlPzYBABTTQ+xfw7e8dJ24xdRTDEoB44dBfWKWmj/P6MAXDoVw6FyzQ
	4yIdeQ44VnM1Bua9s0Ks9a/buebpEKABzLk4+mR8Cp3W6w2iTK8otIb9Cwk2nh2WIaBf
	nPaC+KDTFUGTkuHkAGxdrWtTytwnMj05KD9/Ck2lE2XWbcf6qxsv4pkIh12wYufIBoQs
	VN9MF7o/yc7+362qLz2w2fYIGLxFfHumwgvrgwBD7F2uBQz0wHmIYoI+xD7ji9vdbhA2
	aP7XPDaBK6M7JEA4OgN+y4weUDyfoYNgo07pOpKO5fIYtspga/xFiCXZ8nM7458p9O6E
	xljw==
X-Gm-Message-State: AIkVDXKTMfFLygjudphVxsDiVJJtX2L9rIH1DNKfofESxDqu1SeXJyItHQSUFzIzBlrRVHcEgGSm2JA5DPKNOA==
X-Received: by 10.55.114.2 with SMTP id n2mr35944188qkc.318.1483457463165;
	Tue, 03 Jan 2017 07:31:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.129.227 with HTTP; Tue, 3 Jan 2017 07:31:02 -0800 (PST)
In-Reply-To: <20170103044754.15012-1-cardoe@cardoe.com>
References: <20170103044754.15012-1-cardoe@cardoe.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Jan 2017 10:31:02 -0500
Message-ID: <CADkTA4Oc0BCLmhAw7vFLspt4eMN-BAeCEv8ij0cmDuEAUDSUVg@mail.gmail.com>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-virtualization (krogoth)][PATCH 1/5] xen: switch to updated download URL
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
X-List-Received-Date: Tue, 03 Jan 2017 15:31:11 -0000
Content-Type: multipart/alternative; boundary=94eb2c05be6821abe00545325b35

--94eb2c05be6821abe00545325b35
Content-Type: text/plain; charset=UTF-8

You didn't follow up to patch 1 and 2, I assume these are for the same
branches
as patches 3 -> 5 ?

Bruce

On Mon, Jan 2, 2017 at 11:47 PM, Doug Goldstein <cardoe@cardoe.com> wrote:

> The Xen Project has changed the officially supported download URL to use
> xenproject.org. This changes to the officially supported URLs.
>
> Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
> ---
>  recipes-extended/xen/xen_4.6.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/xen/xen_4.6.1.bb b/recipes-extended/xen/
> xen_4.6.1.bb
> index 0adf8ad..c3ba3c8 100644
> --- a/recipes-extended/xen/xen_4.6.1.bb
> +++ b/recipes-extended/xen/xen_4.6.1.bb
> @@ -1,7 +1,7 @@
>  require xen.inc
>
>  SRC_URI = " \
> -    http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz \
> +    https://downloads.xenproject.org/release/xen/${PV}/xen-${PV}.tar.gz \
>      "
>
>  SRC_URI[md5sum] = "df2d854c3c90ffeefaf71e7f868fb326"
> --
> 2.10.2
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

--94eb2c05be6821abe00545325b35
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">You didn&#39;t follow up to patch 1 and 2, I assume these =
are for the same branches<div>as patches 3 -&gt; 5 ?</div><div><br></div><d=
iv>Bruce</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">On Mon, Jan 2, 2017 at 11:47 PM, Doug Goldstein <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:cardoe@cardoe.com" target=3D"_blank">cardoe@cardoe.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The Xen Project has cha=
nged the officially supported download URL to use<br>
<a href=3D"http://xenproject.org" rel=3D"noreferrer" target=3D"_blank">xenp=
roject.org</a>. This changes to the officially supported URLs.<br>
<br>
Signed-off-by: Doug Goldstein &lt;<a href=3D"mailto:cardoe@cardoe.com">card=
oe@cardoe.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/xen/<a href=3D"http://xen_4.6.1.bb" rel=3D"noreferre=
r" target=3D"_blank">xen_4.6.<wbr>1.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-extended/xen/<a href=3D"http://xen_4.6.1.bb" rel=3D"no=
referrer" target=3D"_blank">xen_4.<wbr>6.1.bb</a> b/recipes-extended/xen/<a=
 href=3D"http://xen_4.6.1.bb" rel=3D"noreferrer" target=3D"_blank">xen_4.<w=
br>6.1.bb</a><br>
index 0adf8ad..c3ba3c8 100644<br>
--- a/recipes-extended/xen/<a href=3D"http://xen_4.6.1.bb" rel=3D"noreferre=
r" target=3D"_blank">xen_4.<wbr>6.1.bb</a><br>
+++ b/recipes-extended/xen/<a href=3D"http://xen_4.6.1.bb" rel=3D"noreferre=
r" target=3D"_blank">xen_4.<wbr>6.1.bb</a><br>
@@ -1,7 +1,7 @@<br>
=C2=A0require xen.inc<br>
<br>
=C2=A0SRC_URI =3D &quot; \<br>
-=C2=A0 =C2=A0 <a href=3D"http://bits.xensource.com/oss-xen/release/${PV}/x=
en-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://bits.xensource=
.com/oss-<wbr>xen/release/${PV}/xen-${PV}.<wbr>tar.gz</a> \<br>
+=C2=A0 =C2=A0 <a href=3D"https://downloads.xenproject.org/release/xen/${PV=
}/xen-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://downloads.=
xenproject.<wbr>org/release/xen/${PV}/xen-${<wbr>PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>df2d854c3c90ffeefaf71e7f868fb3<wbr>26&=
quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.10.2<br>
<br>
--<br>
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

--94eb2c05be6821abe00545325b35--
