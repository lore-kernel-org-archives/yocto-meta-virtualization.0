Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC0D5FF885D
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 11:40:23 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11343.1777376421890555141
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Apr 2026 04:40:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KZTaonHA;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-50e5bea4045so78599831cf.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 04:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777376421; x=1777981221; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hwHwFLZ0bLBb5JXW8is8xsnN77eqahGUFpcMvfG5Tpk=;
        b=KZTaonHAW+nOmAr2nh6hwmcGXVbAlz0FmK9UiQud914gjqWrskGMTDHaRj76z0lm/x
         4EMCHj2e7XUpAHH+xAgSGkmamVK1/NWn7irbSTsCiomHkd6b7qfs9kC67b1lfuNNjuXH
         poHqK4qSKWuy7MwhaLiepLPpGvpK3Y5O5YXr6O3yXyBdW0J5tXMPGIYVoYaCa7w0nl1F
         ESo9qoSG+sFASqFrF3jz0jCbKnLp9VPby3FRbLkyUsoXWCM1QVwWrJuPj0Men6Fkr7FW
         oJxuqjeV9THe/gSQlRM89R6bPN1rj/gfYYczVyu3dVrCNt4iDrpT7w4NWWVg3Nqlrwuc
         arqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376421; x=1777981221;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hwHwFLZ0bLBb5JXW8is8xsnN77eqahGUFpcMvfG5Tpk=;
        b=j3DjydT6Z0mtca5upzRtw1Uo/8kMm7GJfOF1altBGoqbrVWkdLnrdYxmIO9/PBCrUr
         eTwEkb5IlEu5Z8XH6wL2G9cqeZOKBAwJiolRgKy+jigHYfcWRIoqQSJczmqCknrAjcao
         a1bGSDIAmCgt4radpDklGVlHWY+X5/Uhme+k/4XzyvTwvvkPJh+zPveJYrwWmx8TzI9J
         3P6Tj3o7fL9ry76vpg+hTagXPcLKikvJD/j7p9ZjIOIzy6DX7/hfwORe8tAVttJKQwna
         95oa5E0a0Nd8Sz1PDI6tUkVXsAu785Wso1elDkcSCuhEBdyc/A76A2P1dGsu7yAPjtse
         zd/A==
X-Forwarded-Encrypted: i=1; AFNElJ/xTiD7liGgCshLetiesGl73iucKMmNZcu+HG7Sq0gEja8OT2/HGnuCZ2FQZWkRhMHWUXPX69U/iAE5vR70EwuUjmjD@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwQN0jUHozsyOndCB6iMqR8+ZEAFdcOGrxPMMzz6nvY1ZD8Lg8F
	Y6atXX+cOVUMxwi0KCYaSpaSCfzwnMf6Q0/RbgiehRmqpE8ODly0oWDI
X-Gm-Gg: AeBDietBqQd58k2iNqIteYbrgFXFhIA08gQWbeO+adfI8K8r2d17ORtECQUaN3Onn2J
	2OAmV1PTqAowGxQsI0wpIMrYoCrqs1PkDYz6B7z4E8RdrUMLfMLOwQw95L8rLtFCkFpytXs9AzX
	Ib9uOX0rDzETZ5CJe6TW53DlXDEHAbIcxgcUG/jWl2wd4rEVZNAsYdwTPu1alxasJsVbJBUpD2m
	slEmTZn846oIb2xJL8BZ8827HF0EiOiu1qsbETaLdw+m34OLFGPmFUD3IQnXCsrtngVwC8VYLq2
	EZs4xBn4G8OnMP9b9FTq/Gj4HgnLGJTVD/WOaZrITPSStr/6cPzrCmaT+NsJTmeEY196NSbeHuW
	KFIVLyOBXX0amT10bjq1eYli+MutGV5UpF4x03xbSNNyrnwzFSOpv/ogDNDAsx3J4OmIo3egByW
	iloiXNkfGZw46Ah4/PuTeduwFyemOXmYmTzeykqQAtuqOBLeHhfyDeqzFgINo9gTPbVsSTkud/N
	PNSDcq9060l2nE8vI/zIVqHB2qof9bP1tmUtWizq9MfkNA=
X-Received: by 2002:a05:622a:a18:b0:50d:8bf2:45cd with SMTP id d75a77b69052e-5100e1ab432mr31345531cf.34.1777376420630;
        Tue, 28 Apr 2026 04:40:20 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3e281c5f8sm17561916d6.7.2026.04.28.04.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:40:20 -0700 (PDT)
Date: Tue, 28 Apr 2026 11:40:18 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: raj.khem@gmail.com
Cc: zhixiong.chi@windriver.com, meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] systemd: add openssl PACKAGECONFIG
 for virtualization distro feature
