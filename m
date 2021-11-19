Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web12.9158.1637329890410922577
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 19 Nov 2021 05:51:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bz6UzYhR;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id l22so43508618lfg.7
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 19 Nov 2021 05:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tK+1qYmfZomW3myETnz37ZiJ7US5MolWXRSK09/TNQg=;
        b=bz6UzYhRIH8OLlXNtaoDAwIYUL91DFGcpvYeC3eBNktetcbhycqFVdJS+a+LKdG6CV
         TciGdh3uQA35buqBZ0foGuMUXQe0hAH1xyN1HyYvcn39na1U2Hvt4AnwIuOjyYeosJBQ
         AgbpZHPzWG2uNT1Xej9MFaHxaXl5K+yfiBkVk0Zv3N12yz2IbApPBLxl1qa5fG2WDaAU
         9AYC890YuGqSXn8vvE4Y/BIrGWP5udRrPwoPdJazYKvT+s/i+ys90Js50dD58+ilASlD
         WeuAwLixN6PFds07VitbkZLgsZzszNVWB15e8KgzNeRvPlxx1lgPPs58PZH9MH+hsTke
         4NAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tK+1qYmfZomW3myETnz37ZiJ7US5MolWXRSK09/TNQg=;
        b=YmDE8fRBxC0BIiqgWp/9lAG5Vuv1QOUciLRT3v0oqaDAnn3BHqhfRNu5bfauf5XFMU
         nvpQcmBdQUdt+j0nLQQdLUG0Avv7bNmlmZ4hrAt5D5wy6fa1h2Rl8znORK76WTEsAe7L
         xq6+8ulvVRzxBxVqLHaxLl4kqJ1pfe0nJuA66hEGaWCImgu24+DW3whrrS6c9apLvpBa
         CTJywtQDyETAU8SDI+9l2it1hySQM50q0ahEvKpadScpveU/Vd2Gh4++5Cjo1wQs7PkL
         SBFOpS4+RL1A0iq4Yt/Gz+9z/oDNI13t3Yn7OPIRcLSC0TqVHr9/YSYpNX8rFFHEqEyw
         f+ew==
X-Gm-Message-State: AOAM530y++Q+cEDHC3QJW2IcDcMBb7CSIrIVWEZz7SK1rcx/XAyXCI4e
	bOCCKcb4PDhhuqrYZwYegGHlB6YY0kFXlwxLUws=
X-Google-Smtp-Source: ABdhPJxWhpFI6e+6A1xosqqadZusbEKZ5sHrYTbitj3VtNLSMCgyp9WWjue+TmwFz2YoItWd8cTZU1QuTVbchiFY1oI=
X-Received: by 2002:a05:6512:39c4:: with SMTP id k4mr33015143lfu.79.1637329888136;
 Fri, 19 Nov 2021 05:51:28 -0800 (PST)
MIME-Version: 1.0
References: <20211111100725.38963-1-kai.kang@windriver.com>
 <8552b0e951af4cd1b9a0a7d945ccef85@axis.com> <b0b589fc-7e2c-6653-24f1-1bb44ef2c8db@windriver.com>
In-Reply-To: <b0b589fc-7e2c-6653-24f1-1bb44ef2c8db@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 19 Nov 2021 08:51:16 -0500
Message-ID: <CADkTA4ML9P0UbqPg3m4JUprvNaPo9RgVf0BNNoVxyY_4D5kziw@mail.gmail.com>
Subject: Re: [meta-virtualization][m-c-s][PATCH] concurrent-ruby: add explicit branch
To: kai <kai.kang@windriver.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 19, 2021 at 8:43 AM kai <kai.kang@windriver.com> wrote:
>
> On 11/11/21 7:05 PM, Peter Kjellerstedt wrote:
> >> -----Original Message-----
> >> From: meta-virtualization@lists.yoctoproject.org <meta-
> >> virtualization@lists.yoctoproject.org> On Behalf Of kai
> >> Sent: den 11 november 2021 11:07
> >> To: meta-virtualization@lists.yoctoproject.org
> >> Subject: [meta-virtualization][m-c-s][PATCH] concurrent-ruby: add explicit
> >> branch
> >>
> >> From: Kai Kang <kai.kang@windriver.com>
> >>
> >> Add explicit branch master for concurrent-ruby as the same for other
> >> recipes.
> >>
> >> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >> ---
> >>   meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.6.bb | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.6.bb
> >> b/meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.6.bb
> >> index a328203e..61a2c598 100644
> >> --- a/meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.6.bb
> >> +++ b/meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.6.bb
> >> @@ -4,7 +4,7 @@ HOMEPAGE = "http://www.concurrent-ruby.com"
> >>   LICENSE = "MIT"
> >>   LIC_FILES_CHKSUM =
> >> "file://LICENSE.md;md5=fde65ae93d18826f70c6fe125aa04297"
> >>
> >> -SRC_URI = "git://github.com/ruby-concurrency/concurrent-ruby.git;protocol=https;tag=v1.1.6\
> >> +SRC_URI = "git://github.com/ruby-concurrency/concurrent-ruby.git;protocol=https;tag=v1.1.6;branch=master \
> > While at it, why not remove the tag= and replace it with a proper
> > SRCREV = "<sha1>"?
>
> Sorry for late reply.
>
> I am not sure which is better because there is a tag with branch in
> SRC_URI in meta-oe. If you insist remove tag is better, I'll send it
> with v2.

The default is to use SRCREVs instead of tags, since tags can change
(although they shouldn't), and it used to be that tags did trigger
some network access with some configurations.

So if it isn't too much trouble, I do think switching to a SRCREV is better.

Bruce

>
> Thanks,
>
> Kai
>
> >
> >>         file://0001-Removed-check-for-concurrent_ruby.jar.patch"
> >>
> >>   S = "${WORKDIR}/git"
> >> --
> >> 2.17.1
> > //Peter
> >
>
> --
> Kai Kang
> Wind River Linux
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
