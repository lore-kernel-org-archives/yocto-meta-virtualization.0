Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FFDAC47088
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:50:42 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web11.45606.1669906240849383095
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 01 Dec 2022 06:50:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UeHXAzEm;
 spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id p83so1171597iod.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Dec 2022 06:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WnUJSkl6OJhpGbEUlinPqQl+ZIV5MWtu3zaT2jTBX/8=;
        b=UeHXAzEmhJBaeqFoL7M4URuf+Zb1Z96jevWKpn8LNpaW1SE5ZFr7h0N3+B4pSKmsz/
         9WbN19rprBjvMtArIszJllkgcGlOTyDOhUrX6oIXiOsY5hrtE9MuzwglA3Qxj4RF85T9
         Fy5HhhQQ/UJkZw7EuYFoWn2uPbPj6crMpaI6Ah8kBi0mxd9ydwn2hVZI8QqBvtyPINHr
         Uvs/CkeZDJQLBt1t9Oxb5JEWpzvQJZFln/WK0NqiiCFJW/DySBmryuAQ29qJN+y3V/H1
         IDzN9/TRZTSX3UdBw/6TW3UKgpz61npy/ZIz0HLphw1PICJAO6F5QQdYQ0HjDYYia2SE
         JSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WnUJSkl6OJhpGbEUlinPqQl+ZIV5MWtu3zaT2jTBX/8=;
        b=BgEH8AB+tX3d1libfMZvPZzEEfg11VNy+GDf/Ray9Cvuqf7PJQr5Ni4eeUzhCKl1vf
         YNS0lVhknwblffu8qVuDhfpE9x9hEftvmo0svUVvjhDfOVKJ8RLQaK+cQKAdQ4vwsYkg
         DEedHa+qIPPEu9IV/zk0VhkMpMAk6zgIA1eRCYjW6OOXFVh6pD94vUOTB/CHQ1iTvzoa
         /Xo/tCX+eDaIJaGzxIUa3jRXXxj9UizEmMRpS1Xj7jofJ3Jd3LRcisyo2C/IJkIP8RfU
         Zak2vQd8pPpNA2oHTloFYf/xhfjfjJQbE+1nm1xnXk5vvCg4FwLAhaT4Qn8zkDS/pOeI
         J+ig==
X-Gm-Message-State: ANoB5pkzajOup3gv6M5nzks35QsXuZftExmBzaVKdsbAVUJSJLKLYogJ
	PQ0gtlwX+LDJbComnOLgoD4veDPFB1M/v04PmjM=
X-Google-Smtp-Source: AA0mqf5o44CrWnfFC84BN/110EtPPFrm/UpJGi/g8mnZ/BV2JzGQ3kmX0re3dTg5tLGlQK+n+HwrSbY739H3gfMYXLA=
X-Received: by 2002:a5d:80ce:0:b0:6de:c30c:4d49 with SMTP id
 h14-20020a5d80ce000000b006dec30c4d49mr22719287ior.83.1669906240027; Thu, 01
 Dec 2022 06:50:40 -0800 (PST)
MIME-Version: 1.0
References: <ddf7cf66-0067-2ea9-dbad-a73bba79a5db@axis.com>
In-Reply-To: <ddf7cf66-0067-2ea9-dbad-a73bba79a5db@axis.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 1 Dec 2022 09:50:28 -0500
Message-ID: <CADkTA4PJ_RKxRpOd1GGm8h9DHpG3527NBdrGCcmm7Gdk03t3Eg@mail.gmail.com>
Subject: Re: [meta-virtualization] [Question] upx: do_fetch: Bitbake Fetcher
 Error:,FetchError('Submodule refers to the parent repository.
To: Joakim Roubert <joakim.roubert@axis.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Dec 2022 14:50:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7721

On Thu, Dec 1, 2022 at 8:46 AM Joakim Roubert <joakim.roubert@axis.com> wrote:
>
> Hi!
>
> On Kirkstone, since Kirkstone 4.0.5 (commit
> 189a6d452e3037c9e94ccdf6af38359fc6058064,
> https://git.yoctoproject.org/poky/commit/?h=kirkstone&id=189a6d452e3037c9e94ccdf6af38359fc6058064)
> the added check gives me
>
> ERROR: upx-3.96+AUTOINC+4e1ae22a1a-r0 do_fetch: Bitbake Fetcher Error:
> FetchError('Submodule refers to the parent repository. This will cause
> deadlock situation in current version of Bitbake.Consider using git
> fetcher instead.', None)
>
> (I noticed that latest master is identical with latest kirkstone.)
> I'm experimenting with using git:// instead of gitsm:// and adding a
> suggested solution if found searching for documentation on how to
> migitate this

There's been some serious re-writing of the repository, which is
generally speaking a no-no.

The hash we were previously using is completely gone. But then again,
we are using a branch called "devel", so history re-writing could be
expected.

The fix is not really about the fetcher,  but using a different git hash.

I've bumped the recipe locally, and our one patch can also be dropped,
as it has been merged.

That being said, I'm now running into cmake build issues, which I'm
working through.

I'll continue to plug away at it in the background today, and with any
luck can have it working again shortly (I'm terrible with cmake).

Bruce

>
> do_configure:prepend() {
>      cd ${WORKDIR}/git
>      git submodule update --init --recursive
> }
>
> but I've not yet been able to make things work. Since I'm no power user
> when it comes to Yocto magic perhaps someone already knows what would be
> the best way forward on this (if I'm on the wrong path)?
>
> BR,
>
> /Joakim
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7720): https://lists.yoctoproject.org/g/meta-virtualization/message/7720
> Mute This Topic: https://lists.yoctoproject.org/mt/95382316/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

