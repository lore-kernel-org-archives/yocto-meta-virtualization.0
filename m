Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB1C7D1A434
	for <webhook@archiver.kernel.org>; Sat, 12 Oct 2024 03:27:16 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.3845.1728703626905874466
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 11 Oct 2024 20:27:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N3v9mXVV;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e31af47681so193377a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 11 Oct 2024 20:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728703626; x=1729308426; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U4ChYSjjfM74xnr7xSzqpd95UNjBr/gXhGPj7ncAuZ0=;
        b=N3v9mXVVHqjP4isMPHDVRYVceKhsJ1cVhcQqM+51+9nKJsLH9Q+0m1o6qvzSqYiggZ
         qAMyHyntELHNoL4RzdnbH+E6HfSXUul2qykZfahCV+ejvuCJq0aB4WZp0Tos/URLH3kF
         +Us32eh0qVoy/5boJj8ag9u9U3q5XGroYAF3RKGusX55dgUhqZr6KxCIcvd3Hiu1a+V3
         g8j1c/QDW+mhFcI22rNfBmMJUclflYRrCUyALkNDz8acU8kG87Z6lYYlYl3oErQZfbc8
         W2eMYvmNA2KotD3ljR7MnRhECdF2iDpFARhx8eE4hHPt4hu/NT1MVvjtnSqlrPc/U7d0
         8SjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728703626; x=1729308426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U4ChYSjjfM74xnr7xSzqpd95UNjBr/gXhGPj7ncAuZ0=;
        b=sFRE4dESZThsNTgGrhCq3v2EjtAHpXUdCbl/k+o4UOSBLZisV3pHiGBk1qFitID5RC
         WS97ubkpmXkTlnKq1al5obZWm5efqXMX/teUjhz+ewm64wim7UOs5NCJVjtt0eADZLY6
         QH57w1Wd0tARuYI4dE4asCtayW+GCm5HYX3AEMUrSatZYt4aELtkHuNSCtnTdfZXqeN7
         sY9moEd3cpM0mYQ7nV/x+183HsFJRcvva4oqwESK6o0xfA2AwOpriC+dI25ufQYWLdXn
         D46BLRkpQTIFVrYwIxjtbvLYRxHE+xT6Axj8l7rYIByGNubcFSHuirHOX8gKImeFJ7Dr
         AldA==
X-Forwarded-Encrypted: i=1; AJvYcCXLPrnl6NY/+zCNDsvIMkE30YraM5ebHseSBq7qisat4tZ/TiiX4QB8P6F8c5AtqO2UvGmvK6X5aRETDngGTYWgwKUh@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxxsLQy1TgArVtNLyRW85Lrmvfyl541D0uqlOyft+5o1sAFzljE
	RuAE4LI6/2TnpPpYNb9/+SK4dv9JSdQgHWs2DhCOSKcOWFurhuG8moYnAfMQkcj/NVqibqy6TTo
	1K3t2rK4PAWA+X8Cfzea21z65rNE=
X-Google-Smtp-Source: AGHT+IEc7eeDx4ss2ainAn188VTJnoKh9U3Kv9MSpxlcgbjSPD6s/GbKxikdi+e5xPIcPjaDu9t4NOl3vOkdkxKzYnk=
X-Received: by 2002:a17:90a:f40f:b0:2e2:e092:5323 with SMTP id
 98e67ed59e1d1-2e2f0d8c914mr5189129a91.29.1728703626083; Fri, 11 Oct 2024
 20:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAAfyv340PmSBG6jC-qjPm4kBVeVYfWLukgyBh3pt+wXE+eC52w@mail.gmail.com>
 <17F2ABA7EA75ACA1.18304@lists.yoctoproject.org>
In-Reply-To: <17F2ABA7EA75ACA1.18304@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 11 Oct 2024 23:26:54 -0400
Message-ID: <CADkTA4OpjAOtd=opzm=BKH-MsMrdGNCwwAr+SdxKMJx0FOMu7g@mail.gmail.com>
Subject: Re: [meta-virtualization] meta-cloud-services: fluentd issue
To: bruce.ashfield@gmail.com
Cc: marek.belisko@gmail.com, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 12 Oct 2024 03:27:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8928

