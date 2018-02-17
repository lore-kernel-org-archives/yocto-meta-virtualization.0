Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4E37EE01086; Sat, 17 Feb 2018 10:01:21 -0800 (PST)
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
	*      [209.85.215.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A5F3BE00EF0
	for <meta-virtualization@yoctoproject.org>;
	Sat, 17 Feb 2018 10:01:20 -0800 (PST)
Received: by mail-lf0-f65.google.com with SMTP id t204so5402656lff.9
	for <meta-virtualization@yoctoproject.org>;
	Sat, 17 Feb 2018 10:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4QZN+9n+3OymK2leFiNyDm42ZLlkYNt457++6G1gh78=;
	b=G+NNftLt6t/dbUlvOYfhgXBWydBKPBtyWvc24MzxeeKo4v5nNQYbPNrtsN869/Fw4W
	fdYf2kOigVhtcBU08bSC+E/xNkLObi/qsjoMtjOMvhGmqbXUlZf1kNeeBTDriWe8AhCr
	/HaJeMKXah96WSAqlrv4rWzPJzAoxE7CWGAA1AH4oswHLydFXJKfz12+uAkzcPHFWjYZ
	vI/+JWmGGqcll29NAiq41IraXDKZFL3pBai1F8CDUoiyMvAmDrXceO9O2dJekUpyKpBF
	YNKYv1n9y5mmNjPNH8SCEzU8CoIVwm/r9ki3gSWaTmBXH/FtMYOicvncZ65nrX7W1GF3
	BC+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4QZN+9n+3OymK2leFiNyDm42ZLlkYNt457++6G1gh78=;
	b=K2A9rrNUa9B5/6Hiyo5YM3C+m/6HUVTMV4CFXsx31OWHr1S6n4AlHynsLrA5S8B8R4
	GAyXZi+Z+yayCup2yyqDRZ0emT/FR5gu+5gpPWP++Z5JDIhWD82jE0OGjkVpHY6fL2S3
	Mmwer84LvSykp3rkkbSakGFQKSY9AceLSGWtL6mDO3ZIAKL2hugaG8wgZDu6xbiaRNAq
	Xk+1u2o3dBEb1ZfsB3apaUzX0n6JE53xQA86ilvDhh3db2jNDdTRbjTtdBaEzqkSUdv8
	kUC9SwHoeS0rGTwg/IS4zKwlzcQFuPNgXWyGyuzPGFPDmHRgC/TwqaREufyeLESjd76P
	E6hA==
X-Gm-Message-State: APf1xPDP3xmOG3HLbkqgz2qElbhD1SQkPBDipHe4TBUsfNvfLnhKsDzB
	+AnEAKUTCkEENOr7PD4t3c0zCdLfCIREd/q+gtg=
X-Google-Smtp-Source: AH8x225UB8VvPAoiLMwtNU7axm/SjXVbTuiP9T2CR1Nk4BXFJwO4zU5aci6RSiTDqJ042Afc6RhHyCI80SaTZzeb4xg=
X-Received: by 10.25.92.1 with SMTP id q1mr6923327lfb.126.1518890479048; Sat,
	17 Feb 2018 10:01:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.48.4 with HTTP; Sat, 17 Feb 2018 10:01:18 -0800 (PST)
In-Reply-To: <20180217165732.37799-1-timothy.t.orling@linux.intel.com>
References: <20180217165732.37799-1-timothy.t.orling@linux.intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 17 Feb 2018 13:01:18 -0500
Message-ID: <CADkTA4NBNpz_A5zx5un1rh=inCTK_cdVmTFemoF8OPuYGiavJg@mail.gmail.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] Drop linux-yocto bbappends for 4.4, 4.9, 4.10
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
X-List-Received-Date: Sat, 17 Feb 2018 18:01:21 -0000
Content-Type: text/plain; charset="UTF-8"

I already have this changed queued. Sorry for not pushing it.

Since I'm the one that deletes the kernels for oe-core, I also delete the
bbappends, but I never get a notification when the kernels actually merge, so
I lag a bit :D

Bruce

On Sat, Feb 17, 2018 at 11:57 AM, Tim Orling
<timothy.t.orling@linux.intel.com> wrote:
> These kernels have been dropped from oe-core, so there
> is nothing to bbappend
>
> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> ---
>  recipes-kernel/linux/linux-yocto_4.10.bbappend | 1 -
>  recipes-kernel/linux/linux-yocto_4.4.bbappend  | 1 -
>  recipes-kernel/linux/linux-yocto_4.9.bbappend  | 1 -
>  3 files changed, 3 deletions(-)
>  delete mode 100644 recipes-kernel/linux/linux-yocto_4.10.bbappend
>  delete mode 100644 recipes-kernel/linux/linux-yocto_4.4.bbappend
>  delete mode 100644 recipes-kernel/linux/linux-yocto_4.9.bbappend
>
> diff --git a/recipes-kernel/linux/linux-yocto_4.10.bbappend b/recipes-kernel/linux/linux-yocto_4.10.bbappend
> deleted file mode 100644
> index 617cacc..0000000
> --- a/recipes-kernel/linux/linux-yocto_4.10.bbappend
> +++ /dev/null
> @@ -1 +0,0 @@
> -require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', '${BPN}_virtualization.inc', '', d)}
> diff --git a/recipes-kernel/linux/linux-yocto_4.4.bbappend b/recipes-kernel/linux/linux-yocto_4.4.bbappend
> deleted file mode 100644
> index 617cacc..0000000
> --- a/recipes-kernel/linux/linux-yocto_4.4.bbappend
> +++ /dev/null
> @@ -1 +0,0 @@
> -require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', '${BPN}_virtualization.inc', '', d)}
> diff --git a/recipes-kernel/linux/linux-yocto_4.9.bbappend b/recipes-kernel/linux/linux-yocto_4.9.bbappend
> deleted file mode 100644
> index 617cacc..0000000
> --- a/recipes-kernel/linux/linux-yocto_4.9.bbappend
> +++ /dev/null
> @@ -1 +0,0 @@
> -require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', '${BPN}_virtualization.inc', '', d)}
> --
> 2.14.3
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

