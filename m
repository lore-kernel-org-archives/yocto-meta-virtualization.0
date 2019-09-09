Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AE84AE00DAE; Mon,  9 Sep 2019 00:41:50 -0700 (PDT)
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
	*      [209.85.208.193 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3305AE00D67
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Sep 2019 00:41:49 -0700 (PDT)
Received: by mail-lj1-f193.google.com with SMTP id j16so11720655ljg.6
	for <meta-virtualization@yoctoproject.org>;
	Mon, 09 Sep 2019 00:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=y8l24FJksxku8mzxRCfpZzhFWVOplqONbFwZhQeiJs8=;
	b=IZLpUIDUhOtlOb9gineXN+K6FFmgqfQmd53G4gFCUA1kLiA2igs9G0mSNXcy6jBO0C
	jsh38XSaNbBxMjp8Skn3vY1BOCuQURAF6LjkiC+43OhBR/LKeqDcClyjqlmlwx6KrdEV
	Z+ffB9eq9UKzEXz9S12MFiWOD1ykBKl9zL02oPH0qvagGI1Ebgy7baNExvBypRbLdeUJ
	DbXNO7+U1WSKmmwH+hJGMHJZ+qHgli8KVACojcJiEH1UojAqs4dNPxnYLwP+bpt1/mm9
	SAf2tNl0aF7C0uJI0jIlcsfmO0rM4oXo5oqb62zvm4lQ26Up/HceN3G9MEcq23n6sNLl
	s5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=y8l24FJksxku8mzxRCfpZzhFWVOplqONbFwZhQeiJs8=;
	b=BTrrfKA13UXo/ICdVJZUrxinlU/MDH5Bz16qiFvDF9qijwoj0/kaSXEg6b8vxHzr9q
	zDud+xSboxJTwakwBByJH22gp3sB+D4gsdcN85F9isdsAOgZuU2zMsblyTApx+wVw4+P
	Pc5PmresXC0+Kh6+JQAfhy75FW0lnXoGYbVBcWP4gqoFXFY51VuigQS8N/KBPNYYVmRx
	2JpRxONJ8+Elqwz9G7PvEmhDvaccq4qgn5/rIL+Nkl2EAEPwLN0AkwXoG495P2kZvi4T
	3OVrM6W0DXblj+HvA6mhsFcs2lg1clABYRxA7FFC2bZM88tW9nBx6t5oynZXNE0tm2Kc
	Re2w==
X-Gm-Message-State: APjAAAUqrfKp3rWeZ3ZdMs1/MjpA4z+ZSATntoDNOWwYA3FOqE0Nec62
	usoVjeKht9TdSk8rbftuUAuFDMX1CMcuaAyU9lo=
X-Google-Smtp-Source: APXvYqxkE9Ld3r1ajjApRy/DUv+uzzFco58zZFvVdF6Zsc7xWXeVVerMUozIV8g5agjmcwLmRi1n/AYWLYy+hQ+kpHk=
X-Received: by 2002:a2e:83d6:: with SMTP id s22mr14965624ljh.104.1568014907933;
	Mon, 09 Sep 2019 00:41:47 -0700 (PDT)
MIME-Version: 1.0
References: <1568011154-291249-1-git-send-email-changqing.li@windriver.com>
	<1568011154-291249-2-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1568011154-291249-2-git-send-email-changqing.li@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 9 Sep 2019 03:41:39 -0400
Message-ID: <CADkTA4MfZp9pnxnndr8Z=wK2j8TkXEytNmNrCTOe77Qi21SXCw@mail.gmail.com>
To: changqing.li@windriver.com
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: [meta-openstack][PATCH 2/2] python-futures: remove this recipe
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
X-List-Received-Date: Mon, 09 Sep 2019 07:41:50 -0000
Content-Type: text/plain; charset="UTF-8"

Just because the versions are currently aligned, doesn't mean that
condition will hold in the future. So I'll carry the duplicate recipe
for a bit longer in meta-openstack.

Bruce

On Mon, Sep 9, 2019 at 2:39 AM <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> python-futures under meta-openstack has version 3.3.0, and
> is same version with python-futures under meta-oe,
> so remove this one
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../recipes-devtools/python/python-futures_git.bb  | 25 ----------------------
>  1 file changed, 25 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-futures_git.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-futures_git.bb b/meta-openstack/recipes-devtools/python/python-futures_git.bb
> deleted file mode 100644
> index 015ae5f..0000000
> --- a/meta-openstack/recipes-devtools/python/python-futures_git.bb
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -DESCRIPTION = "Backport of the concurrent.futures package from Python 3.2"
> -HOMEPAGE = "https://github.com/agronholm/pythonfutures"
> -SECTION = "devel/python"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=dd6708d05936d3f6c4e20ed14c87b5e3"
> -
> -PV = "3.3.0+git${SRCPV}"
> -SRCREV = "ec78e222ece60721fc92a6c650df3116cb15d24e"
> -
> -SRCNAME = "futures"
> -SRC_URI = "git://github.com/agronholm/python${SRCNAME}.git"
> -
> -S = "${WORKDIR}/git"
> -
> -inherit setuptools
> -
> -# DEPENDS_default: python-pip
> -
> -DEPENDS += " \
> -        python-pip \
> -        "
> -
> -# RDEPENDS_default:
> -RDEPENDS_${PN} += " \
> -        "
> --
> 2.7.4
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

