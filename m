Return-Path: <alistair23@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 30C5BE00CC9; Thu,  7 Sep 2017 11:05:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.128.193 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (alistair23[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.128.193 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0AC0EE00CAE
	for <meta-virtualization@yoctoproject.org>;
	Thu,  7 Sep 2017 11:05:38 -0700 (PDT)
Received: by mail-wr0-f193.google.com with SMTP id n64so211048wrb.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 07 Sep 2017 11:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RvOn845iVWMWESsSrTC8KpHAZS3CmNjlkHVBpQUlJHA=;
	b=TaG79RUDcdBF3WDB64HcgDo35ghlFthSpUaLOs6rHSXubwpa4wes0XZliUnzzWw3ab
	KJ1QiW9rWHHXwtUpAz/YmM7VHTx1IzlU9R/dloh3O1fvptk6e4/Xg8LCEzN7vlNRrLUM
	OxeRZrbXAsxorrBeHrTe3iAYdt4X7Cl/Jt3AM5mKpK4J2HxWiT12iDlpasx7CYVmm1cP
	WwADrb57rqG73mKGIGxb5OiBQL2+s5jBgOBrkVuDeIT1f5MMxoiv3fWAV6CovP6JAaGs
	p3pt4+pKNTdJe16HHnJIybTdiZcfDsRBszKsh3+LGtbwNLUm+w5KXEiz6vrVRZ4YzDVM
	Y/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RvOn845iVWMWESsSrTC8KpHAZS3CmNjlkHVBpQUlJHA=;
	b=uQVbHV8mFyMFb4u5nsDehTiYAT/Mtf5+SdjUWF6psA2sCUi7VNlEjh3WlXsQ+K1q01
	HLding3f6Q7icLQndy3WkCCS+rvHHxhKAPbwNAnI+hZCBXHlubbLiWDnGhLN4mVAgyLD
	lB5BGTL99yU3coz0j25Xe9QQ3CG1YXMMAjlnJ+MSI7cUGdwXFtxfH+kJzx4WZXrcjFhN
	u0Nl0qAMyphGLocmL8N/EB4oEbHHHHoN3xCGN8S2M+O6jR2KBvxDlFU8qtGKyqgnnc93
	PRcaxk8UQ6X7VctYdMIEKRr7h+W3Zmgd/nFj51HXIsiCY14bjgVoiezA+Uwb2gMpgHMn
	vkVQ==
X-Gm-Message-State: AHPjjUi/Qw1LpvzEDWxv9iJDGi9aEs4KIpd2x2gXQtfd46m0kmrmLw1y
	vn7AfYKnrw4eifFWb6YuzyZvpuggLQ==
X-Google-Smtp-Source: ADKCNb6AZFVEJBBf+iEdK4SwliLZXW3SLJalSB3x2iMqjUjFKDOmLMcAo9TOMojpTxyXljAGofTN0MsbfDuvmCj+d5g=
X-Received: by 10.223.163.83 with SMTP id d19mr133546wrb.84.1504807537581;
	Thu, 07 Sep 2017 11:05:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Thu, 7 Sep 2017 11:05:06 -0700 (PDT)
In-Reply-To: <1504739341-28234-1-git-send-email-christopher.w.clark@gmail.com>
References: <1504739341-28234-1-git-send-email-christopher.w.clark@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 7 Sep 2017 11:05:06 -0700
Message-ID: <CAKmqyKNtyw_m9dUBparHqz1x4QcWM3RT2iu13YOhjbwAp6D3-g@mail.gmail.com>
To: christopher.w.clark@gmail.com
Cc: nathan.studer@dornerworks.com, meta-virtualization@yoctoproject.org,
	cardoe@gentoo.org
Subject: Re: RFC [PATCH] fix non-x86 xen-guest-image-minimal
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
X-List-Received-Date: Thu, 07 Sep 2017 18:05:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 6, 2017 at 4:09 PM,  <christopher.w.clark@gmail.com> wrote:
> From: Christopher Clark <christopher.w.clark@gmail.com>
>
> This RFC patch aims to fix xen-guest-image-minimal for non-x86 builds,
> whilst preserving compatibility with x86.
>
> x11 package inclusion is optional for both x86 and non-x86.
>
> Re: May 2017 thread:
> "[meta-virtualization] [meta-xilinx] Trying to build xen-guest-image-minimal"
> https://lists.yoctoproject.org/pipermail/meta-virtualization/2017-May/002556.html
>
> Feedback would be appreciated, especially on:
>
> 1) Whether this addresses the needs of meta-xzd, enabling replacement of
>    xzd-domu-image-minimal.bb with a bbappend of this recipe.
>
> 2) The correctness of aspects of the patch:
>
> * It switches to use IMAGE_FEATURES rather than DISTRO_FEATURES for
>   specifying the inclusion of x11 packages in the image; this seems more
>   correct for an image recipe.
>   DISTRO_FEATURES appears to default to x11 enabled, IMAGE_FEATURES does not.
>
> * It introduces a bbappend for xserver-xorg to modify the default
>   Xserver configuration for non-x86 builds where DISTRO_FEATURES
>   includes 'xen', to drop dependencies on egl. In build tests, this has
>   simplified satisfying dependencies for building x11 for domU.
>
> * Compatibility with Xilinx hardware profiles and software layers.
>   I have not verified this. I have build tested x86 with
>   MACHINE=genericx86-64 and ARM with MACHINE=cubietruck, using meta-sunxi.
>
> Thanks for your interest and attention.
>
> Christopher Clark (1):
>   xen-guest-image-minimal: Fix non-x86. Select x11 via IMAGE_FEATURES.

I seem to be having mail issues, do you mind CCing me on the patch as well?

Thanks,
Alistair

>
>  recipes-extended/images/xen-guest-image-minimal.bb    | 16 +++++++++++++---
>  recipes-graphics/xorg-xserver/xserver-xorg_%.bbappend | 14 ++++++++++++++
>  2 files changed, 27 insertions(+), 3 deletions(-)
>  create mode 100644 recipes-graphics/xorg-xserver/xserver-xorg_%.bbappend
>
> --
> 2.7.4
>

