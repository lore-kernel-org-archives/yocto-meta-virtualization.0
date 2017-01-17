Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A9B93E00942; Tue, 17 Jan 2017 11:51:08 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_05_10, 
	RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.171 listed in dnsbl.sorbs.net]
	* 0.3 HTML_OBFUSCATE_05_10 BODY: Message is 5% to 10% HTML obfuscation
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.216.171 listed in list.dnswl.org]
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 64E37E008D3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Jan 2017 11:50:55 -0800 (PST)
Received: by mail-qt0-f171.google.com with SMTP id k15so176457624qtg.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Jan 2017 11:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Po/cHFkjjoxols6Dm6j9xVygKk6S4TEofx7nz6cvRF8=;
	b=RaIJWJMYufOHYjI4upFhrpdvpyCU1mn6qIcvL2GRevHUvvFbQsgrUfs58L5et/8Iez
	VUea+lf10UXUQmEf3tcdCWsJ0d2qA0Q1XRacObqaWyxnICRoUVSSIImaPVopMavw1R16
	AFX4exiq58ihOsYksC1lr0BqlqoREO3jd645tmp4YuJr1UDZGWn8bQpVXTXY0QR29abT
	ZHkeJfblGpe9YDtFmzF2EVhuLJ8sMO8pAn/u39Djld1luXJb6+aVV4C3aNmtLatDZvyO
	U6s2lBTdlU2QgpExv1Hrxo8d4+P5dBvEsK50S9ysUvmJUe9w4rurC9PrMg/EJyQI81tY
	wFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Po/cHFkjjoxols6Dm6j9xVygKk6S4TEofx7nz6cvRF8=;
	b=gT6Rx+k0/ME4YvgTZKrIFN6MImEkEOBm7ePNUh6StzehRwQXjmDLhErtXghJR0Bo5w
	i2VGU10K5I3I02iPS4m8y9r6DO3vFr5n4zdAJmEQgF8hLPkfyE4RrSqyYvn3L0BX7pAy
	UdM6avXTeIjajG1vom5PTqvFZtDAxFpUNALuU59aohZIF0+hlKTmJV2rSD6eMgP51s/r
	M/F5P+elmvTXSM+MOTrjOxKKbbV3MyTWA93fvx/gpRb1RyPD2JlH6osGUZeXPWvT8SbH
	pIsOvwAL/fceYJWe/KgUnWb+hgrG3+XHaytBm4Z97ou6YdwBWp0taFy8HC3CGQZk9psb
	9YJw==
X-Gm-Message-State: AIkVDXKShuSxcXmY4PrEZ2fYdlwWSiYoh9pAVW4R4r71YytYN7Rc/qPda79tZ2RERCaYgpzO0r2HHn1mZ+bq8g==
X-Received: by 10.55.161.11 with SMTP id k11mr36912983qke.149.1484682654924;
	Tue, 17 Jan 2017 11:50:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.135.153 with HTTP; Tue, 17 Jan 2017 11:50:54 -0800 (PST)
In-Reply-To: <1484531499-24440-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1484531499-24440-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 17 Jan 2017 14:50:54 -0500
Message-ID: <CADkTA4PSg5kfWJgjYfk5reLfGXgUDuoxuijHZq8SQc0bYCivcA@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-sqlalchemy: 1.0.8 -> 1.0.9
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
X-List-Received-Date: Tue, 17 Jan 2017 19:51:08 -0000
Content-Type: multipart/alternative; boundary=94eb2c07728e4045d805464f9eb6

--94eb2c07728e4045d805464f9eb6
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Sun, Jan 15, 2017 at 8:51 PM, Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
wrote:

> Upgrade python-sqlalchemy from 1.0.8 to 1.0.9.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-sqlalchemy_1.0.8.bb => python-sqlalchemy_1.0.9.bb} |
> 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename recipes-devtools/python/{python-sqlalchemy_1.0.8.bb =>
> python-sqlalchemy_1.0.9.bb} (76%)
>
> diff --git a/recipes-devtools/python/python-sqlalchemy_1.0.8.bb
> b/recipes-devtools/python/python-sqlalchemy_1.0.9.bb
> similarity index 76%
> rename from recipes-devtools/python/python-sqlalchemy_1.0.8.bb
> rename to recipes-devtools/python/python-sqlalchemy_1.0.9.bb
> index 2d66ffd..01c94a5 100644
> --- a/recipes-devtools/python/python-sqlalchemy_1.0.8.bb
> +++ b/recipes-devtools/python/python-sqlalchemy_1.0.9.bb
> @@ -8,8 +8,8 @@ RDEPENDS_${PN} += "python-numbers"
>  SRCNAME = "SQLAlchemy"
>  SRC_URI = "https://pypi.python.org/packages/source/S/${SRCNAME}/$
> {SRCNAME}-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "7cfd005be63945c96a78c67764ac3a85"
> -SRC_URI[sha256sum] = "950c79c0abf9e9f99c43c627c51d40
> d14a946810a90c35e7cd827bfd0bffe46f"
> +SRC_URI[md5sum] = "0e2d7442e70d02c9f6346a5bf0ec2265"
> +SRC_URI[sha256sum] = "c3d37501e36ec5d74c2d7b4a376471
> 9db86a9cdab4a24431bf58b386743ab10e"
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

