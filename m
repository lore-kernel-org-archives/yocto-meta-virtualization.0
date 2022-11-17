Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1925C433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 23:33:04 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web11.5627.1668727984203466129
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 17 Nov 2022 15:33:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DC2BcIsJ;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id s10so2656534ioa.5
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 17 Nov 2022 15:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kxWsxZ2s4BcovS9HQjDCkaGWPHr66eRG9Y7nLdmDRHw=;
        b=DC2BcIsJa9F5wn2RWAzqhrsLA6UqS/8odU3pivl/P9RoVGc4Bgtp77lC3HWwdDqo0Y
         JnZ7i7tAU3zfws0cGeLif0XNF8Y3vfLDziKfJjtbQ6T8FYkckVZi+Oisx49nCBo/2muo
         j3+K7/UioXMNen9nEyzOyEJzbdZmCI08zb+mBV9nl/9GN4scwQphNO4gzi5yBlPBBOfH
         /tXLHZD2HdCGDXS2zwhS1L4gdGeUUK65WIBnHa2kq65uL/mMD6csEFOvl25uqacAODBO
         Xk74aRk3C7E5z2JFuyNzh9vyO+ZBvC7xptRX8aPHwbs9NtgtVmIrJU1PzwFbSl8bcL5K
         wuMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kxWsxZ2s4BcovS9HQjDCkaGWPHr66eRG9Y7nLdmDRHw=;
        b=ktFLDSJL124QmJqAn9D5BVjHUAuVfimEMR6SFhT8q52X4YCTJn0S46/iU7dfRqJdik
         WBI4SMQd3/RYk1rJMCUJROpV2anBuJ5nWGM8IifCTEXj/LwxyPbEgjk97NOYLCvu0VFK
         Igzc9ptoUdyBRvbjI5hrlGXuaela8Cv0Nfk5FSRc00XT5xiCNQP69F/r7MYaubREntJB
         Yokf8oZZSyWwoCIOzvluzjCejqjXLVDxVGXutaTh6QVcs1Cw9ECiJBjAhVP5VvsrXrWl
         zrGEK1uaWPD2/8BpigSy+V74QaxBA5f247YeMsUyGjW/xin+QSYM1aSbHo9TnFQ8+XRR
         MhKQ==
X-Gm-Message-State: ANoB5pk6pqSQ82LHNMxMGo5oplWmCiVIqd0vb9iL9bjPg1WSbDzOceTe
	F8Tyq9prnm/O+tddFuQtwcVOjAMGOAhLYlwInAM=
X-Google-Smtp-Source: AA0mqf4dawXBBNSljzdm8ldXB5bMK0eferVFJHIoJRfrdb7pr8nq7+5Zv1hrLdEejtaQAfKvJgeF22qxr3dY1KejNzs=
X-Received: by 2002:a6b:b584:0:b0:6ce:c240:139 with SMTP id
 e126-20020a6bb584000000b006cec2400139mr2369901iof.83.1668727983413; Thu, 17
 Nov 2022 15:33:03 -0800 (PST)
MIME-Version: 1.0
References: <3130543.zt3vOreWX6@serenity> <CADkTA4O=km=BdAbC5=g6+e0eLgfJ2GGqc3QvkTTNkOZ0e4yYYQ@mail.gmail.com>
 <3063635.q5XDOhcSLO@serenity>
In-Reply-To: <3063635.q5XDOhcSLO@serenity>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 17 Nov 2022 18:32:52 -0500
Message-ID: <CADkTA4P8s4Eq9J-O3d7Me=0hxaowjS2exwYUhN8Nx+RbAgxUeQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] nerdctl: renamed upstream branch
 master to main
To: Guenther Meyer <g.meyer@signum-media.de>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 17 Nov 2022 23:33:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7686

On Thu, Nov 17, 2022 at 4:25 PM Guenther Meyer <g.meyer@signum-media.de> wrote:
>
> On Donnerstag, 17. November 2022 19:23:08 CET Bruce Ashfield wrote:
> > The change itself is fine, but your patch came through mangled, and it
> > doesn't apply to the repository.
> >
> > I could make the change myself, but it is probably worth sorting out
> > which part of the patch sending chain caused the corruption.
>
> Ok, what's thew problem? What can I do?

How did you relay the patch ? Was it via git-send-email or something else ?

Following my normal workflow and scripts, the patch is definitely
garbled/line wrapped:

build [/home/bruc...ualization]> git am -s
~/incoming/0001-_meta-virtualization_PATCH_nerdctl_renamed_upstream_branch_master_to_m.patch
Applying: nerdctl: renamed upstream branch master to main
error: corrupt patch at line 16
Patch failed at 0001 nerdctl: renamed upstream branch master to main
hint: Use 'git am --show-current-patch' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
build [/home/bruc...ualization]> git am --show-current-patch
Date: Wed, 16 Nov 2022 14:09:27 +0100
From: Guenther Meyer <g.meyer@signum-media.de>
To: "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization] [PATCH] nerdctl: renamed upstream branch
 master to main

Signed-off-by: Guenther Meyer <g.meyer@signum-media.de>
---
 recipes-containers/nerdctl/nerdctl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/nerdctl/nerdctl_git.bb b/recipes-containers/
nerdctl/nerdctl_git.bb
index 5d4d827..343c85d 100644
--- a/recipes-containers/nerdctl/nerdctl_git.bb
+++ b/recipes-containers/nerdctl/nerdctl_git.bb
@@ -13,7 +13,7 @@ DEPENDS = " \
 SRCREV_FORMAT="nerdcli_cgroups"
 SRCREV_nerdcli = "48f189a53a24c12838433f5bb5dd57f536816a8a"

-SRC_URI = "git://github.com/containerd/
nerdctl.git;name=nerdcli;branch=master;protocol=https"
+SRC_URI = "git://github.com/containerd/

nerdctl.git;name=nerdcli;branch=main;protocol=https"

 include src_uri.inc


-- 

2.38.1


>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7685): https://lists.yoctoproject.org/g/meta-virtualization/message/7685
> Mute This Topic: https://lists.yoctoproject.org/mt/95065671/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

