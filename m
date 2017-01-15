Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 324D5E0077F; Sat, 14 Jan 2017 16:27:05 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_05_10, 
	RCVD_IN_DNSWL_LOW,RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* 0.3 HTML_OBFUSCATE_05_10 BODY: Message is 5% to 10% HTML obfuscation
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.176 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.176 listed in dnsbl.sorbs.net]
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9F0EBE00655
	for <meta-virtualization@yoctoproject.org>;
	Sat, 14 Jan 2017 16:27:02 -0800 (PST)
Received: by mail-qt0-f176.google.com with SMTP id k15so77844687qtg.3
	for <meta-virtualization@yoctoproject.org>;
	Sat, 14 Jan 2017 16:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dMSKVdJMVjW+qYYJzUwLNgXfxOpyf/BJWE2If7mUGJ4=;
	b=TzT2jh1wXSgEpAanwziIewoR7z5kqxYflnJ/lYwXA4xxNfXfps7KUMHVCU8bQ3UJ6E
	WO1gi8/S7926epEtzQS38+5+yjdL93ADhnyxafOy5OFFOA8o2qvgkSAGE803W9w3JreU
	4oxFMqhBwkKghVHSkkXLn7oBpZNO78n+pKObfZGinIRHQb/1twJbP73Wx0XZx/uT2+Io
	IasTQomNpVsUEhfxcDZDuPS0xAL1fg9hOWfTbvMhyWq/XNVmmJPp2LxXTKZMyry00zVY
	C31m0a3NBku8PCPb7lc5X8zfuevQ0e9+9Y0+iEDIPE5z9YwVx9iu74gE8h7O5yWHl+HA
	M+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dMSKVdJMVjW+qYYJzUwLNgXfxOpyf/BJWE2If7mUGJ4=;
	b=phIvvgRzw3IYF4efHwNW/QnSGo8fokTXXbrsftKX8K8TkF8yDcloMjUv+eLufoZ0Ul
	eQOlx5wmLYFR5PDi1kpMbiZWv60CObkfP/R7NHvPY02UmS599pZqcW2lp/zfTtTj/bD9
	UszQ2RNlfwVzgnA4uIzjs1qJtpL9AYA/Bp5QkKlQWPc1/cyPQe7MSZTTv5DNqTsFqFZQ
	K7COee0sIjDlWees45EsQpiojLWusfTNTtx/jWiw6IYHXUd4nTVrl/D+7Frp/npc1MBL
	eGabItUA1GzUYYHAQkmeMgHYXk5R8HF+3bTJgL+zd/FtPL7jnq1MD04ZJigQymTHJ0R5
	IX6A==
X-Gm-Message-State: AIkVDXKh2QZWe6nFIv5WWWfY/Es+0chUF/QRETf6OpU2839FyWROyzxIUVqR9DvRMJMWnCkn7moZOwUsU6OFxQ==
X-Received: by 10.237.38.65 with SMTP id z59mr17967377qtc.5.1484440021565;
	Sat, 14 Jan 2017 16:27:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.135.153 with HTTP; Sat, 14 Jan 2017 16:27:01 -0800 (PST)
In-Reply-To: <1484299346-1218-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1484299346-1218-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 14 Jan 2017 19:27:01 -0500
Message-ID: <CADkTA4OoWKpni5ODNeyz1LL6jN2RRdRNPfykzWFAGdcd2vSNUw@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-webob 1.4.1 -> 1.6.0
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
X-List-Received-Date: Sun, 15 Jan 2017 00:27:05 -0000
Content-Type: multipart/alternative; boundary=94eb2c122e582d08070546172020

--94eb2c122e582d08070546172020
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Fri, Jan 13, 2017 at 4:22 AM, Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
wrote:

