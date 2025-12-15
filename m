Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C935AD5B16E
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 12:30:54 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47423.1765801846259612545
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 15 Dec 2025 04:30:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y8mZ1pB5;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7ba55660769so2559822b3a.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Dec 2025 04:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765801846; x=1766406646; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2STL5z3oyM0qXD1D5Ue51mKerjcZ0unElvz5NrhFVw0=;
        b=Y8mZ1pB5i7PV/hzErUCUqvVij3JF6VmFjCb5/zi0vEn0sAN67C1qQtOkYo4OcyOZHV
         kH4tAQnii3iVL50c986WPuVG8N+UcY1l/izy9uJCJNZGx1sh2cXKeHPypMYnXBfTzPr9
         46JJBByzDxHBzsSircW95h5mP2ofJiyGTRxEoO51mI9on1zJHPxBuKxjHC4tHvaIb+p/
         /ytlTSroI9HQ8A2uhtP8q8xLanZBS21RIkuR+nXk5XQPSqryjXAJ03eTlvSHBjwzVB+U
         pt+wwSFkxIj7W367S6z+O1WmDu8Hd6vRky+bY97P0wYBPgwODb1aTHVT043/voK/ic/D
         C2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765801846; x=1766406646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2STL5z3oyM0qXD1D5Ue51mKerjcZ0unElvz5NrhFVw0=;
        b=WIzGk9VdnbwqsL6Fz1s/Mr978ngikbSAQBjHDSDcDIalKyNZok7UCrk/Fao1J+nKgL
         FIBJE7MlN8kQNSa9SF6ZzVcpEWALnU3FjNDHfPUxhYtsg8oTcbYgf6mzAcYNsLpah6DV
         UAOK6DGufD/kUE7+xIpiYdWMj+0dGQZIIgo42RwNLkUsslwiqcLBl9bpd3Z7/SkjUZyZ
         xkw7bImJEAOvFadbMZKnbQYtp3zlVuLBrUSHf5JEopP3rpZypgG1G9pz6CsDju457Thq
         WvGLgCMNa4uqQtRFXh2Y8twZDML+xPmWXJgnLJE+ClYZ9ojRpRc0hAA02wdMkPB/M7Uu
         ikuQ==
X-Gm-Message-State: AOJu0YzIMLUk6UxP3yWf2Ka+FELFsUYzrVunzks7HCu+mbwLuDajt7L8
	Vs3C7vc1gmrj9ND+9n/FuNLykmcGH5m7ISDQqzmK6xOsuSOcyfBCKqKr+8qTTXzuL7pJCFXm7Di
	LakhkkTkMukEqedLVhBhSNHKDFDFMsI0=
X-Gm-Gg: AY/fxX4UMRFbMbMP3WCk6eY3o7uZq/d1ik28QhqAlFPmdtYXRJ+DnE5mTu/KcFwiFtp
	sufV50iMaliJnYiLAeIxJgDad3akVd8ud2RdK4gbI1vW/3xm1kmedA3mVtN+fleDQNl/WnMYb03
	Ph/FiEcCH4sBo4CgYybx99wSkS77iB/29nazm5+To3MOHCzw+vTpYKqmg7yQlB5vJvoUk0Q/S/v
	zGM/WnANedktgr5uPAfRxXooyhwRx+wJRqb3BXYKoDOnMBlcoPRUt6+HpsZ1A1TDsdI9A==
X-Google-Smtp-Source: AGHT+IFW0FgP+N0ooIMt+1PkbBA450BvsJ293qzF5eR3GfLedNXtQzS69XyQliaU2Fz5fANfO4bw2koAxl07CsVbcBQ=
X-Received: by 2002:a05:6a20:12d1:b0:352:7cc0:93b7 with SMTP id
 adf61e73a8af0-369af337592mr10318033637.40.1765801845456; Mon, 15 Dec 2025
 04:30:45 -0800 (PST)
MIME-Version: 1.0
References: <20251203082423.2747388-1-hongxu.jia@windriver.com>
 <20251203082423.2747388-2-hongxu.jia@windriver.com> <159171.1765793140865389299@lists.yoctoproject.org>
In-Reply-To: <159171.1765793140865389299@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 15 Dec 2025 07:30:33 -0500
X-Gm-Features: AQt7F2oQ3uB2Lj_IV2CNd3VZrsu9ePzvtT5koqlt6zh8fyJerYS1yOpd5x7lWkM
Message-ID: <CADkTA4MYbESGmB-4P1db2-dkzMhtz48zhb4-NBHThikk7iwxAg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 2/2] libvirt: fix build failure with
 libxml2 2.15.1
To: aguirre.nicolas@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Dec 2025 12:30:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9482

On Mon, Dec 15, 2025 at 5:05=E2=80=AFAM Nicolas Aguirre via
lists.yoctoproject.org
<aguirre.nicolas=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> Hello,
>
>
> I'm facing the same build error where libxml2 has now deprecated a bunch =
of APIs.
>
> Just for my understanding, I was about to fix it by bumping the version o=
f libvirt to v11.10.0 which has already this fix in and I'm wondering if it=
's better to patch like this of if bumping to a newer version is safe?
> It's maybe because we want to keep libvirt in version v11.8.0 ?

Check master-next. The reason this hasn't merged yet, is that I am
already working on an uprev for it. I did virtmanager already, and
this bump is under test in my local branches and should on master-next
shortly.

It'll be uprev'd before I branch for release.

Bruce

>
> Best regards,
>
> Nicolas
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9481): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/9481
> Mute This Topic: https://lists.yoctoproject.org/mt/116591139/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

