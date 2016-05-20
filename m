Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 47C4DE00D23; Fri, 20 May 2016 09:32:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1FD0E00CE1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 May 2016 09:32:06 -0700 (PDT)
Received: by mail-oi0-f65.google.com with SMTP id m198so6827146oig.0
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 May 2016 09:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=ok4Iid+y6MoqFkpzimuFQwxNcuGMxLwhrQh8rqoKLnc=;
	b=Ad+My/OaPNvJE6dTAGmsI6R66HO6m32hwVOmZxtzXqk6PCx05NX3QlJLBKblODpgzw
	dUGpl800iYoTFOUfASUkzmXVFQnXMAFl9aDKs6jTWqoJ/rNYXCl05pg3dV640IEWb7EU
	OWnhHTYWJbU1a24dpMEtlW95YW3FrRVoY0egbSVOZWNX9xT3lpuk6sre6wSy1uoFMna4
	JRQrTLUUPSKpAMq/qeBjiG3CkiTEqLURhHmK6rWkkMEA2kkhvHYw3ul4JgQFhB1/Asz9
	laLjTTEXJk+j0Aho2oiEfFa5MW48ZHKpOtJCCmP5UOkJZtMpVncRKBF/RPcZAUMsGa9L
	YnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=ok4Iid+y6MoqFkpzimuFQwxNcuGMxLwhrQh8rqoKLnc=;
	b=cHV6HOOeHLZH6ssXlptaiAWniQETRhhh4r/W6hr/n7lbdqIPD1goYnhFPhBBroYaZl
	N6Q1Yr/sdQzIj7vj6A5Gkcnke5gXFZijGj5CqWVyuBbH6YHpbsrJg5tDIpYdgxGsFcLt
	PYND5V+BQvSogK4/C0xsswp1ZDPFo+ocbWd0Q1C2wUU05VbNOl4gksazJnjNk+Hpd/FA
	sVBIMey3t4FA0USZP3ZTVDHSsThiO3Mpnu8FgA+Fz8bCJfLTDVrTjSz3TJsJIpQlcomn
	gR4YYzeG/nCKsB3muMc/gjkJRt5sz485fK8wg4ztlqciM1bzrsdOn51S/QR+tK2BgD1g
	k05w==
X-Gm-Message-State: AOPr4FUoQrVOjsc5T9cncmp7vWqyXf63au4Nx2gNf8KLGhvYpYZcR4NoZFOGQQp44D8Tw/5+Y3ASrLOu3GcmjQ==
MIME-Version: 1.0
X-Received: by 10.157.46.67 with SMTP id c3mr2456772otd.14.1463761925197; Fri,
	20 May 2016 09:32:05 -0700 (PDT)
Received: by 10.157.32.198 with HTTP; Fri, 20 May 2016 09:32:05 -0700 (PDT)
In-Reply-To: <1463644024-217045-1-git-send-email-xulin.sun@windriver.com>
References: <1463644024-217045-1-git-send-email-xulin.sun@windriver.com>
Date: Fri, 20 May 2016 12:32:05 -0400
Message-ID: <CADkTA4MiCLPhXd50wLXANXVQw4k_HX8qbJTZmpSXiAhgLfqbjw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Xulin Sun <xulin.sun@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] cloud-init: fix installed-vs-shipped issue by creating a separate package
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
X-List-Received-Date: Fri, 20 May 2016 16:32:09 -0000
Content-Type: multipart/alternative; boundary=001a113d10ec96625c053348a18c

--001a113d10ec96625c053348a18c
Content-Type: text/plain; charset=UTF-8

merged to master.

Bruce

On Thu, May 19, 2016 at 3:47 AM, Xulin Sun <xulin.sun@windriver.com> wrote:

