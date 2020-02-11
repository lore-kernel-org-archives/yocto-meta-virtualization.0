Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.18542.1581463957916641979
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 11 Feb 2020 15:32:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Aps4bwqO;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: christopher.w.clark@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 78D32E016D6; Tue, 11 Feb 2020 15:32:37 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.208.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (christopher.w.clark[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F1A25E013AE
	for <meta-virtualization@yoctoproject.org>; Tue, 11 Feb 2020 15:32:35 -0800 (PST)
Received: by mail-lj1-f196.google.com with SMTP id x14so99653ljd.13
        for <meta-virtualization@yoctoproject.org>; Tue, 11 Feb 2020 15:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZgKkyWTao3MLHVnAHxSGsxDmMOSA3o6BUJ5Yc489WM8=;
        b=Aps4bwqOt0fAp078CUR0QjeBxRK9DxP2yvYPva+qV5cr4fAiwusf38l8zCMxiBwu7L
         Ae9bP5xMlbfba3N3ZZI8PeQIVhBJwwxBrezdoGcHEogVLxHO70zf6odPu4IdAnfi1B0d
         5f9hQ019eruazBEYmeE3jV1WappuVVCwA+cfRzcXbCIPScVZ3BgCqhVp/n4TtlXqg/vR
         zebxN3nn5laQUjP1BKA++v8eMeOwbJrYbbVTTLqw/ziMXdeBp+pGRteYiArEoWkcwNes
         hCLV6Kh2smKWMkZpqGCddSiyDZpJISDohWCVUKOS09s28cEBIlMtEkJ9t0tNvV0ugxOV
         rGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZgKkyWTao3MLHVnAHxSGsxDmMOSA3o6BUJ5Yc489WM8=;
        b=DpLxD/32d8q/uWLta+FcT73d+pfjQ4MDp1MbwmUYMj/L1g8ihClfsE3JNlrsKeHNgF
         K3d1yrr8RMyM8xq3k9sHGp3H8rEktJSnOhZ08ss6LIsCeNYK0JTkkyUHoTyptonWbxYK
         QuX0USgseheHq6VVf//5vnUAsRLLTgtatxTXaQn5+6RvH/Jm/AGJFJ6lOpkAosxwJ76+
         PftUh8MpZ8ySSP1C7o2PuO0GK2lcMkfpfSoo6N6FyT7A7lGibfiCl//e1shFhMg0POG4
         PGhioyEbMK04T9gZAQjlm7mYcAP8GiDhAFNn9C9DPFX1hyRWKJPc5uFZmtXxpYIrhe/Z
         uscQ==
X-Gm-Message-State: APjAAAUlBxnPqg8JrJzNhJw9YvWmBVTijxh7xOV209cfV4uViOtqze0W
	xsdikZWB8neKyqecBM0MPzjqWaunrsgr6MeaKoI=
X-Google-Smtp-Source: APXvYqxsduGABl1F4ih8txQIwLjOS4uzLD6OUZMSTlprqzwC+B8w/cU4SCDBHPDOEM6bfUr3+TC0qsHAkajoq+eNX8U=
X-Received: by 2002:a2e:7207:: with SMTP id n7mr5487144ljc.242.1581463954893;
 Tue, 11 Feb 2020 15:32:34 -0800 (PST)
MIME-Version: 1.0
References: <20200210050754.3534-1-christopher.w.clark@gmail.com>
 <20200210050754.3534-15-christopher.w.clark@gmail.com> <CADkTA4OYBGGh9Wuc+M7RHBoEdDNM1tu5zJsyWGmuUeuYHiVscw@mail.gmail.com>
In-Reply-To: <CADkTA4OYBGGh9Wuc+M7RHBoEdDNM1tu5zJsyWGmuUeuYHiVscw@mail.gmail.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Tue, 11 Feb 2020 15:32:23 -0800
Message-ID: <CACMJ4Gaet+LSt8dq=V0=07sgM54fm-Cm3rRjL2nyB13AZ-_KoQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 11/16] xen-tools: change globbing to fix syntax highlighting
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>, 
	Doug Goldstein <cardoe@gentoo.org>, Rich Persaud <persaur@gmail.com>, 
	Daniel Smith <dpsmith@apertussolutions.com>, Jason Andryuk <jandryuk@gmail.com>, 
	Eric Chanudet <eric.chanudet@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 11, 2020 at 1:15 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Mon, Feb 10, 2020 at 12:08 AM <christopher.w.clark@gmail.com> wrote:
> >
> > From: Christopher Clark <christopher.w.clark@gmail.com>
> >
> > Fixes an annoyance when editing the file. No functional change intended.
>
> I'm guessing it saw them as comments ? /*

Yes, exactly that, so the text editor's syntax highlighting is then
confused for the rest of the file.

Christopher

>
> Bruce
>
> >
> > Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> > ---
> >  recipes-extended/xen/xen-tools.inc | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
> > index 5b0a339..e166c74 100644
> > --- a/recipes-extended/xen/xen-tools.inc
> > +++ b/recipes-extended/xen/xen-tools.inc
> > @@ -197,7 +197,7 @@ FILES_${PN}-dbg += "\
> >      ${libdir}/fs/zfs/.debug \
> >      ${libdir}/fs/reiserfs/.debug \
> >      ${libdir}/fs/iso9660/.debug \
> > -    ${libdir}/fs/*/.debug \
> > +    ${libdir}/fs/**/.debug \
> >      ${sbindir}/.debug \
> >      ${libdir}exec/.debug \
> >      ${libdir}/xen/libexec/.debug \
> > @@ -346,8 +346,8 @@ FILES_${PN}-libfsimage-dev = " \
> >      "
> >
> >  FILES_${PN}-fsimage = " \
> > -    ${libdir}/fs/*/*fsimage.so \
> > -    ${libdir}/xenfsimage/*/fsimage.so \
> > +    ${libdir}/fs/**/[a-z]*fsimage.so \
> > +    ${libdir}/xenfsimage/**/fsimage.so \
> >      "
> >
> >  FILES_${PN}-init-xenstore-dom = "${libdir}/xen/bin/init-xenstore-domain"
> > --
> > 2.17.1
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
