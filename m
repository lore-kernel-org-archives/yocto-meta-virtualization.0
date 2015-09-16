Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2C54BE00D81; Wed, 16 Sep 2015 13:07:56 -0700 (PDT)
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
	*      [209.85.160.180 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f180.google.com (mail-yk0-f180.google.com
	[209.85.160.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A8DB2E00C35
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Sep 2015 13:07:52 -0700 (PDT)
Received: by ykdu9 with SMTP id u9so231687666ykd.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Sep 2015 13:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Ypv7s0zDmNQ1gRhzkvIe6NV95Q8Dprbny7HpC/hgC78=;
	b=JFGpZ4oIFFNBXqQRZaW8bAjScGNrCBIbqSq/Htxpp4kp/CIh57e5XZx/UGSMuLJuh9
	8uKa2PY5A5kPNh4KhFfXqyp1HwlXtokSjQ7+XVuPCIzUnSzcyfRiGRT5s5c8WZY1wN0U
	LYupMN6Qkbivzz1s+42Nabr+0OyT94f0cgv9ve1crZJ+isXl2YcClh6x+Msu62EEY9L2
	bGT3X4O+eu7ioE0V+Bl55BsR9ltqgIInL7LIG32sxJKZ45AiViJhbnq0wbB484iOzcbF
	3e7A5CMIEUohhQ22CRF8NUpzSc/714ejeuTkzdRHw0Qirq9Mhq8H4074dAL+xVTtYnGG
	9yLQ==
MIME-Version: 1.0
X-Received: by 10.13.245.135 with SMTP id e129mr28917365ywf.13.1442434072420; 
	Wed, 16 Sep 2015 13:07:52 -0700 (PDT)
Received: by 10.129.34.212 with HTTP; Wed, 16 Sep 2015 13:07:52 -0700 (PDT)
In-Reply-To: <1442324736-15011-1-git-send-email-mark.asselstine@windriver.com>
References: <1442324736-15011-1-git-send-email-mark.asselstine@windriver.com>
Date: Wed, 16 Sep 2015 16:07:52 -0400
Message-ID: <CADkTA4O7-jZZyGnVSJ1W_jjwJkz+YoxSc3FH0mjfQ07LKFwmPg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH 1/3] dnsmasq: move bbappend to use a wilcard
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
X-List-Received-Date: Wed, 16 Sep 2015 20:07:56 -0000
Content-Type: text/plain; charset=UTF-8

all three patches are now merged.

Bruce

On Tue, Sep 15, 2015 at 9:45 AM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> To facilitate future support and to simplify using meta-cloud-services
> with other branches we prefer to use a wildcard. In making this move
> the content of the bbappend has been audited and most of the content
> is now no longer needed (it is found in dnsmasq.inc for some time now)
> and so we are removing these parts.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  .../dnsmasq/{dnsmasq_2.72.bbappend => dnsmasq_2.%.bbappend}          | 5 -----
>  1 file changed, 5 deletions(-)
>  rename meta-openstack/recipes-support/dnsmasq/{dnsmasq_2.72.bbappend => dnsmasq_2.%.bbappend} (51%)
>
> diff --git a/meta-openstack/recipes-support/dnsmasq/dnsmasq_2.72.bbappend b/meta-openstack/recipes-support/dnsmasq/dnsmasq_2.%.bbappend
> similarity index 51%
> rename from meta-openstack/recipes-support/dnsmasq/dnsmasq_2.72.bbappend
> rename to meta-openstack/recipes-support/dnsmasq/dnsmasq_2.%.bbappend
> index 52eab54..0c979fe 100644
> --- a/meta-openstack/recipes-support/dnsmasq/dnsmasq_2.72.bbappend
> +++ b/meta-openstack/recipes-support/dnsmasq/dnsmasq_2.%.bbappend
> @@ -1,9 +1,4 @@
>  do_install_append() {
> -    cd ${S}/contrib/wrt
> -    oe_runmake
> -
> -    install -m 0755 ${S}/contrib/wrt/dhcp_release ${D}${bindir}
> -
>      # Remove /var/run as it is created on startup
>      rm -rf ${D}${localstatedir}/run
>  }
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

