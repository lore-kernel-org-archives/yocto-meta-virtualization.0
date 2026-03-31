Return-Path: <jonas.gorski@bisdn.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB10FF60E2
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 08:14:24 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15373.1774944855534215496
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 31 Mar 2026 01:14:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bisdn-de.20230601.gappssmtp.com header.s=20230601 header.b=LZIJ/4vr;
 spf=none, err=SPF record not found (domain: bisdn.de, ip: 209.85.167.50, mailfrom: jonas.gorski@bisdn.de)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a298fe32d1so583599e87.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 31 Mar 2026 01:14:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774944853; cv=none;
        d=google.com; s=arc-20240605;
        b=G9Xk5iFMiUfEG+1SoS033l6dZSLKla0fKyLDQoCg5P0vyrP/V6nfEmAVd+MKeJMJXv
         th96ZS5GS13VP2eMaSnrubXapamoLtNQVG2n8Dg2pcfyEyLcgUcYkcqLuwfoykpdXcUH
         aVVZIxYklGk8qZXmlnn3SYN9fLfKcD3EQDezcKW12csf127H2y98ST9EKIn1c6vR+8Wk
         tw5mJU3vDvDpYFj7/gB1sgQUkBSpeG+49jWoGNdbNWtkMmqTjt/ZrGqVOKQtFYla98PD
         ppNPh1RW1zuyQdo27W1ir6+GvLeC2j9VGiI7m8qhj0uepYoXQPQOQ26ntGvL7+2p50Id
         oYOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fOPVmasch7b84nKStOq6NKj4xubtmXwF00jpUYMAK8w=;
        fh=eCwnOjlv6B8KHYbz1+dR8q8uprCZzyTQ1RaTi1tuuHw=;
        b=Al8dWJQi3KY1zwZmA1tiBIQJYLv3CEwVUPSnq0dq2zul77qUQKPcXE0nK8JJsCoZb8
         KY6fPcnoVRFFUerwhUyRfl3PpEgxenaGd257kuIiXUgRWOzLKZyrHHv90i4cpS1gHIKL
         Ga6A+Eg3we8dE3OEmGXB9IxGuYzcF8BFuozoVBwIDTaChfQdtPwxT3365zuemQ0Yaevv
         IXDpnV9xT337ho/HBjqfK2jjmGrwNQvNH4RVId9/EMqAzYvTMG+jj2eaJ6yl2LGxn1kU
         YYmOJn1fT2oTcU0FomaMK01PLqAFvh/35CtRk7ekJ6U4qinzdmdQPhBj71LXPjT5SQTI
         B4ow==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn-de.20230601.gappssmtp.com; s=20230601; t=1774944853; x=1775549653; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOPVmasch7b84nKStOq6NKj4xubtmXwF00jpUYMAK8w=;
        b=LZIJ/4vrjai5EnlJH44jukZOFx3W8IPeEoQpCRsr27PXScDtMrxtR8hsyExpWprKW5
         4/zEz3++JR6SkisoFWsvnclXaKFHD7dYGEurdscbNQIAID2VuXCf0NoaBi1yP+yLQd/p
         E2jWzOaCbW/qHg30Q3zz7L3gXZdV9tAFgqxhc6pM+/4uOCZucBpaP1NhMVUzwA+JyxVC
         6CkApgTd/9nDihZoLMhgtZDQAmobqyQPJN+1xNj2REgm6dwbuQyXgQ4Yfy8YtuZOWbuE
         2InA0V/bP0OhpKbBSSae66Yh6pyVzLHQx3RGq/eQkjWRngIyvv6XYayz8E2HJCTDV/Ve
         6A5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774944853; x=1775549653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fOPVmasch7b84nKStOq6NKj4xubtmXwF00jpUYMAK8w=;
        b=ixUIPzQPiZIGmQnX2oYmaXPAUapWYLZHnnHkxPTQNcd+DZ0mwZMiEdELoTLTeTaNff
         keXMVeccFxWXHpdHunj+90/4ZkJfZbDBIxt5s438LqyQL0KKCwTIPQtdrgp8pBMgH7I7
         GKE26k2KvHPKTciJv9GinfGCkk80c9cYRtyU2vEXVgmSf+dwZgkAVLFvtCHWW3APn0f1
         op1WMpqktvNzEGgnQOybMT7yLCBk580DqokzlL4C6Tjvxu5xpKW50lYmDhdiNapfcv7J
         jo9PZSxg5Z1wp/tDqXlYEUq7QDpXiQEstOdNnp/xw4sYw/G4DwagP36ZWvTfs4lMU1MR
         YsMQ==
