Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F0611E00CD6; Sun,  7 Apr 2019 20:12:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.68 listed in list.dnswl.org]
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 82F34E00B77
	for <meta-virtualization@yoctoproject.org>;
	Sun,  7 Apr 2019 20:12:52 -0700 (PDT)
Received: by mail-lf1-f68.google.com with SMTP id u24so1393191lfg.5
	for <meta-virtualization@yoctoproject.org>;
	Sun, 07 Apr 2019 20:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=qQ9KxeyO6e5wmcP5pkHhVz/7qzcOQqr4K+yuLQYMhAk=;
	b=HX2M7Q8DglLna2xnJiNZivFEQ88dUUVandV0W+YQjJfyO76Rfwd7GIHQb2PCpkCuEv
	EJ1A4fNUwrXRdkwGxHX3uqCUMmq/qq2waEA+kANniJqjG00Ro0PEZoo1RM+xGD3iQA25
	uk3l176PxgJqYqWg66fjs3jPvbXTWTyabPva8kdoTfsMJSpIKAS3CjIJXLMWcz9tMzGy
	CjxtTCKGrvHd/YwfhL/id/hbsORiB7pqbWoFJtIWQs3sR1yMgAbK3rKPe13ErzzIGjr3
	pz7ph8yoAAwBz0AERl8i9It0nIMDhmA1H4XpCokIb+pWqav4tdsh3jmcuVnOhY8YZlVO
	9oGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=qQ9KxeyO6e5wmcP5pkHhVz/7qzcOQqr4K+yuLQYMhAk=;
	b=OSvX2hf293/PhuFCYh3o/v3a5DwIVyfeW3XTOrNx4CTM0H/GJDcspY3xdPbOij9rkY
	V/974EDXvu9UaKgZ2OJTbD/Z3fUTVWxAUGKRpykgJX9mZR6h6vncMoGUkdS9rxeGghWm
	+YO+mRFt7FxXYCgugBW90aOncqVEJeIPrO1f1w9IF01FLTgqMmHQFT4jRPUtnzRtHyGO
	xgNZDynHsKFXfNWQfeVtPRu7/Ns0XFGejVPjLkHZ9UIRItR4oXQAKExCFYaOPEmJ2S3b
	KQoTGl4E2lxOWQcTrh7dWjdkr8oZOADfWF7Mb6AT/WEOeOIqaFkdASvs+wpHezYP+gEW
	gJ9A==
X-Gm-Message-State: APjAAAWQLPzFuvnzWRRa96kiNSuK11Q2D+OKyKCoXlxHPEsTRJtxPH7w
	cSzMxsbeMlrHr9XIV0yITbe26RjkhAdwXZbUmtoVZSDf
X-Google-Smtp-Source: APXvYqz9nglgqUeIm1Nr7iibDR4K7NLd+Jcw5Ws3tq4NWR1SpQnPcnxfNGMPBVXKhUB9Qip3gXmvecxxvf2SqdVYC/s=
X-Received: by 2002:a19:e003:: with SMTP id x3mr14294678lfg.66.1554693171379; 
	Sun, 07 Apr 2019 20:12:51 -0700 (PDT)
MIME-Version: 1.0
References: <AM6PR08MB36060562D712E3220B157DDA8F500@AM6PR08MB3606.eurprd08.prod.outlook.com>
In-Reply-To: <AM6PR08MB36060562D712E3220B157DDA8F500@AM6PR08MB3606.eurprd08.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 7 Apr 2019 23:12:40 -0400
Message-ID: <CADkTA4NirbuwMTw-ZpuSqz548qbUMZu-3rqw0Uk6Z8w2kRqQeA@mail.gmail.com>
To: Filipe Rinaldi <Filipe.Rinaldi@arm.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	Sathees Balya <Sathees.Balya@arm.com>
Subject: Re: Issues with 50cdecc sysvinit-inittab_xen.inc: fix hypervisor console
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
X-List-Received-Date: Mon, 08 Apr 2019 03:12:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 4, 2019 at 4:11 PM Filipe Rinaldi <Filipe.Rinaldi@arm.com> wrot=
e:
>
> Hi,
>
>
> With regards commit "50cdecc sysvinit-inittab_xen.inc: fix hypervisor con=
sole"...
>
>
> We are having issues with this patch. When using start_getty (a wrapper t=
o getty) it will first check if the console device is a "serial" device dri=
ver [1]. It then fails because hvc0 is a "system" device, not a "serial" [2=
].
>
>
> [1] https://github.com/openembedded/openembedded-core/blob/master/meta/re=
cipes-core/sysvinit/sysvinit-inittab/start_getty#L11
>
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/drivers/tty/hvc/hvc_console.c#n1036
>
>
> Any thoughts?

Can you confirm that if that check is removed that the console still
functions as expected ?

Rather than bouncing back and forth between fixing one issue, and
creating another, I'm tempted to just bbappend and patch the
problematic check out of the startup. But I'm not currently setup to
test the issue.

Bruce

>
>
> Cheers,
>
> Filipe
>
>
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

