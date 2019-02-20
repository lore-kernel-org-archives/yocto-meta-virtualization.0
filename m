Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4B713E00C1B; Wed, 20 Feb 2019 05:42:52 -0800 (PST)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.194 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DC541E00BB7
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Feb 2019 05:42:50 -0800 (PST)
Received: by mail-lj1-f194.google.com with SMTP id s5-v6so20761194ljd.12
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Feb 2019 05:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cRhw9x1BczzH7EO8qxpfoFSEjBKQMw3Zk7031Bsm+As=;
	b=KQvtotCkYqEQQm8Zj78ruuf6cCQBlBI1xicB46Aae9uJ7gKjR3oL08g3mkFaDh1T0p
	Fxg7zlycCcAhE+W4joeItcIwXJeUQ67LZhDBr8b/ftUeAN7XKqKFeRP82EUvGT3JVIJ5
	JLL+y1++nwsAFky8p+sAl2xBOgX1Wcl1PNT5O2ufXzckl5S0pEDtY70f2/9wp62jKu2W
	0hIIhzisn/DhHgv/HmsQISVmp/P79u4uecrQRA+dwMdDPXWjYcEJXEaAbJ3t6pXHOBg7
	xQz5HdUSh5O/SY+R60TqJT36BP5X/Lz3awmwjM+8xckklg9UiHMRHRt06RN/TGPf22yQ
	WQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cRhw9x1BczzH7EO8qxpfoFSEjBKQMw3Zk7031Bsm+As=;
	b=pcHI1Pd5upSsBZ+qEUiA93fukdATgVT7GTGDwNVG8XqP7L87AIA1hbLMfl33A3pmP6
	8UCnSTJ73sNi4JzX1C8MiU/vpe1uBheXU1d2ZByhFaO4V9AbCe0wkreHBR0aPAX37q+9
	HOaEDOe0Fov+Fi7KdzlGIE3GHsbhldmMtZa2bWwicGmjAU0C3QeSwCJ0MMjwG/ItMFfz
	Gh8IQ70p0ACuuitGxXUm0XlEAtM+lIkdFOdl7qFcKopaADVFgKH2OTI25rcVTdlkP/Dm
	8uEoK1QgcD1vOjDLsNdcpfF9mqmMizsvtsuxADW8jgfFuOgnwwA98jRgPpJxjJQAJ2b8
	W/Zw==
X-Gm-Message-State: AHQUAuZHUMGDhbhdrGHWKZh/ZLWr0OLVmqVriX/qBfN7SVGdg8kjpRAQ
	0GTh8KDdxHrreXmjt7659st4uIX8ou2cvKctqAQ=
X-Google-Smtp-Source: AHgI3IZHFkqhMeHeE4TyQ4IUqvOtocaWCby6goDAR37DBSDTpGSlxFWXDrlh1t0/ApfEMwVNDMbN1yo3kgOG6btu1MI=
X-Received: by 2002:a2e:9b15:: with SMTP id u21mr8994713lji.82.1550670168232; 
	Wed, 20 Feb 2019 05:42:48 -0800 (PST)
MIME-Version: 1.0
References: <20190220130527.5770-1-pascal.bach@siemens.com>
In-Reply-To: <20190220130527.5770-1-pascal.bach@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 20 Feb 2019 08:42:36 -0500
Message-ID: <CADkTA4MP0Wotw0ac+dPns81TBkWZWM9fqgdOULeqsvPAhNj-Hw@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] docker: update 18.09.0 -> 18.09.2
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
X-List-Received-Date: Wed, 20 Feb 2019 13:42:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 20, 2019 at 8:06 AM Pascal Bach <pascal.bach@siemens.com> wrote:
>
> Docker revision is taken from https://github.com/docker/engine/releases/tag/v18.09.2
> and libnetwork is extracted from there.
> I also switched the repo from moby/moby to docker/engine as it makes it easier to find the tags.

