Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 645CCE00A53; Wed,  5 Aug 2015 18:14:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.178 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f178.google.com (mail-yk0-f178.google.com
	[209.85.160.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3818EE009D7
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Aug 2015 18:14:36 -0700 (PDT)
Received: by ykeo23 with SMTP id o23so50471165yke.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 05 Aug 2015 18:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Eb2sRh6tBMgR5k3om60yg2+WQUpdn6XT1TQtue5B6Qo=;
	b=R/yA1wUDL3/YunMeBzKySOG6duEqEvSPMIp2d95/aQ+Yw90Q6zAjmLGHvCLMlBl4Ln
	69gBfv4NkyLJrbuotG2Lq8C4epPapaqx6Vw5gjF1vREfm6udXEWUB0rydCpHbrQg1mum
	q+8yITaBX/O9gVzJ+OJ6zGie2WHtNyJ9TTrvou7hPbOgBFSjbNws5Penci4EHanIgKrk
	NzDyqLzLVkdUBo7215ywg664VCyoQbn8jLOHAtzERlwzA2BesjtLMXUohIU8XYQHU2DU
	cPgG9apnOUWI5s4+ziv635+hZnfdb1vd/ljDSSEwBLvUwt1dqV7U+U87wSb36sEdq7OB
	C3YQ==
MIME-Version: 1.0
X-Received: by 10.170.77.5 with SMTP id t5mr12605587ykt.58.1438823676372; Wed,
	05 Aug 2015 18:14:36 -0700 (PDT)
Received: by 10.13.226.203 with HTTP; Wed, 5 Aug 2015 18:14:36 -0700 (PDT)
In-Reply-To: <1438806592-32745-10-git-send-email-mark.asselstine@windriver.com>
References: <1438806592-32745-1-git-send-email-mark.asselstine@windriver.com>
	<1438806592-32745-10-git-send-email-mark.asselstine@windriver.com>
Date: Wed, 5 Aug 2015 21:14:36 -0400
Message-ID: <CADkTA4N6maGASaise+LZakvfhj8zK-UonCko02gQWP8w=vk4wQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [m-c-s][PATCH 09/11] python-oslo.serialization: add pbr to DEPEND
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
X-List-Received-Date: Thu, 06 Aug 2015 01:14:40 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 5, 2015 at 4:29 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> Per the package's setup.py we need to depend on python-pbr. Failing to
> do so results in a build failure:
>     Could not find suitable distribution for Requirement.parse('pbr')
>

My same comment applies. You'll find 15 or 20 packages that depend on
pbr, but that didn't specify it.

We used to get errors if it was specified, since pbr was also coming from
the base python package.

Sounds like this is no longer the case.

Bruce

> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb
> index 451c6b9..7f0fb9c 100644
> --- a/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb
> @@ -19,6 +19,7 @@ inherit setuptools
>
>  DEPENDS += " \
>          python-pip \
> +        python-pbr \
>          "
>
>  # RDEPENDS_default:
> --
> 2.1.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

