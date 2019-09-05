Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 74B9CE00E1E; Thu,  5 Sep 2019 07:10:18 -0700 (PDT)
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
	*      [209.85.208.173 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
	[209.85.208.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 578FFE00E0D
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Sep 2019 07:10:16 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id 7so2631573ljw.7
	for <meta-virtualization@yoctoproject.org>;
	Thu, 05 Sep 2019 07:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qYUJ3N+Tsr2CYr1lcYssU8qz8OUaWEg9qffMZ60yfM4=;
	b=BDfNMM+j0FMMaB0GXp+gRKixROsCVqGqlWL30T8gni7G4jpLZDaqw7SCOBKPZZr4dB
	abRljA6Yel8Yb/RjXlDVgK1KBFZ+MPIFm7y4tPdKRZktp0vDKbGuQEFBEHSgwEo3BT0E
	jWQxsRbONB8kr7Y0I/lac0JStplHs2YC8ZOvv340wOrG9Dx3XwIbf+gKauRPoFWereoT
	mCfg6xy4BlrUAcmM90FruGGnFU36nmEdHxKjhESw/pvfG4S3HTfDO7IuLFVksXM9Wc70
	S4NpoRH4VXLavSsAsdFkJ+sOl3NE6jf4+9D4Enh59gzMDLvlAPSdRY63OqzkWBSDm+xu
	5fZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qYUJ3N+Tsr2CYr1lcYssU8qz8OUaWEg9qffMZ60yfM4=;
	b=e0shGa5INaypEPSoRC2XOTs5VGpzxv47a+5pBcVnvGrZjqJ0Yer+Fvkfa+h2zhBF5t
	GcKu7IKhUaVa1AMc/hQOVKsv/xFuMILNR+GtVydyhoREZM5WIBmhdLv4aeC+qvFXj0fp
	2uCnWQJM/7Zq2mxJyBaOHko3BKjLFpUGWmJ3KfonwIahLDaQOAvbwmU3+xTzbpd0jW2L
	s+rONPmj7Q+dBMiZjQSZcSP6535d3lNHO9bkyp91tevr6mwRxC0QhvPxei89OEp6NqLS
	XSPz5yuuv3SSCTxHr/KcIUkLmlck/EZYKHb6YPW4vpGumvjKBQZc5TuDRcCKAkhi/JGg
	LaYw==
X-Gm-Message-State: APjAAAUmNaqlSmJxaLhpEGKqoExhRLOTtJw1Q0KSSoIx2bi0KWKla5im
	NisOeKJesBjV/RdWyGLFSczdZ9hK2vltv7HsCDY5jZ9m
X-Google-Smtp-Source: APXvYqy1EgwSpHD31gurr8/jsHCxNDBfknzN3sPA1UQUFDdiOFR3G2yoXcWyXLKvlFEDhpISHCUDL5gRTjuYKKo0W24=
X-Received: by 2002:a2e:b0e2:: with SMTP id h2mr2198826ljl.79.1567692614811;
	Thu, 05 Sep 2019 07:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190905032740.39871-1-yuanc.fnst@cn.fujitsu.com>
In-Reply-To: <20190905032740.39871-1-yuanc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 5 Sep 2019 10:10:03 -0400
Message-ID: <CADkTA4Mc4rpw2K7+sBhFwLuTNwzX3Ez9ghAWHPdcpD8KxKCANQ@mail.gmail.com>
To: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-futurist: upgrade 1.8.1 -> 1.9.0
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
X-List-Received-Date: Thu, 05 Sep 2019 14:10:18 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Wed, Sep 4, 2019 at 11:28 PM Yuan Chao <yuanc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> ---
>  .../{python-futurist_1.8.1.bb => python-futurist_1.9.0.bb}    | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-futurist_1.8.1.bb => python-futurist_1.9.0.bb} (78%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-futurist_1.8.1.bb b/meta-openstack/recipes-devtools/python/python-futurist_1.9.0.bb
> similarity index 78%
> rename from meta-openstack/recipes-devtools/python/python-futurist_1.8.1.bb
> rename to meta-openstack/recipes-devtools/python/python-futurist_1.9.0.bb
> index 0f35c96..06624c1 100644
> --- a/meta-openstack/recipes-devtools/python/python-futurist_1.8.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-futurist_1.9.0.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
>
> -SRC_URI[md5sum] = "3e5a4b8254ded1624ec807cb7ae04ba5"
> -SRC_URI[sha256sum] = "499ee57728a987028725f836ac22aa18899702162fa0a0f1bbe2ecd5c8daf1eb"
> +SRC_URI[md5sum] = "cbfa47202a5724215edc83cc91bdf0ac"
> +SRC_URI[sha256sum] = "0c58c359d0fa09852841efc587870db4c186c7a9175768176f69013c8acd83a6"
>
>  inherit setuptools pypi
>
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



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

