Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B833BE0093B; Tue, 11 Sep 2018 13:07:07 -0700 (PDT)
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
	*      [209.85.208.171 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
	[209.85.208.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1A899E00566
	for <meta-virtualization@yoctoproject.org>;
	Tue, 11 Sep 2018 13:07:06 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id y17-v6so21864876ljy.8
	for <meta-virtualization@yoctoproject.org>;
	Tue, 11 Sep 2018 13:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nxn14Fgw+zWj9s4o3OoD51y/PDcLLPsZdfpYHXDy2ls=;
	b=uRiAUnxa+fDk4l8780d8TQtOR9tssIol27nE5B2YRQp1PSHYAAnMX1UmuMjpGA1S/o
	8oA3MRpv6SA9xGxtZUj0PMdOPRW5CtyyjidrvKbabrD5YumfymCTgLDQ1Ih1RjofR6vi
	Ege5ucasmnDy8JzysiIHuYOathGRQt9aqTWw0JYMgoIs/yvfmGPW4ZCgH0c+z5rH8tFB
	9PFYyWigJsun4OVD2MbyUSqw7JVJ/aUPwuL9I55Gl/SHdAke+8MBFBKKWwUM0q+AMxrD
	LJFQ2R25xaeMeNt80DjFS7HvcrH1+SFpYo2obS/gN/Ee849QF5lSnpL4wm4HnAG5Rm01
	DMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nxn14Fgw+zWj9s4o3OoD51y/PDcLLPsZdfpYHXDy2ls=;
	b=dd/V76aRLL8Tfz6Eefk7Cpd6TVmXr9Vo/fiQ2mQ7hlALcujwE/FVkn+LaGO2zCxGe5
	PGoW/0/Re2u3ugWMr4WZDiLMbF5WiLHLetLAoiXsaXFzXheluyjCdA79Qdy9TVBdo2Up
	Iiq3egzitfzqRVWYBBSl4cEocRfLLEduP8T7YqELobhwydqQStxnOGc/RlyTM8HzUEyB
	wc2tD+Xd08NM21cHu2zpooPiZsf3krPXSxQKRanFW6ewsAIvPGy/UoncaF4TgOwrL2QU
	9pDRVg2FjteydO60fhF+M73wXCQ9zot2XA580zfON8k9rlL+hd+95IT6mC/NsY1Bnc8M
	rdvQ==
X-Gm-Message-State: APzg51Bm+qGja9IP6/sMkxSRwmrdXlwuW302QLuuvE9Go2To5blkRSba
	tDdPw3djH9ZEo+T/j3mPq09HcivPuh2Pnpwj2w+tXA==
X-Google-Smtp-Source: ANB0VdZq1ozSVdF3PUR3VStZJVVGQ531WIzSwOi/PUzHo2CwKPqIWkyGMPLrdh2lhZsmt98DRY3JKAkBoKRGjsnY9iA=
X-Received: by 2002:a2e:5c07:: with SMTP id
	q7-v6mr16220202ljb.119.1536696425819; 
	Tue, 11 Sep 2018 13:07:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:86c9:0:0:0:0:0 with HTTP; Tue, 11 Sep 2018 13:07:05
	-0700 (PDT)
In-Reply-To: <20180911092917.25868-4-hongl.fnst@cn.fujitsu.com>
References: <20180911092917.25868-1-hongl.fnst@cn.fujitsu.com>
	<20180911092917.25868-4-hongl.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 11 Sep 2018 16:07:05 -0400
Message-ID: <CADkTA4PfHsbBwVLYPqkfwOf-azSH-hkPNVVCYUZtZ5a7DQFqNw@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] [meta-cloud-services][patch]:python-pecan:1.2.1->1.3.2
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
X-List-Received-Date: Tue, 11 Sep 2018 20:07:07 -0000
Content-Type: text/plain; charset="UTF-8"

all patches in this series have been merged.

Bruce

On Tue, Sep 11, 2018 at 5:29 AM, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
> 1.Upgrade python-pecan from 1.2.1 to 1.3.2
>
> 2.Remove python-webob from rdepends.
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-pecan_1.2.1.bb => python-pecan_1.3.2.bb}        | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-pecan_1.2.1.bb => python-pecan_1.3.2.bb} (62%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-pecan_1.2.1.bb b/meta-openstack/recipes-devtools/python/python-pecan_1.3.2.bb
> similarity index 62%
> rename from meta-openstack/recipes-devtools/python/python-pecan_1.2.1.bb
> rename to meta-openstack/recipes-devtools/python/python-pecan_1.3.2.bb
> index 656bb02..0e2a863 100644
> --- a/meta-openstack/recipes-devtools/python/python-pecan_1.2.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-pecan_1.3.2.bb
> @@ -4,13 +4,12 @@ SECTION = "devel/python"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=d846877d24bbb3d7a00a985c90378e8c"
>
> -SRC_URI[md5sum] = "d0ad387dbc77d1803ad3573fe38a4e0a"
> -SRC_URI[sha256sum] = "8d95457b9cedcfda9b467f5cc7dde8cdf72ddba6b402d6a5902843d1b2186c46"
> +SRC_URI[md5sum] = "42bff04c3a90c32d78560fe7921658d4"
> +SRC_URI[sha256sum] = "24f06cf88a488b75f433e62b33c1c97e4575d0cd91eec9eec841a81cecfd6de3"
>
>  inherit setuptools pypi
>
> -RDEPENDS_${PN} = "python-webob \
> -                  python-mako \
> +RDEPENDS_${PN} = "python-mako \
>                    python-webtest \
>                    python-six \
>                    python-logutils \
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

