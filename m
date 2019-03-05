Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5F8C2E0097C; Tue,  5 Mar 2019 08:50:39 -0800 (PST)
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
	*      [209.85.167.68 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C4021E0048C
	for <meta-virtualization@yoctoproject.org>;
	Tue,  5 Mar 2019 08:50:38 -0800 (PST)
Received: by mail-lf1-f68.google.com with SMTP id f16so6680645lfk.12
	for <meta-virtualization@yoctoproject.org>;
	Tue, 05 Mar 2019 08:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=z1Z7tLpg5RVszy1mgWHaXXP+WsdRHcU6J1KbRA1gLNg=;
	b=a6U8t2hvLazn2c3tHoLZ1XGj44s4hUkF+W7wnRVAfoDy+0XV4/VazdFkbWqngBPq6a
	pgrxdXZqLy2T84FZEj15Zx2hZ0Wuqoj7bey3TJWEYPtL6mWJ0kC0bsUIDjMKyKzPmfT5
	ZPGJ577aSJmawcQ2iDFeE0+AKERWPJiwid88BgJAQPxGBxK4I3ABudqh7ydmTo0kMToA
	I2RW17fTFxv8q/ZkHZIiH1SpgFrJljM+F96ECUK+kWJvJwU3YkIqCpYbLVFIrrwHKZr3
	PwurxPVJkAhQsfsnGXzDEPQ78ABpyOZAT8XMPsaaIK8S8u+ZxX3pxqvI+ke4ZvSipqvx
	IrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=z1Z7tLpg5RVszy1mgWHaXXP+WsdRHcU6J1KbRA1gLNg=;
	b=aeWpEjMVpBssmAJYLAMwNnBj7k0moIen8BqPpGpwZEFgQ3oY5JSZSzbl0ni9Q9pzUt
	mN1Ol/eZCP3/60eNlOs8GdKZIiMGKEM4mjFhV6bbyjEJgUJO9CfaPtFk1zFNFjesNh/7
	iM/cx3jxtFPa9mWOb/OG8qck3ZjxKaOgyOw5k8lAtqx1mWR5k+0UDuuZfz51Wu1Y/Kp2
	vZmnZwA0u4ZYT0Dx6FoMi/LEdR2lX6irtBYWnpNPgQ4CvYFFYXp4zckysll0arOcVkx2
	xIOpdfyhDK3WvlfiUUrPpsl2ZLYqGnbBu9/Kp51mRIuTWlblSSDuLveIh36WoIZ+23GA
	UVPQ==
X-Gm-Message-State: APjAAAVMrPNgKYXsLEllppZliUcnkRbizlEP7WTmizJIRnQaTeIuo0HC
	I9QlPFp5MVNCtzW/W1j7XmXpEehx/Ga3eZPUGg/RoQfP
X-Google-Smtp-Source: APXvYqzxC8ZyMsfTjP85OIii0BzMRyJgv8kIb7wKGgMQ8rnhj+EQDP18p95PgJHL6b0DlmAsC0zlk5g/BWUbJZd5870=
X-Received: by 2002:a19:da1a:: with SMTP id r26mr1205667lfg.2.1551804637447;
	Tue, 05 Mar 2019 08:50:37 -0800 (PST)
MIME-Version: 1.0
References: <20190305071814.17006-1-hongzhi.song@windriver.com>
In-Reply-To: <20190305071814.17006-1-hongzhi.song@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 5 Mar 2019 11:50:26 -0500
Message-ID: <CADkTA4OZJzO0ToOjHhP3nHc+2V8t=dO4JHUf6hTE_5vB3tc9gg@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] docker-distribution: uprev to v2.7.1
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
X-List-Received-Date: Tue, 05 Mar 2019 16:50:39 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Tue, Mar 5, 2019 at 2:18 AM Hongzhi.Song <hongzhi.song@windriver.com> wrote:
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  .../docker-distribution/docker-distribution_git.bb          | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
> index 2892556..25e4db9 100644
> --- a/recipes-containers/docker-distribution/docker-distribution_git.bb
> +++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
> @@ -3,14 +3,14 @@ SUMMARY = "The Docker toolset to pack, ship, store, and deliver content"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
>
> -SRCREV_distribution="48294d928ced5dd9b378f7fd7c6f5da3ff3f2c89"
> -SRC_URI = "git://github.com/docker/distribution.git;branch=release/2.6;name=distribution;destsuffix=git/src/github.com/docker/distribution \
> +SRCREV_distribution="2461543d988979529609e8cb6fca9ca190dc48da"
> +SRC_URI = "git://github.com/docker/distribution.git;branch=release/2.7;name=distribution;destsuffix=git/src/github.com/docker/distribution \
>             file://docker-registry.service \
>            "
>
>  PACKAGES =+ "docker-registry"
>
> -PV = "v2.6.2"
> +PV = "v2.7.1"
>  S = "${WORKDIR}/git/src/github.com/docker/distribution"
>
>  GO_IMPORT = "import"
> --
> 2.21.0
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

