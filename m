Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web11.1294.1582840709272734552
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Feb 2020 13:58:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hWp2iVLh;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id c7so910795edu.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 27 Feb 2020 13:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dMlqxIMB02FZ4an4gQaxC8M7sjolaic37KfRkP3uFxY=;
        b=hWp2iVLhNIzo2QHP0ia4gd0TW4NfSzhfH6XDe4f79BZM4gDH23CyhUnwc1teEeki9U
         cAJ+4JFn5eoXvEFTsXbiVa2LEECuja1VYciMniUzfiQr1WfjsUYcZ+wHEW93YIO2cin0
         hmzwglI54LtAWwjZSfVZQS8Dxn5CKBCfJuhwnhedxmSIDgY16FSWrMaXGmmJvbw74LWS
         1ibt8LKJWVVZrnQ8wv4RwItcHZNVBN+F6K6RVQYwME1Xxnv4FlOhuP52l9jZnltTKHN0
         oK0aVFKZNzh38qiadf1Yb+xGtkrHL+YzaB4W4UbDnKnRQKeCJS2ldJgsF7l6z/mayd5p
         fTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dMlqxIMB02FZ4an4gQaxC8M7sjolaic37KfRkP3uFxY=;
        b=ReaTjyTJk6Mp6w1QGq2MThaP7JvdK2jrej3KX83P216cYT2RHQEe8AGmF2ECjRzITm
         mc2CAfrch0UFCHbGMjHzEj3OF9+An+jB7yqHJOvliL8Xf4TCGlZngCWF2PKZ/qhQB5Fw
         XqCrkCylnsDJuCjAx9oib7Kqak9MiyqJNN4q9Ci2fl/43zv8NDARxuXNGwfFwk7ifvzv
         blX86J4gbqA8GFh99yCUHWN91MyfB4OJ9gR69R4UZr6Xptrf0oUV2eZV7lF/0u10I3Yu
         O5GXm09V1k1nJo9u+Wf9WH6JzDZSr3R2C2PHGBZvvUaWTk+ah4HGajVgKRYz96w8LU0S
         mn/g==
X-Gm-Message-State: APjAAAWRODnj3aiB+qQ5O+RbHL29vE37wtoD43dfNQ8kR1Dp5/rU5xVz
	t549xP1gWlFWyBjP+2yohrqnyMaXPZaJAadbhPM=
X-Google-Smtp-Source: APXvYqzSlSJMsY+RxEVsQarz+gHJxe9mFe71wE0Uro/yQ507dhr+s/pQD/e9yAVTq4Mny026iLJeZbmJQyhsOD9LY0s=
X-Received: by 2002:a50:ec1a:: with SMTP id g26mr628925edr.164.1582840707855;
 Thu, 27 Feb 2020 13:58:27 -0800 (PST)
MIME-Version: 1.0
References: <20200214101719.6674-1-bertrand.marquis@arm.com> <15F7612BAB3ECD1F.22756@lists.yoctoproject.org>
In-Reply-To: <15F7612BAB3ECD1F.22756@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 27 Feb 2020 16:58:16 -0500
Message-ID: <CADkTA4MNJRwS0PwcyzyAoo8hFha1JzNp77ZUwdELGEfBsmLp-w@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] Xen: fix do_deploy dependencies
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

ooops. Misfire on the email.

This isn't merged and can be revisited once I have the Xen updates in the tree.

Bruce

On Thu, Feb 27, 2020 at 4:57 PM Bruce Ashfield via
Lists.Yoctoproject.Org
<bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
>
>
> merged.
>
> Bruce
>
> In message: [meta-virtualization] [PATCH] Xen: fix do_deploy dependencies
> on 14/02/2020 Bertrand Marquis wrote:
>
> > do_deploy is using the files installed during do_install and it must be
> > executed after it but before do_build. This is fixing SSTATE behaviour
> > which had previously an empty scene in some cases.
> >
> > Change-Id: I04b1f652c697ed0bc7e262571dd03e123ac096f6
> > Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > ---
> >  recipes-extended/xen/xen.inc | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> > index 36ab78e..41b1983 100644
> > --- a/recipes-extended/xen/xen.inc
> > +++ b/recipes-extended/xen/xen.inc
> > @@ -1099,7 +1099,9 @@ do_deploy() {
> >      fi
> >  }
> >
> > -addtask deploy after do_populate_sysroot
> > +# do_deploy is using files created during do_install so force it to be called
> > +# after do_install but before do_build
> > +addtask deploy before do_build after do_install
> >
> >  # Enable use of menuconfig directly from bitbake and also within the devshell
> >  OE_TERMINAL_EXPORTS += "HOST_EXTRACFLAGS HOSTLDFLAGS TERMINFO"
> > --
> > 2.17.1
> >
>
> >
>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
