Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F39E7E00C45; Mon, 27 Nov 2017 07:43:02 -0800 (PST)
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
	*      [209.85.220.179 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0ADC9E00AF2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 27 Nov 2017 07:43:01 -0800 (PST)
Received: by mail-qk0-f179.google.com with SMTP id j202so32964706qke.10
	for <meta-virtualization@yoctoproject.org>;
	Mon, 27 Nov 2017 07:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Iv1Z+BDyekUEqwyi79/a/N+P3U+o20GIeh04eRm1RP8=;
	b=EG63S39uE84agWWc928Ohs0JRarSADltAtsKD1SYIJou7kB9qYhR6wGXJF1z/Q2Ghr
	tWHv7CnAqRB1P+a1QpK84DtL6OlFCn1RhnRqlW/K4MeA//DBxiS+Rp8m5LW8ie9lxZW9
	bGEAi7hymNYSDaofcZxOG+5ep0CyqSsIPBPSSmf1bDEA1NETP5R3VVniF4Q6kAwGIeVw
	p6+J3hTMbRJ0+Su9XXrcUUOSX2znK0UeGYbZHGb6FBmn/AvnhyvY9E0E89SRjsFLgsHL
	cGqpOe34drB8o/sXIbWmtHO4MZKZXz9g/b1IIONItuUmpwrls2C/E2qxMHx2AZ7lAPXy
	VUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Iv1Z+BDyekUEqwyi79/a/N+P3U+o20GIeh04eRm1RP8=;
	b=RHfhZ9q8RGTkwq8D9+mAWSbuR94/rAPsOFrATIdJvr7iUIISp+/KMh/uwoEg+gJj58
	e2QRBJid5GBV2uer3M6RQC5ZnHUN0bdZu4GwDWka1O++c5uryTq9wXeRfxP+mjg58Swm
	gvc2xPtUiQTOkizLzZFDwYi2JjuDYRxtC75AYMH9vBHGqlkpSRd401xcTi3t5U5oncL1
	3GJCd5J8W/praWIoX0rGsGQOln/U65rBYgY6MEl1xuWcswaI+x+K4E8Xp7GitxaNsWlC
	33jaLcCpKt5rAFAaawYEMDr++43KXbOWb61rPqCHCExJuk7a6ez/z2jpbDNvYeGPtFXY
	5gDg==
X-Gm-Message-State: AJaThX5x0Ereypge8U3kpOktGp/yEcAd77bY3AiQoJQ5b4QhAE1h2NDP
	XBcdjQ9gUB3f1pB+A91Ii4z8Y8hG3RuERDV6boo=
X-Google-Smtp-Source: AGs4zMbqKjK6DOxRiH6lYoQrXiRQp3khc2cEcSG0owsUVFJ1BYWUK5g3IRhKHqxHKSwpL7vh9vn1b6Bd7Dlu5p96RVE=
X-Received: by 10.55.159.145 with SMTP id i139mr1771457qke.339.1511797381013; 
	Mon, 27 Nov 2017 07:43:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Mon, 27 Nov 2017 07:43:00 -0800 (PST)
In-Reply-To: <1511447044-22828-1-git-send-email-yan.yankovskyi@globallogic.com>
References: <1511447044-22828-1-git-send-email-yan.yankovskyi@globallogic.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 27 Nov 2017 10:43:00 -0500
Message-ID: <CADkTA4Nu2K8-5+RNSoN5VkkPoajcM7Pnk2DKVBGwCa0SOHaFsg@mail.gmail.com>
To: Yan Yankovskyi <yan.yankovskyi@globallogic.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] xen: delete references to xenstored.socket and xenstored_ro.socket in xen.inc
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
X-List-Received-Date: Mon, 27 Nov 2017 15:43:03 -0000
Content-Type: multipart/alternative; boundary="001a114d7f68de26ef055ef8c163"

--001a114d7f68de26ef055ef8c163
Content-Type: text/plain; charset="UTF-8"

I see no complaints, so this is now merged.

Bruce

On Thu, Nov 23, 2017 at 9:24 AM, Yan Yankovskyi <
yan.yankovskyi@globallogic.com> wrote:

