Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA71C6FD18
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 16:44:11 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web11.43354.1681922642992630051
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Apr 2023 09:44:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=FetdLXNB;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3296292e623so40677395ab.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Apr 2023 09:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681922642; x=1684514642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APHntBnNk+VF8jjYKIEol9upKaT+DCUPjpBlzpFKN+I=;
        b=FetdLXNBbU0wK7ZwF2D1hMvXb67aZPtr4qHeLdlKKyJryTRMZP0QrjIpkVPUyM/Q4x
         C1Gg1jVKufaJ1alcN9IlLiv+Qaz2eK/FemMsbCbLjH3mNqsIVl9V79RmlRZ8xaZ6hD6E
         KzOCfMv35OX71XzaabxWjtIYFNmYt4Loby6tPVmqvG6I0YzSYJjpukj1E04VBwCY1rF7
         TTy1qlOM8jvi/tF99QLQxcySfVm7mV2waktiuqi8TuxFGp0bMbVbsOFzjMeVqGDazW5Z
         coSXql9N2DKnHiKXP0M6Wo4mzTOLyKv5CzNRW60hFEnYkvf2irHrIqygjCJMncgaN0lk
         i6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681922642; x=1684514642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=APHntBnNk+VF8jjYKIEol9upKaT+DCUPjpBlzpFKN+I=;
        b=beLj6/CKpn92mvTRHaXiP4iFcmOJIgVzHYGaTblRMh6FHfyrlOB49XGdLWJLBRYKLp
         A0Re39+UC+OZiSI/P/NAcsJskK/62DRk4NVk3SYo0cbld6Jhzj/xooVV7V3RSCB8/Mw+
         QddeBW+9mjPbi4/yKvjhklyu95FMbOyLvRRGlIG53QLnfm7vpWvOS4knpOSgcGXazeoe
         vZXzW93qSzaQfz629nqaMfviid2YdURbHjf8uyYpeLfUoTfY9RveYsdnjyzWyMECGGLv
         ecYHDWlXr4FJP62b5lFOeEUtxVid/FQ1SgWHs5yfIoPYSMY1yVIgeRPcqa6gpu72kSAc
         FftA==
X-Gm-Message-State: AAQBX9dECsW+G8+XHiS8lNWfat9WOOd+SrmOHos7iDD/u6PZaj1FwkSY
	hPAZCSQl7VdMdYMQsj8ZGG2AH1HR6h84wES0H4bevK9rZeE=
X-Google-Smtp-Source: AKy350bG2BXfgpUTzy1H9Ts9S5NbJ+koxn9F3cF2oXPNUex2SzlA6FwzMirxWdubI7e+kNNOLpgvM9MGGzmEWOF/bvE=
X-Received: by 2002:a92:cec6:0:b0:318:a732:2b6f with SMTP id
 z6-20020a92cec6000000b00318a7322b6fmr505536ilq.20.1681922642096; Wed, 19 Apr
 2023 09:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <b8aa.1681909317749305722.hhK1@lists.yoctoproject.org>
In-Reply-To: <b8aa.1681909317749305722.hhK1@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 19 Apr 2023 12:43:56 -0400
Message-ID: <CADkTA4MG+Xoy5_reOsVgrXA4_G=FshyQpA+TC4a-yu+aeV9o6w@mail.gmail.com>
Subject: Re: [meta-virtualization] k3s air gap installation #meta-virtualization
To: alvaro.gimenez.s@elbbits.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Apr 2023 16:44:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8001

On Wed, Apr 19, 2023 at 9:01=E2=80=AFAM <alvaro.gimenez.s@elbbits.com> wrot=
e:
>
> Hello,
>
> I am trying to use k3s using meta-virtualization layer (from kirkstone br=
anch) and at least by default it is not running if our devices are not conn=
ected to internet.
>
> Is there a way to activate air-gap installation of k3s to avoid needing t=
o download the initial images on the target?
>
> Thank you for your work and support,

That isn't something I've specifically looked into, so I can't say
that I have any specific tips to offer.

Are there general guides for K3S to set it up in such a configuration
(I haven't checked) ? If so, any gaps in that configuration that
aren't supported in a yocto build or runtime environment would be our
task list (but I state the obvious).

The only other slightly similar thing I've tested in the past has been
running a local registry, where images are hosted (and then pulled
locally). That allows it to run with no external network access
without needing significant changes.

Bruce

>
> Alvaro.
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8000): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8000
> Mute This Topic: https://lists.yoctoproject.org/mt/98365820/1050810
> Mute #meta-virtualization:https://lists.yoctoproject.org/g/meta-virtualiz=
ation/mutehashtag/meta-virtualization
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

