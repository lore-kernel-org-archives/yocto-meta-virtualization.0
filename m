Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C2265E00AE4; Tue, 25 Apr 2017 05:09:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.175 listed in dnsbl.sorbs.net]
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
	*      [209.85.216.175 listed in list.dnswl.org]
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4BF85E00A9B
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Apr 2017 05:09:21 -0700 (PDT)
Received: by mail-qt0-f175.google.com with SMTP id m36so137345419qtb.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Apr 2017 05:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wFQziosEZOaSH4mhoSOsv/K0mSGca+j4ieU/4/rWgdI=;
	b=NSOF4N1wI4/PpDZKnIie5OB+A/FQS91bxL8seAQtcE49Skp9Jl+9ZIpyn4SDCRs2Yc
	qvIcxp2M+LbUo/dDiTp+T1MP8ypM9gF2Uxq3g3gtjCfRYXnSNz3G/l0ImvIQ6cBRFzcy
	D5521barbMIrLuqr4bcmibLL2/jTEcxamwqYWRnrz2O0mmHQdxpHxaraMdGJK3g5qwnh
	VKWzKNvhJ74ODs7DItvN2ElovtoDvuGix7PSmmBPi4QLsJDlpJr7sjKy0K0vPmEmTrfA
	HeDrjC8lTg49T4RhvwZjSyG24iOny6EBqL1iadeHDyKHbYswxp3vAnvn/sJUu0IOPIhV
	Up9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wFQziosEZOaSH4mhoSOsv/K0mSGca+j4ieU/4/rWgdI=;
	b=sb4GGKX8YcL07dSAzanP6fWYxWCczyn+Ok4IQsSL+xuQ34RkCUCWwT2UbfAvZcOwbO
	wc2gz1fYAjbl1MZ01gbZOEB4TRKtynuPJoaKn0r3y4H+LCQvHrzhjo2Ag3k7iIckh7X1
	bEWzDNZWmD0Ii2MP71orAhMFd+ZFHFRyhNGXO6AZeYi4+g7IGhPpc/3sJjPIA0UMiLzQ
	i8WLqD9yHKtL6K9g0p9WptgzWPs3hA7ewpm1EyzP7N84BtbwzZLZTZOhLYzNL9xLwgcA
	hfiAcLB6viQL46zyoMARb8GWfVccbEqASzZlOsgw/28rTqvyxwvIVU2e9byMjWrw05FE
	P5JA==
X-Gm-Message-State: AN3rC/77L/L/fRpcg9VNYDQI2Gj/hTLHuB0aNaVtT24oL9G0paIiOxAz
	9WhyNvq0fYp+cLrKfFDdi8445TICsg==
X-Received: by 10.237.53.139 with SMTP id c11mr30065808qte.285.1493122161423; 
	Tue, 25 Apr 2017 05:09:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.145.143 with HTTP; Tue, 25 Apr 2017 05:09:21 -0700 (PDT)
In-Reply-To: <1493107201-29291-2-git-send-email-B40290@freescale.com>
References: <1493107201-29291-1-git-send-email-B40290@freescale.com>
	<1493107201-29291-2-git-send-email-B40290@freescale.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 25 Apr 2017 08:09:21 -0400
Message-ID: <CADkTA4PtYG2WJ00k6b7bN4Wo_1dEiBmqWbJ2hgmsBcz8BPUE3g@mail.gmail.com>
To: Chunrong Guo <B40290@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, chunrong.guo@nxp.com
Subject: Re: [PATCH 2/3] packagegroup-lxc: initial add
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
X-List-Received-Date: Tue, 25 Apr 2017 12:09:23 -0000
Content-Type: multipart/alternative; boundary=001a11c008ba09b7dc054dfc98ab

--001a11c008ba09b7dc054dfc98ab
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 25, 2017 at 4:00 AM, Chunrong Guo <B40290@freescale.com> wrote:

> From: Chunrong Guo <chunrong.guo@nxp.com>
>
> ---
>  recipes-containers/packagegroups/packagegroup-lxc.bb | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 recipes-containers/packagegroups/packagegroup-lxc.bb
>
> diff --git a/recipes-containers/packagegroups/packagegroup-lxc.bb
> b/recipes-containers/packagegroups/packagegroup-lxc.bb
> new file mode 100644
> index 0000000..25954ca
> --- /dev/null
> +++ b/recipes-containers/packagegroups/packagegroup-lxc.bb
> @@ -0,0 +1,13 @@
> +DESCRIPTION = "Install lxc tools"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=
> 4d92cd373abda3937c2bc47fbc49d690"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +inherit packagegroup
> +
> +PACKAGES = "${PN}"
> +
> +RDEPENDS_${PN} = "docker \
> +    docker-registry  \
>

This RDEPENDS is wrong.

Bruce


> +"
> --
> 1.9.0
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

--001a11c008ba09b7dc054dfc98ab
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Apr 25, 2017 at 4:00 AM, Chunrong Guo <span dir=3D"ltr">&lt;<a =
href=3D"mailto:B40290@freescale.com" target=3D"_blank">B40290@freescale.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Chunrong Guo=
 &lt;<a href=3D"mailto:chunrong.guo@nxp.com">chunrong.guo@nxp.com</a>&gt;<b=
r>
<br>
---<br>
=C2=A0recipes-containers/<wbr>packagegroups/<a href=3D"http://packagegroup-=
lxc.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-<wbr>lxc.bb</a> |=
 13 +++++++++++++<br>
=C2=A01 file changed, 13 insertions(+)<br>
=C2=A0create mode 100644 recipes-containers/<wbr>packagegroups/<a href=3D"h=
ttp://packagegroup-lxc.bb" rel=3D"noreferrer" target=3D"_blank">packagegrou=
p-<wbr>lxc.bb</a><br>
<br>
diff --git a/recipes-containers/<wbr>packagegroups/<a href=3D"http://packag=
egroup-lxc.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-<wbr>lxc.b=
b</a> b/recipes-containers/<wbr>packagegroups/<a href=3D"http://packagegrou=
p-lxc.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-<wbr>lxc.bb</a>=
<br>
new file mode 100644<br>
index 0000000..25954ca<br>
--- /dev/null<br>
+++ b/recipes-containers/<wbr>packagegroups/<a href=3D"http://packagegroup-=
lxc.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-<wbr>lxc.bb</a><b=
r>
@@ -0,0 +1,13 @@<br>
+DESCRIPTION =3D &quot;Install lxc tools&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/LICENSE;<wbr>md5=3D<wbr>4d92=
cd373abda3937c2bc47fbc49d6<wbr>90&quot;<br>
+<br>
+PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
+<br>
+inherit packagegroup<br>
+<br>
+PACKAGES =3D &quot;${PN}&quot;<br>
+<br>
+RDEPENDS_${PN} =3D &quot;docker \<br>
+=C2=A0 =C2=A0 docker-registry=C2=A0 \<br></blockquote><div><br></div><div>=
This RDEPENDS is wrong.</div><div><br></div><div>Bruce</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
+&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.0<br>
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
</div></div>

--001a11c008ba09b7dc054dfc98ab--
