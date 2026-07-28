Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78391C53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 12:46:00 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10445.1785242751357843851
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 05:45:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hwRnt0M5;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cf41bab353so54802435ad.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 05:45:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785242751; cv=none;
        d=google.com; s=arc-20260327;
        b=d1tCde+saKfdhaMSsyT4qCrriqXJYUqDWyJv9uDmsjQQPx6Gsh8yxlRTM54WItzo5j
         XjiLtBhri8scuzJCUqAHFoyLi9eXIaC1N1IcAJYr1PFnjpt8D2f1KO5IrBmgRbs9iOrp
         8VPDLmtAZ7Nqw8X3PNjucxvcOXe8cd7WIaqZyyugas4IgkvMrcwXsuTvGZuRjQ3kMlly
         UQpGsUpkibtTvc7C/BjP201/mLTuMEuNBpXxM9EY0RS1tiqaLlvDS6TLZiVLNhrqWYHO
         IgxojKhf3+IzQa/qIsWETbZuodvm+PuaPXwcwfaKFhJcSG4LXEYW0v7O3sD1JKcHS9L0
         W0Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0ekSHi/FdrLsyhzKtpOpk5RvWDlgHrvHuUcUq/My1+o=;
        fh=dFTg4p4tAYHgpQk8ypaRYlaLG2ISar8c+sE9mXf2xt8=;
        b=GyfVjIhl/16Ktdt9h2vq8p1RfkffvNl+OkRLi+sk8ZtXJ1j9wOYk4VTKRh380pqGPe
         wLjB3sXfLw2VZ8ui2VLj5P/Gd5D9GHjk0wVG4JpLYs++Xw9BkYcKYT+AdX6y9amSbW6F
         zr01KGPUykylKRUy0wK4Ixwf8sCWqNzZHFfCLWK23J9cXqXjAhdzlIm2tBH++XhcyB+t
         ZO/3mfn2ikoeyF92QSce/QkNdoDH477uyRZm6YWpk4gkhyTD0WYNccZWpvdNZkp7zSoa
         AfsYBOW7m6w7qY7x3QO6WXsv/ZdWvEB7TiK0sV/Kc7g03h2WjaZXDSUxiMqVDDo+KEG5
         zLzA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785242751; x=1785847551; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0ekSHi/FdrLsyhzKtpOpk5RvWDlgHrvHuUcUq/My1+o=;
        b=hwRnt0M51r+7j79YHBOwB4nLKb1keyAZNK+mIuy1emz0/wAbUYB21NOtlAjSc/QUwc
         tUWsbC+SOdIrBw83ZxsXr42BtUF6ODlqLTxLku0c+orQBvuEgWlurb9j7BAkjJwuOz/i
         I6jSDkfMOy8emZewOdZyQ6L3+KLiIYcV9oIKk037fRlZE1TawdJT4r7MUsDGHGZ+bFEq
         +MYeW/Rkt+NJuZNBLPuibtNjlVKXg/xwxv0g27Ve5ucWMmszdoBKR+48RQ/f220Tctrf
         KJUAi8pE1ImAC1ksJsGhgZVcxL7cX28PRn/XZpxSG7yLTtI+OwA4WFlS5UkLCOny5Z/t
         G7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785242751; x=1785847551;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ekSHi/FdrLsyhzKtpOpk5RvWDlgHrvHuUcUq/My1+o=;
        b=Mir+g4qG5TjKuo4go2FxNrwEIyBaJuGEYQfT47xKI8nujZDS+OMmHM11C4acfFKbmm
         P+u+r0KgsKxGQUwBlnq6Tx/G+txI8GYDD5Dri3i37c7qREFU+5wLvwcVgazrmmH/DY1i
         xdwM8emPFI8Y89bHoB26HLHKC8f9Tr+mz676k9SHJHx80zeNKoyG2rspFeGQraHZMyyP
         YJYYTw4JuOMnSyBbsfIxL/MLf9dw4eRIo1WF2EdCLqMVVE/HMbjavkLJtkags5RK5cGk
         G8gwcn2TU7b5qcK5sANu6x7iF9+M4mPJ0YofrDNAVkfN+eEV/xO4ExlOybdTyVyyM5DJ
         mNQg==
X-Gm-Message-State: AOJu0Yxsrqf0EcCTtJYalb2z7z7BnohNqA17XP0h+cphmoylo7jnBIzB
	4o53FUxoyTCdPDChgVAU+hmWfwKl8RxdYhJog0swDRMIM4qbRfnp3aCimLolnAGf9aPpeON/oZk
	wA6K7DKIQncPewEWjf/G7G2/xt5K/0Jo=
X-Gm-Gg: AR+sD10bJO+1Q6qMRJim/Zb3wYX0OIBAZMIOHN+0hq45aH6QTAdeVN5txp2EK0ew6bI
	5nwESya+MLN5wtjkjJUwXWwzuwjfezRlCjx4OGjtpzSYYix3zvJscwuy4KgK+xYUrqNsjrFLast
	Jyql8UQpJ3OLIjP7AalYjEhH+cNKBqWj+bRzh4bEPu36Tmdx7OrDTB+0ckQqOfVSSuxUeYCHqy7
	DJnCTKBjzPXTaep4bnyra/XpWCKoObefpiAUT2PAMHpv1vwauhVxgwYBcNkhvketshh0IcQiWnB
	KlcTi2UtW8aF1lancJdAK5tvooA5dhKfErSrl4W8O/bhYgjajGas9+gj8A9lNw84b4faJ55QFUe
	ONKea
