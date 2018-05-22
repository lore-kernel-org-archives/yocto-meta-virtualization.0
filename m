Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B81C3E00903; Mon, 21 May 2018 19:11:05 -0700 (PDT)
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
	*      [209.85.215.48 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1027CE009BC
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 May 2018 19:11:02 -0700 (PDT)
Received: by mail-lf0-f48.google.com with SMTP id x145-v6so14709163lff.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 May 2018 19:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2NYCMRfLhGRlkL555dAGYeC2yOHs6xrL9VeBkNOUuNk=;
	b=h3mzQ3563/pv/aT6hgQqCvr2EgKwCcAWc14mc+ecIs3WZgRxbbzGsVIK6oYg4D/y8x
	99gXfg8A29mBjAFQohQ5cTJpZVVorPcLmpl79pM+AOkAzO4ylcfoan+XKIUFKYfLCJuc
	h8f4vKCZilyzKxeIUmxidEU02mF0Nhdz9b2XClIfLRGrpGJ+QsfziupSAW+doWUaY6La
	E8kZRFVRYNNobkC0dNvLPmlGSkcm1H+KBMtbGeiIIj0r4XDx0oIBPmOtZ/J5agTfJ63/
	pf02nWnohbZYZ0vrtymX5HfLPwi40/5ThD5+3UsditEu8j2sMjgCEU08U0T/VQ2m2XKL
	hieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2NYCMRfLhGRlkL555dAGYeC2yOHs6xrL9VeBkNOUuNk=;
	b=PEuXESp42NFc/r3KzFPNKUyYQdupetfEmQcv7GSxWcuIMNeny7Z86QSzRNTsIroePA
	ZAfO9H0zWIFn8p8aIvnWtr7SE6SJN/qkVjovxNDePe0Q71j0UdY52tqvdA+fbBX3/1Tk
	SXxJS5K3E+i9CMKVaXVfiS3tmufE5syvAiMxBAtVJH/vvECCpJ7QGsJpz0gRSe07Sywm
	4BlsdE/6IYYGgBLY9p0Vkt5Gjyv+rwSkh0aoB76EefH086Ize4Ya5uoKOoVTk41y28ui
	fG4jaM0MJpBibyFjXZ8qPCFzHpGanwdC0hEFiKG+D011atnR/tCl6VBZ/42QoizfX6v4
	XEzg==
X-Gm-Message-State: ALKqPwcUH0k0KmKGn4WogReNWss8i2ABkWdendZWz8VP+eCAJL/thVHe
	CZqOwSNVozdo1lLH9iywUfsRhAgyNRSIv7Ndb4s=
X-Google-Smtp-Source: AB8JxZpwmcLzkhfB8b9o2q8YsrauMCgJRq2cyHsLNzZ0RKcO/6HBybQTBcS3e2Fr+bHGj8tbzpEXL+nTyOHM933uT3o=
X-Received: by 2002:a2e:8518:: with SMTP id
	j24-v6mr14252515lji.12.1526955061655; 
	Mon, 21 May 2018 19:11:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.51.7 with HTTP; Mon, 21 May 2018 19:11:01 -0700 (PDT)
In-Reply-To: <20180521140701.51481-1-smithdm@gmail.com>
References: <20180521140701.51481-1-smithdm@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 21 May 2018 22:11:01 -0400
Message-ID: <CADkTA4M3dsNygY+VbCCFJ8x=jBffu-J1goMEmsV3fUpo3wz-1w@mail.gmail.com>
To: Dave Smith <smithdm@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] LXC LICENSE is LGPLv2.1 not GPLv2.
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
X-List-Received-Date: Tue, 22 May 2018 02:11:05 -0000
Content-Type: multipart/alternative; boundary="00000000000009bea1056cc1eef1"

--00000000000009bea1056cc1eef1
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Mon, May 21, 2018 at 10:07 AM, Dave Smith <smithdm@gmail.com> wrote:

> From: David Smith <smithdm@gmail.com>
>
> LXC is licensed under LGPLv2.1 not GPLv2. The COPYING file
> referenced in the LXC recipe on all branches have the same content,
> checksum  and all define LICENSE="GPLv2" rather than "LGPLv2.1".
> ---
>  recipes-containers/lxc/lxc_2.0.8.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/lxc/lxc_2.0.8.bb b/recipes-containers/lxc/
> lxc_2.0.8.bb
> index c87b875..4918d91 100644
> --- a/recipes-containers/lxc/lxc_2.0.8.bb
> +++ b/recipes-containers/lxc/lxc_2.0.8.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "lxc aims to use these new functionnalities to provide an
> userspace container object"
>  SECTION = "console/utils"
> -LICENSE = "GPLv2"
> +LICENSE = "LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>  DEPENDS = "libxml2 libcap"
>  RDEPENDS_${PN} = " \
> --
> 2.17.0
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

--00000000000009bea1056cc1eef1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Mon, May 21, 2018 at 10:07 A=
M, Dave Smith <span dir=3D"ltr">&lt;<a href=3D"mailto:smithdm@gmail.com" ta=
rget=3D"_blank">smithdm@gmail.com</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">From: David Smith &lt;<a href=3D"mailto:smithdm@gmail.com">s=
mithdm@gmail.com</a>&gt;<br>
<br>
LXC is licensed under LGPLv2.1 not GPLv2. The COPYING file<br>
referenced in the LXC recipe on all branches have the same content,<br>
checksum=C2=A0 and all define LICENSE=3D&quot;GPLv2&quot; rather than &quot=
;LGPLv2.1&quot;.<br>
---<br>
=C2=A0recipes-containers/lxc/<a href=3D"http://lxc_2.0.8.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_2.<wbr>0.8.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-containers/lxc/<a href=3D"http://lxc_2.0.8.bb" rel=3D"=
noreferrer" target=3D"_blank">lxc_<wbr>2.0.8.bb</a> b/recipes-containers/lx=
c/<a href=3D"http://lxc_2.0.8.bb" rel=3D"noreferrer" target=3D"_blank">lxc_=
<wbr>2.0.8.bb</a><br>
index c87b875..4918d91 100644<br>
--- a/recipes-containers/lxc/<a href=3D"http://lxc_2.0.8.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_<wbr>2.0.8.bb</a><br>
+++ b/recipes-containers/lxc/<a href=3D"http://lxc_2.0.8.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_<wbr>2.0.8.bb</a><br>
@@ -1,6 +1,6 @@<br>
=C2=A0DESCRIPTION =3D &quot;lxc aims to use these new functionnalities to p=
rovide an userspace container object&quot;<br>
=C2=A0SECTION =3D &quot;console/utils&quot;<br>
-LICENSE =3D &quot;GPLv2&quot;<br>
+LICENSE =3D &quot;LGPLv2.1&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>4fbd65380cdd2559=
51079008b36451<wbr>6c&quot;<br>
=C2=A0DEPENDS =3D &quot;libxml2 libcap&quot;<br>
=C2=A0RDEPENDS_${PN} =3D &quot; \<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">-- <br>
2.17.0<br>
<br>
-- <br>
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

--00000000000009bea1056cc1eef1--