Message-ID: <afCcov9P-GuAYNmX@gmail.com>
References: <20260421074617.1646975-1-zhixiong.chi@windriver.com>
 <7ecfecca-4b96-49e9-b259-0370f38eafa8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ecfecca-4b96-49e9-b259-0370f38eafa8@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 11:40:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9758



In message: Re: [meta-virtualization][PATCH] systemd: add openssl PACKAGECONFIG for virtualization distro feature
on 21/04/2026 Khem Raj via lists.yoctoproject.org wrote:

> 
> 
> On 4/21/26 12:46 AM, Zhixiong Chi via lists.yoctoproject.org wrote:
> > Since libvirt was upgraded to v12.1.0, the new systemd service file
> > virt-secret-init-encryption.service has been introduced, and it requires
> > systemd to add openssl to PACKAGECONFIG. Because systemd-creds encrypt
> > command will be executed in the service file, which depends on openssl
> > is enabled.
> > 
> > Meanwhile this service was added into the dependency chain of the main service
> > libvirtd.service, and will be enabled by default by libvirtd service without
> > any build dependency detection according to the original upstream commit
> > https://github.com/libvirt/libvirt/commit/97758bc9a0b1fccf8c0009308658f1204b113b89
> > 
> > In systemd oe-core recipe, the openssl PACKAGECONFIG is disabled at default.
> > Finally the service file virt-secret-init-encryption.service and libvirtd will
> > be failed as the following error:
> > > # systemctl status libvirtd -l
> >   * libvirtd.service - libvirt legacy monolithic daemon
> >       Loaded: loaded (/usr/lib/systemd/system/libvirtd.service; enabled; preset: enabled)
> >       Active: inactive (dead)
> >   TriggeredBy: * libvirtd.socket
> >                * libvirtd-ro.socket
> >                * libvirtd-admin.socket
> >         Docs: man:libvirtd(8)
> >               https://libvirt.org/
> > 
> >   systemd[1]: Dependency failed for libvirt legacy monolithic daemon.
> >   systemd[1]: libvirtd.service: Job libvirtd.service/start failed with result 'dependency'
> > 
> > > # journalctl -xe
> > 
> >     A start job for unit virt-secret-init-encryption.service has begun execution.
> > 
> >   systemd-creds[1251]: Support for encrypted credentials not available.
> >   systemd[1]: virt-secret-init-encryption.service: Main process exited, code=exited, status=1/FAILURE
> > 
> > The above error info "Support for encrypted credentials not available." comes
> > from systemd-creds command provided by systemd without HAVE_OPENSSL option at
> > the source code src/shared/creds-utils.c
> > 
> > Here we enable openssl for systemd when 'virtualization' is in distro feature.
> > 
> > Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> > ---
> >   recipes-core/systemd/systemd_%.bbappend         | 1 +
> >   recipes-core/systemd/systemd_virtualization.inc | 2 ++
> >   2 files changed, 3 insertions(+)
> >   create mode 100644 recipes-core/systemd/systemd_%.bbappend
> >   create mode 100644 recipes-core/systemd/systemd_virtualization.inc
> > 
> > diff --git a/recipes-core/systemd/systemd_%.bbappend b/recipes-core/systemd/systemd_%.bbappend
> > new file mode 100644
> > index 00000000..617caccb
> > --- /dev/null
> > +++ b/recipes-core/systemd/systemd_%.bbappend
> > @@ -0,0 +1 @@
> > +require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', '${BPN}_virtualization.inc', '', d)}
> > diff --git a/recipes-core/systemd/systemd_virtualization.inc b/recipes-core/systemd/systemd_virtualization.inc
> > new file mode 100644
> > index 00000000..585f4c35
> > --- /dev/null
> > +++ b/recipes-core/systemd/systemd_virtualization.inc
> > @@ -0,0 +1,2 @@
> > +# libvirt acquires systemd enable openssl PACKAGECONFIG
> > +PACKAGECONFIG:append = " openssl"
> > 
> 
> Can this be all in the bbappend. something like below
> 
> PACKAGECONFIG:append = "${@bb.utils.contains('DISTRO_FEATURES',
> 'virtualization', ' openssl', '', d)}"

I could absolutely be like that. I had already merged the
change before I saw your comment, so I've left it as-is for now
as it follows the patterns of other meta-virtualization conditional
includes (that are more complex and actually need the .inc file)

I have a feeling that we'll need more systemd overrides in the
future, so let's see if anything else comes in, and if not, I'll
make it simpler in the next update cycle.

Bruce

> 
> > 
> > 
> > 
> > 
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9721): https://lists.yoctoproject.org/g/meta-virtualization/message/9721
> Mute This Topic: https://lists.yoctoproject.org/mt/118934409/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


