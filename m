Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33064CD98CF
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 18:11:33 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76556.1781287886806426103
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 12 Jun 2026 11:11:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ksb2kMr+;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-517b1f2c6adso11353471cf.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 12 Jun 2026 11:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781287886; x=1781892686; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGH4Ff7rgWSMogOZMdOlU1cd40XEP9At6eDduyb6wUI=;
        b=Ksb2kMr+yQd1iDMTRagGdwAljRn1SQzbDFbdFw9V9h1pDdZZQGiM8U9Jl3oXl00wFG
         iGWXjEFFePMv8dxjhSUKCETJ5d3hMEpViYFM0T7UJdDRR2YWjP8Sf+N1vFEEHRTu68uA
         cA6uSExyqz9l0UlXv87JTm8FKv3QWEVzFrJrQslSMc4ptpBonwX4LURpB6eKSMXIn6zy
         6Y3GYFwdlBPX+nKuYAIE0AHU1LsFQXodnN/xGYUMDUUZUXoG7dlFwkAK5AMtq+6TRJen
         o9Xlmd6Ivkk/nW9pjwEazpE8t+dcmYl2eZ0myc6TwaDU8vQGPdGCBmomfAhQ4sLIRqDq
         q8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781287886; x=1781892686;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XGH4Ff7rgWSMogOZMdOlU1cd40XEP9At6eDduyb6wUI=;
        b=VuUcJr8gYySdDuXqkTt8vvShaw9dpZAgITvUE7or0NYBZiGa7llteUnuVVvSwOStbj
         Av/iUCm+Ity5Qb+mtgKv1hv/0YIiWvN11kipSjNWvG4l9tGu5BhfC3qj8fwOGHzku3yA
         vEyYvP4qJ48TvAT+OEDpuy8XZfSuC2POAFqj+P2CAqqAc7oCQgFTPLXRqgggOIxNhL1I
         wC/TYFPN/sEZr1QWk83bDAQq8+bx6AZqwH99ynz9go5AcnMHPdvY1AqUgPLrJg1TdmG6
         poj4yJjnMR91cs+G3gcMVWA7+0q9SoAn/ypzcCgG+73JJ32M+Q5wuLxP5THx4AyX30rt
         lKVQ==
X-Gm-Message-State: AOJu0YwzLh8Sl5y8VnLk5VwKcItOlolDDHtNwfO0SDWga9OuCKr8zLgx
	0k//aS2tsh3BCufZ2aeWWEgbI0zTbb4IcQNNo1qaRMAbf1GicLzItBTJ
X-Gm-Gg: Acq92OELM4P0jtQKOv5BZWc2LY/vUd/Hm7D9hUb0RmLyXAb3LTJ3p/LcwWu3kwgm6rl
	fveAkmdv3aExxrEXozqbLE9oHo0G+XLW6qiDXf7y6Jw+Pr2/7Y/9eZitpYwOGQ8RErEKt3OFLoO
	AsS3ZqteE2SWoqXle5LBItB4EHbpdG3qGh7Wd2GUqtoFzvmXOeonagSfN49TejQ6JbC7Ct6pWOy
	cJKlXm7XeZnvS8+w/VpzevZ/QPQE3ltq0udLXzGGeo1UwM6hb06YwGZY524MomlJ1V0Rsr1T4U0
	9A3alGvmNeWT5PL71E5DpZlWkOtQ/X+9+1hP3PfEE2Vbsloq9650O0x1LIG3shEJ7v0yqwvMdc+
	gLNa4e258t4zg7BlbvAeMT+acN9EpW5TEDVdsC9+zgmWu/5z/Gu4BulLEZ1/dI4oCeTFhqgs2Nz
	VHJl1ytVo+NCdOVawlNpNjTRW8TXq+w/5MmPqrNJMzlsZ/szG+O1y5fHiwblhcaiepm6qWKz0bU
	VOkgj/JQgk7yhjgwDtXp7NheqPlNA1IxrlGSxQr3llR8HxWYa20L7BITOIAw+uDKLwwB2Dj0qJJ
	5kUJ0Uv26mz3blFfeIwwB9t3EoH3JSxgoQ8=
