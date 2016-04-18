Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6E721E00F05; Mon, 18 Apr 2016 11:18:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.54 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EBC93E00F09
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Apr 2016 11:17:56 -0700 (PDT)
Received: by mail-oi0-f54.google.com with SMTP id x201so32864395oif.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Apr 2016 11:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=/kRpW463B30z1K7YT3nYoh4Kp4p73ytXDpscCx2iSog=;
	b=c562/tIVv4lgkir9PBVXw+xCe/3ziOUgN1na7KZHkXAt9WaRCx1ZFQglz2+oGVg+21
	oyYD28k7d+fxZGwV8QRqgwNmRO+gAOJQkMdqHT/CCg+AleqpUyw+zXkYCJB8lP1H1gbI
	NSfPWvsrGcadhpFoKMIwwvbeJA0rLw/mP8VjMwXd/qIHWh3rkPOk0m1CRYnLRzBWebLK
	RrCEwcRCdN3o1qHFZ62Fg79HQaFXAchWHyx6E2hKpH9rf5Tll4z5KSnZOVZBbbEwvZGB
	sle/1+okFeko3vu5tovf4OqIsMriV/zq6RPqaCN8f1Py/F9Hk00/yWjBtoUfU7M483Te
	dEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=/kRpW463B30z1K7YT3nYoh4Kp4p73ytXDpscCx2iSog=;
	b=ByUOezMIY73VAA3BvAG4E5khVz+f+SHoQvAYI/I+/1mJ2vgtusLT9n7O4Z0dAC0TXC
	Fswlpi7tmHopa7LQSeI7YrDQ/cQp6QdDnv/kQrh/fPaVyJx9esBI/JjzDkvME/2B31qr
	YOF4d1dPF6ztJzkTfY7AbFcX2mGE2+9werAplwEqRYp3JtFhR0v2/5VYBpDoAwHNFgk5
	i9X/+i6KnaSjZBTk3pPN1zTf3CuqMUDBiekQR8IspJV1EX4DJe2yUsjxgQktDC0cj/qP
	Pmk3ygJOc5K14yD31HOoucDR347AERfA/UsI5Z19QkWDmAH83e3zs+uxxQTg9t/9J5hS
	qKXQ==
X-Gm-Message-State: AOPr4FVoktu5btjXbRsoV7eL30FCKxNOBJNeMZppF1ZhM25P5VxtOJk4SJf3YA7rsHq3tpGTlLWYVi1PkkzqrA==
MIME-Version: 1.0
X-Received: by 10.157.37.45 with SMTP id k42mr2965152otb.119.1461003476138;
	Mon, 18 Apr 2016 11:17:56 -0700 (PDT)
Received: by 10.157.5.101 with HTTP; Mon, 18 Apr 2016 11:17:56 -0700 (PDT)
In-Reply-To: <1460681739-16510-1-git-send-email-derek@asterius.io>
References: <1460681739-16510-1-git-send-email-derek@asterius.io>
Date: Mon, 18 Apr 2016 14:17:56 -0400
Message-ID: <CADkTA4ON+0wPpLaNCXo+y=S+gAtUzNnPbob=69DV2Pyny4i4Zg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] seabios: update to version 1.9.1
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
X-List-Received-Date: Mon, 18 Apr 2016 18:18:01 -0000
Content-Type: multipart/alternative; boundary=001a11352e463603bc0530c661f4

--001a11352e463603bc0530c661f4
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Thu, Apr 14, 2016 at 8:55 PM, Derek Straka <derek@asterius.io> wrote:

> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  recipes-extended/seabios/{seabios_1.9.0.bb => seabios_1.9.1.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename recipes-extended/seabios/{seabios_1.9.0.bb => seabios_1.9.1.bb}
> (86%)
>
> diff --git a/recipes-extended/seabios/seabios_1.9.0.bb
> b/recipes-extended/seabios/seabios_1.9.1.bb
> similarity index 86%
> rename from recipes-extended/seabios/seabios_1.9.0.bb
> rename to recipes-extended/seabios/seabios_1.9.1.bb
> index 4808a18..88f2963 100644
> --- a/recipes-extended/seabios/seabios_1.9.0.bb
> +++ b/recipes-extended/seabios/seabios_1.9.1.bb
> @@ -12,8 +12,8 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=d32239bcb673463ab874e80d47fae504
>
>  file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6  \
>                      "
>
> -SRC_URI[md5sum] = "c3fea87e731e396bd4e7e2c478ba39d9"
> -SRC_URI[sha256sum] =
> "88595545c6d580a7a6da1c40befc46dd74c0e4aaf808547867dd7ce8cc3b4d0e"
> +SRC_URI[md5sum] = "e21b6f3e54d492be837ef20d66617f81"
> +SRC_URI[sha256sum] =
> "8a2a562fe5cfd37fe8327cdc4a60accdfe441e235b29e6999fdeb442ba98d608"
>
>  FILES_${PN} = "/usr/share/firmware"
>
> --
> 1.9.1
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

--001a11352e463603bc0530c661f4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Thu, Apr 14, 2016 at 8:55 PM=
, Derek Straka <span dir=3D"ltr">&lt;<a href=3D"mailto:derek@asterius.io" t=
arget=3D"_blank">derek@asterius.io</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">Signed-off-by: Derek Straka &lt;<a href=3D"mailto:derek@ast=
erius.io">derek@asterius.io</a>&gt;<br>
---<br>
=C2=A0recipes-extended/seabios/{<a href=3D"http://seabios_1.9.0.bb" rel=3D"=
noreferrer" target=3D"_blank">seabios_1.9.0.bb</a> =3D&gt; <a href=3D"http:=
//seabios_1.9.1.bb" rel=3D"noreferrer" target=3D"_blank">seabios_1.9.1.bb</=
a>} | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename recipes-extended/seabios/{<a href=3D"http://seabios_1.9.0.bb" =
rel=3D"noreferrer" target=3D"_blank">seabios_1.9.0.bb</a> =3D&gt; <a href=
=3D"http://seabios_1.9.1.bb" rel=3D"noreferrer" target=3D"_blank">seabios_1=
.9.1.bb</a>} (86%)<br>
<br>
diff --git a/recipes-extended/seabios/<a href=3D"http://seabios_1.9.0.bb" r=
el=3D"noreferrer" target=3D"_blank">seabios_1.9.0.bb</a> b/recipes-extended=
/seabios/<a href=3D"http://seabios_1.9.1.bb" rel=3D"noreferrer" target=3D"_=
blank">seabios_1.9.1.bb</a><br>
similarity index 86%<br>
rename from recipes-extended/seabios/<a href=3D"http://seabios_1.9.0.bb" re=
l=3D"noreferrer" target=3D"_blank">seabios_1.9.0.bb</a><br>
rename to recipes-extended/seabios/<a href=3D"http://seabios_1.9.1.bb" rel=
=3D"noreferrer" target=3D"_blank">seabios_1.9.1.bb</a><br>
index 4808a18..88f2963 100644<br>
--- a/recipes-extended/seabios/<a href=3D"http://seabios_1.9.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">seabios_1.9.0.bb</a><br>
+++ b/recipes-extended/seabios/<a href=3D"http://seabios_1.9.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">seabios_1.9.1.bb</a><br>
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd32239bcb=
673463ab874e80d47fae504<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://COPYING.LESSER;md5=3D6a6a8e020838b23406c81b19c1d46df6=C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;c3fea87e731e396bd4e7e2c478ba39d9&quot;<br>
-SRC_URI[sha256sum] =3D &quot;88595545c6d580a7a6da1c40befc46dd74c0e4aaf8085=
47867dd7ce8cc3b4d0e&quot;<br>
+SRC_URI[md5sum] =3D &quot;e21b6f3e54d492be837ef20d66617f81&quot;<br>
+SRC_URI[sha256sum] =3D &quot;8a2a562fe5cfd37fe8327cdc4a60accdfe441e235b29e=
6999fdeb442ba98d608&quot;<br>
<br>
=C2=A0FILES_${PN} =3D &quot;/usr/share/firmware&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div>

--001a11352e463603bc0530c661f4--
