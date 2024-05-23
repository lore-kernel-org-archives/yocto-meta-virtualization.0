Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 639D3C25B7A
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 20:10:05 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.673.1716495002114329923
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 23 May 2024 13:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NyApened;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e6f33150bcso84359621fa.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 23 May 2024 13:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716495000; x=1717099800; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9EOWO2p0IzoTJQ1gR7zqKbSuixesbeaycTVPSNR6Uq0=;
        b=NyApened5rZx6NCu7RrNZzto1II768tj7cxoT/gsOx/kW3YsbbcheQajBUrWXOI0+r
         IOO21Grwo1Llg56if7xfu/203vjz3SbqIEmJWJWctAkYWDFSRVaiZ+dw9bame6xV0UW9
         sCHpd9qa+j1+ZPvavrDNrf1Tq98EOtA6RAq4NDMNRteS0Ok5ayR+ngAHQTjWO5/Dddtn
         VxMSnshA9/a87QVegUO+K7dVk2bhhymxweB6buarLvwHMnWCXqPikDl/he62yqjUqZ3a
         ui0bjqHtZHn9eONFbaZsiHa2bM598H/a+U42X685TV2Fz6Zt8+3XWby2rS5IyCnxzmjW
         bPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716495000; x=1717099800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9EOWO2p0IzoTJQ1gR7zqKbSuixesbeaycTVPSNR6Uq0=;
        b=qqOuDiWHg/EdNwqfoMyHyZse8fwBt3VIFAGDsG/K58vRlpUhhv+NlQw82SmKI/GSc7
         46mm+kPMBZ0rr4Dum9ETb8K6aUVdM1UXBIvabnOoqAIUR6CIMWiQIwGGowV/lH1df7bD
         ZC3nt7jKpz/ogkxSj8CCyqw2dSrr3C06uxmI8IZYOMaCBqsg1M6sd5oVnClpDoaUm+b2
         0iHP/9GrX3noRHQ3CtlHIOu48GJLMqfN/hJgcR9W1OYvGxROpwwNWoP9j17i3c/h4GOd
         1NyGHoU4NIf4Ng/UJT8nWoAle4wIEvGIaL17SsKkSErfHpVUT5QeIciV7kMR4hwlcQlw
         k0ng==
X-Forwarded-Encrypted: i=1; AJvYcCWM6iyVTRsVoYW1ugziRqBuYpKUw+gNMSd2QTrHJa6rnVv+DYAp6omltAbULOg7V9MWKPfdAuF1ergkIXNvy/v+cIJzqvGpkPLGiGpZ4JLXg8INmrQJKpXTE3Q=
X-Gm-Message-State: AOJu0YzPtWOVLG5vSZJm3xK4H9txZHQwbaSg2FrCUuaSNXeRpOB3etI5
	7QuH9u8oH++2fkTmZPvJHdk7XT6ARYmhJK06Tg/LZzhcwX4OF145+hml1ue30AUyVEfHABeUl7/
	Vg/rKH6EVWOU/XB2ZIzA/2xt6myk=
X-Google-Smtp-Source: AGHT+IH9UeYgOT314Qz2kw8pbLZQ8ma5AYVqaayXzzBeOGv+RvY7WwxfItgpM/MLSZuY+fzryQbWKOmu7wykypUouKw=
X-Received: by 2002:a05:651c:1311:b0:2d8:408c:3f5b with SMTP id
 38308e7fff4ca-2e95b07b0cdmr1113061fa.5.1716494999845; Thu, 23 May 2024
 13:09:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAFMvBt2+s5a9BCnkYgmXvL9P83JDgkg5hg41q936JuEXHy568g@mail.gmail.com>
 <CA+chaQdXNXd_B3YiKXnvt0eV-i24hS1g7Jm6zW0buqN9n_3sZQ@mail.gmail.com>
 <CAFMvBt1p7DHLfeiNPA=F5__kkSyW9Z8Ouhkhpg9Kptnt=R-PQA@mail.gmail.com>
 <CA+chaQd=BcD17hyZg5VDCSajtQ56aG=YJeRmGr3s+tsRsRkS9g@mail.gmail.com>
 <CADkTA4P5u3NVBO-3itqOE931ik68caKdR-2kXgdseADr9v=9GQ@mail.gmail.com>
 <CA+chaQc94P6-yfmJRhM4Mi5gK9MVkq3MFGw4Z_Nvns_U78TdAw@mail.gmail.com> <CAFMvBt2Rk1BBVWnqJaLmmVtbi2Dpb_cMQvnY6FVjMfbXdhEh6Q@mail.gmail.com>
