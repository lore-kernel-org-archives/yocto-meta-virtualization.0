Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3847EC4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 13:55:29 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web11.95000.1701093319444132918
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Nov 2023 05:55:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HTbIRqNv;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7b35d476d61so110892439f.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Nov 2023 05:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701093318; x=1701698118; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vvTwzVIbEC19btcMt4ndremByXDGw4zEj17G/wWQ3AM=;
        b=HTbIRqNvDe91ddG36yW6A85nw3zIBaSXub7NpSqlSD+oATZJTKPhCekRnDvyD9SBan
         M/gDTjtjS87fa8eti/AIyVxeqVg+IAwvAqyu86SJj4HgjnZmY3GkIadHP0JetUz2eBXc
         UFEJ3N1sxcy9dOfI6Eq+IrfxiGpEriQEePNah19lqa65gMqCOqfya4zUwO/HFsgLFrtR
         csl78WiTfQ2W8whGLtS6u49eTPGoaCuKYkdxceLWorNIFGRs3cRjuclwM6WSba5cpHyM
         llriPT878JfnafRn6OYTF0+eyMCFEuCg8DbxOaKCu/usdjExmwBDFfvJI0Fmc6PlJ3SE
         BYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701093318; x=1701698118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vvTwzVIbEC19btcMt4ndremByXDGw4zEj17G/wWQ3AM=;
        b=tNY1kUB+oMFM9yrfVKmjEThE6E0L/aJ4VzzWGMjZ3O6BG6ToNwBN8MDjCXG7X3CbA8
         GRd2sdqoX6ptSsFfyniaMSdhVTPI1PgZtoz9MPs4Nw1iVhUNKAMw5byWZeet3P7WiKqJ
         D/0sF1bZYVYGv+a8dnkiAnBtbNbdZABE8McwiW+x2GAfknkRsMTo+ElCHgnAkSDpcojg
         3ulZfZVjOsJoMDxyvtTMXOWpIT4cITQN87lH/CgAdMvkR2dBOpI82xTlSWQn/UzmhKnQ
         yAlY3vFy57mRVMnOFL8Z3e3dWM5o0LSmXTq+h5VvfMiMpFX7fl0nHd65ZIn5xJ7L7r/m
         dzZQ==
X-Gm-Message-State: AOJu0Yw2rJZgDPiAhDGzhdWVNlD9sCwNwMPJt27RNzlZhAb0ezUV5rVx
	wJdAh5mlY7FSp/GkPGb8VbLjufNpEcQdax+2O64=
X-Google-Smtp-Source: AGHT+IEWdOj22ZRGZJNZT1p1KwqXTaU2o/8NBBxne7OfVZiZxww3tZFsXD3s8RZuqcU4jA7z2JvSYm9Np9qNEpRv2bk=
X-Received: by 2002:a05:6602:242f:b0:7a5:a391:73ae with SMTP id
 g15-20020a056602242f00b007a5a39173aemr7753537iob.17.1701093318519; Mon, 27
 Nov 2023 05:55:18 -0800 (PST)
MIME-Version: 1.0
References: <20231127103811.319149-1-michal.orzel@amd.com>
In-Reply-To: <20231127103811.319149-1-michal.orzel@amd.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 27 Nov 2023 08:55:07 -0500
Message-ID: <CADkTA4P7xjs7Db+_j6NTde3j0gyKS0R5kGYm9O5pPp+Vu54mMA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 0/2] xen: follow-up to recent recipes update
To: Michal Orzel <michal.orzel@amd.com>
Cc: meta-virtualization@lists.yoctoproject.org, christopher.w.clark@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Nov 2023 13:55:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8468

On Mon, Nov 27, 2023 at 5:38=E2=80=AFAM Michal Orzel <michal.orzel@amd.com>=
 wrote:
>
> Some follow-up patches after a recent Xen recipes update.
>
> Open question:
> Shouldn't we set 4.18 as a default version?

Not yet (and definitely not for nanbield). Perhaps once it has been under
test for a few weeks. I did the updates to get them some extra soak time
and make them available in both the upcoming release (nanbield) and
master for those that want to use the latest, without making it a default
version jump so late in the cycle.

As for the changes in master, the 4.18 version on the _git recipes is
intentional, as there's been no 4.19 tag that I can find and I don't bump
versions until I see that in the repo .. so for now, it is just the +git
and +stable that is the difference between the 4.18 and _git versions.

I've grabbed the 4.17 version bump from the series.

Bruce



>
> Michal Orzel (2):
>   xen: Bump SRCREV of 4.17 recipes to 4.17.2
>   xen: Set XEN_REL to 4.19 for master recipes
>
>  ...g-solaris-syntax-for-.section-direct.patch | 70 -------------------
>  recipes-extended/xen/xen-tools_4.17.bb        |  4 +-
>  recipes-extended/xen/xen-tools_git.bb         |  6 +-
>  recipes-extended/xen/xen_4.17.bb              |  5 +-
>  recipes-extended/xen/xen_git.bb               |  2 +-
>  5 files changed, 8 insertions(+), 79 deletions(-)
>  delete mode 100644 recipes-extended/xen/files/0001-arm32-Avoid-using-sol=
aris-syntax-for-.section-direct.patch
>
> --
> 2.25.1
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