> These files were removed since the followine patch
> http://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=
> 976ce01e103fc03bb3336cdbc6c951a709e285fe
> and are absent in xen 4.8.0 and further, which leads to
> the following error during the Xen build process:
> do_package: SYSTEMD_SERVICE_xen-xencommons value xenstored.socket does not
> exist
>
> Signed-off-by: Yan Yankovskyi <yan.yankovskyi@globallogic.com>
> ---
>  recipes-extended/xen/xen.inc | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index cb314f8..4d56de9 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -739,8 +739,6 @@ FILES_${PN}-xencommons += "\
>      ${systemd_unitdir}/system/xenconsoled.service \
>      ${systemd_unitdir}/system/xen-init-dom0.service \
>      ${systemd_unitdir}/system/xenstored.service \
> -    ${systemd_unitdir}/system/xenstored.socket \
> -    ${systemd_unitdir}/system/xenstored_ro.socket \
>      ${systemd_unitdir}/system/var-lib-xenstored.mount \
>      "
>
> @@ -780,8 +778,6 @@ SYSTEMD_SERVICE_${PN}-xencommons = " \
>      xenconsoled.service \
>      xen-init-dom0.service \
>      xenstored.service \
> -    xenstored.socket \
> -    xenstored_ro.socket \
>      "
>  SYSTEMD_SERVICE_${PN}-xendomains = "xendomains.service"
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

--001a114d7f68de26ef055ef8c163
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I see no complaints, so this is now merged.<div><br></div>=
<div>Bruce</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_qu=
ote">On Thu, Nov 23, 2017 at 9:24 AM, Yan Yankovskyi <span dir=3D"ltr">&lt;=
<a href=3D"mailto:yan.yankovskyi@globallogic.com" target=3D"_blank">yan.yan=
kovskyi@globallogic.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">These files were removed since the followine patch<br>
<a href=3D"http://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommit;h=3D976ce0=
1e103fc03bb3336cdbc6c951a709e285fe" rel=3D"noreferrer" target=3D"_blank">ht=
tp://xenbits.xen.org/gitweb/<wbr>?p=3Dxen.git;a=3Dcommit;h=3D<wbr>976ce01e1=
03fc03bb3336cdbc6c951<wbr>a709e285fe</a><br>
and are absent in xen 4.8.0 and further, which leads to<br>
the following error during the Xen build process:<br>
do_package: SYSTEMD_SERVICE_xen-xencommons value xenstored.socket does not =
exist<br>
<br>
Signed-off-by: Yan Yankovskyi &lt;<a href=3D"mailto:yan.yankovskyi@globallo=
gic.com">yan.yankovskyi@globallogic.<wbr>com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/xen/xen.inc | 4 ----<br>
=C2=A01 file changed, 4 deletions(-)<br>
<br>
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc<br=
>
index cb314f8..4d56de9 100644<br>
--- a/recipes-extended/xen/xen.inc<br>
+++ b/recipes-extended/xen/xen.inc<br>
@@ -739,8 +739,6 @@ FILES_${PN}-xencommons +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${systemd_unitdir}/system/<wbr>xenconsoled.service \<br=
>
=C2=A0 =C2=A0 =C2=A0${systemd_unitdir}/system/xen-<wbr>init-dom0.service \<=
br>
=C2=A0 =C2=A0 =C2=A0${systemd_unitdir}/system/<wbr>xenstored.service \<br>
-=C2=A0 =C2=A0 ${systemd_unitdir}/system/<wbr>xenstored.socket \<br>
-=C2=A0 =C2=A0 ${systemd_unitdir}/system/<wbr>xenstored_ro.socket \<br>
=C2=A0 =C2=A0 =C2=A0${systemd_unitdir}/system/var-<wbr>lib-xenstored.mount =
\<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
@@ -780,8 +778,6 @@ SYSTEMD_SERVICE_${PN}-<wbr>xencommons =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0xenconsoled.service \<br>
=C2=A0 =C2=A0 =C2=A0xen-init-dom0.service \<br>
=C2=A0 =C2=A0 =C2=A0xenstored.service \<br>
-=C2=A0 =C2=A0 xenstored.socket \<br>
-=C2=A0 =C2=A0 xenstored_ro.socket \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0SYSTEMD_SERVICE_${PN}-<wbr>xendomains =3D &quot;xendomains.service&qu=
ot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.9.1<br>
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

--001a114d7f68de26ef055ef8c163--
