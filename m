Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C98C4707C
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 14:08:29 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web11.12230.1704895708138228322
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 10 Jan 2024 06:08:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Iu6YaZxN;
 spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7bed9c7d33fso67005939f.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jan 2024 06:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704895707; x=1705500507; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aa6NDyE9kgv9WKsHVdQDIwV1xs3rNvJW7AXgtKDju6Y=;
        b=Iu6YaZxNdYC3nKMlcO8SxZUbgBbNOXJieAocEBaTHIw2dhRvqFrjEGFAhNly8TBAcv
         G6oThs/wSOF87eoHF0jCPH5e8AYLhNuhXUILREZaaVPx+7FXs2ZUw0YjuK2aqgKam4bv
         C3w7klsccyb3y2DnbBUC7QIT54Qbgu2QRqwLdF2knib9THMyEBiFBxyk80egg3PxJY6f
         IafS4YL8rz5PqnpzKnadsEHJikOamOsGSqhNCkHjKrrBSL/YWjxjb1uJ53CpmjhlkhfA
         XHXdT1ogc6CcvIYoNQaUN7nji6qogYZJZYRU2Wzswt+Kn4GgyHa7OSPCYk/bgGsjw0mh
         DPlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704895707; x=1705500507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aa6NDyE9kgv9WKsHVdQDIwV1xs3rNvJW7AXgtKDju6Y=;
        b=AzZ5iyi3Jnx+xdQbNFFIqM9KIhPaWu0dxo+wbi+l5eQDc6Gvs6RSeLvau4Xix7y7bE
         SDQynTnLnY2WELZFsWcIuJcp4zleuqykNHM0sgSuRh52ckjZrnfKtFvsVc9vpXXtT3a+
         YL9uatZaKMQR2fCGXyjPGAeCykKNXvW3eWuzJPOUvRbZCh7zbh6UVwXFza+IObdtynJh
         J94xWJiKnYenqLJQ2S6Ts78VL047pSvQBDlTkNXcoV+yjEvsyqiL/5asZl55axZs9yDN
         QsAK/3uSA0A4O8Ip0gtXkygrr5h2ywkFFeWkozO6ps9avMR5sMWfvrWGKDy8zRAw3HdF
         ECbw==
X-Gm-Message-State: AOJu0YzrE+FD2rSCDDr85yjt2smrvXg+2gb1RGG/MWdvsCd1VSdYrmjX
	rwRVVZTa83lNt2ysAOSroxVS+03qHw3K9WDpaAs=
X-Google-Smtp-Source: AGHT+IFYYgv5F9dAM9IxIEgkbQB1EkAQt+GDUrsIWb0oWPvYVElNC6lm1ffVN8u/AYJ0FKtNoY4BYuQHCvDxRf1tCMA=
X-Received: by 2002:a5d:84ce:0:b0:7be:f432:4630 with SMTP id
 z14-20020a5d84ce000000b007bef4324630mr827476ior.33.1704895707129; Wed, 10 Jan
 2024 06:08:27 -0800 (PST)
MIME-Version: 1.0
References: <20240108180933.2362963-1-liu.ming50@gmail.com>
 <CADkTA4NwrXFJ0b_2x0GDhVNeSUFVGOvWuXRKu+Wj1ckE=CtSEA@mail.gmail.com>
 <CALatG=4-p2tGB_Ke2WzULVQOPN00n5EYYRvAcsgfWi-U2gGo5g@mail.gmail.com>
 <CADkTA4OeoLqbD_7Zo-96RL3oAoQH-j0xx3phYGuAx_DKJT1WXQ@mail.gmail.com> <CALatG=7B5bHVustExrSgUiWsWMGLqFz6Gi9VZ6qyaUzYvomLSg@mail.gmail.com>
In-Reply-To: <CALatG=7B5bHVustExrSgUiWsWMGLqFz6Gi9VZ6qyaUzYvomLSg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 10 Jan 2024 09:08:15 -0500
Message-ID: <CADkTA4Oi3fAiOwwj5Zd-Cyqu==gxSQiiTsTDDSQ=7tQUrPqnag@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] podman: support bash completions for podman/docker
To: Ming Liu <liu.ming50@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jan 2024 14:08:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8536

On Wed, Jan 10, 2024 at 3:50=E2=80=AFAM Ming Liu <liu.ming50@gmail.com> wro=
te:
>
> Hi, Bruce:
>
> Got that, in that case, I will use a bbappend in our meta layers for now,=
 thanks for the explanation.
>
> About the podman-native recipe you mentioned, do you plan to push it to m=
eta-virtualization layer? We found it's very useful in some cases, I am als=
o considering adding native/natiesdk for buildah, it could be used to provi=
de a fakerooted build env.
>

I will push both of the changes eventually, I'm currently still
working through some pseudo and
namespace / cgroups problems.

I also have buildah as native in that scenario, since it is slightly
coupled to podman. But I won't
use it as a image construction method as it duplicates far too much
code from other tools and
had it's own set of assumptions and coupling.

Bruce

> the best,
> thank you
>
> Bruce Ashfield <bruce.ashfield@gmail.com> =E6=96=BC 2024=E5=B9=B41=E6=9C=
=889=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=882:23=E5=AF=AB=E9=81=93=
=EF=BC=9A
>>
>> On Tue, Jan 9, 2024 at 4:19=E2=80=AFAM Ming Liu <liu.ming50@gmail.com> w=
rote:
>> >
>> > Hi, Bruce:
>> >
>> > Seems podman manage its shell completions inside the code (see this li=
ne: https://github.com/containers/podman/pull/21095/commits/6c4892c8029fd99=
2b4494adb62c535d0f5c5d62d#diff-cf5cc76e70a369c5221f08f29ec0452710af1f4ecd42=
3c162d5b669688416caeR484)
>> >
>> > then it uses "podman completion SHELL-NAME" to get the completion for =
a particular shell, so it's not safe to pre-generate a completion outside o=
f podman source? For instance, if we add a CVE fix or some common bug fixes=
 to SRC_URI, the completion might be changed and the developers have to be =
aware of that and also update completion file.
>> >
>>
>> That CVE example is quite unlikely .. and I'd suggest we created the
>> issue by packaging the completions in the first case.
>>
>> > And this qemu wrapper way is being used in OE in several recipes, like=
 python, the qemu-native would be built in most cases if you build a OE ima=
ge, so would be no much cost on it? Just my personal options.
>> >
>>
>> I'm quite aware of how and where the wrappers are used.  It is still
>> too complex for something as trivial
>> as bash completion generation.
>>
>> I'd suggest you can carry the generation and packaging in a bbappend,
>> and that I can look into alternate
>> ways to generate the completions in the future.
>>
>> Even generating them on-target, in a first boot scenario is preferable
>> (from a maintenance point of view).
>>
>> I also have a podman-native extension locally that could be useful,
>> but doing an emulated arch-specific
>> execution of target podman to generate bash completion outputs (that
>> should NOT be arch specfic, and
>> if they are, we want no part of them) is far too heavy.
>>
>> Bruce
>>
>> > the best,
>> > thank you
>>
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

