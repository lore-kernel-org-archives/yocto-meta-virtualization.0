Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE7AEC54E58
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 21:11:21 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.5009.1710191481642356096
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Mar 2024 14:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ePXG6UWO;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5d3907ff128so3957389a12.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Mar 2024 14:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710191481; x=1710796281; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cok0GJ4VMAe6wbiwZV8eUt+pFlUHGldJAhge/JmpuLM=;
        b=ePXG6UWOpNgmPlRO7emSdfA+LtIi/TdLdvC6C0BzUv/DGl+fUeOEDD5SUedkUPqjVv
         izGJ4WjLjqb0TbGsVzcSNCjkPzTwFykER2Y7HJ9Rg5LCtBdCXGeJ0c2cKwmlwDvdxYbi
         J4k8+Bxw8ZOXdQghLS68/UAK8SSFb3GKrAIHgPASo5xE16GvjxoFPZjjNHDRrJRXasE0
         6HJhzlQRxQpcmXHiamXZi3w8tu0gXURfaBSohRZpNgsAInEDaMePhBr8naXPVJdDBwie
         t6ZiB8oXzZ7ukTqJ0IXtTWkLormzga06WpNPYHGLNN3Skf4okNGKj0yFpZiMlkKkkGxp
         qozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710191481; x=1710796281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cok0GJ4VMAe6wbiwZV8eUt+pFlUHGldJAhge/JmpuLM=;
        b=hHkRGkCdIejNSnNuXTS4KQ+EbKEsgrwajgrdaJrRf4L4pWJpeOPZIM5rojBYwJR78i
         bKM9GY0iCJeg1CbP+YY5mH1+q35xaL9PRR7gutj2bTRJYxX1Ga1uaYnyv2ZROMKmNCZs
         J596Ixyyk9PlCKVzn0UVLNaNj3ZbEoULd7Po2yJOjatJq9Vw5//5jaOBaGIB3Z7UjHhS
         DxgBuWIG0TRuYe9AuSx5WOnB8+FA3EpYV41MW2yE+qOcYzkotBuJG1iGeNREufAywIQ/
         CzzgfK0JyIbYdB1e49UJlrzHk4FgEtkH1QuXhnidCzCG+hkhVkCxytOdJLU0H958itgP
         PTnA==
X-Gm-Message-State: AOJu0YxiPRU4TSnB+OraznI1X8M1ubma7/lQVLYPOM7tx9hXeahs0RkQ
	6fk7hMLzX+Evw8kHbitSoMqaG4zevrPvckKjwG2IUSF19hFlfCeONScytkPRFNn/O7wYJkyLxkt
	gwj/zTix9bxZERmkaOWglJgikdFg=
X-Google-Smtp-Source: AGHT+IGK7TMDxB8xTeJKsBjmrxZk5JDHXRgg4HqU5cMA7zR9lfBwwlfONUI8K1WIIusW0CXJDg/11PiKWNoAZkLwZps=
X-Received: by 2002:a17:90b:1107:b0:29c:93c:4ce4 with SMTP id
 gi7-20020a17090b110700b0029c093c4ce4mr3010392pjb.17.1710191480799; Mon, 11
 Mar 2024 14:11:20 -0700 (PDT)
MIME-Version: 1.0
References: <17BA0B9342C35A1E.21429@lists.yoctoproject.org>
In-Reply-To: <17BA0B9342C35A1E.21429@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 11 Mar 2024 17:11:09 -0400
Message-ID: <CADkTA4M9w2W+7Cio6x2DBsHf+i6TPtrodVB4p5it_oGbh0bO-w@mail.gmail.com>
Subject: Re: [meta-virtualization] ceph upgrade
To: bruce.ashfield@gmail.com
Cc: meta-virtualization <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Mar 2024 21:11:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8624

Hi all,

I'm still looking for help with this.

It's all fine and well that folks have packages that they are
interested in more than others, but it needs to be more than
maintainers that step up and fix the niche packages.

I'm still holding the meta-virt master-next -> master push until Ceph
is upgraded and working.

I know absolutely nothing about CMake, so I'm flailing around in the
build of Ceph and have gotten no further since I last asked for help.

Bruce

On Tue, Mar 5, 2024 at 9:22=E2=80=AFPM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> Hi all,
>
> If anyone has experience with Cmake, I could use a hand completing the
> ceph upgrade that is marked as WIP in master-next.
>
> It took me a few hours today, but I managed to get past python3
> detection issues, but now I'm running into a compiler test failure
> during the build.
>
> To me, it looks like our sysroot isn't being passed, which could be
> related to the toolchain.cmake not being used (since the compiler test
> is being launched by a sub component).
>
> I'm inclined to be stubborn about this, and keep working on getting
> the package bumped, as it has missed a few upgrades and is in need of
> some love.
>
> Bruce
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8604): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8604
> Mute This Topic: https://lists.yoctoproject.org/mt/104759213/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

