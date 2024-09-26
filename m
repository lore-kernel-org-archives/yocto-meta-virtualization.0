Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3146CF9C7F
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 12:57:06 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.42015.1727355425562207022
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 26 Sep 2024 05:57:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V2jl0GQ7;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7db299608e7so612672a12.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 26 Sep 2024 05:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727355425; x=1727960225; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1Tl/cayW21QBunDACMjihzLYAWdi2xokuL2qY+SS3Y=;
        b=V2jl0GQ7jbRTLIoZCh+HjQLnpSYoIzSSPxy+RkU9ZBe5PJ4ayr4E7SdNMApFzes9Tz
         9vr1EJ+dYYUFJwWwRvc9jYgyV8+x14iIxdKohAVdUer2fdPmuO17FgEtP2ASSpqEnfGy
         hJRN55wZ+gdawscASPsfpAMLRUWbHKWt7hO0drPynNMLqzPxAIbaQjRiRBPyV30nDD2d
         vuWD9duzbh0BlQp1VbbRb2zYQuz9qH1N/LN12CLMYoVLg9zMI0R4yOsgUu/qwmxWaCiD
         4dWo/O1ET+NeROJWJxHgojDKihVsCPaYrESh9BMgxZw3bgkSQGLIOK6vr01yI9/hRbtp
         4KYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727355425; x=1727960225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1Tl/cayW21QBunDACMjihzLYAWdi2xokuL2qY+SS3Y=;
        b=FCo6H1Avr7a/gxQW2+j2+uTpLGsO02avc2ztbRg8q2+AZHcJMYjkvfqbvoKMHMijDC
         imxVL0UHJQxpVVp+um9eU7nECi9+pHNOO4dfz5p/WWwtB4GtGsqgO66Uj6bG0PkVnB6W
         2D9+BLVFHxtuM2k+pgC1YAoDZG8lkm+B3euqC1IqZLA9I5194XUaaBU+PISOzu0l7lEe
         CzGo8a6vnEos7rv+xUMvWTmCIQWlQxFqLt6PDNOHXKhS4aceGv8GszNzgJP5uu8LqiFk
         eLCCcaux9dJLE9APunBC0DWljux8sLJHNqKpjfz3OfkGTd1VG3PaHq4Hz2A3717F6W2X
         3l8g==
X-Forwarded-Encrypted: i=1; AJvYcCX12jr8F5ZHg8Chfs6WtqW3OwOb+p6VjgAXxS77wc2Xrv65ZqQCkFnwqivculkDB68g6MlCx0wIGdiFc7EhHKbAVjJs@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwD4ukIrPB9XBkHLprv4H9InO4FPaEWcu1u+orIHBlJRTOIKefx
	juKb3DofOzagdWlIj8k0HT1nzwAl+5HRqBI80OJZj4/oo3FC4Cs7XAdNsCiqNLgwitcH0Z0wq9T
	xKsUHdKaw5ddlpaDgsSB3nOWKFSw=
X-Google-Smtp-Source: AGHT+IHopeLCaBsmdNBfJfKaKy9qe5O8Jru75NOHRr+HtJCwlwCi3XuMEaEA3p5rHG7oAnfWQEuRhgKT8ZCIMiPLZnM=
X-Received: by 2002:a05:6a21:2d0a:b0:1cc:e7a2:2bef with SMTP id
 adf61e73a8af0-1d4d4ac991cmr8621010637.30.1727355424795; Thu, 26 Sep 2024
 05:57:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240915080816.81614-1-peron.clem@gmail.com> <17F5683C6CC73280.21522@lists.yoctoproject.org>
In-Reply-To: <17F5683C6CC73280.21522@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 26 Sep 2024 08:56:53 -0400
Message-ID: <CADkTA4P9Yia87yaU1p4NHTsYBPxdroWsvgB1NCuG7w64VKCuVA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] k3s: fix PV not properly bumped
To: bruce.ashfield@gmail.com
Cc: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, 
	meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 26 Sep 2024 12:57:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8899

The updated k3s recipe is soaking on master-next.

Bruce

On Sun, Sep 15, 2024 at 7:44=E2=80=AFAM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> I have another round of package updates about to land, so I'll probably n=
ot take this change exactly, but thanks for the patch, I'll look into what =
went wrong in my upgrade process.
>
> Bruce
>
> On Sun, Sep 15, 2024 at 4:08=E2=80=AFAM Cl=C3=A9ment P=C3=A9ron <peron.cl=
em@gmail.com> wrote:
>>
>> This has been missed in commit
>> 4fbc98c93c5a68bde74b4691da190885022bdbbf
>>
>> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
>> ---
>>  recipes-containers/k3s/k3s_git.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/=
k3s_git.bb
>> index f9443c46..c42e907e 100644
>> --- a/recipes-containers/k3s/k3s_git.bb
>> +++ b/recipes-containers/k3s/k3s_git.bb
>> @@ -19,7 +19,7 @@ SRC_URI[k3s.md5sum] =3D "363d3a08dc0b72ba6e6577964f6e9=
4a5"
>>  SRCREV_k3s =3D "16321f2554c50281218f3efe999e085b5c6aeefc"
>>
>>  SRCREV_FORMAT =3D "k3s_fuse"
>> -PV =3D "v1.28.7+k3s1+git${SRCREV_k3s}"
>> +PV =3D "v1.30.2+k3s2+git${SRCREV_k3s}"
>>
>>  include src_uri.inc
>>
>> --
>> 2.45.2
>>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8895): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8895
> Mute This Topic: https://lists.yoctoproject.org/mt/108460584/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

