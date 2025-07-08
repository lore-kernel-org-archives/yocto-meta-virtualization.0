Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03467C83F09
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 13:30:54 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.18851.1751981448887069785
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 08 Jul 2025 06:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g2aDn5nq;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32cd0dfbdb8so34356731fa.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 08 Jul 2025 06:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751981447; x=1752586247; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0aHHECdaXyKFNJByLj3DUSHV+I0v2PwCfMgW1g34EuY=;
        b=g2aDn5nqEsp9RLK3lloB58jR1nRR3c+EPEXeIp3i5r7itt6GArg53Uj1Sj6QWdcbRc
         XR2hJ+WQ4MrgRApBpOD9B49AV0K/NzBcPKZwEeB2GgsbH6BXdHCeNyQO4Cx8yrBT/aP4
         AW7CBo+GAW+GPztdu5TmH+wPgHTVrz3lhRY/YyWUbytdmkB4ME8ba6zWpA/Y8dP4h7ub
         ZM51SYV2LSlJ47UUywGZJ9I4T0HDuFk8OwveidFgI8+KlBzEtNs+pThHT5oemjjdDfWP
         pRmdBGBE9XAr5T4Pk7CNtRFmIPOO4m1pkq/nKDZsTbx59c9Ar5Dp060XhTPi6HoMf6cE
         /ISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751981447; x=1752586247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0aHHECdaXyKFNJByLj3DUSHV+I0v2PwCfMgW1g34EuY=;
        b=UHne2h1Htmvvw5mkJQ2r5qCUwuv5Z9hc+L5DA1DdSFibfkhWih5qcygxgOdUXljh5C
         cwZ99yvbnlg6LNYtFqCx6ZMOMQ0r0C3g6dY8Cp9OdTrIzFEAkXz8e+BDLAOqli+V8B/J
         zws9UZ/qK4pnrPd0s+yRdkD3Cxium5v1Gswh6oiS7YVYtA38r0gO/Nmbe5oZHQL9jwkV
         Rb8Veo+MwSwpmlU8jNgedXnO0Qz/Aslr1mKeEZrzIZx2Thrb5hVZr3iaywHdRkQFxPCe
         EhCa+iGjzmVRZUF+XoMPbIb8GlBZFe+qb5pJMcQtR4gNuVb9bum5tBDwxi+bMcdqg8uD
         vnYQ==
X-Gm-Message-State: AOJu0YzQFJhEx+nisVcn+DZDqL/YyzHGj5gih5xv5NmI7XDtCsGVGNuz
	sFQbX7SWiGMIkDjBZkOoL+58gFRPjzXckUfsCe1o+TgLjRYtCL0VmB1IidbTzNld1Ow6wxlMHud
	68tdSvjmttr520jnujazykObHT6raOd0=
X-Gm-Gg: ASbGnctCNBnUzuAgQtIsUzqqqzW0+cO8s2tNnrB+zoQdfFTu1pMkvWfLxK3Yl/16lUQ
	VMxuTsaCmhwDsbB9FfEMC3vwZWhmID2R3mFt0apUGt9vluMU/506mj4ZSK0o4Bg5Y+dP8DFHQab
	u8RC3ZSpE7dy6f2pauYgCTDnRGbWZ8JBHyfwHD4PGuH81Pbg==
X-Google-Smtp-Source: AGHT+IFMZfYOcF55nF63+XsHY51B4HLtQCaqDhbteQqG5K6qZDrbV72dpQ4gE6b3U3fOudDouUGFb7vjklHDA573eX4=
X-Received: by 2002:a2e:b892:0:b0:32b:7284:7b with SMTP id 38308e7fff4ca-32f00c65f25mr48368811fa.6.1751981446472;
 Tue, 08 Jul 2025 06:30:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250708131302.3871609-1-martin.jansa@gmail.com> <CADkTA4MLSZNpyGE0-_U09DPMZUVb=rxxGT6Zdc9mwUmRJPZ6fA@mail.gmail.com>
In-Reply-To: <CADkTA4MLSZNpyGE0-_U09DPMZUVb=rxxGT6Zdc9mwUmRJPZ6fA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 8 Jul 2025 15:30:36 +0200
X-Gm-Features: Ac12FXyJON67xHvKns5UGFNmCQxDfsv1nB6sXNe049imyqFBOqr6s5KC_KhKZzk
Message-ID: <CA+chaQcmFaisAcy=WrsuWcey2LtxjAGx=oa2ZXUVZx+9-1P9Ng@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] xvisor: upgrade to 3.0.2
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 08 Jul 2025 13:30:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9303

On Tue, Jul 8, 2025 at 3:22=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmail=
.com> wrote:
>
>
>
> On Tue, Jul 8, 2025 at 9:13=E2=80=AFAM Martin Jansa via lists.yoctoprojec=
t.org <martin.jansa=3Dgmail.com@lists.yoctoproject.org> wrote:
>>
>> From: Martin Jansa <martin.jansa@gmail.com>
>>
>> * the old SRCREV 6b23764a1439f9d08b2ed2f363da522460d8a22b doesn't exist =
in any branch
>>   upgrade to latest 3.0.2 release from Jan 1st 2023
>
>
> I was looking at a similar upgrade just a day or so ago.
>
> I can take this patch, but I'll re-work it a bit, as unlike some others, =
I really don't
> like bouncing recipe names to chase versions.
>
> So I'd keep this with PV in the recipe and _git as the recipe name.
>
> Actually, I'll just fire off my script and do it, and add your name to th=
e commit log
> as prompting me to finish the job.

Fine with me, thanks.

I've realized that I could have added the tag in SRC_URI as well as it
now matches the tag.

