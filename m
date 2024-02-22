Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45A10C48BF8
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 17:19:49 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.18732.1708622387463857268
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 Feb 2024 09:19:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C+dgRoug;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1dc1ff697f9so12785ad.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Feb 2024 09:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708622387; x=1709227187; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VB39dCPQrfS7uILQQh5ikAT84j6zNFjmUzjCo+9Vgfk=;
        b=C+dgRougfHqrN82idhLOvQvDZG/Qpcnn0mkg9OXE29RGagJ4UPUxuIzvyovkfCpNCB
         vXuP32nqTr4A/HG9V/TMEaIUO4ThsL/ZLb0KLk/BIlwGSas4vbfHBONgnZD0bWngFp11
         IA4oWR8MjhvWFmkqzHeZXdk+i22dJk9lBHzcjFz+i1nFuEyTmltgQm0lpz5J/k+B1HnY
         4OU1vVRXd2hcYMPkXKx2jbXo33Tc/4bTHAXRwXkSomb54+rpRvJPf69ytWjXA9LuYefs
         wyHS6Ll5ea5FCi9D4GAGxAV05zSLUuOjptf23TvMevV7zIJCA+MKT10tTOQozcNzZbvC
         fvfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708622387; x=1709227187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VB39dCPQrfS7uILQQh5ikAT84j6zNFjmUzjCo+9Vgfk=;
        b=X8HimQqeoq5iFqyrrQ0VOO8Urpv+QH5NubiIAVbmI34t7PPYKcfHJJgTIP8/FXvRa+
         uSX1yL1BARSNxW0Ji74gf8tH5a85cmERWxRk1I8R39pYZmVkzihlXrWJsyYfyFhPzPXK
         4LT7dFJbQzsWQDTXJkVXvGk6faYsVdxd/RnJ0e25R1VMSj+Bl6TVDvxQIrRutpaEw0kT
         gdR6DRVsv0uXAGPY5kCamBwRRh22LOWUvRkSgdZZPh/tP/k5Q9ZTmggPX9iz7PZonx7K
         CQj+Fi8HvnM6TOId4mJskGlCYOjl1qrbHu/49hPdAjXJcJ2qPeDqmXvk3iO3nlhFNPT7
         /rRQ==
X-Gm-Message-State: AOJu0YxgrFpY6wNB0CfXwUdHignPB9oC+8azRIS56iXVEYhJwxkxJmol
	rabWUOxz7oFq1c3Yhfw43qdJ9SlK6q/9k7FNnFyjUMCYwDmlWlT4i537Fc5ggIf5DhyCB/zYWWW
	QJ4gaRQnnelLvBxL4fYPGYpc9oUE=
X-Google-Smtp-Source: AGHT+IEzJggs6TtVwa1b5WTUPfTjBflCgVOSLYlrphsIVAAHI3juo2AdYmdUEhXqf1wHAYqNd1/wQ+sEX6uBlz1hLSA=
X-Received: by 2002:a17:90a:f494:b0:299:a5a1:46e2 with SMTP id
 bx20-20020a17090af49400b00299a5a146e2mr9548752pjb.25.1708622386755; Thu, 22
 Feb 2024 09:19:46 -0800 (PST)
MIME-Version: 1.0
References: <20240222162019.3154833-1-fathi.boudra@linaro.org>
 <CADkTA4Ovz6SpRXopnfUxq8cMFXzCoG=hLZ3cA5vG3VNx=Pneww@mail.gmail.com> <CAGNsrLChN5LWNPR7OGLHZ5305fH8Xpw91RQggV9Wrt-ek4aZzw@mail.gmail.com>
In-Reply-To: <CAGNsrLChN5LWNPR7OGLHZ5305fH8Xpw91RQggV9Wrt-ek4aZzw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 22 Feb 2024 12:19:35 -0500
Message-ID: <CADkTA4N5NUoGGrxAKsSceeKUSyc+65eDHhrJqjHbm0NXLS7tNg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] linux-yocto: include: relax the
 versioned linux-yocto_*_virtualization.inc
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Feb 2024 17:19:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8577

On Thu, Feb 22, 2024 at 12:16=E2=80=AFPM Fathi Boudra <fathi.boudra@linaro.=
org> wrote:
>
> On Thu, 22 Feb 2024 at 18:10, Bruce Ashfield <bruce.ashfield@gmail.com> w=
rote:
> >
> > Unfortunately, no. I've already rejected similar patches in the past.
> >
> > The specific versioning is intentional and is going to stay. It tracks
> > what is supported and tested in a given branch.
> >
> > If someone needs to deviate from what I'm marking as tested, they can
> > carry a file in their layers.
>
> That's unfortunate. Let's all carry a workaround for this one-liner
> that hasn't changed in 4 years.
>

I'm not sure what you are implying, but I am constantly changing the
versioned linux-yocto .inc file to match the upstream file.

Which is exactly the point of that file, not the contents within the
file.

Bruce

> -  <project path=3D"meta-virtualization" name=3D"meta-virtualization"/>
> +  <project path=3D"meta-virtualization" name=3D"meta-virtualization" >
> +     <copyfile
> src=3D"recipes-kernel/linux/linux-yocto_6.6_virtualization.inc"
> dest=3D"meta-virtualization/recipes-kernel/linux/linux-yocto_%_virtualiza=
tion.inc"
> />
> +  </project>



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

