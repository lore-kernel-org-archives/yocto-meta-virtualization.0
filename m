Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 03E23E00DD1; Thu, 18 Jan 2018 07:46:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.216.172 listed in list.dnswl.org]
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B5812E00CF7
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Jan 2018 07:46:34 -0800 (PST)
Received: by mail-qt0-f172.google.com with SMTP id m59so31257711qte.11
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Jan 2018 07:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=M+NU1rXq3+YN4GzrNQyrmwYokZn3E0UAplp8KCfZPZM=;
	b=m5oyJ5jtEfVmBM4pWj6+eCGOManv9TeC8+bso/WgwRauksEzQ7wUWw41BYUBw9CBGL
	MbdjETYlN1WANL2omY87TfwzCbE+ghk7/BWALVXnwVqiVc6rXTDqnLRoC2ohpgcv8WD/
	mH3eCUa93OOGt1pPEbLO8WtmOaWvvDpERprcMa96qs1fVoBh7Dy6oCzi7wKfDOuINa55
	nvWrGQYUFeZZCif92eCC8x9tJlntNO+pkgmPKm4P5e90FeWn1Maf1kRmjVb2MP+DKrQn
	avFZCzQJXZdmlj17zIc+mHMe2fubA8GMIBDol427CdTrwUmiHd2FAa+SfVkbQZ10aGg0
	i+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=M+NU1rXq3+YN4GzrNQyrmwYokZn3E0UAplp8KCfZPZM=;
	b=T/M7udynC07JsSApglMfB/IIu/U3CdjdUm+S2W3LX5RilmTmJ+iQU2N4QbmnmCqbRz
	KxggkFhN52CBpfmvB6mNZGnag9k+3Am6EJwsX8C94fBWBulJLr1bCEU3FSnQb2sVlHHp
	e48gj45wHiPeOARStbFahQDuym3AyJ1D4+GaMfDEiyNLY8vsMOo7aLPCTr+bHjsQfhmL
	TEMk38wR8syO+Gxs7c/zVD68hmiNPyBcCiBqF8SMa/JpJDG5DQvgLzZvb3YrPRLvCCk4
	RZTowAH4DXyn+RbhfP81zfg1LfvyOHyp5RwqyYtgI0eaXEauF7mtGxxddnyQhlwFp3z6
	9MXA==
X-Gm-Message-State: AKwxytcTpqoBRS9ODgf+vebUrfH7oRIsWsIBEytQZNkt7RUpNSpD6dtZ
	TRRoE/IztotLyXIIhKxNUaD/KzHN0CuguqBii4YYuw==
X-Google-Smtp-Source: ACJfBov5zX3raInqJa8KbuVWpE3DiN71W3/WkIV4jApRQV30Pp4uvvbevpkuurKiTzFmGiSk+b354msxgcS05WLF2ao=
X-Received: by 10.55.129.134 with SMTP id c128mr23570632qkd.265.1516290393603; 
	Thu, 18 Jan 2018 07:46:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.82 with HTTP; Thu, 18 Jan 2018 07:46:32 -0800 (PST)
In-Reply-To: <ec90fa09-7fca-7ca8-f158-23a80bf6c388@debevv.com>
References: <9e2f6fe9-5114-7f66-8137-24d45ee9a9b9@debevv.com>
	<d1fd3195-0da5-f09b-b8b9-220bfdc01a4c@debevv.com>
	<ec90fa09-7fca-7ca8-f158-23a80bf6c388@debevv.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 18 Jan 2018 10:46:32 -0500
Message-ID: <CADkTA4OT4i0gzDJif9BqQ6ieHNFgqoY0jFwLqFTCij6COEoTxw@mail.gmail.com>
To: Valerio De Benedetto <valerio@debevv.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] Add python3-terminal RDEPENDS to docker-compose
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
X-List-Received-Date: Thu, 18 Jan 2018 15:46:36 -0000
Content-Type: text/plain; charset="UTF-8"

Patches should be sent inline (preferably via git send-email), but this one
was simple enough, so I've grabbed it and merged it to rocko and master.

Bruce

On Tue, Jan 16, 2018 at 11:46 AM, Valerio De Benedetto
<valerio@debevv.com> wrote:
> The dependency docker-compose is missing for module tty is python3-terminal,
> this patch adds it to recipe RDEPENDS.
> (running docker-compose on the target system was failing with "ImportError:
> No module named 'tty'")
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

