Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF86EC433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 16:25:14 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.68.1654100711432922094
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Jun 2022 09:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N+RFspTW;
 spf=pass (domain: gmail.com, ip: 209.85.128.170,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-2ff7b90e635so24435057b3.5
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Jun 2022 09:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4CHffzMS4P5imUfpMVF9he/u7OfGmOVDwLmJ3oRhrLY=;
        b=N+RFspTWvOFub7PAqyfE7ua0sVkEskAN0FO4Cg1Vv/2zJWcnAJ4SJ+b5/KzlF3sES0
         XvEEQ2sxQbdInjPKtUW/5+rsmf6brUE6bYn52zks0YPX6Z6K9F60MMX2LrfsfCHJ7YEY
         3rQspn8aQFDJ/THDhNHcq6Tt3lne9L/TO46oQIVfzwiNouWqalRTsOXVulW+Ab4UGqhR
         OD4u4RynLmXcOeJjrQka2BByFJuNRH6YqJaj2Wy5p94LGYNCKRK1K+D8mg0kNQeew9Pm
         HBLXtgXpAZD9sf8KuotOyLHXzBsIneGx+CAJ3y+JBjWduj7C9G3UNDf9E9Nak4IqEaL1
         /3BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4CHffzMS4P5imUfpMVF9he/u7OfGmOVDwLmJ3oRhrLY=;
        b=tBRvIN1B8imdQ8iAgBgUTKAVz1OKKtC5gNjsFnd/FBfkpXayMjSfH5zOFjTcFmKh2f
         yEqzpTuLdOryMbWMAEIQ0mHbMnWBL8f++9YbtOTwmp2k7vC6bsE4CpP2gXKHOR065xI3
         z1kYl3Y1uxdKPB3AADbrk/OUtvWCbMH/zNMtdkJRBOcT/Bk9OStVKqgGdkZFyLgsBS29
         ao0naVHU5byy6rHd2JgWbN8b3S/wD4/QAtMAxdoGN4FRidB9eclZxDfN5n6o6lRy/2a4
         yhJoJ7dzGGdeT/AmkyDGlOvLc/VAZIditQz0gmxmPE+YaoFC6XACUoGDK2IQTKsAiwZ5
         ZH7A==
X-Gm-Message-State: AOAM531Gp84oDbNJn7eVV/DyB140F/JPYIGvCynbcz38FqtL0PE3HzNK
	hsPCbpFKPHRzCodO7d0UVSb6XREMlvyDq2RBQsA=
X-Google-Smtp-Source: 
 ABdhPJz/6QuJw49BJO54sJ+WXQuZm8SrLyhhFxJDBfU2ibep1wGuV6b1wY3VylZZh5VoIBXFKVpjjGQ8YPTmtczt5go=
X-Received: by 2002:a81:9b4a:0:b0:30c:c499:eb01 with SMTP id
 s71-20020a819b4a000000b0030cc499eb01mr316264ywg.34.1654100710604; Wed, 01 Jun
 2022 09:25:10 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAKGXpebcjpJzWVZBYOm1sB3277A7ryOaid1UG5a9BkAig=P5OA@mail.gmail.com>
In-Reply-To: 
 <CAKGXpebcjpJzWVZBYOm1sB3277A7ryOaid1UG5a9BkAig=P5OA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 1 Jun 2022 12:24:59 -0400
Message-ID: 
 <CADkTA4PNBQG-C5QDiXgMPXZQuWhbiHt_4CHLNTuJoKCFEAJ8Og@mail.gmail.com>
Subject: Re: [meta-virtualization] [podman-compose] references absent SRCREV
To: =?UTF-8?Q?Aur=C3=A9lien_Bertron?= <aurelienbertron@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Jun 2022 16:25:14 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7331

On Wed, Jun 1, 2022 at 12:05 PM Aur=C3=A9lien Bertron
<aurelienbertron@gmail.com> wrote:
>
> Hi all,
>
> On kirkstone branch, the recipe podman-compose_1.0.3.bb specifies the
> following variables :
>
> SRC_URI =3D "git://github.com/containers/podman-compose.git;branch=3Ddeve=
l;protocol=3Dhttps"
> SRCREV =3D "1555417958dfce23f03eeb7c1e85caacac7469b3"
>
> Problem: the commit 1555417958dfce23f03eeb7c1e85caacac7469b3 does not
> exist on upstream repo, so the fetch step fails. Am I missing something?

History may have been rewritten .. which is a no-no, but of course can happ=
en.

That is definitely a valid commit, as it was tested before integration.

But now the commit is dangling and not on the devel branch (it is
still valid, just not on that branch).

I'll run a few tests and fix it up shortly.

Bruce


>
> Aur=C3=A9lien.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7330): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7330
> Mute This Topic: https://lists.yoctoproject.org/mt/91479833/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

