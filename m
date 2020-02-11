Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.16703.1581455864474296206
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 11 Feb 2020 13:17:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q22qLPCO;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 54B33E01723; Tue, 11 Feb 2020 13:17:44 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,FREEMAIL_REPLY,RCVD_IN_DNSWL_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.208.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  1.0 FREEMAIL_REPLY From and body contain different freemails
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EC3A7E013AE
	for <meta-virtualization@yoctoproject.org>; Tue, 11 Feb 2020 13:17:42 -0800 (PST)
Received: by mail-lj1-f196.google.com with SMTP id x7so13294804ljc.1
        for <meta-virtualization@yoctoproject.org>; Tue, 11 Feb 2020 13:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LH63hRjiaEPnLiQIem/vzHMFX7mDlTZMPwCFhItherY=;
        b=Q22qLPCO6kiFP8uiT5bqWlArHIbmx88rlFH2MACX/E/ksRohwE15zFzT16JjLSFrCX
         srwVDjD2vxz9BYIYxDTZZ+jSOUcQGWRlDK7WzKwoBXamqV11rNIf3id0Jyx2qng92JqU
         mVgsm476JXG6ZKZFOERD3xW3m8YfiuzJxRmZ0IAL1aRzZU+/v8H8Krv7gH+tC8oqZhIL
         iCcLDZfE3GyeBofTx8zzoZ3DaI0Rv4RCcCGRDzWsqWFDkP1ZWZGxE5C2GsQp9IffU+lO
         HOBIfnTY62cVyM9Pru7nFf6TiruUEZIe6Xu5AfmK5k57x7qZAGvgDEsiznDKaQ2Fca7h
         v6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LH63hRjiaEPnLiQIem/vzHMFX7mDlTZMPwCFhItherY=;
        b=PdMzV1EDSc2Ry0mDux9FaQBkjE3e4LEQc8OxBHGySZdvcwSo4zqRel0UX14H0D5fmJ
         5BD4hxllhB0e5ZkNzUtFy512Ri6IxmbnSVkvjOdRJkwnicg0onbYqv1FBca6GO8NryFz
         /+3bTp3sA/bxPT0QyFKd0RnH7bSFdxeVzQBNXM12tf7ER5PBSvS5bFMMyve/y4O4ruDn
         V6VwoF2nMR/Fwr+acrrqJPCq6fjo5dUowPx1RUlH/AZmyrMzyMzTsNg3qz4t7v0Pal9f
         HkUsdb5vyIgpR70mxitDTfak4KOsVXuVQAB4Ec6bf96a+TAkZZ3lkieQN0CoVi9qPXPp
         ANTQ==
X-Gm-Message-State: APjAAAVlDavYi08CZwtM0Gn8A89MNIV+6tANwcZFCvRZ2iHMQbhx4Fj8
	CYfyu8QwED9cLBuOjVjI3rYrid+GnFiH9Gz/Ts0=
X-Google-Smtp-Source: APXvYqz1xepXN4jO0gOfeXjLrqOkwyoMEIG3SZIl4bO7gg4DUkPsuPH/zbSl/sQCNc4iIQGn8WkWvx3bjcui3XkXzzA=
X-Received: by 2002:a2e:3504:: with SMTP id z4mr5525736ljz.273.1581455861968;
 Tue, 11 Feb 2020 13:17:41 -0800 (PST)
MIME-Version: 1.0
References: <20200210050754.3534-1-christopher.w.clark@gmail.com> <20200210050754.3534-20-christopher.w.clark@gmail.com>
In-Reply-To: <20200210050754.3534-20-christopher.w.clark@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 11 Feb 2020 16:17:31 -0500
Message-ID: <CADkTA4Oko4tG+0CkmoexjGzFj2Hg7qVcoh55b46Mp8bcVABnqg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 16/16] xen: add contact to recipe README file
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>, 
	Doug Goldstein <cardoe@gentoo.org>, Rich Persaud <persaur@gmail.com>, 
	Daniel Smith <dpsmith@apertussolutions.com>, Jason Andryuk <jandryuk@gmail.com>, 
	Eric Chanudet <eric.chanudet@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 10, 2020 at 12:08 AM <christopher.w.clark@gmail.com> wrote:
>
> From: Christopher Clark <christopher.w.clark@gmail.com>
>
> Add myself as a contact for the Xen recipes.

We can also consider a MAINTAINERS file for the layer.

Bruce

>
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> ---
>  recipes-extended/xen/README | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-extended/xen/README b/recipes-extended/xen/README
> index 3686530..5592b48 100644
> --- a/recipes-extended/xen/README
> +++ b/recipes-extended/xen/README
> @@ -1,7 +1,9 @@
>  Xen
>  ---
>
> -For any issues with the xen recipes please make sure you CC cardoe@gentoo.org
> +For any issues with the Xen recipes please make sure you CC:
> + christopher.w.clark@gmail.com
> + cardoe@gentoo.org
>
>  configuring the hypervisor
>  --------------------------
> --
> 2.17.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
