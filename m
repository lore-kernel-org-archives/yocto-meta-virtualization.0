Return-Path: <iurii.mykhalskyi@globallogic.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D310AE00826; Fri, 28 Apr 2017 04:11:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.82.43 listed in list.dnswl.org]
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 81040E007B5
	for <meta-virtualization@yoctoproject.org>;
	Fri, 28 Apr 2017 04:11:40 -0700 (PDT)
Received: by mail-wm0-f43.google.com with SMTP id u65so39257882wmu.1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 28 Apr 2017 04:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=globallogic.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=unXhiB2D8xZ09RhlME3OQJJkHv8oswcH66NjbA4KF/I=;
	b=CayBEHLdbmkLK2/UHkuAm9L5Xib5XeZoDKEhsVx2nzPJpgaEMjV8NM+E/HSo3yfq/q
	Iu3z9ruLDaxAlP2afjpO/PpJqfkUKaFwfy1xE2MovtMmEMcELArY9kT4AQAttpfRdnyE
	ELCQdXqfgmqnwKXgh/L+2F9TvWTNOA1UyDwhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=unXhiB2D8xZ09RhlME3OQJJkHv8oswcH66NjbA4KF/I=;
	b=jdcThBhCTpfekV78oopZBy1mInjO/FHt0l6ZshLBfXhiF/gEUBxQ7PDt/NeYKqZ7Mn
	TWPzAFos82742tUpeFU+1qnNPQJBvqPvvq28xhgucAO8COkYd9SfbgaAcC8xjoL3uj7F
	IABChHEGxAUgpF8S/aCXhA9vFbTUYOACAPL8xdZ7TWgIPzEKjpOTaZR2YRTy5sumrNN4
	7Q25wuUCh1cvK78ZOI33VafRqxZYSyOfB2lIFkLpzvKsHY7j8ctl9Sfqz6NXUjQXt0b7
	kONRroZp6n0QttLwnp4XtEXpLVetdszROhr7hB4hE2AqajiptvHh3EGKN5qJcv1SlTzs
	+UEg==
X-Gm-Message-State: AN3rC/7/5lmZUntRkT+1z4a/n0FHh/dSAbYClDGHFMnoxcBpAggd/Rj5
	pLhheAX5uxJQ04/JKP1R/PmiHoo4N/r5
X-Received: by 10.28.49.136 with SMTP id x130mr5053737wmx.137.1493377899644;
	Fri, 28 Apr 2017 04:11:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.154.13 with HTTP; Fri, 28 Apr 2017 04:11:09 -0700 (PDT)
In-Reply-To: <1490280257-11855-1-git-send-email-iurii.mykhalskyi@globallogic.com>
References: <1490280257-11855-1-git-send-email-iurii.mykhalskyi@globallogic.com>
From: Iurii Mykhalskyi <iurii.mykhalskyi@globallogic.com>
Date: Fri, 28 Apr 2017 14:11:09 +0300
Message-ID: <CAC+yBMvfnV8iH713WgDyNO6mdJ969GX8EwT4wLCFzds+U0FX=g@mail.gmail.com>
To: meta-virtualization@yoctoproject.org, bruce.ashfield@windriver.com, 
	mark.asselstine@windriver.com
Subject: Re: [PATCH] xen: Fix mistype error in xen-watchdog systemd service
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
X-List-Received-Date: Fri, 28 Apr 2017 11:11:44 -0000
Content-Type: multipart/alternative; boundary=001a1142dfc0396701054e3823b2

--001a1142dfc0396701054e3823b2
Content-Type: text/plain; charset=UTF-8

Hello guys,

any updates regarding this patch?

On Thu, Mar 23, 2017 at 4:44 PM, Iurii Mykhalskyi <
iurii.mykhalskyi@globallogic.com> wrote:

> Due to error in naming this service will not be autoenabled in
> systems with systemd init manager
>
> Signed-off-by: Iurii Mykhalskyi <iurii.mykhalskyi@globallogic.com>
> ---
>  recipes-extended/xen/xen.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 0084274..a28d474 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -720,7 +720,7 @@ INITSCRIPT_PARAMS_${PN}-devd = "defaults 82"
>
>  # systemd packages
>  SYSTEMD_PACKAGES = "${PN}-xen-watchdog ${PN}-xencommons ${PN}-xendomains"
> -SYSTEMD_SERVICE_${PN}-watchdog = "xen-watchdog.service"
> +SYSTEMD_SERVICE_${PN}-xen-watchdog = "xen-watchdog.service"
>  SYSTEMD_SERVICE_${PN}-xencommons = " \
>      proc-xen.mount \
>      var-lib-xenstored.mount \
> --
> 2.7.4
>
>


-- 

Iurii Mykhalskyi | Lead Software Engineer
GlobalLogic
P +38.044.492.9695x3664  M +38.096.311.5467  S mad-nemoi
www.globallogic.com
<http://www.globallogic.com/>
http://www.globallogic.com/email_disclaimer.txt

