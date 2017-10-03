Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0E0F7E00D41; Tue,  3 Oct 2017 11:46:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.216.175 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.175 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 53656E00D19
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Oct 2017 11:46:07 -0700 (PDT)
Received: by mail-qt0-f175.google.com with SMTP id v28so5961795qtv.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Oct 2017 11:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=R6Rl3/nm1K3XUoCXfvPeie5NOEoZQzKPwykFG9WNEJA=;
	b=MSJZaZubvdOcigrzuelEioToQDWIVf4RP8bVYjl4gQ93W17R+g13SucjhpnWfXOnzd
	a5N4XdBEYDbPRLpa16z7aI4vQwCjK92P6GCtIVsIAwP6SSlc37F2y2ZybEQtTZsYF/z6
	qKdCTWumRkhyJMhh5HAf4eCSN7jI0PnFghlYUb5LoJhydPOeVunsv2ITNcn5t4d9UN13
	M+RvHRCk5JgwmNd1Gs3LUVVNJan6mzpoQcbHrfJj2+awksJ+xZXpz22qOQNj0n3w4ecy
	DUEBDOccQMX3X4DnaRrGl+KFCDbeW8Uk+R6ne/EyTz/ZoD0ZJ87cJHwse+46J5pqQ/Yo
	I0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=R6Rl3/nm1K3XUoCXfvPeie5NOEoZQzKPwykFG9WNEJA=;
	b=qS5g79dkzKvntXm5mFp58XjwSmogzf+9QwKRVjBaToPH9xTXTKJPdGHWBhDWp+FKxm
	feKrq4sBg5jg606GMji9cBzQ9tdvAqS+/Dj6KShtSaGmenIxzoChe5cyJ811+5loxH2V
	QxJIA40/0gte8vVXuv9k2mDkcqtbtPqWz99tzNzV5ePlDI6Y30r0XvS4zoCcIUbFPf7u
	zIZPEuvFQKQEDve4XLUUD2QjQsBTbKGtFBBKHjbHhLKtR2w9d5PnnWDeCO9ASBGKer7/
	hbP+dCvSoM2UCPz2pnTyOq8DbaSGRh9c+HccxgXgOBmEpygCzCuYbtImHaw5Grv9xWav
	PGJg==
X-Gm-Message-State: AMCzsaW2wYqGsGmvnYZly2gm1Ru2lT+AAYSL9k6mSkCAoQztaI/Myqx/
	N4BPD1WX7NGZI6xhaAG21WvfKwQzprKl5VRAYeg=
X-Google-Smtp-Source: AOwi7QB2YNKt8tYUoCq8yeqjICephK7JleuS/O//lLR+WC0nzS/vLvlcslBIjFgSCoF9jS0Y6bP8SVBOsf65MzwbIwQ=
X-Received: by 10.200.3.150 with SMTP id t22mr25551433qtg.187.1507056367364;
	Tue, 03 Oct 2017 11:46:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.97.101 with HTTP; Tue, 3 Oct 2017 11:46:06 -0700 (PDT)
In-Reply-To: <1fb178e8-d4cd-6125-8d69-7d65ef34e1e6@windriver.com>
References: <1fb178e8-d4cd-6125-8d69-7d65ef34e1e6@windriver.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Tue, 3 Oct 2017 11:46:06 -0700
Message-ID: <CACMJ4Ga021AkYEh56MRb7Ow0Gh6j300XDz5swkzvfr9k=AqhqQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: xen-guest-image-minimal.bb
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
X-List-Received-Date: Tue, 03 Oct 2017 18:46:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 3, 2017 at 8:17 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
> I had a user report to me a problem with this recipe.  They received a parsing
> error, which was due to effectively a recursion issue.
>
> I looked at the recipe and noticed:
>
> # When xf86-video-vesa is not present, add opengl and don't require wayland:
> DISTRO_FEATURES_append = "${@bb.utils.contains('IMAGE_FEATURES', 'x11', \
>                              bb.utils.contains('IMAGE_INSTALL',
> 'xf86-video-vesa', '', ' opengl', d), '', d)}"
> DISTRO_FEATURES_remove = "${@bb.utils.contains('IMAGE_INSTALL',
> 'xf86-video-vesa', '', 'wayland', d)}"
>
> The trigger for the fault the user sent me was this code..  But I question why
> the code is even in the recipe.
>
> DISTRO_FEATURE settings are global, while recipe context is local to that
> recipe.  So those DISTRO_FEATURES (append and remove) are effectively a no-op to
> the rest of the system and would only affect this particular recipe.  I believe
> that is incorrect.
>
> In addition changing the DISTRO_FEATURE based on the IMAGE_FEATURE is incorrect
> -- as often the IMAGE_FEATURES are defined by referencing the DISTRO_FEATURES
> (or MACHINE_FEATURES that reference DISTRO_FEATURES) which gets you into a
> variable recursion problem.
>
>
> The design of the DISTRO_FEATURES is that they must be set in a globally loaded
> configuration file, so they are visible to all recipes/tasks -- otherwise they
> really have no effect.
>
> I'd offer a patch, but I don't understand what is being attempted here.

Thanks for your analysis and guidance on the expectations and
behaviour of the control variables.

That code can be removed.

The motivation for the change that added that code was to have
xen-guest-image-minimal build successfully for both x86 and ARM with
common MACHINEs, in configurations with and without x11 selected to be
in the image.

xf86-video-vesa is only available on x86 builds. The objective of the
lines that are modifying the DISTRO_FEATURES contents was to simplify
/ satisfy the image build requirements for an x11-inclusive image when
xf86-video-vesa is not available.

However, I must have been confused, and I now see no build
difficulties with those lines removed, which fits with your note that
any change to DISTRO_FEATURES would only be visible to that one
recipe.

I'll submit a patch to remove them shortly.

Thanks, and apologies for the error.

Christopher


>
> --Mark
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

