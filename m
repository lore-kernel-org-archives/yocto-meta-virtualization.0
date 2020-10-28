Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
 by mx.groups.io with SMTP id smtpd.web08.2364.1603913118823547865
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 28 Oct 2020 12:25:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ku7oI9Jt;
 spf=pass (domain: gmail.com, ip: 209.85.167.194, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-oi1-f194.google.com with SMTP id f7so739679oib.4
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 28 Oct 2020 12:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J4abD/pC13+/qLpnIQuamP+myJ5+rnWOZePO0kEn63c=;
        b=Ku7oI9JtKDJbEcDm4BbBLdo6gcnAzv6NMM4Blbx0QW7+P8Woe7jaF+UCL+yMfUBVVS
         FsMHhWx3YgpMe32wbyJznLCVKq+9Cd5e8uMZEafHGTjb516iN0agEdh9dLnYpujfrP4q
         pJxQq+JgUu+2bydoLW1C5LtEmzhHSt+NL+XPKNc8N0pnzyHK82+C/FXTpQq2Ha8Fiku/
         L3fkCfH7bC9noNNwtHHdMVe57qCHd26MIn/WrybdsOvncCNvnN5DEkeDr1X1vy5PAz3E
         DIxq5ccCFWIxr1YJ9POb4N9Ow/oUZlRbHrbK8Flp/zwdTbPvBBeTps1j6fwL3Gg9Vutw
         MFeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J4abD/pC13+/qLpnIQuamP+myJ5+rnWOZePO0kEn63c=;
        b=az1lYGA6v0hUwLlw7dWfQJ2LYtEHt84XM8HI/lJzO0s+afUwCugOw0CZrZO+iNU/oY
         fR2c4L/AXm6eUvRDmR/0PLt6q3fgTq0Wgz1RygcToISo02AEK2eB/g85yGtC18q0kImn
         YTnV0Lm6wJQXgnrU2ulcn9l9G9fvEI9QGQ769NLuBvm/ZRyq+tlYsEdX6DUDy2OqVc0H
         RAFR74gMb7ilc+S5nP7pzSyxUjpcXAcheTE2+s/+tLQ3+YlnwItuUKsnHHke3AH4DM4/
         NxbCaJZG9sX/UKw3LoPHBv5I2uy6j0b9CcTMgQXaYWqhM0hVcX+ZcrfNKPnawdMDlx2Q
         VkmQ==
X-Gm-Message-State: AOAM531RWIWSoA/js1H/WOpo6b4sFts0BOIfzk+pkBMl6nK0PE8vQ+N3
	qaxoD+Zt6SZxKb3DrcgNz1oN0CZkz1jI5mr7mFQ=
X-Google-Smtp-Source: ABdhPJzIV2FJ5Fz4A3u6kKpAFkvCof/9Qr8IXs+K3Vta0lPc9Jzh6+887cOS8zh4/tLbQzkp9FSiur5QqFEzXpnHxrg=
X-Received: by 2002:aca:3b86:: with SMTP id i128mr370247oia.152.1603913118104;
 Wed, 28 Oct 2020 12:25:18 -0700 (PDT)
MIME-Version: 1.0
References: <20201027155536.12513-1-diego.sueiro@arm.com> <36EAA7F4-1823-4119-8982-AC32E9C6BCD2@arm.com>
In-Reply-To: <36EAA7F4-1823-4119-8982-AC32E9C6BCD2@arm.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Wed, 28 Oct 2020 12:25:06 -0700
Message-ID: <CACMJ4GYdGs7dr4s=fmmNCeAO789mQ15o+PUci4jG0hasWivxnQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 1/2] xen: run do_deploy after do_compile and do_populate_sysroot
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Diego Sueiro <Diego.Sueiro@arm.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>, 
	"cardoe@gentoo.org" <cardoe@gentoo.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 28, 2020 at 1:51 AM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi,
>
> > On 27 Oct 2020, at 15:55, Diego Sueiro via lists.yoctoproject.org <diego.sueiro=arm.com@lists.yoctoproject.org> wrote:
> >
> > When having rm_work and bitbake needs to re-run do_deploy, we need to ensure
> > that the ${B} is re-generated, otherwise the deploy-xen will be empty.
>
> I can confirm this was encountered by me to and this is solving it.

This change makes sense and thanks for including the update to comment
in the commit.

> > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Christopher Clark <christopher.w.clark@gmail.com>

Christopher


>
> Cheers
> Bertrand
>
> > ---
> > recipes-extended/xen/xen-hypervisor.inc | 8 +++++---
> > 1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/xen/xen-hypervisor.inc
> > index 3bfee8e..6a75d16 100644
> > --- a/recipes-extended/xen/xen-hypervisor.inc
> > +++ b/recipes-extended/xen/xen-hypervisor.inc
> > @@ -76,11 +76,13 @@ do_deploy() {
> > #   at least run afer that task has completed
> > # - the hypervisor binaries may be included in the image filesystem, so we
> > #   must ensure that the binaries deployed match what is staged in the sysroot:
> > -#   so do deploy must run after do_populate_sysroot -- which is always after
> > -#   do_compile, so that handles 'after do_compile' too
> > +#   so do_deploy must run after do_populate_sysroot and after do_compile is
> > +#   also needed for when having rm_work and bitbake needs to re-run do_deploy,
> > +#   we ensure that the ${B} is re-generated, otherwise the deploy-xen will be
> > +#   empty
> > # - add the task before do_build to ensure that deployment has completed when
> > #   the recipe build done stamp is written
> > -addtask deploy after do_populate_sysroot before do_build
> > +addtask deploy after do_compile do_populate_sysroot before do_build
> > # To ensure that a deployed hypervisor has matching tools, add a dependency to
> > # make sure that the tools have built and been staged:
> > do_deploy[depends] += "xen-tools:do_populate_sysroot"
> > --
> > 2.17.1
> >
> >
> > 
> >
>
