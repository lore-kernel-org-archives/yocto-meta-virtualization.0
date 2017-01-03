Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CCE6EE0049F; Tue,  3 Jan 2017 07:27:38 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.178 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.178 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 78B3CE00480
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Jan 2017 07:27:36 -0800 (PST)
Received: by mail-qk0-f178.google.com with SMTP id t184so378370895qkd.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Jan 2017 07:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H3dXaJ2rpjeJTJdgr9GV69GMBY1xv00m8klWCzX70z0=;
	b=YesEzG3GjPAEhPYqdgZNYgPisqW/vidhrOv0aWxk5PQ0oxIU5Ldx2JIaREOXUEs+dC
	kETxIR2jcxd5kSPI4zuV4BCN4Nnbou0fUkZ6mJJcxaefmBk1uTkCrGzubkXi368eXKSg
	wzS42gDPiJHIVfOcKFU7Z4hSVzC8Y+FOOpWM0Q8elSL0IewNxr6gTO0neMisvJb5KYpn
	Frz7glG21rABqyJQR+aQu0jssBRowJIvJ8pRLM18UUle6aGM1hqUuBmho7BXfhbOWvG/
	MvFHlIbMPKFAXTBypiZ86dFN3LeH96GNBsoJm1pa/bakXXF0COxka+bPyEUVmpCvGNMQ
	FhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H3dXaJ2rpjeJTJdgr9GV69GMBY1xv00m8klWCzX70z0=;
	b=r3lE74c1Q6TEf6zLWTWMkB0WY+wpjgXSiE2/H5zQSs+qeBf5tcEnfcFy43xlw+P5+e
	GcYSdtYxaFfaA93wmIfkbeD4GXKZix4dihw91mcG6CmGHKW7T0PFU/mlHSo9/KmqCGQO
	poUD0ZlIZhhuWbLHL/rlqvlVzzc3CXm934/FdJ1JhtQ6EenvILo5ulqM30c2CMprMJio
	ZZ89AG5QsaAf3G55uvhIKCuEihW1L3jfd2bx/mLg7an+50twwK4PMKPLt8Ig8XjdqN/o
	O3xqoQySCEF0BkBrRthR2J0yowci74ft1ySK4/mtVu0cqBK/xP8BqwilRKBFERjtqjgW
	4BJQ==
X-Gm-Message-State: AIkVDXJ+vDE/47D9rjtSUARNjKA9XeHhDEjmjrjEnzQu3M0/4ZdlgwJ/Kq60hD9smJSRBJvQnaiAC7vsbAnWVw==
X-Received: by 10.55.169.75 with SMTP id s72mr22742296qke.211.1483457256206;
	Tue, 03 Jan 2017 07:27:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.129.227 with HTTP; Tue, 3 Jan 2017 07:27:35 -0800 (PST)
In-Reply-To: <1482889451-47606-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1482889451-47606-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Jan 2017 10:27:35 -0500
Message-ID: <CADkTA4O09z6r-uGiDY7L_9it0TyxN10nZ7A7mDeeJ7d0CAN1zw@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] libconfig-general-perl 2.58 -> 2.63
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
X-List-Received-Date: Tue, 03 Jan 2017 15:27:38 -0000
Content-Type: multipart/alternative; boundary=94eb2c06f48ecbb6130545324e32

--94eb2c06f48ecbb6130545324e32
Content-Type: text/plain; charset=UTF-8

Sorry for the delay, I was travelling for the holidays and only got to this
now.

merged.

Bruce

On Tue, Dec 27, 2016 at 8:44 PM, Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

> Upgrade libconfig-general-perl from 2.58 to 2.63
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  ...{libconfig-general-perl_2.58.bb => libconfig-general-perl_2.63.bb} |
> 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/perl/{libconfig-
> general-perl_2.58.bb => libconfig-general-perl_2.63.bb} (81%)
>
> diff --git a/meta-openstack/recipes-devtools/perl/libconfig-
> general-perl_2.58.bb b/meta-openstack/recipes-devtools/perl/libconfig-
> general-perl_2.63.bb
> similarity index 81%
> rename from meta-openstack/recipes-devtools/perl/libconfig-
> general-perl_2.58.bb
> rename to meta-openstack/recipes-devtools/perl/libconfig-
> general-perl_2.63.bb
> index fd06ccc..ec84c44 100644
> --- a/meta-openstack/recipes-devtools/perl/libconfig-general-perl_2.58.bb
> +++ b/meta-openstack/recipes-devtools/perl/libconfig-general-perl_2.63.bb
> @@ -8,8 +8,8 @@ SRCNAME = "Config-General"
>
>  SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TL/TLINDEN/${
> SRCNAME}-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "79397bfbf32dbe772bdc2167afc5c5a6"
> -SRC_URI[sha256sum] = "d63cf3f4c600a87de336db806a7def
> 0385ba5e3a9be427e0c65e407558b82eef"
> +SRC_URI[md5sum] = "e3ea2a6dc76931cf638b5227aceabf60"
> +SRC_URI[sha256sum] = "0a9bf977b8aabe76343e88095d2296
> c8a422410fd2a05a1901f2b20e2e1f6fad"
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

