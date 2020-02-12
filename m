Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.19171.1581465888150006773
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 11 Feb 2020 16:04:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=igPMEB5T;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 083BCE0167E; Tue, 11 Feb 2020 16:04:48 -0800 (PST)
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
	*      [209.85.208.66 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  1.0 FREEMAIL_REPLY From and body contain different freemails
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ACFA4E007EE
	for <meta-virtualization@yoctoproject.org>; Tue, 11 Feb 2020 16:04:46 -0800 (PST)
Received: by mail-ed1-f66.google.com with SMTP id c26so240384eds.8
        for <meta-virtualization@yoctoproject.org>; Tue, 11 Feb 2020 16:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H6jbcQizvl3qOYUGM+0CyF2Iz1k0IT67K6gFmFmlcFM=;
        b=igPMEB5T9/qTbDbTtbINjupHv0tplAG6wNyRvtQPQvESWaY500n5jnSN2Srf0l1kFQ
         0SPamzbqAYmhB6R+YoM9Fdsy1IoG88fRYet1QKfzjAncWoll2LSqDp7Yu0jmGPwdfcXK
         N9YEq+sHP6+w1vSqbENDt19FaQXswy8huKN5G3NWBfgMS6Z44VYuVL8AJVWF1KSywowo
         4juj8Gr5tBbMFsGF0QIWDQNwyhmMeh8JWgWLm9YGn9UtoEc3OPFvtcMyGEEBaRUgGQPv
         yicOqtoxibjXKcxmowdNiflPPsnNhPq81+2oamoYske1DZcP/QAXVh6ygUQ3s2kmeeyu
         z0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H6jbcQizvl3qOYUGM+0CyF2Iz1k0IT67K6gFmFmlcFM=;
        b=FeBk+kPn/Et9QpRZDaDuz7IG4WjgYj0x3rbivX6xw03jVHE0Xd6Qh4CPitKWwQ+vvH
         w25qYR+Jh00/XjvkkusGX1Kwa/zy4jo3wZb6bF/K2Pj258VGHnviIKHePEjw/IGVETwx
         qeR1UlYR+u6XUrIfItQzbnbGPpK1Ep4Do4H6ifpcEsI3TKqSvhrWDk3zkfAaD06ajcFt
         TchyhcSA3AJBizxzaOuK7SUwtw4/ckAzcTocN7wlq7e2yXTaEH6mtpuKEWvRESgbbnbR
         3MarHPe1nwlyMgIZN7HFW7Y1RBunhPrzRJRoOp2d8eXahRI/1Y00vS3A5CJd2m52LGuM
         mbmQ==
X-Gm-Message-State: APjAAAUmSS/jZRA3i0E+BtFTUxEijJZGqu9n56ZjsnJ+piS0Y3nNSEBQ
	nI/W2eYA3w1frQz84mE3/PxZQYYen0D70KfFXnU=
X-Google-Smtp-Source: APXvYqxTlA79STOhOTrePeAJh9U+qrniNUE9qEwEMn0KeuGdJ59NCYhbaflK9l2FxFsFp4UqQ0NeEEWVE8mQJFHlrLA=
X-Received: by 2002:a17:906:4bd1:: with SMTP id x17mr8578250ejv.181.1581465885684;
 Tue, 11 Feb 2020 16:04:45 -0800 (PST)
MIME-Version: 1.0
References: <20200210050754.3534-1-christopher.w.clark@gmail.com>
 <20200210050754.3534-20-christopher.w.clark@gmail.com> <CADkTA4Oko4tG+0CkmoexjGzFj2Hg7qVcoh55b46Mp8bcVABnqg@mail.gmail.com>
 <CACMJ4GYEDXRPJRxxfm6oSR5TVyukKkzOt5M0BWeUsAPa+3+fPg@mail.gmail.com>
In-Reply-To: <CACMJ4GYEDXRPJRxxfm6oSR5TVyukKkzOt5M0BWeUsAPa+3+fPg@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 11 Feb 2020 19:04:34 -0500
Message-ID: <CADkTA4MwXP3ocFpGwc3nKwjwyrgL5drTEawegiKCo4NSgoVYLg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 16/16] xen: add contact to recipe README file
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>, 
	Doug Goldstein <cardoe@gentoo.org>, Rich Persaud <persaur@gmail.com>, 
	Daniel Smith <dpsmith@apertussolutions.com>, Jason Andryuk <jandryuk@gmail.com>, 
	Eric Chanudet <eric.chanudet@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 11, 2020 at 6:43 PM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> On Tue, Feb 11, 2020 at 1:17 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > On Mon, Feb 10, 2020 at 12:08 AM <christopher.w.clark@gmail.com> wrote:
> > >
> > > From: Christopher Clark <christopher.w.clark@gmail.com>
> > >
> > > Add myself as a contact for the Xen recipes.
> >
> > We can also consider a MAINTAINERS file for the layer.
>
> Yes, that looks like it could be a good fit for this layer.

I'll pull together one in the next day or so, and add you for the Xen recipe(s).

Bruce

>
> Christopher
>
>
> >
> > Bruce
> >
> > >
> > > Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> > > ---
> > >  recipes-extended/xen/README | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/recipes-extended/xen/README b/recipes-extended/xen/README
> > > index 3686530..5592b48 100644
> > > --- a/recipes-extended/xen/README
> > > +++ b/recipes-extended/xen/README
> > > @@ -1,7 +1,9 @@
> > >  Xen
> > >  ---
> > >
> > > -For any issues with the xen recipes please make sure you CC cardoe@gentoo.org
> > > +For any issues with the Xen recipes please make sure you CC:
> > > + christopher.w.clark@gmail.com
> > > + cardoe@gentoo.org
> > >
> > >  configuring the hypervisor
> > >  --------------------------
> > > --
> > > 2.17.1
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
