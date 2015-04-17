Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A5B42E009CA; Fri, 17 Apr 2015 05:48:37 -0700 (PDT)
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
	*      [209.85.214.179 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E61E3E009C2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 17 Apr 2015 05:48:34 -0700 (PDT)
Received: by obbfy7 with SMTP id fy7so68156481obb.2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 17 Apr 2015 05:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=fgRf2vwzM4/baz6Xf6b1uoSe99oR77WMgTm3kjPBEdc=;
	b=mSJbBtByYQqnr9YWK4U9B0OdmdcCucVZXe+Mw8K01ATrc+CEIULotH5roqnIH3KO2E
	iY1wh2XP+zm1y5LMMYzd4KTNpXfQbT7/lYe1LScfQ/HP3K0CiiyFXYDS/Rb43hFhnrTO
	VlAsP7lEJa8vKqbkXwCvwmKHelFE6OfjwiOr22E3GfJP0j0ASvL+E72GaaEo70eDR7gi
	/hbn8zjt+jBm+eRPUVZmsHX5KhjKRskaQA7ezBrAU8CBb+CPhsvI7kXiDTPKddXA0BOl
	nty/nHssm9ThfP8D9OHL01QdvMDHB7MrucC9qynwI2Mcc9CmwmBIzC3I+YjTcNzE7WRB
	/uGA==
MIME-Version: 1.0
X-Received: by 10.202.201.3 with SMTP id z3mr2667526oif.130.1429274913811;
	Fri, 17 Apr 2015 05:48:33 -0700 (PDT)
Received: by 10.202.9.193 with HTTP; Fri, 17 Apr 2015 05:48:33 -0700 (PDT)
In-Reply-To: <1429253763-2474-1-git-send-email-jackie.huang@windriver.com>
References: <1429253763-2474-1-git-send-email-jackie.huang@windriver.com>
Date: Fri, 17 Apr 2015 08:48:33 -0400
Message-ID: <CADkTA4PeokH-1st0p13ZQz6gtDw81VE5B8kVjvBQY95afiH7cw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Huang, Jie (Jackie)" <jackie.huang@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] package_regex_openstack: fix for openstack core components
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
X-List-Received-Date: Fri, 17 Apr 2015 12:48:37 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 17, 2015 at 2:56 AM,  <jackie.huang@windriver.com> wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> The bitbake git fetcher ignores non-released branches/tags
> like beta and rc, but we may want to update the openstack
> milestones like 2015.1.0.b2, add the GITTAGREGEX_BETA to
> allow this.

Thanks Jackie.

merged

Bruce

>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../conf/distro/include/package_regex_openstack.inc           | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/meta-openstack/conf/distro/include/package_regex_openstack.inc b/meta-openstack/conf/distro/include/package_regex_openstack.inc
> index b72b2d1..6afe5ea 100644
> --- a/meta-openstack/conf/distro/include/package_regex_openstack.inc
> +++ b/meta-openstack/conf/distro/include/package_regex_openstack.inc
> @@ -40,3 +40,14 @@ GITTAGREGEX_pn-python-glanceclient = "${GITTAGREGEX_COMMON}"
>  GITTAGREGEX_pn-python-keystoneclient = "${GITTAGREGEX_COMMON}"
>  GITTAGREGEX_pn-python-neutronclient = "(?P<pver>\d+\.\d+\.(\d\.?)+)"
>  GITTAGREGEX_pn-python-novaclient = "${GITTAGREGEX_COMMON}"
> +
> +GITTAGREGEX_BETA = "(?P<pver>\d+\.\d+(\.\d+(b\d)?)?)"
> +GITTAGREGEX_pn-python-barbican = "${GITTAGREGEX_BETA}"
> +GITTAGREGEX_pn-python-ceilometer = "${GITTAGREGEX_BETA}"
> +GITTAGREGEX_pn-python-cinder = "${GITTAGREGEX_BETA}"
> +GITTAGREGEX_pn-python-glance = "${GITTAGREGEX_BETA}"
> +GITTAGREGEX_pn-python-heat = "${GITTAGREGEX_BETA}"
> +GITTAGREGEX_pn-python-horizon = "${GITTAGREGEX_BETA}"
> +GITTAGREGEX_pn-python-keystone = "${GITTAGREGEX_BETA}"
> +GITTAGREGEX_pn-python-neutron = "${GITTAGREGEX_BETA}"
> +GITTAGREGEX_pn-python-nova = "${GITTAGREGEX_BETA}"
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

