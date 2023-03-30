Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17626C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 13:56:42 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web11.25990.1680184600595643771
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 Mar 2023 06:56:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VMco81Be;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id d22so7283177iow.12
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Mar 2023 06:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680184599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6g81nEvtXZrfsqxlu1ugcM9njN5pOVku9ASB119iZMY=;
        b=VMco81BeOVz5xnJ+pPaztXmcPw+ABrkH/K1Pox5fUfjyqWWfgGCuB+7nwbN3EQUOES
         T9iXOniGMFBN8WqKZ1NyBY0IeNCyYcXPNnbVhwYBmm8wGMq5koQIM0grQ00MAWr4z78M
         Ud8u2aYVJ854eDPj5vPc+tfsZKI+F8jVCk2LMt1yRbMMM/LvNxIL6B03N2Jolf1d+3ex
         aa633RGN5JyjsrYH4VZiZZqY4U5qt18M367D6s4sAeWn/yjsSPvr4xkWRBQN04OLqAOe
         dLkmNVBJdD5r9yCJxHRfOg2V+GkhOEGlbwWT4vePJc/l8ckIDBCYsLKtGA/ebxjqE/aW
         hIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680184599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6g81nEvtXZrfsqxlu1ugcM9njN5pOVku9ASB119iZMY=;
        b=IW2bNlvrGCGHO6nFBcpKqbWl/O+XDmzN0+kTDH2ecKWxHsEjfgy/2aFGIICqLbsKJ2
         74rLKp52Cp/wxTh8ZDh5OxycNEhhxKXqHduTjp7DWZth5nhLUKSbYjxOicPXk/Wljfep
         Q8qDjiESe3vzVLDppfB2k1Yk5kvw29r4UUDH/VTrgcT+gl4wqessa7mhOSBlK63cAxUn
         A7EFygHmrT+cEit+1D39k9AZlkjzsxZWXpp83ZWGAA1ljnEipnDltzKST6uGGP8zrkIA
         87i+nys5RhJkJ528Y0U5cyQdGg6JPaAWCXg50KlPQugCsDB/TSAhiw2yA/V7mw7Mm2hz
         tQQQ==
X-Gm-Message-State: AAQBX9dapTaJ7phnOXagZTrxL70ZqqimD4HMIgITnUSiyu0woH7L0d3P
	Fm6g7jbIxDca6v4y1x1W4ElP/1iOKCLiRhZnlHc=
X-Google-Smtp-Source: AKy350Z2J6JUxSChwMnKUm/QQpATC1SZl6dR70XAjK3FgKMMNs0fdrkxBTKYMc+7mKT26lRbRqxCeU8Mow8FjHiNJUQ=
X-Received: by 2002:a02:628f:0:b0:406:6686:2e0c with SMTP id
 d137-20020a02628f000000b0040666862e0cmr2793831jac.3.1680184599654; Thu, 30
 Mar 2023 06:56:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230329215729.719615-1-sakib.sajal@windriver.com> <1751141C54057351.27612@lists.yoctoproject.org>
In-Reply-To: <1751141C54057351.27612@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 30 Mar 2023 09:56:52 -0400
Message-ID: <CADkTA4N=W0tCS7T89zDyazcm=CvHHNgxHwvPsAEe-LvtGmHO6g@mail.gmail.com>
Subject: Re: [meta-virtualization][kirkstone][PATCH] kubernetes: update to v1.23.17
To: bruce.ashfield@gmail.com
Cc: Sakib Sajal <sakib.sajal@windriver.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Mar 2023 13:56:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7971

I should add, that if the shortlogs blow out the mailing list max
message size, then either a pull request or a summary of the release
notes from the project are appropriate work arounds.

Bruce

On Wed, Mar 29, 2023 at 11:17=E2=80=AFPM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> Please do list them in the log. Simply listing the number isn't useful.
>
> We aren't charged by the byte of text  ;)
>
> Bruce
>
> On Wed, Mar 29, 2023, 5:59 PM <sakib.sajal@windriver.com> wrote:
>>
>> Bumping kubernetes to version v1.23.17, which comprises of 251 commits,
>> so not listing them in the log:
>>   $ git log --no-merges --oneline fbcfa330..953be892 | wc -l
>>     251
>>
>> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> ---
>>  recipes-containers/kubernetes/kubernetes_git.bb | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-c=
ontainers/kubernetes/kubernetes_git.bb
>> index 170a938..f475bd7 100644
>> --- a/recipes-containers/kubernetes/kubernetes_git.bb
>> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
>> @@ -5,8 +5,8 @@ applications across multiple hosts, providing basic mech=
anisms for deployment, \
>>  maintenance, and scaling of applications. \
>>  "
>>
>> -PV =3D "v1.23.6+git${SRCREV_kubernetes}"
>> -SRCREV_kubernetes =3D "fbcfa33018159c033aee77b0d5456df6771aa9b5"
>> +PV =3D "v1.23.17+git${SRCREV_kubernetes}"
>> +SRCREV_kubernetes =3D "953be8927218ec8067e1af2641e540238ffd7576"
>>  SRCREV_kubernetes-release =3D "7c1aa83dac555de6f05500911467b70aca4949f0=
"
>>  PE =3D "1"
>>
>> --
>> 2.40.0
>>
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7970): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7970
> Mute This Topic: https://lists.yoctoproject.org/mt/97939317/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/leave/6=
693017/1050810/978058475/xyzzy [bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