--94eb2c07728e4045d805464f9eb6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Sun, Jan 15, 2017 at 8:51 PM=
, Huang Qiyu <span dir=3D"ltr">&lt;<a href=3D"mailto:huangqy.fnst@cn.fujits=
u.com" target=3D"_blank">huangqy.fnst@cn.fujitsu.com</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">Upgrade python-sqlalchemy from 1.0.8 to 1=
.0.9.<br>
<br>
Signed-off-by: Huang Qiyu &lt;<a href=3D"mailto:huangqy.fnst@cn.fujitsu.com=
">huangqy.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../python/{<a href=3D"http://python-sqlalchemy_1.0.8.bb" rel=3D"nore=
ferrer" target=3D"_blank">python-sqlalchemy_<wbr>1.0.8.bb</a> =3D&gt; <a hr=
ef=3D"http://python-sqlalchemy_1.0.9.bb" rel=3D"noreferrer" target=3D"_blan=
k">python-sqlalchemy_1.0.9.bb</a>} | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename recipes-devtools/python/{<a href=3D"http://python-sqlalchemy_1=
.0.8.bb" rel=3D"noreferrer" target=3D"_blank">pytho<wbr>n-sqlalchemy_1.0.8.=
bb</a> =3D&gt; <a href=3D"http://python-sqlalchemy_1.0.9.bb" rel=3D"norefer=
rer" target=3D"_blank">python-sqlalchemy_1.0.9.bb</a>} (76%)<br>
<br>
diff --git a/recipes-devtools/python/<a href=3D"http://python-sqlalchemy_1.=
0.8.bb" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-sqlalchemy_1.0.8.b=
b</a> b/recipes-devtools/python/<a href=3D"http://python-sqlalchemy_1.0.9.b=
b" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-sqlalchemy_1.0.9.bb</a>=
<br>
similarity index 76%<br>
rename from recipes-devtools/python/<a href=3D"http://python-sqlalchemy_1.0=
.8.bb" rel=3D"noreferrer" target=3D"_blank">python<wbr>-sqlalchemy_1.0.8.bb=
</a><br>
rename to recipes-devtools/python/<a href=3D"http://python-sqlalchemy_1.0.9=
.bb" rel=3D"noreferrer" target=3D"_blank">python<wbr>-sqlalchemy_1.0.9.bb</=
a><br>
index 2d66ffd..01c94a5 100644<br>
--- a/recipes-devtools/python/<a href=3D"http://python-sqlalchemy_1.0.8.bb"=
 rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-sqlalchemy_1.0.8.bb</a><b=
r>
+++ b/recipes-devtools/python/<a href=3D"http://python-sqlalchemy_1.0.9.bb"=
 rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-sqlalchemy_1.0.9.bb</a><b=
r>
@@ -8,8 +8,8 @@ RDEPENDS_${PN} +=3D &quot;python-numbers&quot;<br>
=C2=A0SRCNAME =3D &quot;SQLAlchemy&quot;<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://pypi.python.org/packages/source/=
S/${SRCNAME}/${SRCNAME}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">=
https://pypi.python.org/<wbr>packages/source/S/${SRCNAME}/$<wbr>{SRCNAME}-$=
{PV}.tar.gz</a>&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>7cfd005be63945c96a78c67764ac3a<wbr>85&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>950c79c0abf9e9f99c43c627c51d40<wbr>d14a9=
46810a90c35e7cd827bfd0bff<wbr>e46f&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>0e2d7442e70d02c9f6346a5bf0ec22<wbr>65&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>c3d37501e36ec5d74c2d7b4a376471<wbr>9db86=
a9cdab4a24431bf58b386743a<wbr>b10e&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
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
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--94eb2c07728e4045d805464f9eb6--