X-Received: by 2002:a17:902:f645:b0:2ca:ecf6:910e with SMTP id
 d9443c01a7336-2d0159aff48mr28158675ad.0.1785242750527; Tue, 28 Jul 2026
 05:45:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260728115516.1107990-1-koen.kooi@oss.qualcomm.com>
In-Reply-To: <20260728115516.1107990-1-koen.kooi@oss.qualcomm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 28 Jul 2026 08:45:38 -0400
X-Gm-Features: AUfX_my1Vm9SLemPFlUof3-nt_t650OBGLnwPJxTVOw7fbA4_Zsp5nRU_6kN3ls
Message-ID: <CADkTA4NRnwrXxgpU7Hwf55SmVEhTDnTidSwvQgpOkHTRWbVG6g@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 0/2] image-oci: two do_image_oci
 bugfixes (missing pm.update(), libgcc/libgcc-initial sysroot collision)
To: koen.kooi@oss.qualcomm.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 12:46:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9993

On Tue, Jul 28, 2026 at 7:56=E2=80=AFAM Koen Kooi via lists.yoctoproject.or=
g
<koen.kooi=3Doss.qualcomm.com@lists.yoctoproject.org> wrote:
>
> I've been working on a prototype for building a rootfs with multiple mult=
i-layer OCI images images, all built from scratch, in one bitbake command. =
I ran into some issues along the way:
>
> * image-oci never runs "opkg update" or its rpm equivalents, so nothing g=
ets installed
> * both libgcc-initial and libgcc want to be in the sysroot
>
> The first issue is straightforward, for the second I leaned heavily on Cl=
aude to write a proper python version and explain it better. I'm not fond o=
f the wall of text that ends up with, but this is already the 3rd iteration=
 of trimming it down.
>
> Anyway, This is the first wave, I'm working on other fixes, like mtime in=
fluencing base-layer sharing, but that needs more testing and review. I do =
need to mention how surprisingly small the resulting image recipes are, a b=
ig thanks to everyone who has been working on this!
>
> Below is what Claude suggested as coverletter, it is still verbose, but d=
oesn't suffer from the "Is Koen being sarcastic or not?" issue :)
>
> 1/2 - image-oci: call pm.update() before pm.install() for multi-layer
>       package layers
>
>   Multi-layer OCI images (OCI_LAYER_MODE =3D "multi") with a "packages:"
>   layer silently produce an empty layer: do_image_oci reports success,
>   but the layer's opkg/rpm install never actually installs anything,
>   because the per-layer package manager's local index/cache was never
>   refreshed after write_index() (do_rootfs itself always calls
>   pm.update() between the two; image-oci's per-layer installer
>   skipped it). The failure is only visible as a bb.warn(), so the
>   build looks green while shipping an empty (or partial) layer.

Aha. Since I've obviously tested the package installs and they work,
but multi layer is something that I don't recall testing in that combinatio=
n.

>
>   Reproduced with a minimal recipe (base-files+coreutils in a
>   "packages:" layer): before the fix, the resulting OCI layer blob
>   contains 0 regular files; after the fix, the same layer contains
>   272 files and the compressed blob grows from 299 bytes to 7.5 MB.
>   Full before/after evidence in the patch commit message and in
>   TEST-CASES.md if you'd like to reproduce it independently.
>

I'd definitely want to see a reproducer, both so I can confirm how
I didn't see this before, and so I can get it into the layer tests.

Does this same image reproduce the second issue as well ?
I'd also like to reproduce that, to hunt around and see if there's
any other options to resolve the problem.

Bruce

> 2/2 - image-oci: drop *-initial sysroot deps in do_image_oci to avoid
>       libgcc collision
>
>   do_image_oci can abort with:
>     ERROR: <recipe> do_image_oci: The file .../crtbegin.o is installed
>     by both libgcc and libgcc-initial, aborting
>
>   Root cause is in extend_recipe_sysroot's dependency walk: the
>   SSTATE_EXCLUDEDEPS_SYSROOT exclusion that normally keeps libgcc and
>   libgcc-initial from landing in the same sysroot only applies when
>   the *consuming* task is itself do_populate_sysroot. do_image_oci
>   reaches extend_recipe_sysroot through the generic "any task whose
>   [depends] contains populate_sysroot gets this prefunc" path
>   (staging_taskhandler), so that exclusion never fires for it.
>
>   This one is sstate-state-dependent -- whether it fires depends on
>   whether extend_recipe_sysroot's walk actually needs to populate (vs.
>   skip via sstate/setscene shortcuts) both libgcc and libgcc-initial
>   for a given recipe/build. A minimal single-package OCI recipe did
>   not reach libgcc in our testing, but a multi-layer "packages:" recipe
>   installing a from-source-compiled library with a moderately large
>   DEPENDS (boost) did: instrumenting the fix confirms it stripping two
>   "*-initial" do_populate_sysroot nodes out of BB_TASKDEPDATA for that
>   recipe, i.e. libgcc-initial is a real, reachable node in
>   do_image_oci's dependency walk for realistic recipes. We were not
>   able to force the raw abort deterministically within our test
>   window (a downstream build did hit it deterministically across 6+
>   clean-sstate attempts on a wider dependency set) -- see the patch
>   commit message and TEST-CASES.md for exactly what was and wasn't
>   reproduced, and why the fix is justified regardless.
>
>
> Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9990): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/9990
> Mute This Topic: https://lists.yoctoproject.org/mt/120482430/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

