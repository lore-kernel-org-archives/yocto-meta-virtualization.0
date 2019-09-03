Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 47794E00BF8; Tue,  3 Sep 2019 13:45:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.210.68 listed in list.dnswl.org]
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AEC32E0098A
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Sep 2019 13:45:41 -0700 (PDT)
Received: by mail-ot1-f68.google.com with SMTP id y39so8275003ota.7
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Sep 2019 13:45:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
	:from:date:message-id:subject:to:cc;
	bh=o55Y1xlE5gwTX8gGKBe1HwYLC8U7zAhrpAqSJMNc06M=;
	b=j5N38QD8UFn7cOG9QRJUWsOMObA6fY+rUnfVzvSa+eppVzC9fO+uX6ZmEb36SGM5Pi
	eT3XE2nnWILPDmnWrkkIv4uKHGySF1MqHujKaylqVatUcj/1qe8Adf7wUBwypqC6X+bH
	+Yuhvhq4M4OGwJWPaDQakn7YKwWetLsXXUSaS71FHx6c1rm8eKiaix7BT396dJ8ibLx+
	wlRJdiMKPsmpEmExmTPjYtlMRHPLH6iTiqNsmhbJGxCs1dOk//RYsangfNSKiu+m2LYV
	PPU/PG6HBZYe/I7GHVceqyl9uLJVqf0csqmjfygcPXeOjTXHgN9mL02PVYC9AvEjj3I5
	U5Fg==
X-Gm-Message-State: APjAAAWHHD6CsbrsD6ikJVyS35fUHp9qEviyaXwqSTOUwTV7vrq1DCnS
	HrBDZmbq8o8oGNidO97tfw3Z6Tet4YZnHTkoldlP1Q==
X-Google-Smtp-Source: APXvYqwdU5z90RVuc/rqAhOICtosY50CLIoRca6oKqwygH2azoK07QUt9lslsTOXLD0LkgYRm6ULPzDLxF+jYUjzL/E=
X-Received: by 2002:a05:6830:184:: with SMTP id
	q4mr14074438ota.128.1567543540992; 
	Tue, 03 Sep 2019 13:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <1567425189-118862-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1567425189-118862-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Tue, 3 Sep 2019 16:45:30 -0400
Message-ID: <CAPuovELN1S+uxOTkdaE=-SohXru1fAdcN1hstGhriTHoTNVb6g@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-glanceclient: upgrade 2.8.0 -> 2.16.0
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Sep 2019 20:45:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 2, 2019 at 7:53 AM Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../python/python-glanceclient_git.bb          | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb b/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb
> index 00ea2ab..e828cba 100644
> --- a/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb
> @@ -3,22 +3,20 @@ HOMEPAGE = "https://github.com/openstack/python-glanceclient"
>  SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
> +SRC_URI = "git://github.com/openstack/python-glanceclient.git \
> +           file://glance-api-check.sh \
> +        "
> +
> +PV = "2.16.0+git${SRCPV}"
> +SRCREV = "44a4dbd6ce2642daeaca9f45ac99e2d1b39e805a"
> +S = "${WORKDIR}/git"
> +
>  DEPENDS += " \
>          gmp \
>          python-pip \
>          python-pbr \
>          "
>
> -SRCREV = "13b25ff1fed908cfe7b4e719a97efd7121e3be96"
> -PV = "2.8.0+git${SRCPV}"
> -
> -SRC_URI = "\
> -       git://github.com/openstack/${BPN}.git;branch=stable/pike \
> -       file://glance-api-check.sh \
> -       "
> -
> -S = "${WORKDIR}/git"

What's with the extra churn here? Was the moving around of lines
deliberate, if so it needs to be covered in the long log. If not you
should avoid this as it is similar to mixing real changes and non-real
changes, it only serves to make the review more difficult.

MarkA

> -
>  inherit setuptools monitor rmargparse
>
>  FILES_${PN} += "${datadir}/${SRCNAME}"
> --
> 2.17.1
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

