Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.3388.1615518417876227313
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 11 Mar 2021 19:06:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mMNkyEBQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id jt13so50688984ejb.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 11 Mar 2021 19:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YOWayzZt4sIYCglvDPoczI2USBjri789Fz4mCtnCw7Q=;
        b=mMNkyEBQ69g1VoXGbEvzKVetys4GJsFxbx6tu2dqF/V4ISEjq0Po3+i160oZyO4Qlc
         KDsVXyvokLA/RyA0MI1dLl85Pzlpyjpw/G4+w6XFJiqRPrR7ImJmIRlQeDd71rtgWX2h
         n3waindS6kMwod0ZeeSUF44YvtggO5PqJ/9+aI4BR7jMFjCL/v2wH9eNNIipvWFyAg2x
         bp0UIQ3ZzFyJB+X6jOPMKFxz3pM/Z86wClO+Yk1A5fEue+I1dmUo3a+6pJ6QbKKHQJ6U
         fuCXXGMHw9SvzGu6MV8PNFqMj1ZVTVTAokQzMYPSzWyUEB47mMVY5lWrHpRaHi5V8NtY
         H5dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YOWayzZt4sIYCglvDPoczI2USBjri789Fz4mCtnCw7Q=;
        b=Sq8wOotzwOu4TEaNS/R1qKYMKkFBPP/m94vlvnG/f38CnbUQb3LTYCpqPvlZuERsGG
         MFYKtt88eVfcPK1mwjn0x5W+c4B/csbXl+sX++5oMTppqu1UIEbHYfnLsjUSrDJo366T
         SIbXA8JA3hNFuPndvuO4bVGQAjS7qehYv2mzSQvK6def4ndYduuvyv61VOQxGlMNYUx/
         hq+5DylPavS5B5dpFJymIKRCrmnNHhXAWKZK02s1sE1qxTnjZjSQu2tGEpJxL3IXEir4
         7uidDCV+8FEg8Q2MUPNM/W91JbhTaf7C+EoI3MfCIioWRYsKZcQRFSfpQE0b/wigeZbu
         r6jg==
X-Gm-Message-State: AOAM531vuQcivffm4L05QePKTEVBd52PSLkNydKGUJsioQMnLWEXEUwU
	yR1+lWh2IfsQQxxjpsYCTfLUSNbQdrOeZ85TNjY=
X-Google-Smtp-Source: ABdhPJxNHv78xtH24PVsUJXta8eV119LQOKsPkeR1E8QpK7v/vuQ0MtuvpiB697ELp84jNcgitYUGBNGeRAmXjRuD4E=
X-Received: by 2002:a17:906:a94b:: with SMTP id hh11mr6256192ejb.459.1615518416285;
 Thu, 11 Mar 2021 19:06:56 -0800 (PST)
MIME-Version: 1.0
References: <nDbt.1615459289447454507.U8Ef@lists.yoctoproject.org>
In-Reply-To: <nDbt.1615459289447454507.U8Ef@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 11 Mar 2021 22:06:45 -0500
Message-ID: <CADkTA4PFB7RiWXLC5MHW=3DfpX55O539RUH02mS=8g_1dZCJjg@mail.gmail.com>
Subject: Re: [meta-virtualization] Updated status of meta-virt roadmap
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

I actually do have an updated roadmap that I've been working on
throughout the release cycle (driven by the presentation that I
prepared during the fall OE developer day). It isn't formalized into
the existing format at this point, but I can do that as I become more
sure of what is, and isn't going to make this release. So in the next
3-4 weeks, I can have it updated in tree.

The best way to find out what's up and to collaborate on direction is
to drop by the #meta-virt freenode channel and catch folks there.

Cheers,

Bruce

On Thu, Mar 11, 2021 at 5:41 AM Diego Sueiro <diego.sueiro@arm.com> wrote:
>
> Hello Bruce,
>
> Can you please give an updated status of the meta-virtualization roadmap?
> I had a look at meta-virt-roadmap.txt and it seems that it was not updated since 10/2020.
>
> Also, what is the process to contribute to this roadmap?
>
> Kind Regards,
> Diego Sueiro
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
