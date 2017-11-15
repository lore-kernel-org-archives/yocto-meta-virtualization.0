Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 80418E00CD4; Wed, 15 Nov 2017 11:19:05 -0800 (PST)
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
	*      [209.85.216.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 28E2EE009B4
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 Nov 2017 11:19:02 -0800 (PST)
Received: by mail-qt0-f193.google.com with SMTP id n32so20753973qtb.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 Nov 2017 11:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7JnBM9qBpmRdBuPCAgrWaVxGUFPJzTtLjFPYcnYQfz4=;
	b=Y4BvXm4ded30u6mxinyKFFSGHM+9ygUKu9y75FXN3U+W59Q9+H0mWuIoLOIwiF71QT
	0NAxbsXGaFNFUyx7M5gc+H6KNRXdCHdoHvf3RD8K6zY2FQ9aknr9WaeZOPn4bIMiHuwl
	gKbUBWepWd6xE2IHHCe1DHKxQ2McA/oba5+s6y8SRWRcFeRtQyxuNBJYdlr6Tc4LX+fB
	DIq27fW/3K06GJztfLhPxgD3aLlm3IS/lsqjCbe3lrsTmHRE/mefGesXvJcDyf/0rdgA
	qQ8LFZMqbtVYnRdwmK+yXdUJ5eMv+LTOB5xqCn4TNQnTkB/SMdg1/tOGXFNXZDzbkkLW
	GYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7JnBM9qBpmRdBuPCAgrWaVxGUFPJzTtLjFPYcnYQfz4=;
	b=rjtUOs3rZK9NE3dqpilwRvwnQv3E+9CyjbRZLfMZEnDSQh2KgA2wvfAUu2ktWHvn2l
	kGcXa4UufYQGKlW8Xw2eQtemzz/KGzRMcZwre0vMIVe8dRuy5WI95BOyFiycJfwZedCn
	8KmHs4JJbJWssn9sEM4KPnQxWD83R2D8EFbuQ+d21AgHT3xrkEWEQBQ4rebExDHANl5M
	O2Mzhip/zDr93/Td38FbfNi6tOPsF4lhqvK7Ehv6gHg03Uash37EJAITZRimcbEz+Teb
	B919Pg/M2r+zUgwz3/A0mNfOMY4+yOw4zqe44mG7O7P21eheVYzZJAzI4LZSbbpI6XYd
	R6IA==
X-Gm-Message-State: AJaThX6YRrh/NZaYPoCWqHI9M+r6jnLwamWNB2NrKShPpChA7vIpDUdy
	8MsQt5QxV2pYo/GDbkRJJ1NeiCQXAvE7aGrAekjHww==
X-Google-Smtp-Source: AGs4zMZ4t/4uVI2np03BN8kI/5qD/2vvWt7ge5ShuaL3MH5MNa45DkMD4ms40G4+KbsNhZZtg6VlB7ii0n17iyfTHOQ=
X-Received: by 10.55.121.2 with SMTP id u2mr24972935qkc.19.1510773542243; Wed,
	15 Nov 2017 11:19:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.80 with HTTP; Wed, 15 Nov 2017 11:19:01 -0800 (PST)
In-Reply-To: <1510764261-37283-1-git-send-email-abdur_rehman@mentor.com>
References: <1510764261-37283-1-git-send-email-abdur_rehman@mentor.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 15 Nov 2017 14:19:01 -0500
Message-ID: <CADkTA4PD4=9sDAtYwwE9GoB26YxLhDeGj77r7L_GYBV4ck48WA@mail.gmail.com>
To: Abdur Rehman <abdur_rehman@mentor.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] README: fix a couple of grammatical errors
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
X-List-Received-Date: Wed, 15 Nov 2017 19:19:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 15, 2017 at 11:44 AM, Abdur Rehman <abdur_rehman@mentor.com> wrote:
> Signed-off-by: Abdur Rehman <abdur_rehman@mentor.com>
> ---
>  README | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/README b/README
> index 7d84232..4181f5f 100644
> --- a/README
> +++ b/README
> @@ -23,7 +23,7 @@ variable in your configuration:
>
>    SKIP_META_VIRT_SANITY_CHECK = 1
>
> -Also note that there are kvm and xen specific distro flags/features that depending
> +Also note that there are kvm and xen specific distro flags/features that depend

This isn't any better.

It should probably read:

Also note that there are kvm and xen specific distro flags/features
that, depending on your use case, must be set.

Bruce

>  on your use case.
>
>  Dependencies
> @@ -63,7 +63,7 @@ Send pull requests, patches, comments or questions to meta-virtualization@yoctop
>  Maintainers: Raymond Danks <ray.danks@se-eng.com>
>               Bruce Ashfield <bruce.ashfield@gmail.com>
>
> -When sending single patches, please using something like:
> +When sending single patches, please use something like:
>  $ git send-email -1 --to meta-virtualization@yoctoproject.org --subject-prefix='meta-virtualization][PATCH'
>
>  License
> --
> 2.8.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

