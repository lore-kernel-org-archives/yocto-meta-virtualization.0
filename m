Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F59C54EE9
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 15:01:00 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.5911.1663081255897524847
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 08:00:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jaJvq2tI;
 spf=pass (domain: gmail.com, ip: 209.85.215.177,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id bh13so11578029pgb.4
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 08:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=3Gdl9nUBlAQXGtU622iKDHtjGZ8kPNDOhpeF19detxI=;
        b=jaJvq2tI1vMoIAUwEufNZ61DYT4DHhCpyvBYX68q1n8n49vKKlbwS8qGeKZ2bY3HEL
         8SNQUZsb2nWV19k/hXL7LE/spc6ybf5LQDkaHuMNnkmwZ0Sbyx3E3ujT+pI08Q4AKTju
         1+8ZslWHWWQCklXsb1+E7U38ZhRHnheqTQLv1mHZx9hYbFrxQUbVTyADn/3Q/Oky5ojZ
         llCOVqswkZgQqwogyYuZ9CnZqx9q2qjBY6AJMTxcWb9oC0G/kjOKpMSICZWKCATVwtQJ
         zikxjH8Fd/3zneWAUmjYANeMZjtNJTtJ6dNsOc4zqA9wXKEaiDUL42fmjzJr2WYroeth
         vK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=3Gdl9nUBlAQXGtU622iKDHtjGZ8kPNDOhpeF19detxI=;
        b=sWprn1E+4sjoiGovHKw/f+XZtnX0WOxGmseVPVgm7wydP0QvbmQ/hKCAeQPbwKyPm6
         UvJh7kzSLwRo8vC7vyV/Bu5mzi0v5DEWhGZ9clZ3Xlw16BZK1ulEa32+0dFS66I/OTGf
         Y5LfC49Ph6orn90XdiLaTVUl0TUkfQL/tXpJoyw2OXvRUduPd8rHEwI4loOIhM8GIh09
         lGIbfO8i/uGJiFTR9odkwj1ljEkGuTzipgndPU8SmbZJgEC3JCcEJYQz4g/Awru9wkkk
         8lXmt20+xMGSsfy9GBdnTF6cRCRnAOkg8IU17X7W7tEVXD+XuB0kUEc8GlBvCdk1Mcjy
         46pg==
X-Gm-Message-State: ACgBeo1Dx+SE7aCWEGyDM5Hq9Bk42bjQSrI8qqYGZGmurft7oaBqr5yK
	4Iv7T12mdLRfk+87MpY3grti/geYZLNKjrKJp+8=
X-Google-Smtp-Source: 
 AA6agR5LmqdiiCp+6wskYH4YKedo72qFDFY5ZgYWL42v1PbqZUUTV4LnNDhagQ4zpXaTAaE3l0scAjh9tHzhGlz3ZoE=
X-Received: by 2002:a05:6a00:84a:b0:542:4254:17f9 with SMTP id
 q10-20020a056a00084a00b00542425417f9mr14225428pfk.75.1663081255217; Tue, 13
 Sep 2022 08:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <X3gR.1663080644352218398.7GPk@lists.yoctoproject.org>
In-Reply-To: <X3gR.1663080644352218398.7GPk@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 13 Sep 2022 11:00:44 -0400
Message-ID: 
 <CADkTA4PtNy0Oxs2H0w-zY342dd0oMJpbgqs6=uDhf48gR=o+6g@mail.gmail.com>
Subject: Re: [meta-virtualization] What the proper way to enable
 meta-virtualization
To: Kuzemko Aleksandr <kuzemkoyocto@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 13 Sep 2022 15:01:00 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7614

On Tue, Sep 13, 2022 at 10:50 AM Kuzemko Aleksandr
<kuzemkoyocto@gmail.com> wrote:
>
> Hello.
> I want add meta-virtualization to Boot2QT distro. When I git  https://git.yoctoproject.org/meta-virtualization/ and add
>  ${BSPDIR}/sources/meta-virtualization to bblayers.conf I get error
> $ bitbake b2qt-embedded-qt6-image
> ERROR: Layer virtualization-layer is not compatible with the core layer which only supports these series: kirkstone (layer is compatible with warrior thud)
>

This isn't unique to meta-virtualization, but is a question about how
OEcore manages layer compatibility.

You can find references to it in the various Yocto documentation resources.

The short answer is .. you need to check out the "kirkstone" branch of
meta-virtualization, if you are building against an OEcore/Yocto
kirstone release. This same thing holds true for almost any layer you
want to use. From the last part of the error message, it looks like
you have a warrior checkout of meta-virtualization.

Bruce

> I am newbie in Yocto, please help :)
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7613): https://lists.yoctoproject.org/g/meta-virtualization/message/7613
> Mute This Topic: https://lists.yoctoproject.org/mt/93656957/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