X-Gm-Message-State: AOJu0Ywib9Bx5Hk/XxmJDy3619kHBAJT3E/Rvb2ly3LWP17CZK2SlchV
	Z6xo4dllpoBYaxWs7XnYUy1HsLRkghPyWjiBhJ8/S3U5R2Ix/7AYt4xYed7XKtq89TBwKwfgASi
	rEBR72RL0S6z489INlav6yDDWxkdLlBmMR6yKb6X6hpzvHyG59vxT8Whi1S/ihRWT6xkCNSwjut
	BfPNhIJNlNc9sOcjqtWHYwWs0zCiif5dkbcn6LCu/Qindrd5Y6Qw0M
X-Gm-Gg: ATEYQzyaon6q3MU8uhFFdxYZtSNqrS/Q5Jhl4VKRRMwUERoeGLj0BaEuAdnDa6a1qHK
	ZRLy8zy1/bRHzmDOysF15wm7STUxThli4NxaVzTDWRcUmQpfZc1qStbLDmUjRbuLw99iv8QV1I+
	HH2nTJdAGLkZC2DYUXBV0uklzXfN3Dxtki3So44WniI2Y3nc4PSj5iwYKZzn6Wve3W4iwQNQK8W
	xRvBLhEtLocNUOMk/z8jzTUpO72+uACTDmTdghLXN82fnKl3pgfeMzXMY+9hqxhhVdt7nluSt2U
	PzlSeA==
X-Received: by 2002:a05:6512:23aa:b0:5a1:4712:376a with SMTP id
 2adb3069b0e04-5a2ab940b68mr2374609e87.8.1774944853119; Tue, 31 Mar 2026
 01:14:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260327140640.126833-1-jonas.gorski@bisdn.de> <acrTlFWe3YF8dX4l@gmail.com>
In-Reply-To: <acrTlFWe3YF8dX4l@gmail.com>
From: Jonas Gorski <jonas.gorski@bisdn.de>
Date: Tue, 31 Mar 2026 10:13:57 +0200
X-Gm-Features: AQROBzCvSxywGcLSFRlMhTdYtSgrSu-LXWDDNMTqa_WtEtvAf85G1MMLLrKEruc
Message-ID: <CAJpXRYSeQ36iKGrqrcfJ9qpZyDREJzmz=jqmF8DDzoo1f6DY+w@mail.gmail.com>
Subject: Re: [meta-virtualization][kirkstone][PATCH 0/4] runc: update to 1.1.15
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 31 Mar 2026 08:14:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9686

On Mon, 30 Mar 2026 at 21:48, Bruce Ashfield <bruce.ashfield@gmail.com> wro=
te:
>
>
>
> In message: [meta-virtualization][kirkstone][PATCH 0/4] runc: update to 1=
.1.15
> on 27/03/2026 Jonas Gorski via lists.yoctoproject.org wrote:
>
> > runc has been stuck at 1.1.4 for long while in kirkstone, and the last
> > attempt at updating it had to be reverted.
> >
> > In order to reduce the amount of open vulnerabilities, update it to the
> > latest 1.1 release, 1.1.15, by first updating it to 1.1.12, which was
> > the last 1.1 release in master, then updating it to 1.1.15.
> >
> > To keep the amount of patches short, I squashed the cherry-picked
> > updates from master to a single patch each.
> >
> > In case anyone wonders, runc-opencontainers and runc-docker were at
> > different commits before they were both bumped to 1.2.0-rc2, which is
> > why their diffs looks different.
> >
> > I runtested runc-opencontainers, and compile-tested runc-docker.
>
> Thanks for the extra details, it made this much easier to
> merge.
>
> I confirmed bug/cve only in the 3rd digit bumps, so this is
> now merged and pushed to the server.

And thank you for merging it so quickly :)

I just noticed that scarthgap is also still at 1.1 (.14), and now
lagging behind kirkstone. This is awkward.

I'll send a patch as soon as I can to make them even.

Best regards,
Jonas

--=20
BISDN GmbH
K=C3=B6rnerstra=C3=9Fe 7-10
10785 Berlin
Germany
Phone: +49 30 610 816 100
Managing Directors:=C2=A0Dr.-Ing. Hagen Woesner, Andreas K=C3=B6psel


Commercial=20
register:=C2=A0
Amtsgericht Berlin-Charlottenburg HRB 141569 B
VAT ID No:=C2=A0
DE283257294




