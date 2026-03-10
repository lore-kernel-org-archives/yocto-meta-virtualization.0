Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3575FEB1071
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 15:22:50 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42719.1773156169118567695
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Mar 2026 08:22:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IDPgW4eR;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a1273de95aso7620609e87.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Mar 2026 08:22:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773156167; cv=none;
        d=google.com; s=arc-20240605;
        b=J4zbkdrixZ9FD+LImetO8V00n9ESOx0reCduhmR4NTxExltRefsoSJzZoraHRoFvRR
         tFFUNSeqhw6kNa8854lq5wF29jLeKHXMK9kNMxIyQeDNpvEoDTozfnOOJV2C/+qchDn9
         MnzYBsKIkhtxRd/JHmqeZ1RW+XPBqqOF9QdORaE0IaixiGQuMjV0l2tBkkUGK9Mo0u8x
         QKfsYYKMs7f7r/QS7gbbcFnr6QnW2lx3YJiqmhBkQXKueRAJD6frYeh9oLGJ9PR+AY11
         GuYUlFuUqvtYjzC7/WIpYVz0x6AIc6++uIX9Hw1Z4kp6gzRqbdu2V9dyk1YYeUcN9XuA
         qQjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b2eUWBzLi8kzfv3bInnbpH+k3t18Pv9e4QcgzPXqZDs=;
        fh=eCwnOjlv6B8KHYbz1+dR8q8uprCZzyTQ1RaTi1tuuHw=;
        b=llMXYBvz5rOnrmLXXN7DUAbSLoLRJDfxnkc9uU1Nfq78IPiBVZ8KgFsyqUHw2+gzTn
         pyg8dR+lhm6ot/B4AhYAUaMCxv3gI7soXGflwL0nRCvaSaDF13fahCjmLMQVkBLiow1X
         cMTbMaGS1Fedo9UA4FSCmmr7+0DrqK4sGrCnvVa8DMarrNmMNnLKH3rp2ncOSS7yWzaF
         5UaC+Lgyl9Nqp2hSCsNV+Zngemg7sGBDqvJTSghTAReINuQWVotpz60/hYnrkzHJLZe2
         YQMqa8i+ncsHr2qmrdXwPHBtEpXOUEhKC+pgwOxmQ9YP1qbCVjTnw6DhgVC2WIkCGq9q
         I7vQ==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773156167; x=1773760967; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b2eUWBzLi8kzfv3bInnbpH+k3t18Pv9e4QcgzPXqZDs=;
        b=IDPgW4eRhQ8kOhugVORjC8fo7OTqMuBxqpbq6SFe3OnQ8OZto3x5/KPa2pjOZQFf3g
         NcHaeIlwB3675LdxCWWgkMml03B7fE0RoQ9RPnzE+3sRiO6aAlI5K1BIlCfOHPSvHdkR
         iDIoQMHJ9GrRAeifWw5HG85wbX30VuwBSmlFjEVWIKeJODpx+gv3u53tTVefMjzu8bdr
         rRXncoXzeFf9B+p0zNMJdlHT2FZKmpdE27mtmYo0+UHVDmJxBOdjPDNOU6MLYeEBVSL+
         rjkZ88Qsz2qw9Wg60Vtcyfww+ZjiwNgbJdZIY6jWRIIYBlxS2xyTpHmPQxhKnqNkbNGH
         f46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773156167; x=1773760967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b2eUWBzLi8kzfv3bInnbpH+k3t18Pv9e4QcgzPXqZDs=;
        b=wDybnxaRle7NUOXpd2BIBE5mzdWkkcenP03msLRPwI//6a2EmndHAxHWpVTrQsZDje
         RchN7PForm9hSYv93q5ZP//vOfulxgP90uB+4mQzERdf0svTI2HAuSosBxAYUF2V/4sd
         P9WgVUenfH9dQYywGtV4I8c7RFpOLNuiyvYWP6vsZ86GWYbjbtDduTbyqVnONMagiwNf
         1aBhIg2C6QG26nGnwCqZssKweKmEkbaFiDPWtk8UBDL9RtrXuLabtniCj9bGoh2im/7A
         j3CmLw7FTRv/bYVDt810vqSd/v+qGbhQUC4hpyR6eSvMS5E9C6FqW5Dh77bXyy4zekln
         mA1g==
