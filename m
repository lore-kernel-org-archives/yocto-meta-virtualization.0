Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web09.2706.1579296677217113546
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Jan 2020 13:31:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cpNqilDK;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id f8so23621900edv.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Jan 2020 13:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+00fZRw9d1kvrnUcDD/ZTT/4V/8I3UXDr6WsCKHWNNI=;
        b=cpNqilDK1tU720YsujZrTtJBreWEjYQgD8Ammjc6wtelum/N/b9mVhars7uXKU3cIl
         1t+dm84bJuKsdtfA4pG7iEFtLEzWO+LjguXr2hIBOljUu7AKT+SVF5VUVuKPhXgt6Us8
         v7tMgXUiQkvDfclsFjdb1zMnFsfQs47MXTY5OZHGoWA1TaWXi1QmUyiyF4ArHhIPmArY
         CEuMfSA+VADCxaZIhmVkBzjFrBlF2wofhiWNOT9Id3ucmamhiXawuYZZkZLu/ZX2U1yG
         PVdWNcUXsWmLe3Pg9/f+55+QgM7V+y271XfNzcIWtirqEIflBP5etrIQ+sKfJMfRlliN
         0Pzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+00fZRw9d1kvrnUcDD/ZTT/4V/8I3UXDr6WsCKHWNNI=;
        b=PKLXLOlCwbMRIrcd+2xPXLpkaz+tlH957N7310vpfwLQR2y4VlDbPl6MUmN4N4c3M9
         9PExayyTmR6FIuPgn5z9qcjy3BJfhC+j14VyF37Ciol/fZDVKisp22n1Wgkc9kb33Po7
         n24n+b3qsU2LueWA0+CO4TQCtKjKklTqKuxQdFdLlLbQiz58eN/mriJnU8NOvK+jnSKN
         i/ONxbZiZXUkR/mlgLRWawSISsIKVz8rmQmdIDSrGfZ9gIWg4CC5tnDIXbtCslZOtoO6
         AlSEL9QUzrmE7LKosOjx8+n1qatsyzJ6DDGWxOwbGkFp+TjzQ1tN7YWVAv+1o4BnDgWD
         RGpQ==
X-Gm-Message-State: APjAAAWen7sW5xMwrZwxttiTuuGXV4Sf3zGSbTC9FssiQ6ZJf6IGAt+T
	RkxXpWTdyVlYb9w/vIyMqbl+dcJbHGmHb+WwaClkUc23caQ=
X-Google-Smtp-Source: APXvYqxH/xbgI7aV/o1DdylNGy6NODUncG1XQuQs6zL828X19qmuGkZtvcBHbeXK/bkRP7+gREsy0V2zhvYMccazXv0=
X-Received: by 2002:a50:aacd:: with SMTP id r13mr5966745edc.129.1579296675810;
 Fri, 17 Jan 2020 13:31:15 -0800 (PST)
MIME-Version: 1.0
References: <20200113154742.15509-1-brendank310@gmail.com> <CACMJ4GZUq-hrYamCjJ-_2GQJYU2qTA2HxkY51kMR=Kk5VrE5bA@mail.gmail.com>
In-Reply-To: <CACMJ4GZUq-hrYamCjJ-_2GQJYU2qTA2HxkY51kMR=Kk5VrE5bA@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 17 Jan 2020 16:31:05 -0500
Message-ID: <CADkTA4PLmFNLSG8tJupCSa4fWU-ejks4GGngOjS0_SmYuFWVKQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 0/3] xen: uprev to 4.13.0
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Brendan Kerrigan <brendank310@gmail.com>, meta-virtualization@lists.yoctoproject.org, 
	Brendan Kerrigan <kerriganb@ainfosec.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 16, 2020 at 1:57 AM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> On Mon, Jan 13, 2020 at 8:15 AM Brendan Kerrigan <brendank310@gmail.com> wrote:
> >
> > From: Brendan Kerrigan <kerriganb@ainfosec.com>
> >
> > Uprev xen to 4.13.0 release
>
> Thanks, Brendan -- I'm working on a review for this series now.
>

Given the review comments (thanks!!), I've dropped this series for
now, and will wait for a v2.

Bruce

> Christopher
>
> >
> > Brendan Kerrigan (3):
> >   xen: add flag to ignore warning "address-of-packed-member"
> >   xen: add package for xen-ucode
> >   xen: upgrade to 4.13.0
> >
> >  ...01-python-pygrub-pass-DISTUTILS-xen.4.13.patch} |  3 +++
> >  recipes-extended/xen/xen.inc                       |  8 ++++++++
> >  recipes-extended/xen/xen_4.12.0.bb                 | 12 ------------
> >  recipes-extended/xen/xen_4.13.0.bb                 | 14 ++++++++++++++
> >  4 files changed, 25 insertions(+), 12 deletions(-)
> >  rename recipes-extended/xen/files/{0001-python-pygrub-pass-DISTUTILS-xen.4.12.patch => 0001-python-pygrub-pass-DISTUTILS-xen.4.13.patch} (96%)
> >  delete mode 100644 recipes-extended/xen/xen_4.12.0.bb
> >  create mode 100644 recipes-extended/xen/xen_4.13.0.bb
> >
> > --
> > 2.20.1
> >
> >
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
