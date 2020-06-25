Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
 by mx.groups.io with SMTP id smtpd.web12.4874.1593066439242565593
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 24 Jun 2020 23:27:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H3Xdj0UZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.68, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-ot1-f68.google.com with SMTP id k4so1086298otr.7
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Jun 2020 23:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ods4hq8FZpS/iKKQa9VcmU8lsTNVipGFMrck6GiLfhA=;
        b=H3Xdj0UZGIprYFLUcLOvhdwWKWCPAjMqgppNDIjmmNLRn4o/pUbB/F1vDAKRb2Xmol
         NPLMFR8pMZSVeBGGv4GihvreUzO0Xx6YtPhycRG6xTr15XA2hZe/N+PqP7bDxbsibV1s
         fxFnJJ8DrDjiDjNnNJ4oWlAFYsMiXhNVOYvDhDv10TY+bP+Usu3tIcUg4NBvSc3aKBBZ
         aAx1nHyHurP5t9lK7UdUcJ9DxFOnn0Ypbregy2SyqAKlEJUDGx9Kg22QygCrKnilIcYI
         Mjq+yimeJ3l/KsMGxfa9yQjdFN9vTyNz/25gytKBwzJCMV4mxlI5y0D5ieiyTgnGaq6Z
         5LcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ods4hq8FZpS/iKKQa9VcmU8lsTNVipGFMrck6GiLfhA=;
        b=uHFcOkWXW6byldcDwfY1GLU5+1r990FIHO/dISiwmbr6RffvzxHvNaccD5uqZUIRgx
         /4Y+iD4jedQFBuUNa+9JnFqPfiId0meMhMlK+9xs2fu1sW0LrvzJ50529CkO4KpGCh3t
         1SxZusnTyizWAJhoT5aFTWOfNyzeN1HIXncYFy07LZ9PYjPyXTDMPmZsp0GR0cbC5gow
         XYScID98BTqwWD5Izn5koesHOxznG09TTgVgx8K+GRAAxDfKw/SmexvjQnuzVW2fu0n8
         a7fxN9x2dP7ucbliW6GsugAauZ+eih3yRqomWiAgSyq+tkqJbH4qy+So+yhR3rQcyOga
         YAzw==
X-Gm-Message-State: AOAM533UqcGoIzoVfVowSVqm6qX1r4w2JBR8gXxuTeJd8Q53jxyum8fM
	kBY1p9G1propPiAwZCh99hLuEk58LYiqHPwnlX4=
X-Google-Smtp-Source: ABdhPJw7iXZu3WmIZDSVvZXg22ONweK5UudCygbcBEgXLsYQ2hinSpN68swPxc+dIx/ZXCClyhBqFdiZVhQZf1IuCWk=
X-Received: by 2002:a05:6830:3104:: with SMTP id b4mr26033546ots.192.1593066438510;
 Wed, 24 Jun 2020 23:27:18 -0700 (PDT)
MIME-Version: 1.0
References: <CY1P110MB05517012EA0DC0134F655D2A8C860@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
 <20200605211602.GO2903@minyard.net> <CADkTA4N7vqHMi8Fa5H1sRuX4ZnVrEiS4oso5TiObUu0thJGr5g@mail.gmail.com>
 <20200606005839.GR2903@minyard.net> <CACMJ4GYcc0v=Y8gJzhCfVrSq8J4J6V5iwMFwzMfOXit63yO2ww@mail.gmail.com>
 <CADkTA4N+-GrD8TnUUVMC3Hrj=1tR8rsyHj4gCsFvPKzJh9LKyg@mail.gmail.com>
In-Reply-To: <CADkTA4N+-GrD8TnUUVMC3Hrj=1tR8rsyHj4gCsFvPKzJh9LKyg@mail.gmail.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Wed, 24 Jun 2020 23:27:06 -0700
Message-ID: <CACMJ4GZVFj=XX5LMbpEeZrc0Fyr9YxSYF9poxkCTjRWnpWy0sw@mail.gmail.com>
Subject: Re: [meta-virtualization] Xen on Raspberry Pi 4 (was "How to resolve the ERROR: xen-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs. and ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. ERROR: xen-image-minimal-1.0-r0 do_rootf")
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Corey Minyard <cminyard@mvista.com>
Cc: Siddhartha V <Siddhuvgowda.18695@gmail.com>, 
	Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 15, 2020 at 5:45 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Mon, Jun 15, 2020 at 5:11 AM Christopher Clark
> <christopher.w.clark@gmail.com> wrote:
> >
> > On Fri, Jun 5, 2020 at 5:58 PM Corey Minyard <cminyard@mvista.com> wrote:
> > >
> > > On Fri, Jun 05, 2020 at 07:53:53PM -0400, Bruce Ashfield wrote:
> > > > On Fri, Jun 5, 2020 at 5:16 PM Corey Minyard <cminyard@mvista.com> wrote:

> > > > > Ok.  The layer has the following basic pieces:

> > > > > 3 The addition of xen-tools.  This seems somewhat controversial from a
> > > > >   naming point of view, at least.  But all the major distros seem to
> > > > >   have it, and it does make things easier.  It brings along a boatload
> > > > >   of perl recipes.
> >
> > > > Christopher might have a better idea about #3, but if the
> > > > functionality is useful, I'm all for having it close to the other Xen
> > > > components.
> >
> > I think if there's users wanting it, it's worth considering and I
> > agree with Bruce that meta-virtualization will be the right layer. I
> > think the name chosen by the software authors is somewhat unfortunate,
> > so getting sign off from the Xen Community Manager about whether the
> > use of the trademark is OK would be sensible for Yocto's license
> > compliance; but from my (basic) understanding of the policy, it should
> > be fine.
> >
> > I think it's appropriate to retain the 'xen-tools' package name in
> > Yocto for the tools provided by the Xen Project source code, since
> > those are core Xen system components, with wider Xen community
> > involvement in their development and use than these perl system
> > management scripts. I don't mind the recipe/package for these perl
> > tools being called xen-tools-extra, but getting thumbs up from the Xen
> > Community Manager would be best.
>
> Sounds like a good approach.

Following up on this: I did make contact seeking guidance on this, but
have not yet received an answer, so I'm going to make a request:
Corey: Please can this software be submitted for inclusion to
meta-virtualization, using this recipe and package name:
  perl-xen-management-scripts

This will make it obvious that the software is clearly separate from
the main Xen hypervisor tools that are maintained within the Xen
Project, and the name transparently describes what it provides.

thanks,

Christopher
