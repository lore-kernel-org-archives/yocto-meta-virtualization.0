Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC525C25B78
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 22:54:56 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.4289.1716418493444765203
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 22 May 2024 15:54:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hicY8JEL;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51f4d2676d1so7023048e87.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 22 May 2024 15:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716418491; x=1717023291; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zeYt1A25Wq140MashLY1z7Ka8DcnGnNvX/+8+fweEWs=;
        b=hicY8JELycK39QJdxDqawu1g7b41iJzY5Ll75qGBEnKLb4JNTlz39OS+Dn/evHvzvG
         RAH4zFaFXZba3Ga4K3poF5bs/JY+Nckag5Nlt5QIvgYEPxtlZdWXx7SM55CZ4l0BVe8g
         LnSWluP+UsBN9U33en+CseN4XyMcgkTZVg6WpVXj5GayaQtRWrskIHAJuo9al4gB92lg
         gICTRXQXg7atY2nN7P6ZWxANV2TWV1qQupqLF/j7+g3DoIXPeIoI0qCdaW/+zSd9z+eO
         0FhG0P+nX3sqywAXzjVag19A563hUKvg1vhmv6sIGf5A5p9YMdU/uX5fSNXPxDNHOOtA
         0ybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716418491; x=1717023291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zeYt1A25Wq140MashLY1z7Ka8DcnGnNvX/+8+fweEWs=;
        b=U+V7ueKI9AqgB02MPThskxEq4t3HuFcv1YdPGguZw2VnPiRi2Di3XBRJdVevUi4yCo
         EdNmH/wpQWzsiZgBsp9iI9QfvDfaCPlo/eVmBChnon6m8zOKdkK2b6D9L6VIzKXNt8Ie
         i2dfBCXeXHJ0XGi1bw3PwJ4C6wslLYyHMcXT0b+FQga/iUovzsQ7cdhFXWsf3221AtXM
         Irp1U3H4Ow+zS93iYoCb3MMnNMefcQejrrlRiV1inipu1bYKEaghJFqeFGfn6hHTim45
         wZWpR0HNgHcupnZp2+M1/5pIMlIXrGsDAqHzlZSXwd3HN3ZlHrb00h6VBNQJNE0hcRLc
         NMtg==
X-Gm-Message-State: AOJu0YwMb1Gzo248wjB2ilZFfOV9kA8EeIX7BW11mkRHh6ZX7S147WTf
	ElMCsl9QRBqunQkjjYzEl2otJxy6qXx42X6E0UenF748qVHtCAJlS7/+A7NVTXLvQ2eLDPH8jwx
	1/2m9WSkdF2B2Ecvu8Jz3198uNug=
X-Google-Smtp-Source: AGHT+IFW1zG1HMuEmLCkKs/mFs99To4So42V0xNcxD4s61BN8/uKz7qhCmDZLUoWdH/JAgDuFsOm8Q5ho+U92aEQ+hA=
X-Received: by 2002:ac2:538d:0:b0:51d:1002:520d with SMTP id
 2adb3069b0e04-526c130b942mr1647623e87.64.1716418491114; Wed, 22 May 2024
 15:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAFMvBt2+s5a9BCnkYgmXvL9P83JDgkg5hg41q936JuEXHy568g@mail.gmail.com>
 <CA+chaQdXNXd_B3YiKXnvt0eV-i24hS1g7Jm6zW0buqN9n_3sZQ@mail.gmail.com> <CAFMvBt1p7DHLfeiNPA=F5__kkSyW9Z8Ouhkhpg9Kptnt=R-PQA@mail.gmail.com>
In-Reply-To: <CAFMvBt1p7DHLfeiNPA=F5__kkSyW9Z8Ouhkhpg9Kptnt=R-PQA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 23 May 2024 00:54:35 +0200
Message-ID: <CA+chaQd=BcD17hyZg5VDCSajtQ56aG=YJeRmGr3s+tsRsRkS9g@mail.gmail.com>
Subject: Re: [meta-virtualization] breakages in go recipes
To: "Theodore A. Roth" <troth@openavr.org>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 22 May 2024 22:54:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8740

