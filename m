Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 483A4E00BED
	for <meta-virtualization@yoctoproject.org>;
	Tue, 15 Apr 2014 16:46:34 -0700 (PDT)
Received: by mail-la0-f44.google.com with SMTP id c6so7555803lan.31
	for <meta-virtualization@yoctoproject.org>;
	Tue, 15 Apr 2014 16:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=2o34/heUq91EKgWPclw/cEn68GpxX19yAqZgnv3Drwg=;
	b=Jw/e/JYB/weGzXjcm3J8kWZT/GJ2UanIc2cagDyyLPm6XSYUhtI1eB4bUimR2WNaCU
	HdlLCKF+swuPeSMZc99tgHnDt9DPFsWKmKmcMsYUTXWoUZeUabyPNC/BVeLvUVrMU2Yl
	7l/8G2K9vagwtNJi2aukF7AVkWYZVYIdREu+U79exhCClSHuh8PZhzpHNqgLRG+tx0Ye
	wnone//ksNEzwyxqvNb6J9OQAe1y06qWFt9djcViAp25mTx2e88fN8ydFRP+1USkLuGi
	IZIoLZZL5x1877WnR77xJEhEmLG7UGJEs59Z3LVE2ikTVgES0WYhBbtnPYADu4d9nqIS
	RFRA==
MIME-Version: 1.0
X-Received: by 10.152.116.43 with SMTP id jt11mr2990086lab.41.1397605592934;
	Tue, 15 Apr 2014 16:46:32 -0700 (PDT)
Received: by 10.112.58.132 with HTTP; Tue, 15 Apr 2014 16:46:32 -0700 (PDT)
In-Reply-To: <1397481980-65447-1-git-send-email-mihaela.sendrea@enea.com>
References: <1397481980-65447-1-git-send-email-mihaela.sendrea@enea.com>
Date: Tue, 15 Apr 2014 19:46:32 -0400
Message-ID: <CADkTA4Nnnn625iyHCQi7gRrpWZbwEtmAJew1w=V-t=FuyLxhMg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mihaela Sendrea <mihaela.sendrea@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 0/2] lxc ptest support and update to version 1.0.1
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
X-List-Received-Date: Tue, 15 Apr 2014 23:46:37 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 14, 2014 at 9:26 AM, Mihaela Sendrea
<mihaela.sendrea@enea.com> wrote:
> Hi,
>
> This patch series adds libvirt to ptest framework and updates to 1.0.1.
> The tests that are using the ubuntu template are not installed, since
> they are not suitable to embedded distros.

Looks fine to me.

merged!

Bruce

>
> Best regards,
> Mihaela Sendrea.
>
> Mihaela Sendrea (2):
>   lxc: Add ptest support
>   lxc: Update version to 1.0.1
>
>  recipes-containers/lxc/files/run-ptest             |  4 +++
>  recipes-containers/lxc/files/runtest.patch         | 32 ++++++++++++++++++++++
>  .../lxc/{lxc_1.0.0.bb => lxc_1.0.1.bb}             | 21 +++++++++++---
>  3 files changed, 53 insertions(+), 4 deletions(-)
>  create mode 100644 recipes-containers/lxc/files/run-ptest
>  create mode 100644 recipes-containers/lxc/files/runtest.patch
>  rename recipes-containers/lxc/{lxc_1.0.0.bb => lxc_1.0.1.bb} (77%)
>
> --
> 1.8.5.3
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

