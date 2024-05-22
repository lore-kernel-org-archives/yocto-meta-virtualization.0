Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B553AC25B7C
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 22:06:06 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.3347.1716415556845208254
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 22 May 2024 15:05:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LGqOXyKq;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51fc01b6fe7so6066382e87.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 22 May 2024 15:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716415555; x=1717020355; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tNZOfi04P8VLBZCSH/WIip4HuRr55ZO9X6iDCZ2l9Pw=;
        b=LGqOXyKqhwOy78L71RNnsL4pta9H+WCwxwV57qzpg86RyHK2QS4eiw97T0g8MdJXKu
         S7nsLh+bH6HjyGa4sCfBuDeE0/tdxsb1pQsc3HQAHo2hLsaU2pgOnPGtYe3iaaWFGEGy
         8lHOV5mmIE7UQtAlfXo8ptlkih5V0W6rXpPwwG0r/OdTiruyWQbz7+eeM8D2sq2iXlzy
         lxzTCulzudFcWPqUG9a5x8OEYhOdT2R8nsabDTh8vjMaYKBVnRs4oCfXDuuv2XWN/p3m
         vCtQWhfRtp4aX+mvTZNwf43qxe77apQvqe0COVqE6dqkfVL21A1Yu9ebzLI0PjdWyKci
         HcUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716415555; x=1717020355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tNZOfi04P8VLBZCSH/WIip4HuRr55ZO9X6iDCZ2l9Pw=;
        b=KenKn6xrZJ3z+Jkds1WDSWO/KVyl5Td+31bC7jJjF026NjCS1G8L3SBAaoTguwF4nT
         BAWl+adonzpDLJ3KL7f5Vn7kfJtLGhmztLvBe2y4zcwoLxC7HFscg6XelGtvS9dT9wIA
         FfD5s+JiGOeY/1lsy8RgoJVIvmWAzUqH5HveJm3917Okrh5AdjHdK5eFK2yjRR3gi5a1
         qHYZjSgHTeH6Ia1zEmqWKaqY4OxrUf+SoDOUPdwcHpn0ObFt0myhA/AjheywqrCsnQqp
         +nx56jFz+a9++6IU896BvaWRAEa5SzCYwZWhHdG3zV6p+LOLy1b1I+DSQshT9X6K7qsq
         SHag==
X-Gm-Message-State: AOJu0YxntuVRELpeA9hFzDWEALv0r9yBmFjuxh6IOCRK42jabcpE2AwF
	qV3ffaSFaBiJgdXpxbt7S1uKLNoyRsso5rg3JcV7Y7aqMP+QEhKhKh1SlfoovkkBxSPHDh9nrNg
	mC7dQUvGMx084Y+8VNWfoqT0juTc=
X-Google-Smtp-Source: AGHT+IEgWU2lWG7zI+f2VsvduhlUpmW0F3mpNCt8oy7MfqutL44bFZMsHDQ3hdynp3qxGJ5/1oX7Dk09Q9jfDFaBWxg=
X-Received: by 2002:ac2:5312:0:b0:51c:8b45:c9fb with SMTP id
 2adb3069b0e04-526bf54bea0mr2053076e87.69.1716415554411; Wed, 22 May 2024
 15:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAFMvBt2+s5a9BCnkYgmXvL9P83JDgkg5hg41q936JuEXHy568g@mail.gmail.com>
In-Reply-To: <CAFMvBt2+s5a9BCnkYgmXvL9P83JDgkg5hg41q936JuEXHy568g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 23 May 2024 00:05:38 +0200
Message-ID: <CA+chaQdXNXd_B3YiKXnvt0eV-i24hS1g7Jm6zW0buqN9n_3sZQ@mail.gmail.com>
Subject: Re: [meta-virtualization] breakages in go recipes
To: troth@openavr.org
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 22 May 2024 22:06:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8738

Hi,

I can confirm that I'm seeing the same build failures since this
morning and agree that the recipes need to adapt to:
https://git.openembedded.org/openembedded-core/commit/?id=3Dcc4ec43a2b657fb=
4c58429ab14f1edc2473c1327

I've started with some WIP changes and fixed some of them in:
https://github.com/shr-project/meta-virtualization/commit/30a85c0319c253632=
206b0d2c2c483f11a490939
but than got side tracked by some other build failures and not sure
when I'll be able to get back to it.

I've also asked Bruce on IRC and he is aware of the issues, but might
not have time to resolve it soon, so if you have the changes ready,
then please send them to ML for Bruce to review when he has time and
I'll happily build test them as well.

Cheers,

On Wed, May 22, 2024 at 11:52=E2=80=AFPM Theodore A. Roth via
lists.yoctoproject.org <troth=3Dopenavr.org@lists.yoctoproject.org>
wrote:
>
> Hi,
>
> In our CI builds for multiple projects using meta-virtualization master b=
ranch, we are
> seeing some build failures for some recipes that use GO:
>
> * go-md2man
> * runc-opencontainers
> * docker-moby
> * podman
> * buildah
> * cni
>
> I think I've narrowed the breakages down to this commit to oe-core from R=
ichard Purdie:
>
> * https://lists.openembedded.org/g/openembedded-core/message/199614
>
> The fixes for our builds seem simple enough. Just add ';destsuffix=3D${GO=
_SRCURI_DESTSUFFIX}'
> to the SRC_URI. For example:
>
> ---
>
> diff --git a/recipes-devtools/go/go-md2man_git.bb b/recipes-devtools/go/g=
o-md2man_git.bb
> index 1d96bb1b..73d8d167 100644
> --- a/recipes-devtools/go/go-md2man_git.bb
> +++ b/recipes-devtools/go/go-md2man_git.bb
> @@ -9,7 +9,7 @@ BBCLASSEXTEND =3D "native"
>  GO_IMPORT =3D "github.com/cpuguy83/go-md2man"
>  #GO_INSTALL =3D "${GO_IMPORT}/bin/go-md2man"
>
> -SRC_URI =3D "git://${GO_IMPORT}.git;branch=3Dmaster;protocol=3Dhttps"
> +SRC_URI =3D "git://${GO_IMPORT}.git;branch=3Dmaster;protocol=3Dhttps;des=
tsuffix=3D${GO_SRCURI_DESTSUFFIX}"
>
>  SRCREV =3D "f79a8a8ca69da163eee19ab442bedad7a35bba5a"
>  PV =3D "1.0.10+git"
>
> ---
>
> I plan to finish my testing for our breakages and submit some patches, bu=
t it feels like there are many
> more recipes that will need this change made (basically anything that is =
using 'inherit go').
>
> I'm a bit reluctant to submit patches for recipes we are not using (and t=
esting) even if they seem like
> mechanical changes, but I wanted to let the list know what I have found.
>
> Ted Roth
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8737): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8737
> Mute This Topic: https://lists.yoctoproject.org/mt/106252100/3617156
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

