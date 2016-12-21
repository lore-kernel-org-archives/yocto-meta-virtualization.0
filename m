Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 54E43E007AA; Wed, 21 Dec 2016 09:19:51 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
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
	*      [209.85.220.169 listed in list.dnswl.org]
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CA268E00848
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Dec 2016 09:19:48 -0800 (PST)
Received: by mail-qk0-f169.google.com with SMTP id u25so77693212qki.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Dec 2016 09:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IGcZLf852v6LXGW7UIVK2RcGN+CesSJsBlzdWKpeXfg=;
	b=DRjKQQskBily980ygZwgX0/WIkR7C2vWxS+XTkw21HTJC/wT8G1hi46l4oXDJW1jfr
	v5QVBVR7WD+qhik1VJkJE/QxdvIc80Zha7fk9egwPA5o80lQPZcYCwdaYokZ4IrQNH+p
	43tlfyEQy+/m2KP369BwYwllxHD5otz3GdMwJd3bZyiWITcLMl2oKkENFj9uHWvTXfiA
	g36JbV5gpsLUnml0b/WFSLa22ro2e44CZSr8eMlrZrhpW0N58x3y3oqhG9zFEO2CI56v
	gE9t7wMSLED28XYewIwIcxLDi3GhtSAgka1DEUtkw/nqw+KWUaOadGZRWSfDna0JbHWO
	HSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IGcZLf852v6LXGW7UIVK2RcGN+CesSJsBlzdWKpeXfg=;
	b=ATq9PcBB1QW9aiAAJzT+f9CKplYmko+tuNAVU/sWjYfHK3heqFcbVM49SY/yhi13s0
	RVFrC4DPKqMPmA3rsrIGJFb9tRKzqjpEliw0s3jXYBoq24Rk4BdVP3yHwtevqYTQvPEP
	7ztvLh6tCpOVKaNJfjBbG49Jv090s30In4D5LO8/PDfyiBx0BzC++bRS0R98ktAZCUn+
	QEOW1ejCGUZIGOSiOYm3N+G3KM5eAwSXhsbfbjOLIET9s2iMt+vOhfctDVVis8TN7TXc
	apPGZxPeekRAepVeJn6fzQYu5hy3U+Zy/pvzkbF5tNuLVd0EvP4/iRnP2Prf8aE5aIvu
	piGw==
X-Gm-Message-State: AIkVDXI0ux2hGjtwt6u8PlVXzWClx7ELJOTS09Bhlj82Qmp/kj5SN33HjlOiYSgik8d02Uuak6V7XcmC8xWtbg==
X-Received: by 10.233.221.135 with SMTP id r129mr5768646qkf.56.1482340787316; 
	Wed, 21 Dec 2016 09:19:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.129.227 with HTTP; Wed, 21 Dec 2016 09:19:47 -0800 (PST)
In-Reply-To: <20161220173151.2143-1-adrian.ratiu@ni.com>
References: <20161220173151.2143-1-adrian.ratiu@ni.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 21 Dec 2016 12:19:47 -0500
Message-ID: <CADkTA4Okh=A-M-BVbbXtz+=zos-Lm_wQAEYSmh0zEcucoV5UzQ@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] meta-openstack: add python-pika git based recipe
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
X-List-Received-Date: Wed, 21 Dec 2016 17:19:51 -0000
Content-Type: multipart/alternative; boundary=94eb2c0438a8106d4f05442e5c61

--94eb2c0438a8106d4f05442e5c61
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Tue, Dec 20, 2016 at 12:31 PM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
wrote:

> This package provides a RabbitMQ/AMQP python client library.
>
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  meta-openstack/recipes-devtools/python/python-pika_git.bb | 15
> +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-pika_
> git.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-pika_git.bb
> b/meta-openstack/recipes-devtools/python/python-pika_git.bb
> new file mode 100644
> index 0000000..6d2e55a
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-pika_git.bb
> @@ -0,0 +1,15 @@
> +SUMMARY = "Pure Python RabbitMQ/AMQP 0-9-1 client library"
> +HOMEPAGE = "https://github.com/pika/pika"
> +SECTION = "devel/python"
> +
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=fb26c37045f9e0d2c5e24b711bd7f01c"
> +
> +PV = "0.10.0+git${SRCPV}"
> +SRCREV = "b907f91415169b7f590174ab5d228e75a1b273e6"
> +
> +SRC_URI = "git://github.com/pika/pika"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit setuptools
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

--94eb2c0438a8106d4f05442e5c61
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>merged.<br><br></div>Bruce<br></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On Tue, Dec 20, 2016 at 12:31 PM, =
Ioan-Adrian Ratiu <span dir=3D"ltr">&lt;<a href=3D"mailto:adrian.ratiu@ni.c=
om" target=3D"_blank">adrian.ratiu@ni.com</a>&gt;</span> wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">This package provides a RabbitMQ/AMQP python client =
library.<br>
<br>
Signed-off-by: Ioan-Adrian Ratiu &lt;<a href=3D"mailto:adrian.ratiu@ni.com"=
>adrian.ratiu@ni.com</a>&gt;<br>
---<br>
=C2=A0meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
pika_git.bb" rel=3D"noreferrer" target=3D"_blank">python-pika_<wbr>git.bb</=
a> | 15 +++++++++++++++<br>
=C2=A01 file changed, 15 insertions(+)<br>
=C2=A0create mode 100644 meta-openstack/recipes-<wbr>devtools/python/<a hre=
f=3D"http://python-pika_git.bb" rel=3D"noreferrer" target=3D"_blank">python=
-pika_<wbr>git.bb</a><br>
<br>
diff --git a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://=
python-pika_git.bb" rel=3D"noreferrer" target=3D"_blank">python-pika_<wbr>g=
it.bb</a> b/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://p=
ython-pika_git.bb" rel=3D"noreferrer" target=3D"_blank">python-pika_<wbr>gi=
t.bb</a><br>
new file mode 100644<br>
index 0000000..6d2e55a<br>
--- /dev/null<br>
+++ b/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
pika_git.bb" rel=3D"noreferrer" target=3D"_blank">python-pika_<wbr>git.bb</=
a><br>
@@ -0,0 +1,15 @@<br>
+SUMMARY =3D &quot;Pure Python RabbitMQ/AMQP 0-9-1 client library&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/pika/pika" rel=3D"norefer=
rer" target=3D"_blank">https://github.com/pika/pika</a>&quot;<br>
+SECTION =3D &quot;devel/python&quot;<br>
+<br>
+LICENSE =3D &quot;BSD-3-Clause&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>fb26c37045f9e0d2c5e24=
b711bd7f0<wbr>1c&quot;<br>
+<br>
+PV =3D &quot;0.10.0+git${SRCPV}&quot;<br>
+SRCREV =3D &quot;<wbr>b907f91415169b7f590174ab5d228e<wbr>75a1b273e6&quot;<=
br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/pika/pika" rel=3D"nor=
eferrer" target=3D"_blank">github.com/pika/pika</a>&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit setuptools<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.11.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div>

--94eb2c0438a8106d4f05442e5c61--
