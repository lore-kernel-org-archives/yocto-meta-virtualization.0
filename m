Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C0F9AE009D7; Wed,  5 Aug 2015 18:11:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.176 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 57E5DE009D7
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Aug 2015 18:11:35 -0700 (PDT)
Received: by ykoo205 with SMTP id o205so50649532yko.0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 05 Aug 2015 18:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=XDl3C1k8SzBvNu3TDAGrJ8mWsUzMlAZE7KfWAtkin+s=;
	b=nPKzC0uZvGWYculcXP9T3SzD3ctNn9oCrXxcaXsHa7dG7g3HYdLRnggEAn9MTVrLyj
	vEFbkib7h9kiEPdAZExG1a2j9J1eevUTVmw/thcj3RaiDuha0NO+od3O/yLEdp2Eqzbk
	5EAOc1MergdKBg3vT8xUznCfTSZOnqK6UyxOZB+d09VomEhnJQr+hvdMS0FIVwyBW4Dg
	ISchZ5Yq9njZkejWfQIkAM4RKwDntgjDRvrZE04KkSsNK3xExcxd6+/Gp033FhlpGaFk
	NriTMJ7ifs/slTt90v9KksZUU3pc36TnYIOP/lDxHb977wcZDbic1Ou/knl1S/IcAdN9
	8baQ==
MIME-Version: 1.0
X-Received: by 10.170.135.74 with SMTP id b71mr11985603ykc.16.1438823495224;
	Wed, 05 Aug 2015 18:11:35 -0700 (PDT)
Received: by 10.13.226.203 with HTTP; Wed, 5 Aug 2015 18:11:35 -0700 (PDT)
In-Reply-To: <1438806592-32745-7-git-send-email-mark.asselstine@windriver.com>
References: <1438806592-32745-1-git-send-email-mark.asselstine@windriver.com>
	<1438806592-32745-7-git-send-email-mark.asselstine@windriver.com>
Date: Wed, 5 Aug 2015 21:11:35 -0400
Message-ID: <CADkTA4PzxM+HhWn-_55Gdcecn=+54fiySVFCe7=pyZjEbE_fKg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [m-c-s][PATCH 06/11] python-testtools: fix build error
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
X-List-Received-Date: Thu, 06 Aug 2015 01:11:41 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 5, 2015 at 4:29 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> Ran in to a build error:
> distutils.errors.DistutilsError: Could not find suitable distribution for Requirement.parse('pbr')
> ERROR: python setup.py build execution failed.
>
> Fix by DEPENDing on python-pbr.
>

This used to be on purpose. If you added python-pbr to DEPENDS the images
would fail to assemble due to QA errors and overlapping files.

If you say that you've successfully assembled and booted the images and pbr
isn't acting up, I'll merge this .. but otherwise, I'm eyeing the
change for more
testing.

Bruce

> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  meta-openstack/recipes-devtools/python/python-testtools_1.8.0.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-testtools_1.8.0.bb b/meta-openstack/recipes-devtools/python/python-testtools_1.8.0.bb
> index 80a7489..a58c91a 100644
> --- a/meta-openstack/recipes-devtools/python/python-testtools_1.8.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-testtools_1.8.0.bb
> @@ -17,4 +17,8 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
>
>  inherit setuptools
>
> +DEPENDS += " \
> +    python-pbr \
> +"
> +
>  RDEPENDS_${PN} += "python-extras"
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

