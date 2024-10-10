Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 076AACF11F0
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 13:03:50 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.42844.1728565425872919228
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Oct 2024 06:03:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UWd/s0Vf;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2e2916a92ffso879635a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 10 Oct 2024 06:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728565425; x=1729170225; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzVgnjSbwTDTb6sdSwO/4X/TZyA2/RYUPQOdRKTL2ME=;
        b=UWd/s0VfwcJka4V0WHRk4Jhz5pamkg5WbtSWk4wX87S4tjtEPwFG+f1Qt19f3vhEZB
         MUpnxJoKLrAnsq4cS9haPVVzbu22egVO+FKu3qxLaOEBPEOXu3ox1DlkDY8zzqreiZSc
         EMlSD3fVANZ+Rw7TDZ+Y5hkV9dqsrRsqlcX6YByEhOiA//KuNze1WbfoBiXfMML9XX8L
         ogpF0kkzL79f1n7FhPsbldv9CK9lGNMEoqIkHejWnjAcRUL/+kaWbDpM8hGQQAhJ3nbL
         4l2I66YG1qj4q5EccggjLg9D1ceSt1mEC2uffyYVfM8U6CdnYnU8HQXHlibsbMb2CeMJ
         vICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728565425; x=1729170225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FzVgnjSbwTDTb6sdSwO/4X/TZyA2/RYUPQOdRKTL2ME=;
        b=ugZhZbIoU5KUDNVns5WybudM0Y4+x1TqttDAwatCMI4YQpD1q0PhotDewJJsNCpSHV
         ViqwwpA/XJ6OKsoIOILazLYhQGZ9zMUW8RylubtdmzwSCaDtDBL2e09cBnLDpWEwBr40
         I4zRQFiX8b8xgu7YuG/yPctzhFz3ycSPQKkWpzuTnqVjJf7Y9TBSv9SIMVLHBNoV4cqu
         yu9mOFXQ4xipNKR1cVTYUk/uKQwyY9lzetjRAimctBZQdTjxJuEdqzt4NhSi45FjA1sA
         wayWp7O+SvT1RgpmA44TLHzuJo4Ddxm3nig7ziBMHZa2kSEUatBTEPo2Jy+uiqNbJfjx
         XRxw==
X-Gm-Message-State: AOJu0YxukyJfech6gGJTLgoMRnO3spbCQzl0Z5J+uo9CjvLyPbgIudO+
	tvJJmQaxMOzLs562UnJ4rPxf6yvoO6qcCLay05FubnX+fYxv9XzaK3AVgeGOtU4eapSBTugfgEw
	1m2hPJdOQe2SxxNe+MIbu6XFom/E=
X-Google-Smtp-Source: AGHT+IGLyZBRRAsZ1iEkavbJ3jQRvhgGuFVGaq+VsFuEo/16IpQ0sGeAmBqnk9y/Fp+ssWl55thCg3aj3J7hYMVd+o0=
X-Received: by 2002:a17:90b:134c:b0:2e2:bb32:73eb with SMTP id
 98e67ed59e1d1-2e2bb3275bfmr5487684a91.31.1728565425069; Thu, 10 Oct 2024
 06:03:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAERRtEuXxxZcjs0fGovUhF_dufQeco7dNM=zaU5aFJ9baoszog@mail.gmail.com>
In-Reply-To: <CAERRtEuXxxZcjs0fGovUhF_dufQeco7dNM=zaU5aFJ9baoszog@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 10 Oct 2024 09:03:33 -0400
Message-ID: <CADkTA4N5eTYG8aTbjBfRspdR-25+0a3aFSGnjR_y63d8b+mtxA@mail.gmail.com>
Subject: Re: [meta-virtualization] Canonical LXD on Yocto
To: kev.ferber@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 10 Oct 2024 13:03:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8922

I have some partial work on it that I did about a year ago.

I never did finish the recipe, since there were runtime issues and no
one was asking for it :)

It is something I'd like to have in meta-virt (the fact that someone
made an entire separate layer for it .. just makes no sense).

If you do work on it, please contribute it to the layer. Or it is
something I can pick up in a few weeks and perhaps get some assistance
in validation.

Bruce


On Thu, Oct 10, 2024 at 8:52=E2=80=AFAM Kevin Ferber via
lists.yoctoproject.org <kev.ferber=3Dgmail.com@lists.yoctoproject.org>
wrote:
>
> Hi all,
>
> does anyone worked on a recipe for LXD.
>
> We are in the process of moving from Ubuntu to Yocto Scarthgap because we=
 wanted to use the OTA functionality of RAUC.
>
> Now we are faced with the challenge of successfully compiling LXD, I have=
 looked at an old unofficial layer (https://github.com/fcuringa/meta-lxd) f=
or reference, which of course no longer works with more recent LXD builds.
>
> Best regards
>
> Kevin
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8921): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8921
> Mute This Topic: https://lists.yoctoproject.org/mt/108927978/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

