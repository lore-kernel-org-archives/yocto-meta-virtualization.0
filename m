Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC1A5C36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 06:34:30 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.5218.1743748461783230319
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 03 Apr 2025 23:34:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KGRgZpvV;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30bef9b04adso14804601fa.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 03 Apr 2025 23:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743748460; x=1744353260; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXJS9367AxP/JPN5H1GIYQOjc7Z3vflt3+wwp0EisMQ=;
        b=KGRgZpvVUS1d5f43rojUk1H+WkcWvZPXRzxABQijwCbvkdKF3s+k3SNFo9Bom9RymY
         hrQ6WdqmDj4CObea1g9lpM27GbMkV3axCWpNs+hKU/DllGInbk0AanXS809KaeRuBbS5
         gE3kjmntGfjv8iKGBRhsQwU4bwpbeiTIOVBKEBYTxUXsZLrdhMiqo8f6YcGO4fKsYWCh
         771/VdboYgHmeU0jS29BKkDtDJysHEHA09//LawVab+KMbgrKundCVRvotAntkQ6GjKK
         a3BlwLSqM7yS73fmmeq8v2ttsm9cON4VweqVBTKz1+ggJtWE480KHFSJWBdd5cfiEdY8
         QdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743748460; x=1744353260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QXJS9367AxP/JPN5H1GIYQOjc7Z3vflt3+wwp0EisMQ=;
        b=e31L42zdQkSYcMQVA+I4S55RLw9y8YwUQhbddvpRbaQwSLSkqQoV10Bv9LENlSI91Q
         8+M63gbgCzHG2j3JCOFxLBzUguuP9wRF/t8yhQL2CfZlPaoNKHAc2Z7JGH8t4622jzuL
         BbKtx3LJAA7tn61WKW0sEWpWnF7fPBgyTHxMTdQJIeInw/uz7+FSkAEL4hrUGC8AXRsZ
         rssW81Oyofb1CcehDfTt/aeBU/GbC7HQ++5ICq3tTtWCqvxPhFgBRc7B7Fj7DekaRi0l
         MuOp+61q55y2TF0Ue8Egd7bzZx5ojYv3Jt9g1TS7yu2AU4piUBTSBxDnNOheagslc10s
         Cw0g==
X-Gm-Message-State: AOJu0Ywx4TKOOnWtO6TAnbt2F7oXIdIxA4VY1pbtn48T/CUOMWOQietR
	0SmxInjV/RM1Z4EQbOKBkn6V8zlewvKLiR9qqzFfxl5gIwJrwWc8zOpNJMkvBSKPtrvp/bAKpoF
	HI3dpaO0bhxRH3A4ZHjg+Oom8XGk=
X-Gm-Gg: ASbGnctpwXg7alI43RwSY4jOopJTRqFT6e77L0Z6nnxU/mQII02XTwfR3XePZJrNWq8
	BsqHUhogqB9aWXVyGsA0h4UvKA5RZGz8Re6vCu+sJDrciUCiqzN2cSrGItH8o5ERKNTZ9qa1cZe
	rJnzGIpf6awBwht3DQa7i034+Fscam
X-Google-Smtp-Source: AGHT+IF5YH6F59VKOL4yUO3VXc/ErDa9ROXcCblYYWPsEs4fCGgVVsn1+YQ006BWhubhbfcUodKz4SZDT8mr3SaxGwY=
X-Received: by 2002:a2e:a915:0:b0:30d:b366:d259 with SMTP id
 38308e7fff4ca-30f0a123699mr6550501fa.10.1743748459563; Thu, 03 Apr 2025
 23:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <18328BABEEB953D4.22698@lists.yoctoproject.org>
In-Reply-To: <18328BABEEB953D4.22698@lists.yoctoproject.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 4 Apr 2025 08:34:08 +0200
X-Gm-Features: ATxdqUHlhuls0AZPi0MMq4kWS0MXgOkmmU8mh0Hm8QlepkHIhNENnRm8I9hkWGg
Message-ID: <CA+chaQen8GCkgLBDBNNGXtrxWWD2k5V62-M3dTqv6egp753Njg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 1/3] metadata: add whitespace around assignments
To: martin.jansa@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 04 Apr 2025 06:34:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9199

On Wed, Apr 2, 2025 at 5:59=E2=80=AFPM Martin Jansa via lists.yoctoproject.=
org
<martin.jansa=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> From: Martin Jansa <martin.jansa@gmail.com>
>
> With:
> https://lists.openembedded.org/g/bitbake-devel/message/17508
> there are many WARNINGs from this layer will cover src_uri.inc files
> in next commit.

Hi Bruce,

I see you already have them in master-next and I've noticed your
fix-up for cri-tools.

There is one more case like that in:
recipes-containers/docker-distribution/docker-distribution_git.bb:EXTRA_OEM=
AKE
=3D "BUILDTAGS =3D ''"
do you want me to send v2 with both fix-ups included or additional one
for docker-distribution or will you fix it yourself?

I did run a world build with these changes, but some recipes aren't
included for our DISTRO even with world build. Sorry about missing
these 2.

Cheers,

