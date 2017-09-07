Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 95C14E00CC9; Thu,  7 Sep 2017 11:33:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.178 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.178 listed in list.dnswl.org]
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 513FDE00CAE
	for <meta-virtualization@yoctoproject.org>;
	Thu,  7 Sep 2017 11:33:45 -0700 (PDT)
Received: by mail-qk0-f178.google.com with SMTP id b23so1331413qkg.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 07 Sep 2017 11:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=L7OM4RB1HccEEVD+q3Q142LTikSoClkngGgXCPesX+s=;
	b=gMcYhYaNHUg7/B542FJ3h6fJVGhWwVUrbBtO5g2BW/mLUMDL6KU5X/sRZ51CzPl8ir
	A1Ji3kdGupMOFswlVAG5alfeyvh4DKgXvxgGSCES8UIeREY717KZp+gou5JVAwUH+Fno
	YQg7SHrF3KYD/oRuRJzID5YJNPDQnfLKeA+nKIQWNqOFULA6ov6RL7FEg1pzsi0Y1dd/
	+OpAfMc/Qko3CYr5BjtdM0/WremRvbcCLf7332NFjzbNbosNc7cMq3LZCgnFHiMruVC9
	U0BQdwqetNqG7iLpQEyIOl3qxpIdw4CSRW1dkzHYhPHeTWr9vwZb4QguTBOaooNk52mJ
	vMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=L7OM4RB1HccEEVD+q3Q142LTikSoClkngGgXCPesX+s=;
	b=exL3jJH2IulEwo6YLU8CpgR8uNSW7vP6HXv/OF6MyQsu7zTAagm2Sx7qrUogpjEP+t
	gwJ4Gc5HGxoDhsvfzf+1omWeAJCThvYFKugYBitvizE3jrw35bQk7gaykX58Vwl18QF1
	ABV/eCoD9ggGw+lQCAjNAOaeMo/v68TZog+eZ+fk+2h8Kj3iZo2/KnUhscM4aUEiEUvP
	XYBRycVyzHhhq+yCvhQB0SKXQqdLmUH4Gt5F0ohEros5HPPTk/AdXClYeMvpwXzusUzo
	NzvS3XA5r+FZ0E+CyPJdYcL1ixr2NDOFMkI04+Dx6m9bLl7I8zqsgk85V2Ys4hYOB7gN
	z9bg==
X-Gm-Message-State: AHPjjUigQrlgcES2asYNSPrZVdLUhKR8yYtN3bx5F261rp7LtP1QVstU
	ynSFvBJf/6Ek42mwpsjESerGOlygMQ==
X-Google-Smtp-Source: AOwi7QBhLcbaswYctJj+nj4yZ5gn2xxE9yO2lnrToeup9P2G+wce333yc8FWznA0xi79Ma1KTDMV4dYp8q8tNak3O7A=
X-Received: by 10.55.39.22 with SMTP id n22mr362701qkn.293.1504809225421; Thu,
	07 Sep 2017 11:33:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.87.75 with HTTP; Thu, 7 Sep 2017 11:33:44 -0700 (PDT)
In-Reply-To: <CAKmqyKNtyw_m9dUBparHqz1x4QcWM3RT2iu13YOhjbwAp6D3-g@mail.gmail.com>
References: <1504739341-28234-1-git-send-email-christopher.w.clark@gmail.com>
	<CAKmqyKNtyw_m9dUBparHqz1x4QcWM3RT2iu13YOhjbwAp6D3-g@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Thu, 7 Sep 2017 11:33:44 -0700
Message-ID: <CACMJ4GYqAcbmHbpsnk+hxJ1cR1_+3U-pm+a=8dc8+_3y0QGdbw@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: nathan.studer@dornerworks.com, meta-virtualization@yoctoproject.org,
	Doug Goldstein <cardoe@gentoo.org>
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
X-List-Received-Date: Thu, 07 Sep 2017 18:33:46 -0000
Content-Type: text/plain; charset="UTF-8"

> I seem to be having mail issues, do you mind CCing me on the patch as well?
>
> Thanks,
> Alistair

patch sent directly -- thanks.
Christopher

