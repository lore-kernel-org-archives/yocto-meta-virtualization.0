Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 620E4E006E9; Mon, 19 Sep 2016 13:03:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, 
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.175 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.175 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B3E95E006B3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 19 Sep 2016 13:03:10 -0700 (PDT)
Received: by mail-qk0-f175.google.com with SMTP id n185so21520095qke.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 19 Sep 2016 13:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1wDg1rhMKzx1XwM3XKiD4EEV+5Stu/m92P+OUQhOt7A=;
	b=RfoO0YnwJXWgd6z5mkMauTYDRpw2paWSQK7caPhXAi18gUG6Nq4BtP48hefCVU3N3A
	kGUJkvueUCDYkB+Gea0CQkZdt/kUJA6m/zvOWHk6oHn8ZKh1mYxiN01fti7r+KX7zC9H
	bugJKqGUbdHAwXWhS4hDL0ft51Zgg0ANBzbi1OLfFMDS/qNub6rvsV02CinBBo7CLTrS
	o8l7v7vIYaynK+MG93ljHMWROOp05f1E5edSQJtw/46PCAwAtYQNfw4WlUJKO542YVCg
	oTKHJ/A43EDvHQYpluJtPZx/GSgu6AGOZAKo29ZuS22CG/fjObJm7LqkpDbROO3grdd8
	xu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1wDg1rhMKzx1XwM3XKiD4EEV+5Stu/m92P+OUQhOt7A=;
	b=m0l9nnlgR/tTaXuRWklfmFJ5/bZ9AiO6224EhBl7IuQjESds7jS3YqnswNOjlKxEN9
	G9E9PIRSxJlp4MO7gmZduV6btE6OySdrxtit0aFrPJ9fZAIcWY6CCUpS/RCF4lUudCxf
	+Yq4BvTB5BSs36KR6Q0K9LM3ltuQxr2+5jMpulQHy9xJ75KjtzInTW6P4mTk23xh3Juz
	g4eQx1GEXtDug09PSekLdicRLs9c9kM3029GU4sCcLt0rnjjedyIeDBCcrp0oQQobDx1
	nTwLaTTvaVYE30oWavQCI392exfuHWQBSIjzEmD+JkfKTQfRKm0DXmWawMhK/VApz1qP
	7Vvg==
X-Gm-Message-State: AE9vXwMs5SagPKy0nTyQV8VyZ/hXfa0rWOOq4LcKKWu7Yse9UDW9KUOwz5sOSTSeMG32Fksnq7BGMf04qwJwsg==
X-Received: by 10.55.81.213 with SMTP id f204mr30352898qkb.85.1474315389810;
	Mon, 19 Sep 2016 13:03:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.38.166 with HTTP; Mon, 19 Sep 2016 13:03:09 -0700 (PDT)
In-Reply-To: <1473830963-3404-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
References: <1473830963-3404-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 19 Sep 2016 16:03:09 -0400
Message-ID: <CADkTA4O6ey7zKt5=i0PQcjT+0uqaWLt4yrZM6anbmaZdzG-bvw@mail.gmail.com>
To: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-beautifulsoup4: 4.4.0 -> 4.4.1
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
X-List-Received-Date: Mon, 19 Sep 2016 20:03:12 -0000
Content-Type: multipart/alternative; boundary=001a114a88e018f121053ce1cdb2

--001a114a88e018f121053ce1cdb2
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Wed, Sep 14, 2016 at 1:29 AM, Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
wrote:

