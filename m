Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E4009E00A4F; Wed, 19 Sep 2018 01:00:00 -0700 (PDT)
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
	*      [209.85.167.43 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
	[209.85.167.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 57826E0095C
	for <meta-virtualization@yoctoproject.org>;
	Wed, 19 Sep 2018 01:00:00 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id x20-v6so4298245lfg.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 19 Sep 2018 01:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gnS2Wl/ViJuBT9G9mSuPNAMqDcPHO7GmKSvhDR8tFUw=;
	b=UA3vmIj/T/xeAbsf30elyVwEOxOWq+vOCnpwrtuFoGlAYZfO5b1JplxxSip8ulWoqI
	mJ+Dhm3O58zIYGV/HTu0bog99QEXGh5jSz1p4FtTrOqD62HzFD/4RlR4J6AAGMYJ03pw
	wfBa0MaxwchAgzXelhJMRzjiItD9R43R3FUOS54N04Xgw+cYxQuvOJvZnx4NMdGB+jhD
	+EeOT3LZFFDZKjZMLb7NgHGbTK4yj4vOh1UR+RYYyEyC5N0U6amydL56WThwQ8aRSmSD
	FO7FzpsGDKr/YmeHoRhxIgi1Tg3N/s+FL53+6XvNrQrA9/O3uOz3yi5mk1XStDRWD7mb
	rSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gnS2Wl/ViJuBT9G9mSuPNAMqDcPHO7GmKSvhDR8tFUw=;
	b=nK51d3QReg2UEOqtTC1BTEIlkLbWOibiRpTsP63g0usaYYgXy+kw9kezivccmzpBrO
	Z1DXOHstcCLDiGTb16DcAWw6ifzkd+HzxKXebeS0grkaTEOd+laH2dKMBRQtAuKW/Ynh
	4nsmXxEG/90GPSrmUxEWFELnjAsWVz0e0W3hkkXLIyEXgZqe2dqVA3/RcF88yuTk5kRN
	GoAbt64dkYcqdy/fx/yClkKQyx4hDcP7mmA13e4p/Hzs83QVI1uMJS1L175hBZSmiXbO
	gnNzQ99s6+3AzwL4SxN6bPPEd1KAh0yelXu2m0pAFaWNB+Yp+J2KdjU2pGrGVgvBShnQ
	LDWw==
X-Gm-Message-State: APzg51AmGCD20unxAXj7uucEF5UD4Q69YS5JdXxR29zZGwkLAdbhPl4P
	JLoOTcs+Jn5J8yoeb3Yy6gPv/MUdDdt+J6Rsp7nYWQ==
X-Google-Smtp-Source: ANB0VdZQ9B5ckEr3PT8S1SZ54VomjI7yKmqRbgcQ4l5yuyTUlr+HZYNOqhvijo48LehOraw034q/u8nbtoGHuIJvYmI=
X-Received: by 2002:a19:2d16:: with SMTP id
	k22-v6mr23234051lfj.67.1537343999156; 
	Wed, 19 Sep 2018 00:59:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:86c9:0:0:0:0:0 with HTTP; Wed, 19 Sep 2018 00:59:58
	-0700 (PDT)
In-Reply-To: <20180918093631.1253-2-hongl.fnst@cn.fujitsu.com>
References: <20180918093631.1253-1-hongl.fnst@cn.fujitsu.com>
	<20180918093631.1253-2-hongl.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 19 Sep 2018 03:59:58 -0400
Message-ID: <CADkTA4NfTd=Rq1YHjvVO8pN0Mf2d4uMosMnO3AsCt7DfSahqLg@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] [meta-cloud-services][patch]:python-stevedore:1.28.0 -> 1.29.0
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
X-List-Received-Date: Wed, 19 Sep 2018 08:00:00 -0000
Content-Type: text/plain; charset="UTF-8"

merged

On Tue, Sep 18, 2018 at 5:36 AM, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
> Upgrade python-stevedore from 1.28.0 to 1.29.0
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-stevedore_1.28.0.bb => python-stevedore_1.29.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-stevedore_1.28.0.bb => python-stevedore_1.29.0.bb} (75%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-stevedore_1.28.0.bb b/meta-openstack/recipes-devtools/python/python-stevedore_1.29.0.bb
> similarity index 75%
> rename from meta-openstack/recipes-devtools/python/python-stevedore_1.28.0.bb
> rename to meta-openstack/recipes-devtools/python/python-stevedore_1.29.0.bb
> index 789d76b..4b02f03 100644
> --- a/meta-openstack/recipes-devtools/python/python-stevedore_1.28.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-stevedore_1.29.0.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>
> -SRC_URI[md5sum] = "b736a71431a2ff5831bbff4a6ccec0c1"
> -SRC_URI[sha256sum] = "f1c7518e7b160336040fee272174f1f7b29a46febb3632502a8f2055f973d60b"
> +SRC_URI[md5sum] = "525186cba577852e0408c92c3f8fac65"
> +SRC_URI[sha256sum] = "1e153545aca7a6a49d8337acca4f41c212fbfa60bf864ecd056df0cafb9627e8"
>
>  inherit setuptools rmargparse pypi
>
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

