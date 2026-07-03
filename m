Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 048CBC43602
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 15:28:17 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.95650.1783092494295444263
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 08:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JrcGoRG9;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38101f85591so1157036a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Jul 2026 08:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783092494; x=1783697294; darn=lists.yoctoproject.org;
        h=message-id:date:references:in-reply-to:cc:to:subject
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAeZTaA3unTxBbPvqu/zozogV+jbtjr74RE9QJWc0b8=;
        b=JrcGoRG9JYiqhZkq0BxbvHDsVd5NAmEB8mA5pSXVdnfGNuVmc1eHO/BGWbMWqaszWX
         b/EbN/aWvqvyZvaBJTIkjXP95MowG8zffiCT4ELc5aol4TIXP1zVl9EL6zflq892HGmB
         7AKJEvh7RFggrDm5Y2CXhv60+8jmCO+fmf9FnRejdyBVkJ+yyJ4yfsj2BE2iyVtblBZT
         dJkL0W2EVGxeT73x5GLmEeesP6YdMpvT9O++PoIZlVE9MJxcrShl1ytx6kORm99tysmE
         h6e9LNeVcFTsqqLY975OLHSF5FpIUpp0N1uicMSg4wmNPgmSshBG+BiaCOM3ivZABIys
         84kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783092494; x=1783697294;
        h=message-id:date:references:in-reply-to:cc:to:subject
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jAeZTaA3unTxBbPvqu/zozogV+jbtjr74RE9QJWc0b8=;
        b=Nkbl2qdbksqw7TjM87IA4TTVWpVnkLV0O6dnIUPJ4iDdUiKkjfHjC9abXWEaS2OwVA
         CMwOniNWQH3Xub62hXnUEbWS+y6gL+ctrYWgWYuVOQjj5SKtGumsiJOVVEUx0Iwcb8vJ
         waVpiTlEERIyhnYBiutYJ3ZtFdynRtaekQvA00xBNmorrm4Qsf6PWwy2UkCmFPygk8F8
         eN24UmPCWr6UCJSzeFmKNgdz2TQOsA7ndxrHge/ltgL2VOalPPa6565ANJkBYWXnFoJY
         LWKfdXoebPWWUz4e4pAJ8QfDO1s+kqAEJb6muAwbs4hNfAoeiRDFjR2uTBG/wCIq5RBd
         R93g==
X-Forwarded-Encrypted: i=1; AHgh+Rqzr5p72CW6g05dCDHX0SHwCW/0QPV0me5147YX4g2nnnudrQwuHMSKB3LZ6SiIWJR65jE1b+ONOXoA2oGsLNYTZUnu@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yy8u8Bo2H/St3eY7YkPkaDIitlU/MUUgW+sCkdZbYxQhDeNGiOc
	QdOyotQutV/Hhttt+AqaW1szx96Hke6XepY5u+qJJIZllcT7huTNWtyw
X-Gm-Gg: AfdE7ck/7phJyqxC7h08bxbJpWOUr+97siyhvX9SatxWOpqRxcqEnprH21qNePurBJ9
	CIGrpGKWuYkCstOeH6Qpkuthi6VoBXUxdXBI29U7gXtzNdKqG8f5hzctDjNAL2AUe6fPcqq1FjX
	JZmp9hBKVocBbmMYykioUdAULF86qHvqmxRtMISSqfaALKvJQ4WsHXpSvZ1qeV7wIr/PR93MyZ1
	PVqLoTr2FBQAc6UjvLafn7ZR56pTaRsKB05AcFuerU3kgqj1Puf4NxjonGXassWX0NSVZCkD+Gj
	gQQRYhjGFIYjFGHc+h6y5N9gEUhDcPFVEX+tZHbQLWFfQq5kfvo+RKxwX9CQ6rblYSqjTKmh4Wt
	qRvtWLyspdx2wkf82boiCPcWSIRaU34QeOGfbAz7fK+kQ5OxmTDpE3W/ARHzDMflzTFBfKTfU8c
	Uz1b/LjaqwnfZgEhLcYqJ0OMkwSNWN/tEn+nhsmZFEzQe7Vg==
X-Received: by 2002:a17:90a:d44d:b0:37f:c232:f075 with SMTP id 98e67ed59e1d1-3811227b708mr3573539a91.12.1783092493541;
        Fri, 03 Jul 2026 08:28:13 -0700 (PDT)
