Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6743CE00C9E; Tue, 29 Aug 2017 05:43:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_05_10, 
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.217.181 listed in list.dnswl.org]
	* 0.3 HTML_OBFUSCATE_05_10 BODY: Message is 5% to 10% HTML obfuscation
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ua0-f181.google.com (mail-ua0-f181.google.com
	[209.85.217.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9C8CDE00C9F
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Aug 2017 05:43:55 -0700 (PDT)
Received: by mail-ua0-f181.google.com with SMTP id 105so9799551uad.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Aug 2017 05:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Mni1akb2UuSZZdjOQBa1/kvKoowIbgCJUjiz0Ki8L9A=;
	b=QIcRtHHfSpYWIX6Fy1rgb/kc1bq2xdHle6/UW/1VQJZ7JM9kZt6YZ/rOjIlG/Cgngb
	fEARhxJuJdqDtamzOTS/BupTRqr7sXybqzbOmmAxnq179XusttlwuEnjB5YrjeXm65m+
	smQL8AvWqTjckp/dXydHklwmVkWMpad9rrgoc6d4j+O3JSm/LO2Ug9fjidBXSV9+4QZj
	FlqZudx9zEADq4hB8v9LDGje2rp4AvFSxJTbYhG1dvfV3LGlsteQux8OvWIi0zRENNy5
	UB5+rldnmgfq2mpSXDjcrtFko4GICQQ3K57tLl0NyAoYRvWkjLbGYQysUBwct1YG6NeF
	Ii5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Mni1akb2UuSZZdjOQBa1/kvKoowIbgCJUjiz0Ki8L9A=;
	b=nRaFgElmOPL/V7dKRoBef+MBG5Q+ge0z9RgoDyhqf+X9cYxLUD5yf+oubaVbkMebzL
	cyDCd8fjLvfICKNmWu2tyZ7+fpdzq4mssZC77Rl258iv879R/5wqW1KuJ3ZwI15NQYUn
	I+6AFWPbnQW/ACnx44IpJQo6W2RSk8yT+KCEo3g19rpnWG4udctldVbe2KerLAF0GFmH
	U4malDoD+4d6fmFoTpAt2JFwDXInvDNa33ylSDQjEBaoaJK8F5bSinZ44ie6JHqIkJMz
	rdIfQpsqnfPZijsOTOg1OkQ+G7FbzU10yMkVD9DTkoHCDC3Jy106X8ucExqIJlVkxRsZ
	VH6g==
X-Gm-Message-State: AHYfb5hj5o7laWB2OT/E5G/MEZMVQTGc+3WMc8E8B5/Aja27aLojLAWY
	hKi+mDy52ExaRBolg46tBgRmwqG/gg==
X-Received: by 10.176.92.85 with SMTP id a21mr105387uag.168.1504010634555;
	Tue, 29 Aug 2017 05:43:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.235 with HTTP; Tue, 29 Aug 2017 05:43:53 -0700 (PDT)
In-Reply-To: <1503901499-2486-1-git-send-email-B40290@freescale.com>
References: <1503901499-2486-1-git-send-email-B40290@freescale.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 29 Aug 2017 08:43:53 -0400
Message-ID: <CADkTA4N2TRJBMtJEcUtL2y06w=WcX2atDjB-feQxnPCzQ5WYBw@mail.gmail.com>
To: Chunrong Guo <B40290@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, chunrong.guo@nxp.com
Subject: Re: [PATCH] libvirt: fix build failure, failing QA check
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
X-List-Received-Date: Tue, 29 Aug 2017 12:43:56 -0000
Content-Type: multipart/alternative; boundary="f403043eb3409c78010557e3c3b1"

--f403043eb3409c78010557e3c3b1
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Aug 28, 2017 at 2:24 AM, Chunrong Guo <B40290@freescale.com> wrote:

> From: Chunrong Guo <chunrong.guo@nxp.com>
>
>   The build is failing due to a failing QA check:
>
>    ERROR: libvirt-1.3.5-r0 do_package_qa: QA Issue:
> /usr/lib/libvirt/ptest/tests/tests/check-file-access.pl
>    contained in package libvirt-ptest requires /usr/bin/perl,
>    but no providers found in RDEPENDS_libvirt-ptest? [file-rdeps]
>
> Signed-off-by: Chunrong Guo <chunrong.guo@nxp.com>
> ---
>  recipes-extended/libvirt/libvirt_1.3.5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_1.3.5.bb
> b/recipes-extended/libvirt/libvirt_1.3.5.bb
> index 19b7567..8ed2505 100644
> --- a/recipes-extended/libvirt/libvirt_1.3.5.bb
> +++ b/recipes-extended/libvirt/libvirt_1.3.5.bb
> @@ -14,7 +14,7 @@ DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted
> curl libpcap util-linux
>  #
>  RDEPENDS_${PN} = "gettext-runtime"
>
> -RDEPENDS_${PN}-ptest += "make gawk"
> +RDEPENDS_${PN}-ptest += "make gawk perl"
>
>  RDEPENDS_libvirt-libvirtd += "bridge-utils iptables pm-utils dnsmasq
> netcat-openbsd"
>  RDEPENDS_libvirt-libvirtd_append_x86-64 = " dmidecode"
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

--f403043eb3409c78010557e3c3b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged<div><br></div><div>Bruce</div></div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">On Mon, Aug 28, 2017 at 2:24 AM,=
 Chunrong Guo <span dir=3D"ltr">&lt;<a href=3D"mailto:B40290@freescale.com"=
 target=3D"_blank">B40290@freescale.com</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">From: Chunrong Guo &lt;<a href=3D"mailto:chunrong.guo@=
nxp.com">chunrong.guo@nxp.com</a>&gt;<br>
<br>
=C2=A0 The build is failing due to a failing QA check:<br>
<br>
=C2=A0 =C2=A0ERROR: libvirt-1.3.5-r0 do_package_qa: QA Issue: /usr/lib/libv=
irt/ptest/tests/<wbr>tests/<a href=3D"http://check-file-access.pl" rel=3D"n=
oreferrer" target=3D"_blank">check-file-access.pl</a><br>
=C2=A0 =C2=A0contained in package libvirt-ptest requires /usr/bin/perl,<br>
=C2=A0 =C2=A0but no providers found in RDEPENDS_libvirt-ptest? [file-rdeps]=
<br>
<br>
Signed-off-by: Chunrong Guo &lt;<a href=3D"mailto:chunrong.guo@nxp.com">chu=
nrong.guo@nxp.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvi<wbr>rt_1.3.5.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.5.bb" r=
el=3D"noreferrer" target=3D"_blank">lib<wbr>virt_1.3.5.bb</a> b/recipes-ext=
ended/libvirt/<a href=3D"http://libvirt_1.3.5.bb" rel=3D"noreferrer" target=
=3D"_blank">lib<wbr>virt_1.3.5.bb</a><br>
index 19b7567..8ed2505 100644<br>
--- a/recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">lib<wbr>virt_1.3.5.bb</a><br>
+++ b/recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">lib<wbr>virt_1.3.5.bb</a><br>
@@ -14,7 +14,7 @@ DEPENDS =3D &quot;bridge-utils gnutls libxml2 lvm2 avahi =
parted curl libpcap util-linux<br>
=C2=A0#<br>
=C2=A0RDEPENDS_${PN} =3D &quot;gettext-runtime&quot;<br>
<br>
-RDEPENDS_${PN}-ptest +=3D &quot;make gawk&quot;<br>
+RDEPENDS_${PN}-ptest +=3D &quot;make gawk perl&quot;<br>
<br>
=C2=A0RDEPENDS_libvirt-libvirtd +=3D &quot;bridge-utils iptables pm-utils d=
nsmasq netcat-openbsd&quot;<br>
=C2=A0RDEPENDS_libvirt-libvirtd_<wbr>append_x86-64 =3D &quot; dmidecode&quo=
t;<br>
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
</div>

--f403043eb3409c78010557e3c3b1--