In-Reply-To: <CAFMvBt2Rk1BBVWnqJaLmmVtbi2Dpb_cMQvnY6FVjMfbXdhEh6Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 23 May 2024 22:09:43 +0200
Message-ID: <CA+chaQd+ZSZQxXeSSu=Hcgy81Yd+tb7Ag5NA-e6emR5nyzioeA@mail.gmail.com>
Subject: Re: [meta-virtualization] breakages in go recipes
To: "Theodore A. Roth" <troth@openavr.org>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 23 May 2024 20:10:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8744

Hi Theodore,

yes, I'm fighting similar issues in our layers today as well.

I've integrated your change and checked that runc builds now.

Here are the public logs for all the meta-virtualzation issues
http://errors.yoctoproject.org/Errors/Build/184253/
I'll update the WIP changes with these and send what I have after
checking at least buildhistory-diff.


On Thu, May 23, 2024 at 8:23=E2=80=AFPM Theodore A. Roth <troth@openavr.org=
> wrote:
>
>
> On Thu, May 23, 2024 at 2:34=E2=80=AFAM Martin Jansa <martin.jansa@gmail.=
com> wrote:
>>
>> FWIW: My world build with oe-core
>> master:094273bd7d1768e14fbdcd2f239bee14c630a625 (so before the main
>> UNPACKDIR changes) finished with these failures from
>> meta-virtualization:
>>
>> ERROR: Task (meta-virtualization/recipes-containers/cri-tools/cri-tools_=
git.bb:do_patch)
>> failed with exit code '1'
>> ERROR: Task (meta-virtualization/recipes-containers/docker-compose/docke=
r-compose_git.bb:do_populate_lic)
>> failed with exit code '1'
>> ERROR: Task (meta-virtualization/recipes-containers/docker/docker-moby_g=
it.bb:do_patch)
>> failed with exit code '1'
>> ERROR: Task (meta-virtualization/recipes-containers/nerdctl/nerdctl_git.=
bb:do_patch)
>> failed with exit code '1'
>> ERROR: Task (meta-virtualization/recipes-containers/runc/runc-opencontai=
ners_git.bb:do_patch)
>> failed with exit code '1'
>> ERROR: Task (meta-virtualization/recipes-devtools/go/go-md2man_git.bb:do=
_compile)
>> failed with exit code '1'
>> ERROR: Task (meta-virtualization/recipes-devtools/go/go-md2man_git.bb:do=
_populate_lic)
>> failed with exit code '1'
>> ERROR: Task (meta-virtualization/recipes-devtools/yq/yq_git.bb:do_compil=
e)
>> failed with exit code '1'
>> ERROR: Task (meta-virtualization/recipes-devtools/yq/yq_git.bb:do_popula=
te_lic)
>> failed with exit code '1'
>> ERROR: Task (meta-virtualization/recipes-networking/cni/cni_git.bb:do_co=
mpile)
>> failed with exit code '1'
>> ERROR: Task (meta-virtualization/recipes-networking/cni/cni_git.bb:do_po=
pulate_lic)
>> failed with exit code '1'
>> ERROR: Task (meta-virtualization/recipes-networking/netns/netns_git.bb:d=
o_patch)
>> failed with exit code '1'
>>
>> the UNPACKDIR changes will probably cause few more issues, I've
>> already noticed one with linux-yocto_virtualization.inc and added
>> temporary work around here:
>> https://github.com/shr-project/meta-virtualization/commits/jansa/master/
>>
>> will send what I have later today as a RFC (as I cannot even build
>> whole image yet) unless Theodore gets to it sooner.
>
>
> Martin:
>
> Spent most of the day fighting with UNPACKDIR breakages outside of meta-v=
irtualization.
> Finally got to the point where I could build your WIP changes. Found some=
 issues with the
> runc recipes and have pushed fixes here:
>
> https://github.com/troth/meta-virtualization/commit/f604f1fb39fad9f496700=
be59333edcdc3e7a633
>
> I'm still waiting for a full build to complete, so I have not completely =
verified the rest of your changes.
>
> Ted Roth