Received: from macbookpro.home.local ([69.9.132.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3812801ebcbsm1117396a91.11.2026.07.03.08.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:28:12 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [meta-virtualization][PATCH 4/7] recipes-containers/images:
 add app-container-valkey
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: ticotimo@gmail.com, meta-virtualization@lists.yoctoproject.org
In-Reply-To: <6a2c4bcc.f83f8c57.152ba1.f6b8@mx.google.com>
References: <cover.1780104071.git.tim.orling@konsulko.com>
 <5539c6da7c7fc8b6d180c2d038986f2bf1f9ecf0.1780104071.git.tim.orling@konsulko.com>
 <6a2c4bcc.f83f8c57.152ba1.f6b8@mx.google.com>
Date: Fri, 03 Jul 2026 08:28:11 -0700
Message-Id: <178309249171.29524.2018204921699710643.b4-reply@b4>
X-Mailer: b4 0.16-dev
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Jul 2026 15:28:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9920

On 2026-06-12 11:11:24-07:00, Bruce Ashfield wrote:
> Hi Tim,
> 
> Two valkey-specific comments — the series-level points from 2/7 and 3/7
> apply here too but I won't re-raise them.
> 
> On Fri, May 29, 2026 at 18:31 -0700, Tim Orling wrote:
> 
> > Add OCI container image recipe for the Valkey in-memory key-value
> > datastore. The image uses multi-layer mode with separate base and
> > valkey layers, exposes the standard Valkey port (6379), and launches
> > valkey-server with its default config file as the entrypoint.
> 
> [...]
> 
> > +OCI_IMAGE_ENTRYPOINT = "${bindir}/valkey-server"
> > +# The stock valkey.conf shipped by meta-oe is tuned for a host install
> > +# (daemonize yes, syslog-enabled yes, bind 127.0.0.1). Override those at
> > +# launch so the server stays in the foreground as PID 1, logs to stdout,
> > +# and is reachable from outside the container.
> > +OCI_IMAGE_ENTRYPOINT_ARGS = "'${sysconfdir}/valkey/valkey.conf' \
> > +    --daemonize no \
> > +    --syslog-enabled no \
> > +    --bind '0.0.0.0 -::*' \
> > +    --protected-mode no"
> 
> The override-the-conf-at-launch trick is nice, I like it, and it's
> documented in the comments.
> 
> What about a description of `--protected-mode no` ?

Although I also like the override-the-conf-at-launch, on further review of
upstream containers, they use tini and an entrypoint.sh script to launch
with a .conf if passed in on the command line and otherwise no conf.

The whole reason I did the override-the-conf-at-launch was that the default
valkey.conf provided by our valkey recipe was not launching cleanly.

I'm a little concerned that by doing the overrides with OCI_IMAGE_ENTRYPOINT_ARGS
like this it will be more confusing for the end user to re-use the container.

> 
> I quickly searched and found with protected-mode off and bind on all
> interfaces, anyone who can reach the container gets unauthenticated
> access — that's the right default for a base image people will pull
> and customise, but a deployer who slaps this into production without
> adding AUTH or namespace isolation gets a surprise. Worth a single
> sentence in DESCRIPTION saying so explicitly:
> 
> Maybe this ?
> 
>   DESCRIPTION = "OCI container running the Valkey in-memory key-value \
>   datastore, a flexible distributed datastore that supports both caching \
>   and beyond caching workloads. This image runs with protected-mode \
>   disabled and bound to all interfaces, intended as a base for \
>   customisation — production deployments should enable requirepass / \
>   ACLs or restrict the network namespace."
> 
> The second is the same persistence question I asked on mosquitto. The
> stock meta-oe valkey.conf may or may not enable AOF / RDB snapshotting
> (`appendonly yes` / `save <seconds> <writes>`). If either is on,
> valkey-server tries to write to its `dir` (usually /var/lib/valkey).
> Running as our nonroot uid 65532 against a /var/lib/valkey owned by the
> valkey package user will fail-to-write or worse, silently lose data.
> 
> Did you confirm during testing whether the stock conf has persistence
> on? If on, we want a /var/lib/valkey fixup similar to the
> /var/volatile one. If off, a one-line comment saying so would save the
> next person from re-deriving it.
> 
> Bruce



