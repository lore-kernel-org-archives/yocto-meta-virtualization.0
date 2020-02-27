Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web11.1604.1582842097834139413
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Feb 2020 14:21:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=g+PV7yUa;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id dc19so922977edb.10
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 27 Feb 2020 14:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wPHRbTpM38zr2aLfa1fcGUVnXUVKs88lY+a+asdlSxM=;
        b=g+PV7yUatSUfE1NsprazQUpKcNXmg5g/eU7MJRp8zM6UFWXe2DfwHeoPCNmzyMJHXP
         vkZgU4zhg1S5mRWtEuqSevD6rktHehL1bh6OVsihlKgdJQtceTd/21lrVv6EEX27Fa84
         UcA0Vbt1c6DBGiQgqUMqjCFqgOPc0221UEN5h5p5tPHkWao9k3vPARW+oSv2oQ3zV/dL
         7MuVcOVktyzWbX+VgBEydyQHlSn2uNvtVtd1KmLtYnrfkasLce4wNOI9KrjckO6PS3B9
         iWQlewspEkEHufva8OyL4YGz9JHShKI5HUSAjWBfrJFGwIrl6AqY44BfAcfX+Jb6vp1C
         A45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wPHRbTpM38zr2aLfa1fcGUVnXUVKs88lY+a+asdlSxM=;
        b=fA/gjh/I8vALloJ7PTlGOe9DnG2z/3WD+7ccUVT5WCFxiEhHMwgIEH44FFHhx2eM6u
         x+LNI4S355kIj5MOhy9tmPzs8FpE5A1RFgADPx/VuWtcWtwjS6XV4aztZEm41/2z6IF0
         HEywDeIS2Ti5KGJHPSW4/kq5qFyGNxytWEQwXfm+R3EZHASVJI92DHbGRCPJ6INTltMC
         3GAId1v12UYzDho1s39s0Cnz7rxs3QMy0qDw+PXGKG6ltbcNE4V6ssE8Is11RdhV4Y2h
         jI2q4GiKmkmMN8CRjpXX3fEVEa2QbEC/RJ3sa8jCzd9L6BF4TaMCl4DULF2MDOo6lbsd
         PALw==
X-Gm-Message-State: APjAAAUUxHw6LfyF+pRCOdRxX36NybGS7yF0vkf5x1+WqjVS/jrOMYTu
	ihPkabM3WjHyg9pKK/XPiEKdDQNuh5kSR2E81r4=
X-Google-Smtp-Source: APXvYqxZ7AppAzicPTETbRe2M8hc3FMBQC6V4EbPSTfbkNUHJs7c3TW7fT5h0kbfzWVw7/rX2zZg6Si1wOqXB6pOjTg=
X-Received: by 2002:a17:906:4bd1:: with SMTP id x17mr1106689ejv.181.1582842096026;
 Thu, 27 Feb 2020 14:21:36 -0800 (PST)
MIME-Version: 1.0
References: <20200210050754.3534-1-christopher.w.clark@gmail.com>
 <20200210050754.3534-20-christopher.w.clark@gmail.com> <CADkTA4Oko4tG+0CkmoexjGzFj2Hg7qVcoh55b46Mp8bcVABnqg@mail.gmail.com>
 <CACMJ4GYEDXRPJRxxfm6oSR5TVyukKkzOt5M0BWeUsAPa+3+fPg@mail.gmail.com> <15F27ED8B4F696B3.19576@lists.yoctoproject.org>
In-Reply-To: <15F27ED8B4F696B3.19576@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 27 Feb 2020 17:21:25 -0500
Message-ID: <CADkTA4Oovo7vGW9-oJc8nTco8HbF8FXDmZj9PkRVh7FmHHhBeg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 16/16] xen: add contact to recipe README file
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Christopher Clark <christopher.w.clark@gmail.com>, 
	meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 11, 2020 at 7:04 PM Bruce Ashfield via
Lists.Yoctoproject.Org
<bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
>
> On Tue, Feb 11, 2020 at 6:43 PM Christopher Clark
> <christopher.w.clark@gmail.com> wrote:
> >
> > On Tue, Feb 11, 2020 at 1:17 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > >
> > > On Mon, Feb 10, 2020 at 12:08 AM <christopher.w.clark@gmail.com> wrote:
> > > >
> > > > From: Christopher Clark <christopher.w.clark@gmail.com>
> > > >
> > > > Add myself as a contact for the Xen recipes.
> > >
> > > We can also consider a MAINTAINERS file for the layer.
> >
> > Yes, that looks like it could be a good fit for this layer.
>
> I'll pull together one in the next day or so, and add you for the Xen recipe(s).
>

FYI: I pushed a kernel-style MAINTAINERS file with my last batch of updates.

Bruce

> Bruce
>
> >
> > Christopher
> >
> >
> > >
> > > Bruce
> > >
> > > >
> > > > Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> > > > ---
> > > >  recipes-extended/xen/README | 4 +++-
> > > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/recipes-extended/xen/README b/recipes-extended/xen/README
> > > > index 3686530..5592b48 100644
> > > > --- a/recipes-extended/xen/README
> > > > +++ b/recipes-extended/xen/README
> > > > @@ -1,7 +1,9 @@
> > > >  Xen
> > > >  ---
> > > >
> > > > -For any issues with the xen recipes please make sure you CC cardoe@gentoo.org
> > > > +For any issues with the Xen recipes please make sure you CC:
> > > > + christopher.w.clark@gmail.com
> > > > + cardoe@gentoo.org
> > > >
> > > >  configuring the hypervisor
> > > >  --------------------------
> > > > --
> > > > 2.17.1
> > > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