In this case, I'm going to stick with moby. The reason that it was
being used was
to keep the linkage between moby and the -ce builds. Since we have various other
components that are sometimes in sync, sometimes out of sync, having that common
repository was important. The point of having the docker-ce and
'docker' split was
that one tracked community, and one only tracks what docker "the
company" was doing.

Bruce

>
> What is odd is that the Copyright year in LICENSE went backwards in this release.
>
> I didn't touch runc and containerd as they are already updated.
>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  recipes-containers/docker/docker-ce_git.bb |  6 +++---
>  recipes-containers/docker/docker_git.bb    | 12 ++++++------
>  2 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
> index 05eac21..5e9f060 100644
> --- a/recipes-containers/docker/docker-ce_git.bb
> +++ b/recipes-containers/docker/docker-ce_git.bb
> @@ -18,8 +18,8 @@ DESCRIPTION = "Linux container runtime \
>   subtle and/or glaring issues. \
>   "
>
> -SRCREV_docker = "6e632f7fc395d15bce46f426086e91c01598cf59"
> -SRCREV_libnetwork = "6da50d1978302f04c3e2089e29112ea24812f05b"
> +SRCREV_docker = "62479626f213818ba5b4565105a05277308587d5"
> +SRCREV_libnetwork = "2cfbf9b1f98162a55829a21cc603c76072a75382"
>  SRC_URI = "\
>         git://github.com/docker/docker-ce.git;branch=18.09;name=docker \
>         git://github.com/docker/libnetwork.git;branch=bump_18.09;name=libnetwork;destsuffix=git/libnetwork \
> @@ -34,7 +34,7 @@ GO_IMPORT = "import"
>
>  S = "${WORKDIR}/git"
>
> -DOCKER_VERSION = "18.09.0-ce"
> +DOCKER_VERSION = "18.09.2-ce"
>  PV = "${DOCKER_VERSION}+git${SRCREV_docker}"
>
>  DEPENDS = " \
> diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
> index 19e773b..5a0e483 100644
> --- a/recipes-containers/docker/docker_git.bb
> +++ b/recipes-containers/docker/docker_git.bb
> @@ -18,11 +18,11 @@ DESCRIPTION = "Linux container runtime \
>   subtle and/or glaring issues. \
>   "
>
> -SRCREV_docker = "489b8eda6674523df8b82a210399b7d2954427d0"
> -SRCREV_libnetwork = "6da50d1978302f04c3e2089e29112ea24812f05b"
> -SRCREV_cli = "51668a30f26250ccfce31bcc13d9334eaafabe36"
> +SRCREV_docker = "eb137ff1765faeb29c2d99025bfd8ed41836dd06"
> +SRCREV_libnetwork = "2cfbf9b1f98162a55829a21cc603c76072a75382"
> +SRCREV_cli = "af2647d55b1dff69f5684f5991b9690fddd75c69"
>  SRC_URI = "\
> -       git://github.com/moby/moby.git;nobranch=1;name=docker \
> +       git://github.com/docker/engine.git;nobranch=1;name=docker \
>         git://github.com/docker/libnetwork.git;branch=bump_18.09;name=libnetwork;destsuffix=git/libnetwork \
>         git://github.com/docker/cli;branch=18.09;name=cli;destsuffix=git/cli \
>         file://docker.init \
> @@ -31,13 +31,13 @@ SRC_URI = "\
>
>  # Apache-2.0 for docker
>  LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=4859e97a9c7780e77972d989f0823f28"
> +LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=9740d093a080530b5c5c6573df9af45a"
>
>  GO_IMPORT = "import"
>
>  S = "${WORKDIR}/git"
>
> -DOCKER_VERSION = "18.09.0"
> +DOCKER_VERSION = "18.09.2"
>  PV = "${DOCKER_VERSION}+git${SRCREV_docker}"
>
>  DEPENDS = " \
> --
> 2.11.0
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