I think one per recipe (or few related ones like runc*bb) would be
easier to review in this case.

On Thu, May 23, 2024 at 12:51=E2=80=AFAM Theodore A. Roth <troth@openavr.or=
g> wrote:
>
>
> On Wed, May 22, 2024 at 4:05=E2=80=AFPM Martin Jansa <martin.jansa@gmail.=
com> wrote:
>>
>> Hi,
>>
>> I can confirm that I'm seeing the same build failures since this
>> morning and agree that the recipes need to adapt to:
>> https://git.openembedded.org/openembedded-core/commit/?id=3Dcc4ec43a2b65=
7fb4c58429ab14f1edc2473c1327
>>
>> I've started with some WIP changes and fixed some of them in:
>> https://github.com/shr-project/meta-virtualization/commit/30a85c0319c253=
632206b0d2c2c483f11a490939
>> but than got side tracked by some other build failures and not sure
>> when I'll be able to get back to it.
>>
>> I've also asked Bruce on IRC and he is aware of the issues, but might
>> not have time to resolve it soon, so if you have the changes ready,
>> then please send them to ML for Bruce to review when he has time and
>> I'll happily build test them as well.
>>
>> Cheers,
>
>
> Should I send a single patch fixing a bunch of recipes (aka many destsuff=
ix fixes at once) or one patch per recipe?
>
> Ted Roth
>
>>
>>
>> On Wed, May 22, 2024 at 11:52=E2=80=AFPM Theodore A. Roth via
>> lists.yoctoproject.org <troth=3Dopenavr.org@lists.yoctoproject.org>
>> wrote:
>> >
>> > Hi,
>> >
>> > In our CI builds for multiple projects using meta-virtualization maste=
r branch, we are
>> > seeing some build failures for some recipes that use GO:
>> >
>> > * go-md2man
>> > * runc-opencontainers
>> > * docker-moby
>> > * podman
>> > * buildah
>> > * cni
>> >
>> > I think I've narrowed the breakages down to this commit to oe-core fro=
m Richard Purdie:
>> >
>> > * https://lists.openembedded.org/g/openembedded-core/message/199614
>> >
>> > The fixes for our builds seem simple enough. Just add ';destsuffix=3D$=
{GO_SRCURI_DESTSUFFIX}'
>> > to the SRC_URI. For example:
>> >
>> > ---
>> >
>> > diff --git a/recipes-devtools/go/go-md2man_git.bb b/recipes-devtools/g=
o/go-md2man_git.bb
>> > index 1d96bb1b..73d8d167 100644
>> > --- a/recipes-devtools/go/go-md2man_git.bb
>> > +++ b/recipes-devtools/go/go-md2man_git.bb
>> > @@ -9,7 +9,7 @@ BBCLASSEXTEND =3D "native"
>> >  GO_IMPORT =3D "github.com/cpuguy83/go-md2man"
>> >  #GO_INSTALL =3D "${GO_IMPORT}/bin/go-md2man"
>> >
>> > -SRC_URI =3D "git://${GO_IMPORT}.git;branch=3Dmaster;protocol=3Dhttps"
>> > +SRC_URI =3D "git://${GO_IMPORT}.git;branch=3Dmaster;protocol=3Dhttps;=
destsuffix=3D${GO_SRCURI_DESTSUFFIX}"
>> >
>> >  SRCREV =3D "f79a8a8ca69da163eee19ab442bedad7a35bba5a"
>> >  PV =3D "1.0.10+git"
>> >
>> > ---
>> >
>> > I plan to finish my testing for our breakages and submit some patches,=
 but it feels like there are many
>> > more recipes that will need this change made (basically anything that =
is using 'inherit go').
>> >
>> > I'm a bit reluctant to submit patches for recipes we are not using (an=
d testing) even if they seem like
>> > mechanical changes, but I wanted to let the list know what I have foun=
d.
>> >
>> > Ted Roth
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#8737): https://lists.yoctoproject.org/g/meta-virtu=
alization/message/8737
>> > Mute This Topic: https://lists.yoctoproject.org/mt/106252100/3617156
>> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsu=
b [martin.jansa@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >

