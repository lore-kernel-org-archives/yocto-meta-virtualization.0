Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 96485E00CAF; Fri, 11 Nov 2016 06:03:21 -0800 (PST)
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
	*      [209.85.216.194 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.194 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E41C0E00CA3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Nov 2016 06:03:18 -0800 (PST)
Received: by mail-qt0-f194.google.com with SMTP id n6so966780qtd.0
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Nov 2016 06:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rifZE5x5vU5tqnm6Z7gqJEM3IguEd/C0l6gyPmTHunE=;
	b=K+uETB1fhEeC+rRBhVo2rlgp28eZe3ZcUyaeZxMCkNLKGsZkihheT48pOQ/3gxGAN1
	qev1V2uiLS6iktlVyKapPHVXulnHYHG9dw1mHvNct26CymrTPx3Isn6EK/6a1P6AGreY
	gmSaKJ3MTHKbRRtZFeneKBZE1moMC2IENr7eFpSuLsJP9WwAuNWO95pCmLMaGFgxKpq/
	9EyWm+laMlDgsyP/+swkXN7HANO40D89cAOdQXPJY1hjskoOHQzQD3oQz6b8WHoh9b0u
	UR9YYWB//+SmqUWdCpdNM5+yxequtCiixiEiaIdgNG9Vh6We2QXCcWhj9I7i9oHZQD3s
	rejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rifZE5x5vU5tqnm6Z7gqJEM3IguEd/C0l6gyPmTHunE=;
	b=XSMunjlwRamycVu7wLlgtDIWfMjuKQmdUyqs0mnXGksKlDrlrE8xQpe6Vy9Rxoowar
	I4V86XXV/zpiYw9iTk4iVOzUj1Hhs5mGZfHrnRm3Tq1IRSGsWw9mB99glsUVCT81dXbI
	JDxDuHlfpgqj3UsVfw0rwf0nKhNFNMc7AIh8DxLbYy7NuUqaaISz3+t0/7XojA1plIjR
	Uo/wfFq/4T7r0RuuTqlWomkXG2np0TxdBy45rqQcWTXrAA0jbNQ153elh/nmE0rAsCvr
	yZImAHBQ04S3nXs9bM80E8UMRSgLRATzROJzpvQRcFd0CEZxVBDTYV+plXcyjBvPgnjI
	AGtg==
X-Gm-Message-State: ABUngvcqaQ8qq1qoNjxLQ5kJVDgWAxfrrbwC4Ofpuaspyp7x0rWnLyoCXiojp2LMza4P7gWzvgSfnXNYpmIaew==
X-Received: by 10.237.53.56 with SMTP id a53mr3443801qte.85.1478872997636;
	Fri, 11 Nov 2016 06:03:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.200.45.220 with HTTP; Fri, 11 Nov 2016 06:03:17 -0800 (PST)
In-Reply-To: <20161108135916.6314-2-igor.socec@pelagicore.com>
References: <20161108135916.6314-2-igor.socec@pelagicore.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 11 Nov 2016 09:03:17 -0500
Message-ID: <CADkTA4MQ1bbSo8LAUA-Q7CsTte4HY-MVDkFSTgs0x=WNwkHMkg@mail.gmail.com>
To: Igor Socec <igor.socec@pelagicore.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] lxc: move .debug directory to debug package
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
X-List-Received-Date: Fri, 11 Nov 2016 14:03:21 -0000
Content-Type: multipart/alternative; boundary=001a11c0302ab137c8054106f378

--001a11c0302ab137c8054106f378
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 8, 2016 at 8:59 AM, Igor Socec <igor.socec@pelagicore.com>
wrote:

> Bitbake reports a [debug-files] QA Issue for the following path:
> packages-split/lxc/usr/lib/lxc/lxc/hooks/.debug/unmount-namespace
>

merged.

Bruce


>
> Signed-off-by: Igor Socec <igor.socec@pelagicore.com>
> ---
>  recipes-containers/lxc/lxc_2.0.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/lxc/lxc_2.0.0.bb b/recipes-containers/lxc/
> lxc_2.0.0.bb
> index 53068a8..5e45949 100644
> --- a/recipes-containers/lxc/lxc_2.0.0.bb
> +++ b/recipes-containers/lxc/lxc_2.0.0.bb
> @@ -84,7 +84,7 @@ FILES_${PN}-doc = "${mandir} ${infodir}"
>  # For LXC the docdir only contains example configuration files and should
> be included in the lxc package
>  FILES_${PN} += "${docdir}"
>  FILES_${PN} += "${libdir}/python3*"
> -FILES_${PN}-dbg += "${libexecdir}/lxc/.debug"
> +FILES_${PN}-dbg += "${libexecdir}/lxc/.debug ${libexecdir}/lxc/hooks/.
> debug"
>  PACKAGES =+ "${PN}-templates ${PN}-setup ${PN}-networking"
>  FILES_${PN}-templates += "${datadir}/lxc/templates"
>  RDEPENDS_${PN}-templates += "bash"
> --
> 2.9.3
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

--001a11c0302ab137c8054106f378
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Nov 8, 2016 at 8:59 AM, Igor Socec <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:igor.socec@pelagicore.com" target=3D"_blank">igor.socec@pelagic=
ore.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Bitbake rep=
orts a [debug-files] QA Issue for the following path:<br>
packages-split/lxc/usr/lib/<wbr>lxc/lxc/hooks/.debug/unmount-<wbr>namespace=
<br></blockquote><div><br></div><div>merged.</div><div><br></div><div>Bruce=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Igor Socec &lt;<a href=3D"mailto:igor.socec@pelagicore.com">=
igor.socec@pelagicore.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/lxc/<a href=3D"http://lxc_2.0.0.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_2.<wbr>0.0.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-containers/lxc/<a href=3D"http://lxc_2.0.0.bb" rel=3D"=
noreferrer" target=3D"_blank">lxc_<wbr>2.0.0.bb</a> b/recipes-containers/lx=
c/<a href=3D"http://lxc_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">lxc_=
<wbr>2.0.0.bb</a><br>
index 53068a8..5e45949 100644<br>
--- a/recipes-containers/lxc/<a href=3D"http://lxc_2.0.0.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_<wbr>2.0.0.bb</a><br>
+++ b/recipes-containers/lxc/<a href=3D"http://lxc_2.0.0.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_<wbr>2.0.0.bb</a><br>
@@ -84,7 +84,7 @@ FILES_${PN}-doc =3D &quot;${mandir} ${infodir}&quot;<br>
=C2=A0# For LXC the docdir only contains example configuration files and sh=
ould be included in the lxc package<br>
=C2=A0FILES_${PN} +=3D &quot;${docdir}&quot;<br>
=C2=A0FILES_${PN} +=3D &quot;${libdir}/python3*&quot;<br>
-FILES_${PN}-dbg +=3D &quot;${libexecdir}/lxc/.debug&quot;<br>
+FILES_${PN}-dbg +=3D &quot;${libexecdir}/lxc/.debug ${libexecdir}/lxc/hook=
s/.<wbr>debug&quot;<br>
=C2=A0PACKAGES =3D+ &quot;${PN}-templates ${PN}-setup ${PN}-networking&quot=
;<br>
=C2=A0FILES_${PN}-templates +=3D &quot;${datadir}/lxc/templates&quot;<br>
=C2=A0RDEPENDS_${PN}-templates +=3D &quot;bash&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.9.3<br>
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

--001a11c0302ab137c8054106f378--