X-Received: by 2002:ac8:5f08:0:b0:517:917d:e3d7 with SMTP id d75a77b69052e-517fe4ddc23mr55899241cf.28.1781287885653;
        Fri, 12 Jun 2026 11:11:25 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb83db58sm27697201cf.27.2026.06.12.11.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 11:11:24 -0700 (PDT)
Message-ID: <6a2c4bcc.f83f8c57.152ba1.f6b8@mx.google.com>
Date: Fri, 12 Jun 2026 11:11:24 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: ticotimo@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 4/7] recipes-containers/images: add
 app-container-valkey
In-Reply-To: =?utf-8?q?=3C5539c6da7c7fc8b6d180c2d038986f2bf1f9ecf0=2E1780104?=
 =?utf-8?q?071=2Egit=2Etim=2Eorling=40konsulko=2Ecom=3E?=
References: <cover.1780104071.git.tim.orling@konsulko.com> =?utf-8?q?=3C5539?=
 =?utf-8?q?c6da7c7fc8b6d180c2d038986f2bf1f9ecf0=2E1780104071=2Egit=2Etim=2Eo?=
 =?utf-8?q?rling=40konsulko=2Ecom=3E?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 12 Jun 2026 18:11:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9873

Hi Tim,

Two valkey-specific comments — the series-level points from 2/7 and 3/7
apply here too but I won't re-raise them.

On Fri, May 29, 2026 at 18:31 -0700, Tim Orling wrote:
> Add OCI container image recipe for the Valkey in-memory key-value
> datastore. The image uses multi-layer mode with separate base and
> valkey layers, exposes the standard Valkey port (6379), and launches
> valkey-server with its default config file as the entrypoint.
[...]
> +OCI_IMAGE_ENTRYPOINT = "${bindir}/valkey-server"
> +# The stock valkey.conf shipped by meta-oe is tuned for a host install
> +# (daemonize yes, syslog-enabled yes, bind 127.0.0.1). Override those at
> +# launch so the server stays in the foreground as PID 1, logs to stdout,
> +# and is reachable from outside the container.
> +OCI_IMAGE_ENTRYPOINT_ARGS = "'${sysconfdir}/valkey/valkey.conf' \
> +    --daemonize no \
> +    --syslog-enabled no \
> +    --bind '0.0.0.0 -::*' \
> +    --protected-mode no"

The override-the-conf-at-launch trick is nice, I like it, and it's
documented in the comments.

What about a description of `--protected-mode no` ?

I quickly searched and found with protected-mode off and bind on all
interfaces, anyone who can reach the container gets unauthenticated
access — that's the right default for a base image people will pull
and customise, but a deployer who slaps this into production without
adding AUTH or namespace isolation gets a surprise. Worth a single
sentence in DESCRIPTION saying so explicitly:

Maybe this ?

  DESCRIPTION = "OCI container running the Valkey in-memory key-value \
  datastore, a flexible distributed datastore that supports both caching \
  and beyond caching workloads. This image runs with protected-mode \
  disabled and bound to all interfaces, intended as a base for \
  customisation — production deployments should enable requirepass / \
  ACLs or restrict the network namespace."

The second is the same persistence question I asked on mosquitto. The
stock meta-oe valkey.conf may or may not enable AOF / RDB snapshotting
(`appendonly yes` / `save <seconds> <writes>`). If either is on,
valkey-server tries to write to its `dir` (usually /var/lib/valkey).
Running as our nonroot uid 65532 against a /var/lib/valkey owned by the
valkey package user will fail-to-write or worse, silently lose data.

Did you confirm during testing whether the stock conf has persistence
on? If on, we want a /var/lib/valkey fixup similar to the
/var/volatile one. If off, a one-line comment saying so would save the
next person from re-deriving it.

Bruce