--94eb2c06f48ecbb6130545324e32
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry for the delay, I was travelling for the holidays and=
 only got to this now.<div><br></div><div>merged.</div><div><br></div><div>=
Bruce</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Dec 27, 2016 at 8:44 PM, Zheng Ruoqin <span dir=3D"ltr">&lt;<a href=
=3D"mailto:zhengrq.fnst@cn.fujitsu.com" target=3D"_blank">zhengrq.fnst@cn.f=
ujitsu.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Upgrade =
libconfig-general-perl from 2.58 to 2.63<br>
<br>
Signed-off-by: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.c=
om">zhengrq.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...{<a href=3D"http://libconfig-general-perl_2.58.bb" rel=3D"noreferr=
er" target=3D"_blank">libconfig-general-perl_2.<wbr>58.bb</a> =3D&gt; <a hr=
ef=3D"http://libconfig-general-perl_2.63.bb" rel=3D"noreferrer" target=3D"_=
blank">libconfig-general-perl_2.63.bb</a><wbr>} | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-openstack/recipes-<wbr>devtools/perl/{<a href=3D"http://l=
ibconfig-general-perl_2.58.bb" rel=3D"noreferrer" target=3D"_blank">libconf=
ig-<wbr>general-perl_2.58.bb</a> =3D&gt; <a href=3D"http://libconfig-genera=
l-perl_2.63.bb" rel=3D"noreferrer" target=3D"_blank">libconfig-general-perl=
_2.63.bb</a><wbr>} (81%)<br>
<br>
diff --git a/meta-openstack/recipes-<wbr>devtools/perl/<a href=3D"http://li=
bconfig-general-perl_2.58.bb" rel=3D"noreferrer" target=3D"_blank">libconfi=
g-<wbr>general-perl_2.58.bb</a> b/meta-openstack/recipes-<wbr>devtools/perl=
/<a href=3D"http://libconfig-general-perl_2.63.bb" rel=3D"noreferrer" targe=
t=3D"_blank">libconfig-<wbr>general-perl_2.63.bb</a><br>
similarity index 81%<br>
rename from meta-openstack/recipes-<wbr>devtools/perl/<a href=3D"http://lib=
config-general-perl_2.58.bb" rel=3D"noreferrer" target=3D"_blank">libconfig=
-<wbr>general-perl_2.58.bb</a><br>
rename to meta-openstack/recipes-<wbr>devtools/perl/<a href=3D"http://libco=
nfig-general-perl_2.63.bb" rel=3D"noreferrer" target=3D"_blank">libconfig-<=
wbr>general-perl_2.63.bb</a><br>
index fd06ccc..ec84c44 100644<br>
--- a/meta-openstack/recipes-<wbr>devtools/perl/<a href=3D"http://libconfig=
-general-perl_2.58.bb" rel=3D"noreferrer" target=3D"_blank">libconfig-<wbr>=
general-perl_2.58.bb</a><br>
+++ b/meta-openstack/recipes-<wbr>devtools/perl/<a href=3D"http://libconfig=
-general-perl_2.63.bb" rel=3D"noreferrer" target=3D"_blank">libconfig-<wbr>=
general-perl_2.63.bb</a><br>
@@ -8,8 +8,8 @@ SRCNAME =3D &quot;Config-General&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://search.cpan.org/CPAN/authors/id/T=
/TL/TLINDEN/${SRCNAME}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">h=
ttp://search.cpan.org/CPAN/<wbr>authors/id/T/TL/TLINDEN/${<wbr>SRCNAME}-${P=
V}.tar.gz</a>&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>79397bfbf32dbe772bdc2167afc5c5<wbr>a6&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>d63cf3f4c600a87de336db806a7def<wbr>0385b=
a5e3a9be427e0c65e407558b8<wbr>2eef&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>e3ea2a6dc76931cf638b5227aceabf<wbr>60&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>0a9bf977b8aabe76343e88095d2296<wbr>c8a42=
2410fd2a05a1901f2b20e2e1f<wbr>6fad&quot;<br>
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

--94eb2c06f48ecbb6130545324e32--
