Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C00EE6B73
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 20:07:09 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3907.1770667619937896472
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Feb 2026 12:07:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CwA6BXsY;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8c710439535so10597785a.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Feb 2026 12:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770667619; x=1771272419; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pEnRjXEslGY7qU+W/vnmdbi7Q3YocLagKwKq4ICeYzk=;
        b=CwA6BXsYIhW13YhFPsJQw0R8q4pQ8jmf28C1MqoNmGLGYr8J1L7EYGS1YwwJYLoWkH
         SqNMTp0PPxbc3KW6000YGrj3ku30G3XkLt9uFSC1qyeFPqcz86xOJi6YWRubDLvKtX6C
         /6KvLgLBqzokWRUVYkWSn4800wvytFVQMAz0xPoNbmibAqdYgO6wEZjsTqdwGhRWo+Kx
         hYeibpuYdaZUblqsk1BFWdtUeSC9zfD5KT+j63M3Gn2buY5v7FrQn/hjPpfPL8wExDSe
         jTdyL7wPv2aPGs0IbY0MYLaFYZar0SMGiNkBP+loqPVpBeHP4Gseim1aOJV6tZ8QX93/
         ZfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770667619; x=1771272419;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pEnRjXEslGY7qU+W/vnmdbi7Q3YocLagKwKq4ICeYzk=;
        b=QlvSUDlrfVV97M/CegvmnaVIW7wEBrbXm8mvWbSGcCspJJgT6zWsWhIma7ckN1WILk
         dKWdFvSfX1fJtcTol7Rz/XDTQL5H6bAzXexTHl+o7v6aWC31ZcwsUgZk5DX33+JcvWnN
         BTJG5051BsnJAyr+yWfmtqkLnArdrsfYnpuBAHoiKX2h9C4K8i0s9pNAEqX7lFhWPVKN
         FjsR3/VzUOAnq7yT5LkUvsQLMIebdbP/clV7Ct/Zq5kKJ3xwTxALNM7DBp0WD5FTke4m
         OFmeHftiqRMTlLBwivW0WIPllufPhKbTBdZEnQcMmV8xeGWOHNomJmCv2OgvEDZrlscd
         CQUQ==
X-Gm-Message-State: AOJu0YzTkIYVCaOxgEo5NKVOJwHwriA6J9JAuuzK18KqXMESVqAQ6NeG
	K8e1a/WzfQgxX7Xs18Jxu4b6fWGxEl2eE8sknXfLtZrWfracmDQwbgMg
X-Gm-Gg: AZuq6aKgvmMaMXzm9Yj/H042aWkPCWy7LvCuOTI/dFjOqAsaLzyaoqkh4Q/kOkmeIhm
	Wwy0DtbRUxzTfu7c7XRiI2e5Zhvb83zjfFbhO2JiViY9zONVfvMD7WATTvq7M7BLqZ20mNabLzj
	L5yOimySR6p1EdBP1sAy8h+H3ozDFyBOLdSw16zssYwfaMIcJumEmP3Z+aEOSAifoBdyIGGGRhE
	9N+yK78XwmsSg4uEiaJWLr+KND2TcxRmdahIav4ztrPFUfFZ/C+vuyf+g1SQc4rwGvcxK4aDRLb
	Ov/eWWzXmqHZMwv2bN2t80ICfpXoXrRrbzlGvf8zngAZ9/ZfkH7i6S6aLY1tEw9fsHwtp1SK0pt
	S4x1MU3QcnqVooA0Gtf9j+wJkayXXmfu/Mrv/2QRg8in+IJYhBHDYaxDiJjFIwAUZOoZl9Wow/S
	t1BvA10EnUP14ZSOQri578iLTRYMZ9ER3ZUIRgQ0T5RbhZhg8jf9FHSaVCOtUA8QQDBO4iMod98
	B+RDpbxbDIsOLY3jC0VhaZu
X-Received: by 2002:a05:622a:1809:b0:506:2048:36b9 with SMTP id d75a77b69052e-506398d1878mr167500621cf.14.1770667618658;
        Mon, 09 Feb 2026 12:06:58 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-896fbdb3663sm39517926d6.20.2026.02.09.12.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 12:06:58 -0800 (PST)
Date: Mon, 9 Feb 2026 20:06:56 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] nerdctl: use -modcacherw to avoid
 do_rm_work failure
Message-ID: <aYo-YEn4nriQZ2cg@gmail.com>
References: <20260203035140.902906-1-Qi.Chen@windriver.com>
 <CADkTA4PmJ16DoD8sdN1XrU3ATJY_Q-MEwCZX9bpk61QY5+qoYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADkTA4PmJ16DoD8sdN1XrU3ATJY_Q-MEwCZX9bpk61QY5+qoYw@mail.gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Feb 2026 20:07:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9571

In message: Re: [meta-virtualization][PATCH] nerdctl: use -modcacherw to avoid do_rm_work failure
on 04/02/2026 Bruce Ashfield wrote:

> On Mon, Feb 2, 2026 at 10:52 PM Chen Qi via lists.yoctoproject.org <Qi.Chen=
> windriver.com@lists.yoctoproject.org> wrote:
> 
> > From: Chen Qi <Qi.Chen@windriver.com>
> >
> > When rm_work is enabled, building nerdctl fails because do_rm_work
> > fails to remove the contents under pkg/mod/ as they are readonly.
> > Use '-modcacherw' to fix this issue.
> >
> 
> I'm going a different way to fix this.
> 
> I've avoided using modcacherw so far, and would like to continue as
> having it on can mask some issues.
> 
> I have permissions fixups, they should be firing for this, and I'm
> sorting that out now as I work through some package updates.

I moved where the permissions fixups fire, so they should now
run after do_compile (which may change the permissions).

This means we don't need per-recipe fixes, and it covers all
types of builds (directly invoked, makefiles, ones that don't
inherit our variables etc).

Bruce


> 
> Bruce
> 
> 
> >
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  recipes-containers/nerdctl/nerdctl_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/recipes-containers/nerdctl/nerdctl_git.bb
> > b/recipes-containers/nerdctl/nerdctl_git.bb
> > index 8f63b48c..1c37bcf8 100644
> > --- a/recipes-containers/nerdctl/nerdctl_git.bb
> > +++ b/recipes-containers/nerdctl/nerdctl_git.bb
> > @@ -78,7 +78,7 @@ do_compile() {
> >          export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> >
> >          # -trimpath removes build paths from the binary (required for
> > reproducible builds)
> > -        oe_runmake GO=${GO} BUILDTAGS="${BUILDTAGS}"
> > GO_BUILD_FLAGS="-trimpath" binaries
> > +        oe_runmake GO=${GO} BUILDTAGS="${BUILDTAGS}"
> > GO_BUILD_FLAGS="-trimpath -modcacherw" binaries
> >  }
> >
> >  do_install() {
> > --
> > 2.34.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#9554):
> > https://lists.yoctoproject.org/g/meta-virtualization/message/9554
> > Mute This Topic: https://lists.yoctoproject.org/mt/117611093/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> > bruce.ashfield@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
> >
> 
> -- 
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II