> Upgrade python-webob from 1.4.1 to 1.6.0.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-webob_1.4.1.bb => python-webob_1.6.0.bb}           |
> 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename recipes-devtools/python/{python-webob_1.4.1.bb =>
> python-webob_1.6.0.bb} (75%)
>
> diff --git a/recipes-devtools/python/python-webob_1.4.1.bb
> b/recipes-devtools/python/python-webob_1.6.0.bb
> similarity index 75%
> rename from recipes-devtools/python/python-webob_1.4.1.bb
> rename to recipes-devtools/python/python-webob_1.6.0.bb
> index 18b3806..71c74ff 100644
> --- a/recipes-devtools/python/python-webob_1.4.1.bb
> +++ b/recipes-devtools/python/python-webob_1.6.0.bb
> @@ -9,8 +9,8 @@ SRCNAME = "WebOb"
>
>  SRC_URI = "http://pypi.python.org/packages/source/W/${SRCNAME}/$
> {SRCNAME}-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "a5c6e8ba5431756e6a5d5ec56047ec94"
> -SRC_URI[sha256sum] = "12f8b98390befc47336d2c0e5bad9c
> c48609d808eabb3f8675dc1027a3a9e9db"
> +SRC_URI[md5sum] = "089d7fc6745f175737800237c7287802"
> +SRC_URI[sha256sum] = "63d262d8f61b516321f786879c9277
> fa2209f7f57eb47b537eeecfea383d55b7"
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

--94eb2c122e582d08070546172020
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Fri, Jan 13, 2017 at 4:22 AM=
, Huang Qiyu <span dir=3D"ltr">&lt;<a href=3D"mailto:huangqy.fnst@cn.fujits=
u.com" target=3D"_blank">huangqy.fnst@cn.fujitsu.com</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">Upgrade python-webob from 1.4.1 to 1.6.0.=
<br>
<br>
Signed-off-by: Huang Qiyu &lt;<a href=3D"mailto:huangqy.fnst@cn.fujitsu.com=
">huangqy.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../python/{<a href=3D"http://python-webob_1.4.1.bb" rel=3D"noreferre=
r" target=3D"_blank">python-webob_1.4.<wbr>1.bb</a> =3D&gt; <a href=3D"http=
://python-webob_1.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python-webob=
_1.6.0.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename recipes-devtools/python/{<a href=3D"http://python-webob_1.4.1.=
bb" rel=3D"noreferrer" target=3D"_blank">pytho<wbr>n-webob_1.4.1.bb</a> =3D=
&gt; <a href=3D"http://python-webob_1.6.0.bb" rel=3D"noreferrer" target=3D"=
_blank">python-webob_1.6.0.bb</a>} (75%)<br>
<br>
diff --git a/recipes-devtools/python/<a href=3D"http://python-webob_1.4.1.b=
b" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on-webob_1.4.1.bb</a> b/re=
cipes-devtools/python/<a href=3D"http://python-webob_1.6.0.bb" rel=3D"noref=
errer" target=3D"_blank">pyth<wbr>on-webob_1.6.0.bb</a><br>
similarity index 75%<br>
rename from recipes-devtools/python/<a href=3D"http://python-webob_1.4.1.bb=
" rel=3D"noreferrer" target=3D"_blank">python<wbr>-webob_1.4.1.bb</a><br>
rename to recipes-devtools/python/<a href=3D"http://python-webob_1.6.0.bb" =
rel=3D"noreferrer" target=3D"_blank">python<wbr>-webob_1.6.0.bb</a><br>
index 18b3806..71c74ff 100644<br>
--- a/recipes-devtools/python/<a href=3D"http://python-webob_1.4.1.bb" rel=
=3D"noreferrer" target=3D"_blank">pyth<wbr>on-webob_1.4.1.bb</a><br>
+++ b/recipes-devtools/python/<a href=3D"http://python-webob_1.6.0.bb" rel=
=3D"noreferrer" target=3D"_blank">pyth<wbr>on-webob_1.6.0.bb</a><br>
@@ -9,8 +9,8 @@ SRCNAME =3D &quot;WebOb&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://pypi.python.org/packages/source/W=
/${SRCNAME}/${SRCNAME}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">h=
ttp://pypi.python.org/<wbr>packages/source/W/${SRCNAME}/$<wbr>{SRCNAME}-${P=
V}.tar.gz</a>&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>a5c6e8ba5431756e6a5d5ec56047ec<wbr>94&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>12f8b98390befc47336d2c0e5bad9c<wbr>c4860=
9d808eabb3f8675dc1027a3a9<wbr>e9db&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>089d7fc6745f175737800237c72878<wbr>02&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>63d262d8f61b516321f786879c9277<wbr>fa220=
9f7f57eb47b537eeecfea383d<wbr>55b7&quot;<br>
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

--94eb2c122e582d08070546172020--
