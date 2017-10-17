Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 555E9E00C01; Tue, 17 Oct 2017 10:21:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.216.193 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.193 listed in dnsbl.sorbs.net]
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0B68DE00B83
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Oct 2017 10:21:17 -0700 (PDT)
Received: by mail-qt0-f193.google.com with SMTP id z19so5134304qtg.11
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Oct 2017 10:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CGzhE548Q+Ig6bi/sCn/+uZi/4kK6N5efFgEl+JA7P0=;
	b=RTOAAgQFxgXqP9Q1/TvDCn/6Augk/UchfRy0QdiPvbDcjkePZfJH/r+e/an2Gp9s6W
	oMQjIeqNuWW/T2rPAoeO22n8rIR3+MgEpuu6eq7IeSkXHDJ7ZHn8LBVqxWD2XrSz7tYG
	ozdwiL6se0dA9UGyAhC66efjuitUs3ZRLTFwYAhSb8P0lDHUIP/+NTmrudN7rDCxuMCc
	SqnH/Nm4RG+/MWpF1DtLECeA/y0lrcT5qyEIKyQp0BvX+uIhM7RRwO5SX8H+dLFCIC41
	e5Xt8rb+3je4FZZ7PnhKW0znDNaAtCQDN1CX2RfnFtGVvpbxNdrQwy07eMEtfbjNukpt
	nLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CGzhE548Q+Ig6bi/sCn/+uZi/4kK6N5efFgEl+JA7P0=;
	b=HQjvaPMSjELXRD8+LpSpxxk7nBkejfvdKTl2mLgYFW09/ymePDAirS2Un4lh9SUAKm
	MkMMVzm6WeFbPFyrmqzmQKW3PnCu7w4NNyI0p9mxYEGqodREWXCzYQYqug8tes06u8om
	yVYmftfxSvudLFu6rmuQp1aBgQfISBFAn4ZWPIx/pvS+QYRorLw6jOzc3RQrYKHIxKmj
	k0LczX+5F4Sjo5L0pUwIvncmIdr0W6vqAxoxkXB8goDG5q9XnTy1kwynIqSNEhICWq50
	WXm7LD/uME2l84Gdr1b9L+zHysF8Utl34wfE9KvZY8BLOdjvmxTt8ExJ56pIcUEGpxJl
	Y/bw==
X-Gm-Message-State: AMCzsaVOkSdIE2XjUmvWnMw/xa3kKrH57FgyGBTPs2wb4q6OjNT+NFcK
	m+XkxL8/INWexoQTGn02gFFnk2WTimjcOq1pr4/jbA==
X-Google-Smtp-Source: ABhQp+SLpdE9FqFxLrKwYUeq8cFB8oJPjIhaZVfMxKcgHm/kTKGc99Bobwqljw9GWUY/TBLEWKoJzHwDefV+mllJpKI=
X-Received: by 10.200.36.150 with SMTP id s22mr11985162qts.237.1508260877159; 
	Tue, 17 Oct 2017 10:21:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.215.197 with HTTP; Tue, 17 Oct 2017 10:21:16 -0700 (PDT)
In-Reply-To: <20171017144340.15635-1-cardoe@cardoe.com>
References: <20171017144340.15635-1-cardoe@cardoe.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 17 Oct 2017 13:21:16 -0400
Message-ID: <CADkTA4NMzEGnx5pDPt5mQrDPpsnWcA7aQCCpB+NmTJ6TAnZw=g@mail.gmail.com>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 0/5] pyro backports for Xen
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
X-List-Received-Date: Tue, 17 Oct 2017 17:21:19 -0000
Content-Type: text/plain; charset="UTF-8"

merged to pyro.

Bruce

On Tue, Oct 17, 2017 at 10:43 AM, Doug Goldstein <cardoe@cardoe.com> wrote:
> This backports are for the pyro branch to fix Xen issues identified.
>
> Christopher Clark (5):
>   xen: Package libxendevicemodel, introduced in Xen 4.9
>   xen: Package .pc packageconfig files into dev packages
>   xen: remove STAGING_DIR_HOST from the runtime search path for bios.bin
>   xen: Add menuconfig task and enable menuconfig from devshell
>   xen: Replace 'inherit gettext' with explicit gettext-native dependency
>
>  recipes-extended/xen/xen.inc | 118 +++++++++++++++++++++++++++++++++++++------
>  1 file changed, 102 insertions(+), 16 deletions(-)
>
> --
> 2.13.5
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

