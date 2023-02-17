Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B0DC6379F
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 14:14:24 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web11.7212.1676643258107667733
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Feb 2023 06:14:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VOVuVWRu;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id f26so544572ion.7
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 06:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8OehgIrNXYbwBh0bNwFuHuN8wFUiimo69WLsVyKN8fw=;
        b=VOVuVWRuhuSUM1YHLfMgTxWQK3YqoTm4swrIC9JZfVu8wKetNH/M6nXeM2dMVAJllj
         7jlv3wnIWdB6HlGscI/7rLK7kUpaxwjVNEkUNlvc+sNGzEWkhl9iODhqpc7A7YtuSw48
         f/rHzYzIBwp37cViyphoYMY1YnXonsOxzDHMTLSQdySUZ9voI5ZWhiV2kxonTfa3gJQZ
         w/fs7WOCJ0VQbQPVocApflbjNRlq1bM78GaoyycaA40a6hnJ2WhF7L340acTmO9npL2C
         ihQjR7UqHOBSnKfv9wYafrVNasIgiztQhgrzAjCozCcFhpl8Kc2wKb4Pw3nbQD0pzGNw
         Xj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8OehgIrNXYbwBh0bNwFuHuN8wFUiimo69WLsVyKN8fw=;
        b=eEWvbXbLvA/Wl4O3wdgTFpzYG3sRgmx4ResepgGC4pN5kz8NBMSfCephK7zH7RE0Rx
         nkhq6iZ7moIX82jJVjHNka55Bivf8C1RFt9g/6CzLc28Tfb2BWGnTCIxc0obP0I35lIF
         h/nRt1ZckTLHQAEA05Rah+X9thZkXcGldhL6iVN2svl0dXRgK0JEgJQPiwqwBUFLbeZU
         9UfagyFzYZolF2kySbQ4hWCiZtSlOO6SlLpucsSmgkGZ+yRp+pheavksTAxy/nszj6pI
         F83kdx9/txQU5Ls+Ixmi6S26gTeacuySKCvNlBAUvIIMskwyD/0BpTYbYvtC/CC354/z
         GIUA==
X-Gm-Message-State: AO0yUKUG24aPolVEIMBSVjq+VmmumeArVJlamygAfM+oESBbGOm/MqTk
	9ljNzsZmBQot+7NTgXupR1e95vB3uZPZb6P5N4m09v35aw0=
X-Google-Smtp-Source: AK7set/KsrC1CV9SGmAMynsMghAtRf9tsGq91X8L6EbH0fLZpO0rRG2YP20iXRG1J/C5O+C/gIA17UCelOGVgQKil2o=
X-Received: by 2002:a02:7a46:0:b0:3c5:1986:699f with SMTP id
 z6-20020a027a46000000b003c51986699fmr705654jad.0.1676643257339; Fri, 17 Feb
 2023 06:14:17 -0800 (PST)
MIME-Version: 1.0
References: <21754.1676335870049801294@lists.yoctoproject.org> <20503.1676484482559550816@lists.yoctoproject.org>
In-Reply-To: <20503.1676484482559550816@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 17 Feb 2023 09:14:06 -0500
Message-ID: <CADkTA4OyU+WYmL0X3rb5o_g-=9kRz5FExvLYJXUwOhpZhHyLAQ@mail.gmail.com>
Subject: Re: [meta-virtualization] query on container demo
To: SIMON BABY <simonkbaby@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 14:14:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7871

I'd suggest trying something we know is better tested before trying to
load and run the OCI images directly.

That error message normally means something is missing in your target
image, a kernel configuration, or a support utility that docker
requires.

What is your MACHINE configuration ? I assume you are using master ?
or is this an older release ?

Can you try a simpler docker pull, docker run, test to confirm that
official registry images work ?

Bruce

On Wed, Feb 15, 2023 at 1:08 PM SIMON BABY <simonkbaby@gmail.com> wrote:
>
> On Mon, Feb 13, 2023 at 04:51 PM, SIMON BABY wrote:
>
> docker: Error response from daemon: failed to create shim task: OCI runtime create failed: runc create failed: unable to start container process: can't get final child's PID from pipe: EOF: unknown.
>
> ERRO[0000] error waiting for container: context canceled
>
> Hello team,
>  May i know the reason for the below error while trying to run the oci image from docker command.
>
> docker: Error response from daemon: failed to create shim task: OCI runtime create failed: runc create failed: unable to start container process: can't get final child's PID from pipe: EOF: unknown.
>
> ERRO[0000] error waiting for container: context canceled
>
> Regards
> Simon
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7855): https://lists.yoctoproject.org/g/meta-virtualization/message/7855
> Mute This Topic: https://lists.yoctoproject.org/mt/96860300/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