X-Gm-Message-State: AOJu0YyMWAOoP5/WJcjLneHztmhPyJ3dL6GWD+flMJncWgcg+EAV7NSR
	w4ayH7K5Id/b1VzguFPcUwFZkOo/rZH9drez+R3MHHc7Blea5tb/l7K1sGYpcrPD5/BoFU5jfHF
	T9v0wrZ4xVwbHd0Ax0rFa28eLqH7uL4o=
X-Gm-Gg: ATEYQzwCETJt6MDaQYTBNXNyCwmo6x4nGjEsf/MaQMnKMHHTMTuC5OE18UJWbGVfIjJ
	D/oSfCOTU9w/kCK4aqXh/TjTd6AMcfodjK6MmSWo9cKAaLG9U151uCxG6kI8QYmsTotBvcaPe3Z
	iNQckvEh1pgtx3PdVs+u0s7JHK9qPKvENP29FhEtw4IyDaw9JkfoPpptQqm35R0AHWJj3cORV4L
	DSZMDzCGr4pcrh/tzqlFLS0UVgRD3Pn6FLOb9hS/jc7l58pepSF1pobjntQsQp1ATE/v3fDxhvw
	CAG2p7MEWA==
X-Received: by 2002:a05:651c:1604:b0:38a:4516:f69e with SMTP id
 38308e7fff4ca-38a4516fb2cmr39705271fa.10.1773156166846; Tue, 10 Mar 2026
 08:22:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260310135815.3353144-1-martin.jansa@gmail.com>
 <20260310135815.3353144-2-martin.jansa@gmail.com> <CADkTA4OPcnHe9ZMV5hbDET6MGMWUDGMyhxwKn+QhZY=mYQoahQ@mail.gmail.com>
In-Reply-To: <CADkTA4OPcnHe9ZMV5hbDET6MGMWUDGMyhxwKn+QhZY=mYQoahQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 10 Mar 2026 16:22:31 +0100
X-Gm-Features: AaiRm51vCv4X_AMd5qEEXPZegMzMi6p_fOKQ4U08NSL8MwE6MGXaLsjUUze2eRw
Message-ID: <CA+chaQd4wY0JDxr8f2xEOUwjA6PizEV-jPMMxBYV9LLN4mRQPQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 2/2] example-xen-guest-bundle:
 require xen and x11 in DISTRO_FEATURES
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Mar 2026 15:22:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9636

On Tue, Mar 10, 2026 at 3:04=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmai=
l.com> wrote:
>
>
>
> On Tue, Mar 10, 2026 at 9:58=E2=80=AFAM Martin Jansa via lists.yoctoproje=
ct.org <martin.jansa=3Dgmail.com@lists.yoctoproject.org> wrote:
>>
>> From: Martin Jansa <martin.jansa@gmail.com>
>>
>> to match the image recipe from XEN_GUEST_BUNDLES
>>
>> Fixes:
>> ERROR: Nothing PROVIDES 'xen-guest-image-minimal'
>> xen-guest-image-minimal was skipped: using DISTRO 'distro', which is mis=
sing required DISTRO_FEATURES: 'xen'
>> in bitbake world builds
>
>
> I was quite literally just doing this!
>
> But your patch is where I wanted it (versus the bbclass one I got earlier=
), so I'll just grab this instead.

Cool, I was wondering whether to add it in the bbclass, but as there
weren't any other XEN_GUEST_BUNDLES examples I've added it to recipe
and now I'm glad I did :).

