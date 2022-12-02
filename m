Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5075CC4332F
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 04:39:49 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web11.67404.1669955983522350891
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 01 Dec 2022 20:39:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bHGbdWXv;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id y131so1771874iof.9
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 01 Dec 2022 20:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BysuFmKxrumyXMxJg19iS+Ze6Sc35EUUy0C6bRO6FZA=;
        b=bHGbdWXvypm9iO5go7kWbj5Z9ZzQg+j9DUHzYJeezMWFkhS1Mhr/aazGCYb2Xh4QTk
         YMtxYuemXRefKOQ4aZ91myQmcwKq+kDq3/pwgzDj8al+Cr+/yw80bCRJAEX9QIc58c+S
         GhesqkIpzqFyQ6qhvM+igDTFUId08e9IKT/7HpgLpK/NmsdEuXRu0EY9UsTB2ds+uLSs
         VjbXWi30rGJX3uIKJHOBZV+mG89DhA99fSVCT5QyNLl8fT2KICU3aPmQrmgfDNcBvYUD
         sUy1cDE4qPiOKUXhHZqogKGl9DRHTwddicatRzsPEg/YA6mOg8PLxQxHk+p0tXE1UF8e
         w9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BysuFmKxrumyXMxJg19iS+Ze6Sc35EUUy0C6bRO6FZA=;
        b=CTB2ZHdTD9BOB41cWQi9mYuFCAVpeTXaFYgFCmONrWLBAsjp5fk1my0OtM/QmR3Tzp
         xdnOWne8ntzDAQ7UwiT0XWstM2uFBr0OEypouVUFBl4zwBVf/hTlhSQ9j76kOhgmUgWL
         e4KDWHyzTlM1OmQ8p5v18F2+J+9v+zCtoLTKKbSBvtHAuyFmK7KNSPE3omFNNyG5X2Gj
         lGfdDM6XQJnZAXVRML0XJ3pvHBaTn8sO6nhj55sVfEkYRpSu/O0GYvht1fbL3zwFLa2Q
         qoCba2P+uWYVTKO3ZwQYhP2+N+a3gfOsjO6mybSXTTu0KcfcoOLW2WsC1muWm64Vx13J
         mRCA==
X-Gm-Message-State: ANoB5pmgzi0YeC+US3e26rvO9RoJgfX7rIgw85wWOd/9uSGcHjJUEOeb
	ZQbt9eV2q5o9JgsFiyItXD18uiVHPt4vnqsyy0E=
X-Google-Smtp-Source: AA0mqf7g9+yVU1i98jqYWd+TLgsNoTmVyUrdWBxu2ef6zYfs4a3P3mDDR+zjYTYHZ79OXAnXWsCP0KN/0cH1ygMhOUc=
X-Received: by 2002:a05:6602:378f:b0:6db:7942:d64a with SMTP id
 be15-20020a056602378f00b006db7942d64amr25892946iob.198.1669955982792; Thu, 01
 Dec 2022 20:39:42 -0800 (PST)
MIME-Version: 1.0
References: <20221030161333.12430-1-f_l_k@t-online.de> <20221030161333.12430-2-f_l_k@t-online.de>
 <CADkTA4PfHFDrq5McxwSLg957MpFVjZgWpUiBzFm18AM4xUO-sg@mail.gmail.com>
 <6GGOKR.9UDK9PG7M6LM3@t-online.de> <1723CB4C1BEE0B79.10635@lists.yoctoproject.org>
 <CADkTA4N0z=j7AjV9g1-kHnTzX8vSgDSL_4Qj8iNZaeXjyQdtwQ@mail.gmail.com> <V6BTKR.V7B3NTHJZAU82@t-online.de>
In-Reply-To: <V6BTKR.V7B3NTHJZAU82@t-online.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 1 Dec 2022 23:39:31 -0500
Message-ID: <CADkTA4OLtXws3p3HDcpMgkgT2q7Ar558mJQ+7u7r-STdebbRcQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/2] virt-viewer: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 02 Dec 2022 04:39:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7727

I finally managed to get enough time to look into this more, and I've
pushed my fix to master-next.

Everything should now build without QA errors, and I expect to have it
merged over the weekend.

Bruce

On Fri, Nov 4, 2022 at 3:23 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> Am Do, 3. Nov 2022 um 11:23:25 -0400 schrieb Bruce Ashfield <bruce.ashfield@gmail.com>:
>
> but libvirt still has other TMPDIR QA warnings that still haven't been fixed, so I don't consider this an absolute blocker. I'll have a look and try to fix it.
>
>
> Thanks for the help!
>
> Markus



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

