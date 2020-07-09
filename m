Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.3446.1594262788773908833
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Jul 2020 19:46:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=feemXy9k;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 47B1FE01E2F; Wed,  8 Jul 2020 19:46:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,URIBL_RED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.208.67 listed in list.dnswl.org]
	*  0.0 URIBL_RED Contains an URL listed in the URIBL redlist
	*      [URIs: yoctoproject.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 02427E01E2D
	for <meta-virtualization@yoctoproject.org>; Wed,  8 Jul 2020 19:46:26 -0700 (PDT)
Received: by mail-ed1-f67.google.com with SMTP id h28so627157edz.0
        for <meta-virtualization@yoctoproject.org>; Wed, 08 Jul 2020 19:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PCH7phxvVWewJsbifpUNl35T/9BWXggXN3AGLDxAKu0=;
        b=feemXy9kyeqrrxSCAnZQW6X4bO0JCALY4dyt3yUfPxWrRNJPo1U/o74lihHa9A2hib
         0jXSvcLYJY42jRjDBpMQHLdSAbyKyqg3HR0gYZvIPJwUEwBe1myMo1n/RxbnYhOvcqvc
         kzQMqnFGnEqva+yJElKSLQkZCjP2hf4vBBXVeF+nOtu1pZv7lk76zSy3kIGjsw4jMt1x
         oAS6edrrYHVZ8YpS8flclBP85Fa06NOel2ngCsT1EMTXBok2TckaIi7wKRWr2bJzlGhg
         oVc+W3mRNo68TJ2D3Hw2VDCFT8V9ZYCJ8HjHAxfjNVF8nvggsNJNdmja5apbnAiZt+PD
         a3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PCH7phxvVWewJsbifpUNl35T/9BWXggXN3AGLDxAKu0=;
        b=UFmptB591SXgMx4BT3bK2/8jD7poTZtRseFUB2/o6WGBZwvVvnnOjuF5IzdJvOLt8V
         S66Fs69T3gYZPjHmpEsf6v019VxR1chzNnbRXKGfoakZ0MDxY+f31p1AcLXjXZ+sZdZZ
         2eBy8vbLAEvSQJ0XchRvBncW2ynAh7XJFfqk5FxxplJJOK4RM6LJWdUYL8a0hz2552vY
         WyrSHwSAtmytFUhKzn5dB0GkrX8NAd2158zH/I5O8V9bhIThkzPpKRyeKBghwr4guhcx
         DKiOtNUbk/w0SESN7QDPmCjMjyBe4ghMm8xLU4p+ZALVZ6dTq7VSZOAXXDSANqCD9Uvc
         AVqw==
X-Gm-Message-State: AOAM531r07GxWuvgUfzMMZxumciKVdU+vOOzY2+3qlgXs4E9jf187k4I
	RlLk6VlYSlJuFHhLwXSdfxKJVn2uC+6560XSCw0=
X-Google-Smtp-Source: ABdhPJyJxMErYevB7oQOUXPFNkvrQX5zJWPIXQKC5OmGuL5xfcbADjoJ4LTJbvh+4ZSMQzjJ+edCjWW3RagPgDJNBv8=
X-Received: by 2002:aa7:d6cf:: with SMTP id x15mr68256156edr.164.1594262785535;
 Wed, 08 Jul 2020 19:46:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200707021850.9841-1-christopher.w.clark@gmail.com>
In-Reply-To: <20200707021850.9841-1-christopher.w.clark@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 8 Jul 2020 22:46:14 -0400
Message-ID: <CADkTA4PPwqC6yjDAtWQ5jt-_dTAMh=dYHWwHPZrOgEMgzAaPew@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 0/2] xen, xen-tools: patch and recipe fixes
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>, 
	Doug Goldstein <cardoe@gentoo.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	Corey Minyard <cminyard@mvista.com>, 
	Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 6, 2020 at 10:19 PM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> These two patches are to be applied on top of v2 of the previously-posted
> "Xen on Raspberry Pi 4" series:
> https://lists.yoctoproject.org/g/meta-virtualization/message/5495
>
> The first patch in this additional series here applies a new upstream
> patch to a fix a previous patch that has been imported from upstream,
> and the second is a minor recipe fix.

merged.

Bruce

>
> Christopher Clark (2):
>   xen-tools: apply kdd tool patch
>   xen, xen-tools: configure: install defconfig to ${S} not ${B}
>
>  ...xen-build-temporarily-inhibit-Werror.patch | 12 ------
>  .../files/xen-tools-kdd-fix-build-again.patch | 39 +++++++++++++++++++
>  recipes-extended/xen/xen-tools_git.bb         |  1 +
>  recipes-extended/xen/xen.inc                  |  2 +-
>  4 files changed, 41 insertions(+), 13 deletions(-)
>  create mode 100644 recipes-extended/xen/files/xen-tools-kdd-fix-build-again.patch
>
> --
> 2.17.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
