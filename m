Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D9A2FE00C78; Thu, 29 Aug 2019 21:27:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.174 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
	[209.85.208.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4AE60E00B7A
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 21:27:57 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id z17so5196384ljz.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 21:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kchszomUJEMKKwgxViKgP6qXEC+kCWqqUalmXHV0n3Y=;
	b=KBDoDSBal8lB2o84+oqg3dHU171ndDv5srGpzoR+/7m9M3LfVhDTB/ZfAmslC0EkhM
	Na2BpwAVuIeO4H8hG8QtJNnXM3DQPyjFASx/DxLjI8kX96sJ1rXg+GUE/CyRM/uyCNMx
	j6UYyHjWKLK5KYqArbAP6QfHN8BuVn7+iOf08bf/+fM22cmq8fINvU0UCZlTe5wWouhV
	wxdRC/yHRLxYf/r24BSpNTFHO8QsEq+LxEqi4xQR+YlvSUDBUYw1mj2WEPi3VItwT/vA
	e57wPNmV8aHGHBW1NOXDyM/gnjsJMkSwFOYa3XIUNI2mErOS9UHOhbZDipDPtcchKNqi
	qJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kchszomUJEMKKwgxViKgP6qXEC+kCWqqUalmXHV0n3Y=;
	b=qBaBdgywUHGe6QBzFloydrMTIEx2K+dIGL5Au6vEIrxqUhfy1GIn9edSV8e4ufiFU9
	0SmIGiaP8A5+J8+4IV7jITlduml6Mqcx7hPJjoNj8+t3jBeBaM56sLN1fWqnORdZXQrT
	POt/swM+OUVW5DFTMVUDZoEHSllaKsRai/LmR7riayonbXYsoW/0i4gsTtR3kM+vy9RJ
	1+R6mpSEOF6xwImI0mDXsHMVI5AGmPJUvsWllLOm4W1m5P/ddOgRQWGy+XEuJcYphUoX
	9Q795+UVUn9OkW49M7fXn3eTo0VFiHmKvXk+L+GUMnnG1Qddeu5Ot5gnVIHfliv9xRc1
	WBLg==
X-Gm-Message-State: APjAAAXrm0z1nn9XfiNsdZGXyOUzBhOxnJE2egPfZjFrD3Lroj1omUO6
	x3YIExkQyPhCALuoZaZZxMFj68DgtVGG6RYpTze+JYy4
X-Google-Smtp-Source: APXvYqyf5EiYxWm6ycuUgW1suVbwzrdOLq0RsW5Wy2qQ7PF93aVmcSQNbhQL73xudKoXMBJnF7dVV04s4NHhDFw8Gy8=
X-Received: by 2002:a2e:96d3:: with SMTP id d19mr7453229ljj.185.1567139276170; 
	Thu, 29 Aug 2019 21:27:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190829062507.5623-1-kai.kang@windriver.com>
In-Reply-To: <20190829062507.5623-1-kai.kang@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 30 Aug 2019 00:27:45 -0400
Message-ID: <CADkTA4O9=+3m42jPPindMmXWJF+yGzyez2QMm6xJWNHkZaMWTw@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-openstack][Patch] tgt: update DEPENDS and RDEPENDS
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
X-List-Received-Date: Fri, 30 Aug 2019 04:27:57 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Thu, Aug 29, 2019 at 2:27 AM <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Update DEPENDS and RDEPENDS of tgt to fix error and warning:
>
> | bs_aio.c:34:10: fatal error: libaio.h: No such file or directory
> |    34 | #include <libaio.h>
> |       |          ^~~~~~~~~~
>
> and
>
> | WARNING: tgt-1.0.79+gitAUTOINC+b43dbc6711-r0 do_package_qa: QA Issue:
> |  /usr/sbin/tgt-admin contained in package tgt requires /usr/bin/perl,
> |  but no providers found in RDEPENDS_tgt? [file-rdeps]
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta-openstack/recipes-support/tgt/tgt_git.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-openstack/recipes-support/tgt/tgt_git.bb b/meta-openstack/recipes-support/tgt/tgt_git.bb
> index ddec8c4..5242dd5 100644
> --- a/meta-openstack/recipes-support/tgt/tgt_git.bb
> +++ b/meta-openstack/recipes-support/tgt/tgt_git.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "Linux SCSI target framework (tgt)"
>  HOMEPAGE = "http://stgt.sourceforge.net"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://scripts/tgtd.spec;beginline=7;endline=7;md5=21c19ea7dad04648b9c2f791b6e29b4c"
> -DEPENDS = "sg3-utils"
> +DEPENDS = "sg3-utils libaio"
>
>  SRCREV = "b43dbc6711e43c0a32cc4d9df22884841d911d51"
>  PV = "1.0.79+git${SRCPV}"
> @@ -58,6 +58,7 @@ RDEPENDS_${PN} = " \
>      bash \
>      libaio \
>      libconfig-general-perl \
> +    perl \
>      perl-module-english \
>      perl-module-tie-hash-namedcapture \
>      perl-module-xsloader \
> --
> 2.20.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

