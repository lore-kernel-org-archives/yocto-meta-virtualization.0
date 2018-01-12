Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D72ADE00D55; Fri, 12 Jan 2018 07:39:33 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BB508E00E9B
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Jan 2018 07:39:32 -0800 (PST)
Received: by mail-qk0-f195.google.com with SMTP id q1so9103893qkb.9
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Jan 2018 07:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ye4lVTyhMZ4AayZ1By+U+KwoFKGC9l0SmoLSL365IhQ=;
	b=k58aYVCLt5xtp2LBcTws8JcE8ctJ163LiGX0wioGdaqULQn3UzeBUSlvTLCaRJlSpK
	/f9K0z8tjiqRpt8qCKGEm+tZB+hsv9WdwifmSDpR4zA28OHOUDG5WrQXMWI/+T3sRLNg
	j00kz/nLHpMRPvf9LgOclIxgu6TR0TvxWUNA1wcGWs383GfYXSBvdxjE/joYvu8zI/rz
	iaEyccMrvsVQBPXoNeucc5xJUtwCR4gUACmuajiumGofIaulGfbokNbSwdBt/QhJHBRC
	BQAwoJTN3t9qGTYH8eo8zvXGW1WfeYpzaBpFwqVzFY5TSJgy75RTu5bOrWFsCUZrQDR8
	wYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ye4lVTyhMZ4AayZ1By+U+KwoFKGC9l0SmoLSL365IhQ=;
	b=Taq71kBmcnQNHRIlRBMzpSuMTrd+pvvCVdTuGV83prtlIlfn/hSGO1pvdViVsc6o89
	XtusQ0kEhGOJpA6atu1gtI3hdNHqIm9pjhgM/aowZbvqOrZhZ3JnfNknkjdoqXGaYRMI
	vl8RgNvaJ7x2vmScxCfOLk9IVAq24zIJbb1XFf5ndH/x3X4KEiqTBkd8ltSwZjOd7T08
	DBZ/jWVFNtqx4Le8wjxYEg3LzAKMD5qFLMI05wPB2hPSeq0L8HQuuIsTjGSh1+65MtVn
	NRv2Lig+ZKEzGFGWa6g3TMaao4RXABE7/bBQR7iXtsbzGDNYF7bjQXbOjm2xJLZZKHjM
	iIKQ==
X-Gm-Message-State: AKwxytcm2TB3fiKBcivlvs+sevm1VCc56TtCNr5tPyygTSgA6Eki/sGb
	Mkd59GNyLFynw1y5AHKslUPo4ykjD4czBcNOnIs=
X-Google-Smtp-Source: ACJfBotAtxVwWkWiB1OwIx5SnXT8jG7YCCciGLpAeHg1barXG/mSb2F8SxpnOTvfPEufYf5XX07GRLZ9SO3pKQTn6Mg=
X-Received: by 10.55.203.92 with SMTP id d89mr34596133qkj.218.1515771571724;
	Fri, 12 Jan 2018 07:39:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Fri, 12 Jan 2018 07:39:31 -0800 (PST)
In-Reply-To: <1515528906-6892-1-git-send-email-mark.asselstine@windriver.com>
References: <1515528906-6892-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 12 Jan 2018 10:39:31 -0500
Message-ID: <CADkTA4PTDx-dSP98wwei7+3huDiXPgBBXYNe7tfQqbHc3cHdKQ@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH 01/12] python-weakrefmethod: initial version v1.0.3
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
X-List-Received-Date: Fri, 12 Jan 2018 15:39:33 -0000
Content-Type: text/plain; charset="UTF-8"

All patches merged to m-c-s master.

Bruce

On Tue, Jan 9, 2018 at 3:14 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> Needed by the stable/pike version of neutron.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  .../recipes-devtools/python/python-weakrefmethod_1.0.3.bb      | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-weakrefmethod_1.0.3.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-weakrefmethod_1.0.3.bb b/meta-openstack/recipes-devtools/python/python-weakrefmethod_1.0.3.bb
> new file mode 100644
> index 0000000..f14d3e1
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-weakrefmethod_1.0.3.bb
> @@ -0,0 +1,10 @@
> +DESCRIPTION = "A WeakMethod class for storing bound methods using weak references."
> +HOMEPAGE = "https://github.com/twang817/weakrefmethod"
> +SECTION = "devel/python"
> +LICENSE = "PSF"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=dd98d01d471fac8d8dbdd975229dba03"
> +
> +SRC_URI[md5sum] = "39e7450191dea0b17a646b929784ac6f"
> +SRC_URI[sha256sum] = "37bc1fbb5575acf82172d4eb7b6fc4412d77d5a1d70dff2c1f8a4574301cda66"
> +
> +inherit setuptools pypi
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