> This solves the following issue by creating a separate package to put the
> below files:
>
> QA Issue: cloud-init: Files/directories were installed but not shipped
> in any package:
>  /lib
>  /lib/systemd
>  /lib/systemd/system
>  /lib/systemd/system/cloud-init.service
>  /lib/systemd/system/cloud-config.target
>  /lib/systemd/system/cloud-config.service
>  /lib/systemd/system/cloud-init-local.service
>  /lib/systemd/system/cloud-final.service
>
> Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
> ---
>  meta-openstack/recipes-extended/cloud-init/cloud-init_0.7.6.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta-openstack/recipes-extended/cloud-init/
> cloud-init_0.7.6.bb b/meta-openstack/recipes-extended/cloud-init/
> cloud-init_0.7.6.bb
> index ea6752c..457ff93 100644
> --- a/meta-openstack/recipes-extended/cloud-init/cloud-init_0.7.6.bb
> +++ b/meta-openstack/recipes-extended/cloud-init/cloud-init_0.7.6.bb
> @@ -42,9 +42,13 @@ CHEF_SERVICES_CONF_FILES := " \
>      ${sysconfdir}/cloud/cloud.cfg \
>      "
>
> +PACKAGES += "${PN}-systemd"
> +
>  FILES_${PN} += "${sysconfdir}/* \
>                  ${datadir}/*"
>
> +FILES_${PN}-systemd += "${systemd_unitdir}/*"
> +
>  INITSCRIPT_PACKAGES = "${PN}"
>  INITSCRIPT_NAME_${BPN} = "cloud-init"
>
> --
> 2.8.1
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

--001a113d10ec96625c053348a18c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged to master.<div><br></div><div>Bruce</div></div><div=
 class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, May 19, 2016 =
at 3:47 AM, Xulin Sun <span dir=3D"ltr">&lt;<a href=3D"mailto:xulin.sun@win=
driver.com" target=3D"_blank">xulin.sun@windriver.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">This solves the following issue by creat=
ing a separate package to put the<br>
below files:<br>
<br>
QA Issue: cloud-init: Files/directories were installed but not shipped<br>
in any package:<br>
=C2=A0/lib<br>
=C2=A0/lib/systemd<br>
=C2=A0/lib/systemd/system<br>
=C2=A0/lib/systemd/system/cloud-init.service<br>
=C2=A0/lib/systemd/system/cloud-config.target<br>
=C2=A0/lib/systemd/system/cloud-config.service<br>
=C2=A0/lib/systemd/system/cloud-init-local.service<br>
=C2=A0/lib/systemd/system/cloud-final.service<br>
<br>
Signed-off-by: Xulin Sun &lt;<a href=3D"mailto:xulin.sun@windriver.com">xul=
in.sun@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta-openstack/recipes-extended/cloud-init/<a href=3D"http://cloud-in=
it_0.7.6.bb" rel=3D"noreferrer" target=3D"_blank">cloud-init_0.7.6.bb</a> |=
 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta-openstack/recipes-extended/cloud-init/<a href=3D"http://c=
loud-init_0.7.6.bb" rel=3D"noreferrer" target=3D"_blank">cloud-init_0.7.6.b=
b</a> b/meta-openstack/recipes-extended/cloud-init/<a href=3D"http://cloud-=
init_0.7.6.bb" rel=3D"noreferrer" target=3D"_blank">cloud-init_0.7.6.bb</a>=
<br>
index ea6752c..457ff93 100644<br>
--- a/meta-openstack/recipes-extended/cloud-init/<a href=3D"http://cloud-in=
it_0.7.6.bb" rel=3D"noreferrer" target=3D"_blank">cloud-init_0.7.6.bb</a><b=
r>
+++ b/meta-openstack/recipes-extended/cloud-init/<a href=3D"http://cloud-in=
it_0.7.6.bb" rel=3D"noreferrer" target=3D"_blank">cloud-init_0.7.6.bb</a><b=
r>
@@ -42,9 +42,13 @@ CHEF_SERVICES_CONF_FILES :=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${sysconfdir}/cloud/cloud.cfg \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
+PACKAGES +=3D &quot;${PN}-systemd&quot;<br>
+<br>
=C2=A0FILES_${PN} +=3D &quot;${sysconfdir}/* \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/*&=
quot;<br>
<br>
+FILES_${PN}-systemd +=3D &quot;${systemd_unitdir}/*&quot;<br>
+<br>
=C2=A0INITSCRIPT_PACKAGES =3D &quot;${PN}&quot;<br>
=C2=A0INITSCRIPT_NAME_${BPN} =3D &quot;cloud-init&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.8.1<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div>

--001a113d10ec96625c053348a18c--