On Fri, Sep 6, 2024 at 9:45=E2=80=AFAM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
>
>
> On Fri, Sep 6, 2024 at 7:12=E2=80=AFAM Marek Belisko via lists.yoctoproje=
ct.org <marek.belisko=3Dgmail.com@lists.yoctoproject.org> wrote:
>>
>> Hi,
>>
>> I'm including meta-cloud-services to my project in order to have a fluen=
td package in my image. When I run the build I'm getting various error that=
 libraries have incorrect format (e.g.):
>>
>> ERROR: strptime-0.2.5-r0 do_populate_sysroot: Fatal errors occurred in s=
ubprocesses:
>> Command '['aarch64-poky-linux-strip', '--remove-section=3D.comment', '--=
remove-section=3D.note', '--strip-unneeded', '/data/projects/test-build/bui=
ld/tmp/work/cortexa53-crypto-poky-linux/strptime/0.2.5-r0/sysroot-destdir/u=
sr/lib/ruby/gems/3.1.0/gems/strptime-0.2.5/ext/strptime/strptime.so']' retu=
rned non-zero exit status 1.
>> Subprocess output:aarch64-poky-linux-strip: Unable to recognise the form=
at of the input file `/data/projects/test-build/build/tmp/work/cortexa53-cr=
ypto-poky-linux/strptime/0.2.5-r0/sysroot-destdir/usr/lib/ruby/gems/3.1.0/g=
ems/strptime-0.2.5/ext/strptime/strptime.so'
>> Command '['aarch64-poky-linux-strip', '--remove-section=3D.comment', '--=
remove-section=3D.note', '--strip-unneeded', '/data/projects/test-build/bui=
ld/tmp/work/cortexa53-crypto-poky-linux/strptime/0.2.5-r0/sysroot-destdir/u=
sr/lib/ruby/gems/3.1.0/gems/strptime-0.2.5/lib/strptime/strptime.so']' retu=
rned non-zero exit status 1.
>> Subprocess output:aarch64-poky-linux-strip: Unable to recognise the form=
at of the input file `/data/projects/test-build/build/tmp/work/cortexa53-cr=
ypto-poky-linux/strptime/0.2.5-r0/sysroot-destdir/usr/lib/ruby/gems/3.1.0/g=
ems/strptime-0.2.5/lib/strptime/strptime.so'
>> Command '['aarch64-poky-linux-strip', '--remove-section=3D.comment', '--=
remove-section=3D.note', '--strip-unneeded', '/data/projects/test-build/bui=
ld/tmp/work/cortexa53-crypto-poky-linux/strptime/0.2.5-r0/sysroot-destdir/u=
sr/lib/ruby/gems/3.1.0/extensions/x86_64-linux/3.1.0/strptime-0.2.5/strptim=
e/strptime.so']' returned non-zero exit status 1.
>> Subprocess output:aarch64-poky-linux-strip: Unable to recognise the form=
at of the input file `/data/projects/test-build/build/tmp/work/cortexa53-cr=
ypto-poky-linux/strptime/0.2.5-r0/sysroot-destdir/usr/lib/ruby/gems/3.1.0/e=
xtensions/x86_64-linux/3.1.0/strptime-0.2.5/strptime/strptime.so'
>>
>> and when I check the library it's compiled for x86_64 while my target is=
 arm64.
>>
>> I'm using kirkstone branch. Am  I doing something wrong?
>
>
> I'm overdue to update the recipes. in meta-cloud-services, so I can have =
a look at
> this when I get to that. Typically, most of my m-c-s has been for x86 tar=
gets, so
> Clearly there are some cross compile issues still lurking in some of the =
recipes.

There's still a lot to do in getting meta-cloud-services ready for
release, but I have
done enough to get fluentd building.

Does it work ? ... not sure yet, but this is a big step towards cleaning up=
 the
layer.

Bruce

>
> Bruce
>
>
>>
>>
>> Thanks and BR,
>>
>> marek
>>
>>
>>
>> --
>> as simple and primitive as possible
>> -------------------------------------------------
>> Marek Belisko - OPEN-NANDRA
>> Freelance Developer
>>
>> Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
>> Tel: +421 915 052 184
>> skype: marekwhite
>> twitter: #opennandra
>> web: http://open-nandra.com
>>
>>
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
> View/Reply Online (#8874): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8874
> Mute This Topic: https://lists.yoctoproject.org/mt/108302254/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

