Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 336FCEB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 13:51:37 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web11.11158.1687355495694813380
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 21 Jun 2023 06:51:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=RFvrpnMM;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-77e457319a6so110017139f.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 21 Jun 2023 06:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687355495; x=1689947495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z96FPUh9UYGyI5XWzCTFJ8ck3/AwXMuX3XBl7Y+Gyjg=;
        b=RFvrpnMM4SkSJxX4IQRz3kYqXbQo/MAaq2e+S6cBNR+4L8dhsKjncdAVESUsOlD4c/
         xK7UGIMCS7tmoYbVD8iyLS/QkU7DGVBHzagOGLRLmvyfY/CMaOUZAikcZ4Hs56jkpxSb
         HOoOl+uJONLIbn8cuBhza/SHe4JBCRTwbDseJBmVaJ2vE4ccTr8/2Yn/pQLF2SXIMv5w
         iIiljX8I5tJPBieoCoJgD0O8eKNOaQa2KUrqN9t+HTRQ5h7wEz9dVt9lq1tmLnE0xpdZ
         TzLBJyWpntE0WK2JT/Z+iSu2HutdCG0qaSHaLvUkt8kcbiAOvrzyyzPXuTpAkbOasxue
         wnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687355495; x=1689947495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z96FPUh9UYGyI5XWzCTFJ8ck3/AwXMuX3XBl7Y+Gyjg=;
        b=SpRMTYKZwpKu4KM91J3KeEnKDb+tp5Xd+aUnN5har1rHLmQp1b8M3JXIX3s8LAtZMB
         n78BIe4Z7w3mPFomc1vo1CGXQMnvFIGknTleE6RClXkwIfb2tCIQdkGYMCUXQIFJEujN
         rUwqkV56xJQWoMoAMi1z/KeBvQHR+e4SjdzTgSQjJ70JvfTjuf1oJFcyER8FlprSn5Nl
         oCa89drpVUDSWWUvZ9F8iKVV4MOO6snOano3Ya/PhLwVnc/5Ytwe4D+ccE5pzXe8RP1s
         NO23vr41mfu3gURHGGf2tfZ/a3IwBqzl+pC9OXwxcWNoJxRrY8xN+KwGVujv904lQH51
         v9uw==
X-Gm-Message-State: AC+VfDyO5ojYYXD9KG9i6Zt8ZRx2ILDvwwZjRoG7D+Hh/3jb6BSp2o9x
	nDHuHWwgSHx5ZR2cU0pzsbWAghRStcLncqb0yGU=
X-Google-Smtp-Source: ACHHUZ4tqE3annS4MxgiokDNddXQwwhCNAX048cXElUwR2Pvkl3jBuWc/iF1ycL5D+eVI4wV7OohO+4wQqGwORCnSNU=
X-Received: by 2002:a05:6602:2051:b0:777:a94d:d9d with SMTP id
 z17-20020a056602205100b00777a94d0d9dmr11687097iod.2.1687355494863; Wed, 21
 Jun 2023 06:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230621104656.2149899-1-Martin.Jansa@gmail.com>
 <CADkTA4M=ies0HM87uXrwj2vWFU0SiQp3MRb74=z=fnLT7eHOMQ@mail.gmail.com> <CA+chaQfgmuP-WdxPmAGamT6O58CbfF6VCL17v4zCMK4F3Nt8hg@mail.gmail.com>
In-Reply-To: <CA+chaQfgmuP-WdxPmAGamT6O58CbfF6VCL17v4zCMK4F3Nt8hg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 21 Jun 2023 09:51:23 -0400
Message-ID: <CADkTA4MKwoqrrwB9S_E5rUx6Frn6XfqmyzZ2nt7dOyBZBTz=CA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] netavark, xen: *.patch: add
 Upstream-Status to all patches
To: Martin Jansa <martin.jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 21 Jun 2023 13:51:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8104

On Wed, Jun 21, 2023 at 9:42=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> On Wed, Jun 21, 2023 at 2:57=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gm=
ail.com> wrote:
>>
>> On Wed, Jun 21, 2023 at 6:47=E2=80=AFAM Martin Jansa <Martin.Jansa@gmail=
.com> wrote:
>> >
>> > There is new patch-status QA check in oe-core:
>> > https://git.openembedded.org/openembedded-core/commit/?id=3D76a685bfcf=
927593eac67157762a53259089ea8a
>> >
>> > This is temporary work around just to hide _many_ warnings from
>> > optional patch-status (if you add it to WARN_QA).
>> >
>> > This just added
>> > Upstream-Status: Pending
>> > everywhere without actually investigating what's the proper status.
>> >
>> > This is just to hide current QA warnings and to catch new .patch files=
 being
>> > added without Upstream-Status, but the number of Pending patches is no=
w:
>>
>> Pending is fine.
>>
>> I have no intention of doing anything more with the warning fixup
>> (since my opinion on forcing ths on non-core layers and documenting it
>> within the patches themselves is well documented :)
>
>
> That's fine with me. I'm even willing to send further Upstream-Status fix=
es if I spot new ones in my world build (now I've enabled patch-status in E=
RROR_QA globally instead of just for oe-core recipes, so that I don't need =
to explicitly list the layers I regularly use in some of my builds)

Please do. I'll definitely merge them. I'm just confirming that your
effort level is appropriate with the broad use of 'pending'.

I'll turn the warning on here as well, that way I'll catch malformed
status on the way in.

Bruce

>
> Acked-By: Martin Jansa <Martin.Jansa@gmail.com>
>
> :)
>
>>
>> Bruce
>>
>> >
>> > Patches in Pending state: 15 (11%)
>> >
>> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> > ---
>> >  recipes-containers/netavark/files/tests.patch                   | 2 +=
+
>> >  .../xen/files/0001-python-pygrub-pass-DISTUTILS-xen-4.18.patch  | 2 +=
+
>> >  2 files changed, 4 insertions(+)
>> >
>> > diff --git a/recipes-containers/netavark/files/tests.patch b/recipes-c=
ontainers/netavark/files/tests.patch
>> > index 254e4e9..c4b3618 100644
>> > --- a/recipes-containers/netavark/files/tests.patch
>> > +++ b/recipes-containers/netavark/files/tests.patch
>> > @@ -1,3 +1,5 @@
>> > +Upstream-Status: Pending
>> > +
>> >  diff --git a/test/helpers.bash b/test/helpers.bash
>> >  index 89866ec..017b2b5 100644
>> >  --- a/test/helpers.bash
>> > diff --git a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUT=
ILS-xen-4.18.patch b/recipes-extended/xen/files/0001-python-pygrub-pass-DIS=
TUTILS-xen-4.18.patch
>> > index 3c7a97d..7ac1a39 100644
>> > --- a/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen=
-4.18.patch
>> > +++ b/recipes-extended/xen/files/0001-python-pygrub-pass-DISTUTILS-xen=
-4.18.patch
>> > @@ -1,3 +1,5 @@
>> > +Upstream-Status: Pending
>> > +
>> >  diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
>> >  index 4963bc89c6..c1c05eb421 100644
>> >  --- a/tools/pygrub/Makefile
>> > --
>> > 2.41.0
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#8099): https://lists.yoctoproject.org/g/meta-virtu=
alization/message/8099
>> > Mute This Topic: https://lists.yoctoproject.org/mt/99673711/1050810
>> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsu=
b [bruce.ashfield@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >
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

