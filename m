Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web10.167.1583363161281095916
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Mar 2020 15:06:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ObLGficO;
 spf=pass (domain: gmail.com, ip: 209.85.208.193, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-lj1-f193.google.com with SMTP id h18so3890204ljl.13
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 04 Mar 2020 15:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iEZOiiSoeWoOsZqjY4OTWXYlfxhM2JOcJCavFJk7hLU=;
        b=ObLGficO/mI97TUpPQIIqJdcws6ezb/X57vx+MxJCMbxWzxpEezlJmvdtF7xZSfLVk
         ZR+2JPGCwTMgxKqr7ti2Rs7e+sKXyZrtfY9+cet1JynA/V5Ophjx96n7TQZYDv/rj6mL
         Xll3axlrMO2IHL+XzCIJn/xvWKlY/xNhCnRJ7NQpMK2ChILqBfLHG5/hm8QtSVu4p48+
         /JUmusUzaAWPEov1E1GrEsfA30vqW955G1T12Zr8nMoJBRVhzsLzbZmZLfjkGqAiO26L
         6CFYUvxqOWvTkQuVD2GUJF8WNRhPK9QPdFgRgxcpvFJcaRTVV410Ov4BwkHRYuk2d++0
         AB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iEZOiiSoeWoOsZqjY4OTWXYlfxhM2JOcJCavFJk7hLU=;
        b=mGcDrgteRxy1zF0SGTHAOmSDFx1jdxewr227GOaIgogPUBwwV6dKGGllCsDLZ1Bj03
         ap8ivO/aiIoJPcKKutaI3I6shRr8FQsFxP10qFBz2aY6jV0+SYSBzVq3owkSoA+G7c/a
         MnqUKCH18Q60yrvkPn/e0ExQ8DReTVoAI7TgaBIulQh45yx6X10JMABZT/PWos8PXjTS
         k6pDW44sZT7M8RtmL1oTeG9xwFCQxkUEqWXau1wIKUBEue7K7dxXTrLp6yNRjVMSgCjY
         H5OZ5oOKETEouv79xRDGOYjeCgIgEOqxkCSFIfihQ9aaceB3IlyulJFFqt8iGqpwrwNc
         WWwA==
X-Gm-Message-State: ANhLgQ3lDFG8ZSDKm4skQwGfq4Pa+RE5yIMVC6kb6Ue0v733adGrJeGe
	YgiJUkc6AlzjH8VeWfw7VCx3D1cq9gDns/d89R0=
X-Google-Smtp-Source: ADFU+vsaS1IkZvjAx/UGz5vndQFkK1bWhCQUxwBWdXaoTvEg0+DBayicOpPrtO9XImq+mV0SuDw3/aIrdSVvY0P7wCY=
X-Received: by 2002:a2e:7018:: with SMTP id l24mr3311477ljc.128.1583363159399;
 Wed, 04 Mar 2020 15:05:59 -0800 (PST)
MIME-Version: 1.0
References: <15F8D09CD90CE2BE.3586@lists.yoctoproject.org> <20200304152958.vnvz4t66ln2xyijl@jama>
In-Reply-To: <20200304152958.vnvz4t66ln2xyijl@jama>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Wed, 4 Mar 2020 15:05:48 -0800
Message-ID: <CACMJ4GYAEfbc1Qky1-2=yxqfSTjgbp1s6vfvvVgdK=yp8NETpw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/2] xen-tools: fix COMPATIBLE_HOST restriction for i686
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 4, 2020 at 7:30 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> On Tue, Mar 03, 2020 at 03:10:35PM +0100, Martin Jansa via Lists.Yoctoproject.Org wrote:
> > * let TARGET_VENDOR to be set to something else than the default:
> >   meta/conf/bitbake.conf:TARGET_VENDOR = "-oe"
> >   like other architectures use
> > ---
> >  recipes-extended/xen/xen-tools.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
> > index 8bdbfec..8b86f7b 100644
> > --- a/recipes-extended/xen/xen-tools.inc
> > +++ b/recipes-extended/xen/xen-tools.inc
> > @@ -1,7 +1,7 @@
> >  SUMMARY = "Xen hypervisor tools"
> >  DESCRIPTION = "Tools and utility software for the Xen hypervisor"
> >
> > -COMPATIBLE_HOST = 'i686-oe-linux|(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux-gnueabi'
> > +COMPATIBLE_HOST = 'i686-.*-linux|(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux-gnueabi'
> >
> >  inherit setuptools3 update-rc.d systemd deploy
> >  require xen-blktap.inc
>
> Not really caused by this change, but now when the build can be started
> it fails for me with:
> error: mapfile-GNU:1:9: invalid use of VERSION in input file
> Makefile:52: recipe for target 'libxenfsimage.so.4.12.0' failed
>
> Anyone else seeing this? It's actually raspberrypi4 world build, so the
> COMPATIBLE_HOST above isn't related at all in this case.

Thanks for the report, Martin. My first pass at repro'ing this did not
encounter this failure; but this is my first build with raspberrypi4
MACHINE, so it's possible that my config is different in some way. Are
you able to give any more guidance on your build configuration to
reproduce this? (MACHINE, layers and branches, conf file settings -
eg. enabling reproducible builds)

Christopher

>
> > --
> > 2.20.1
> >
>
> >
>
> 
