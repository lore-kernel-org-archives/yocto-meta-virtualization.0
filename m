Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9909E92722
	for <webhook@archiver.kernel.org>; Sun, 28 Dec 2025 01:17:41 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17539.1766884653471314135
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 27 Dec 2025 17:17:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Crtf+Kue;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-34c71f462d2so8660401a91.0
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 27 Dec 2025 17:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766884653; x=1767489453; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5/Ze0wuY+DeDkJM1O4uIMNEhuqTLX9WJxkZfT8L7rU=;
        b=Crtf+KuerkjNa5kWtTeA6hkxPn4LKqis2mYFX1Xv5oxn0g7A0iEPsVkIh0hFl6v+sm
         F+imHQOS/39bS7Pn2Kt6Jj8nSOtxm7kNWDJO8a6jYQT01BpchOxk1XaV8y6COjZvG+t4
         B/oALVdrMBYfWT8LRdOlHp1eBUJGIFTEhZ3zhv11tuGcq8PGJzssTf/Tcy11Av3h1gp7
         dOW1UT5gaGr6C39nGbHZcyl0P5qVozL/ulAl+5tg974n8K+KFDbiVSr+RRu8VIN0FRZg
         sxyq1kfw0PqSKo7VHe0StuoVL8tFqZO4PcfWKUj3cbAdjB3yvlwxnukZLxdMSSmT8wgu
         ceLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766884653; x=1767489453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p5/Ze0wuY+DeDkJM1O4uIMNEhuqTLX9WJxkZfT8L7rU=;
        b=SgAOUqE2xwoM46VanaHVBae5/C8Uet3QSm3MG07IxTVW0bkj0eSZqT43mc5P0ZgAJK
         7AN0l6SCN1qTuLmtIaXOVbhAqFds2sSwPxotQomYfwCIeNlFXjodNJ8ZyjMdUNE3T5k6
         xPtNJtdzr8DOBUiNmkS7dytjXOkQiBUVbNW0ejcEQOiEhkBGYkqqpQuEU/OXGHNN9M9f
         OQjHjwOqEmYwyTaYaVLw24/hoVuiyPVsDK832AXstLk/NwPEKn9R/AThQ13Q/9oZNvwT
         c+wyX02s/JHKyjBRAUL5SzXZG/W74auPOtvVimerU0hANC1gaFKTg5/UAgv5XTsGBLYw
         t9tA==
X-Gm-Message-State: AOJu0YxhMe6VtP5wwXkB5F24d5HcnFZD8DRdiYE2Ak7OAgI55o3e7f89
	2MKcC/d3UfJ7HKzGc+Wx7F9pQeAusZaCGCXiTcizHEVhQrYAoAHIYgWbUsfanQh0gyaJrQ2VoTb
	lNJ17O+8PqwQHVu2ARmo4JBVK3yUeneQ=
X-Gm-Gg: AY/fxX4EmvaeOGQtD+mwIaZRj/Ba9jGLqszUISXmV3nnEQyK1k4XYdyiaR+g0wt2Vmq
	iueZ7Z3RdhLsTapNA+m+rfwk19MS4x71Ga08xpHOfh+y0RRrmWZTcR2I5NYgaO03eXmM4KARsqU
	BFP24mhJvRxkforpIcHoWt9cfSpkqvD9DnbtcQsayx8MUALooRn3Nm4hsGxkrR4ft4A156Xa3Rp
	PsEpH4btYtVkVq5Y+faRIZ55IQGFy9OSB2gfXOZSX6suVfhfroqkCEvbCbzmUehlgw27Q==
X-Google-Smtp-Source: AGHT+IG6h9KUS6ykgG1JJSSrW9PkAVH53WOtTbh2ksKz7+t1otrFyQCpD7C/SJyjHtkwtw0Uz112gJeVpaUGY3WBD10=
X-Received: by 2002:a17:90b:52:b0:34c:94f0:fc09 with SMTP id
 98e67ed59e1d1-34e92139d60mr22446091a91.10.1766884652769; Sat, 27 Dec 2025
 17:17:32 -0800 (PST)
MIME-Version: 1.0
References: <3pakbkmf474bma2anwabz4e6t674vsqr6lpksnqy3ix6d33i7e@4lrzjpkmt6kw>
In-Reply-To: <3pakbkmf474bma2anwabz4e6t674vsqr6lpksnqy3ix6d33i7e@4lrzjpkmt6kw>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 27 Dec 2025 20:17:21 -0500
X-Gm-Features: AQt7F2qaebOaDZcYREWLpjX2dcfRT-Hzz5FYgTtqwr1rZhBFbBSMwMZ-tS503q0
Message-ID: <CADkTA4MkZwD-e557ONgn4bSwYrmCk=MHOoKSc_Fjw5wVJC9hVg@mail.gmail.com>
Subject: Re: [meta-virtualization] nerdctl fails in rm_work
To: dmitry.baryshkov@oss.qualcomm.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 28 Dec 2025 01:17:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9506

On Sat, Dec 27, 2025 at 7:37=E2=80=AFPM Dmitry Baryshkov via
lists.yoctoproject.org
<dmitry.baryshkov=3Doss.qualcomm.com@lists.yoctoproject.org> wrote:
>
> Hello,
>
> Our builds stopped to work because the updated nerdctl recipe fails to
> remove the sources in do_rm_work, because all the source files now have
> 0444 permissions (0555 for the directories). Could you possibly take a
> look and fix that?

I don't run with rm work enabled, but there are functions that deal with
permissions.

I'd recommend looking at the classes and what they are doing and why
it might not be firing (or finding a non rm-work use case), as
I'm still working on release items and won't be switching / using / testing
rm_work any time soon.

Cheers,

Bruce

>
> --
> With best wishes
> Dmitry
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9505): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/9505
> Mute This Topic: https://lists.yoctoproject.org/mt/116966533/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