--001a1142dfc0396701054e3823b2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello guys,<div><br></div><div>any updates regarding this =
patch?<br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu,=
 Mar 23, 2017 at 4:44 PM, Iurii Mykhalskyi <span dir=3D"ltr">&lt;<a href=3D=
"mailto:iurii.mykhalskyi@globallogic.com" target=3D"_blank">iurii.mykhalsky=
i@globallogic.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">D=
ue to error in naming this service will not be autoenabled in<br>
systems with systemd init manager<br>
<br>
Signed-off-by: Iurii Mykhalskyi &lt;<a href=3D"mailto:iurii.mykhalskyi@glob=
allogic.com">iurii.mykhalskyi@globallogic.<wbr>com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/xen/xen.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc<br=
>
index 0084274..a28d474 100644<br>
--- a/recipes-extended/xen/xen.inc<br>
+++ b/recipes-extended/xen/xen.inc<br>
@@ -720,7 +720,7 @@ INITSCRIPT_PARAMS_${PN}-devd =3D &quot;defaults 82&quot=
;<br>
<br>
=C2=A0# systemd packages<br>
=C2=A0SYSTEMD_PACKAGES =3D &quot;${PN}-xen-watchdog ${PN}-xencommons ${PN}-=
xendomains&quot;<br>
-SYSTEMD_SERVICE_${PN}-<wbr>watchdog =3D &quot;xen-watchdog.service&quot;<b=
r>
+SYSTEMD_SERVICE_${PN}-xen-<wbr>watchdog =3D &quot;xen-watchdog.service&quo=
t;<br>
=C2=A0SYSTEMD_SERVICE_${PN}-<wbr>xencommons =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0proc-xen.mount \<br>
=C2=A0 =C2=A0 =C2=A0var-lib-xenstored.mount \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div di=
r=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"=
><div><font size=3D"-1"><br><span style=3D"vertical-align:baseline;font-var=
iant:normal;font-style:normal;font-size:12px;background-color:transparent;t=
ext-decoration:none;font-family:Arial;font-weight:bold">Iurii Mykhalskyi | =
Lead Software Engineer </span><br><span style=3D"vertical-align:baseline;fo=
nt-variant:normal;font-style:normal;font-size:12px;background-color:transpa=
rent;text-decoration:none;font-family:Arial;font-weight:normal">GlobalLogic=
</span><br><span style=3D"vertical-align:baseline;font-variant:normal;font-=
style:normal;font-size:12px;background-color:transparent;text-decoration:no=
ne;font-family:Arial;font-weight:normal">P=C2=A0</span></font><a href=3D"te=
l:%2B38.044.492.9695x3664" value=3D"+380444929695" style=3D"color:rgb(17,85=
,204);font-family:Arial;font-size:12px" target=3D"_blank">+38.044.492.9695x=
3664</a><font size=3D"-1"><span style=3D"vertical-align:baseline;font-varia=
nt:normal;font-style:normal;font-size:12px;background-color:transparent;tex=
t-decoration:none;font-family:Arial;font-weight:normal">=C2=A0 M +38.096.31=
1.5467=C2=A0 S mad-nemoi</span><br><a href=3D"http://www.globallogic.com/" =
target=3D"_blank"><span style=3D"font-size:12px;font-family:Arial;color:#11=
55cc;background-color:transparent;font-weight:normal;font-style:normal;font=
-variant:normal;text-decoration:underline;vertical-align:baseline">www.glob=
allogic.com</span></a><span style=3D"vertical-align:baseline;font-variant:n=
ormal;font-style:normal;font-size:12px;background-color:transparent;text-de=
coration:none;font-family:Arial;font-weight:normal"></span><br><a href=3D"h=
ttp://www.globallogic.com/" target=3D"_blank"><span style=3D"font-size:12px=
;font-family:Arial;color:#1155cc;background-color:transparent;font-weight:n=
ormal;font-style:normal;font-variant:normal;text-decoration:underline;verti=
cal-align:baseline"></span></a><br><a href=3D"http://www.globallogic.com/em=
ail_disclaimer.txt" target=3D"_blank"><span style=3D"font-size:11px;font-fa=
mily:Arial;color:#1155cc;background-color:transparent;font-weight:normal;fo=
nt-style:normal;font-variant:normal;text-decoration:underline;vertical-alig=
n:baseline">http://www.globallogic.com/email_disclaimer.txt</span></a><span=
 style=3D"vertical-align:baseline;font-variant:normal;font-style:normal;fon=
t-size:11px;background-color:transparent;text-decoration:none;font-family:A=
rial;font-weight:normal"></span></font></div></div></div></div></div></div>=
</div></div></div>
</div></div></div>

--001a1142dfc0396701054e3823b2--