> Upgrade python-beautifulsoup4 from 4.4.0 to 4.4.1.
>
> Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
> ---
>  ...{python-beautifulsoup4_4.4.0.bb => python-beautifulsoup4_4.4.1.bb} |
> 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-
> beautifulsoup4_4.4.0.bb => python-beautifulsoup4_4.4.1.bb} (81%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-
> beautifulsoup4_4.4.0.bb b/meta-openstack/recipes-devtools/python/python-
> beautifulsoup4_4.4.1.bb
> similarity index 81%
> rename from meta-openstack/recipes-devtools/python/python-
> beautifulsoup4_4.4.0.bb
> rename to meta-openstack/recipes-devtools/python/python-
> beautifulsoup4_4.4.1.bb
> index 0b67b80..1e061c2 100644
> --- a/meta-openstack/recipes-devtools/python/python-
> beautifulsoup4_4.4.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-
> beautifulsoup4_4.4.1.bb
> @@ -9,8 +9,8 @@ SRCNAME = "beautifulsoup4"
>
>  SRC_URI = "https://pypi.python.org/packages/source/b/${SRCNAME}/$
> {SRCNAME}-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "63d1f33e6524f408cb6efbc5da1ae8a5"
> -SRC_URI[sha256sum] = "fad91da88f69438b9ba939ab1b2cab
> aa31b1d914f1cccb4bb157a993ed2917f6"
> +SRC_URI[md5sum] = "8fbd9a7cac0704645fa20d1419036815"
> +SRC_URI[sha256sum] = "87d4013d0625d4789a4f56b8d79a04
> d5ce6db1152bb65f1d39744f7709a366b4"
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

--001a114a88e018f121053ce1cdb2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>merged.<br><br></div>Bruce<br></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On Wed, Sep 14, 2016 at 1:29 AM, W=
ang Xin <span dir=3D"ltr">&lt;<a href=3D"mailto:wangxin2015.fnst@cn.fujitsu=
.com" target=3D"_blank">wangxin2015.fnst@cn.fujitsu.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5=
">Upgrade python-beautifulsoup4 from 4.4.0 to 4.4.1.<br>
<br>
Signed-off-by: Wang Xin &lt;<a href=3D"mailto:wangxin2015.fnst@cn.fujitsu.c=
om">wangxin2015.fnst@cn.fujitsu.<wbr>com</a>&gt;<br>
---<br>
=C2=A0...{<a href=3D"http://python-beautifulsoup4_4.4.0.bb" rel=3D"noreferr=
er" target=3D"_blank">python-beautifulsoup4_4.4.<wbr>0.bb</a> =3D&gt; <a hr=
ef=3D"http://python-beautifulsoup4_4.4.1.bb" rel=3D"noreferrer" target=3D"_=
blank">python-beautifulsoup4_4.4.1.bb</a><wbr>} | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-openstack/recipes-<wbr>devtools/python/{<a href=3D"http:/=
/python-beautifulsoup4_4.4.0.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n-<wbr>beautifulsoup4_4.4.0.bb</a> =3D&gt; <a href=3D"http://python-beautif=
ulsoup4_4.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python-beautifulsoup=
4_4.4.1.bb</a><wbr>} (81%)<br>
<br>
diff --git a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://=
python-beautifulsoup4_4.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python=
-<wbr>beautifulsoup4_4.4.0.bb</a> b/meta-openstack/recipes-<wbr>devtools/py=
thon/<a href=3D"http://python-beautifulsoup4_4.4.1.bb" rel=3D"noreferrer" t=
arget=3D"_blank">python-<wbr>beautifulsoup4_4.4.1.bb</a><br>
similarity index 81%<br>
rename from meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://p=
ython-beautifulsoup4_4.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python-=
<wbr>beautifulsoup4_4.4.0.bb</a><br>
rename to meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://pyt=
hon-beautifulsoup4_4.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python-<w=
br>beautifulsoup4_4.4.1.bb</a><br>
index 0b67b80..1e061c2 100644<br>
--- a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
beautifulsoup4_4.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>b=
eautifulsoup4_4.4.0.bb</a><br>
+++ b/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
beautifulsoup4_4.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>b=
eautifulsoup4_4.4.1.bb</a><br>
@@ -9,8 +9,8 @@ SRCNAME =3D &quot;beautifulsoup4&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://pypi.python.org/packages/source/=
b/${SRCNAME}/${SRCNAME}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">=
https://pypi.python.org/<wbr>packages/source/b/${SRCNAME}/$<wbr>{SRCNAME}-$=
{PV}.tar.gz</a>&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>63d1f33e6524f408cb6efbc5da1ae8<wbr>a5&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>fad91da88f69438b9ba939ab1b2cab<wbr>aa31b=
1d914f1cccb4bb157a993ed29<wbr>17f6&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>8fbd9a7cac0704645fa20d14190368<wbr>15&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>87d4013d0625d4789a4f56b8d79a04<wbr>d5ce6=
db1152bb65f1d39744f7709a3<wbr>66b4&quot;<br>
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
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div>

--001a114a88e018f121053ce1cdb2--
