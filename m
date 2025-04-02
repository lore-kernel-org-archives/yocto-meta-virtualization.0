Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD4A9C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 14:00:00 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.9151.1743602393775291190
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 02 Apr 2025 06:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e/LMDNQU;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so7889312e87.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Apr 2025 06:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743602392; x=1744207192; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOXNjOpjw/0hFfg5DkmYgXunSyLw477/SEifVrjXKOw=;
        b=e/LMDNQUpYxAO9ih0ICBY7awNEiQeQeP7Km4OA1Y9CLrCN6lv6x/v2SecWASIcMuZQ
         hc2LNMTmgaanGpJpLcb9sOxd9pfC9wPPplsafww4JLm03qNLzjPiioqOR+M1OiAqKBdR
         ojSYkMaT2zcsh1fvrrii5bsnbBM0Gw3U816AeYPIvng7AsnjXxZASGgKW4FfN2nWEVTb
         1zc58ImB+JMs2rF/RhTsYyRwsZSx/z0DJKaBmkagKJ12GUiKsruRHpDGyWOPmNlBx1qe
         ldOASSJVEStX9+WMNLoFdERVxLcrY1j+Lyl0hEoFSj1SCwuNBEQ7Fq/yzmfiVqNg+VFI
         fnWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743602392; x=1744207192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bOXNjOpjw/0hFfg5DkmYgXunSyLw477/SEifVrjXKOw=;
        b=AqUes6zO8xgdslLzPWYKjqhLDzTZB2OUVFgjDQkUhrksUagbk+RugpWKn6wuUGkWHV
         PfTDGUeJhCGJvil5ObCU+kLRZKl0MRx/13HI4eVUmc3SNBpbIBk0CSNZHtm1T+aWJZcX
         oki1a70ZPTQFNCROJ2MB/ortSW2QRQJkJ5SMFYFlkznSJp/ETO6KlCzzpIjv+fq7iznc
         9+MBMQlKobbIfAqalPZPuyzbVGxb2lFvlAhhZfhOH0+tDVcN4llHQqu7CMLgApyO3NZo
         Xy8gY3b5xtH4KDZUoLp0pgDvE/d717hiobr639ukWbaI75Iv8Pe2/VrMV9+hM9e61Am6
         I+Ew==
X-Gm-Message-State: AOJu0YzC59RtA7JKv70NiyCWlHfcrDF9QTQ2gPPZfHPig8cKPn946AJL
	W2x+/sBgMlI6Uojd5eUIfNml89yAk7Bqpf+mMFRyXqcxSbmXTk1Elk2hH2g5FqRhPs7M2i55wP0
	pVybGvqseo1jF1q3PMQrAOnnx778WPQgRx8M=
X-Gm-Gg: ASbGncupLks0X3tYpQlzXNizp/kBokbGFMPFGI/C/vMbHpiUzXjVONk5kGxYbHoHAnf
	pKOOameTJXz7pQMr8KZNSGsJBE4pVx5gsvjQwV6Z6m+39Z94rcg7inQvmV4jX8sPBjoqcJ98EBc
	qWUk9Ts0CA54dn3HsFx1q2eI/zlarC
X-Google-Smtp-Source: AGHT+IFkCFxM6uvSn8Izs9tkOWwuCZy+20L2pmWsjJkllYkmoojxTI1SSmBHoCnfhl0Y6YOVrWVdb91tNnkbM4q4TBU=
X-Received: by 2002:a05:6512:2c97:b0:54c:a49:d3de with SMTP id
 2adb3069b0e04-54c0a49d4a3mr2041096e87.10.1743602391423; Wed, 02 Apr 2025
 06:59:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250326195009.757247-1-praveen.kumar@windriver.com> <20250326195009.757247-2-praveen.kumar@windriver.com>
In-Reply-To: <20250326195009.757247-2-praveen.kumar@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 2 Apr 2025 15:59:37 +0200
X-Gm-Features: AQ5f1JqzYbZ4CAghs40ic9ppSjT4X8ilREO_XVGE5K3d2PlvIx0MServhNhGkMk
Message-ID: <CA+chaQcbvurY3Fg+MPbm0CLxx31-t=4WP_8FD24rDKUv71Zo3A@mail.gmail.com>
Subject: Re: [meta-virtualization][scarthgap][PATCH 2/3] docker-moby: Fix CVE-2024-36621
To: praveen.kumar@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Apr 2025 14:00:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9192

Please don't add a break after Upstream-Status, it's not parsed
correctly, fix sent in:

https://lists.yoctoproject.org/g/meta-virtualization/message/9191

On Wed, Mar 26, 2025 at 8:50=E2=80=AFPM Praveen Kumar via
lists.yoctoproject.org
<praveen.kumar=3Dwindriver.com@lists.yoctoproject.org> wrote:
>
> moby v25.0.5 is affected by a Race Condition in
> builder/builder-next/adapters/snapshot/layer.go. The vulnerability could
> be used to trigger concurrent builds that call the EnsureLayer function
> resulting in resource leaks/exhaustion.
>
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2024-36621
>
> Upstream-patch:
> https://github.com/moby/moby/commit/37545cc644344dcb576cba67eb7b6f51a463d=
31e
>
> Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
> ---
>  recipes-containers/docker/docker-moby_git.bb  |  1 +
>  .../docker/files/CVE-2024-36621.patch         | 83 +++++++++++++++++++
>  2 files changed, 84 insertions(+)
>  create mode 100644 recipes-containers/docker/files/CVE-2024-36621.patch
>
> diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-conta=
iners/docker/docker-moby_git.bb
> index a1879ed2..d274b002 100644
> --- a/recipes-containers/docker/docker-moby_git.bb
> +++ b/recipes-containers/docker/docker-moby_git.bb
> @@ -57,6 +57,7 @@ SRC_URI =3D "\
>          file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patc=
h \
>          file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=3Dsrc=
/import \
>          file://CVE-2024-36620.patch;patchdir=3Dsrc/import \
> +        file://CVE-2024-36621.patch;patchdir=3Dsrc/import \
>         "
>
>  DOCKER_COMMIT =3D "${SRCREV_moby}"
> diff --git a/recipes-containers/docker/files/CVE-2024-36621.patch b/recip=
es-containers/docker/files/CVE-2024-36621.patch
> new file mode 100644
> index 00000000..a6c06ef2
> --- /dev/null
> +++ b/recipes-containers/docker/files/CVE-2024-36621.patch
> @@ -0,0 +1,83 @@
> +From 37545cc644344dcb576cba67eb7b6f51a463d31e Mon Sep 17 00:00:00 2001
> +From: Tonis Tiigi <tonistiigi@gmail.com>
> +Date: Wed, 6 Mar 2024 23:11:32 -0800
> +Subject: [PATCH] builder-next: fix missing lock in ensurelayer
> +
> +When this was called concurrently from the moby image
> +exporter there could be a data race where a layer was
> +written to the refs map when it was already there.
> +
> +In that case the reference count got mixed up and on
> +release only one of these layers was actually released.
> +
> +CVE: CVE-2024-36621
> +
> +Upstream-Status:
> +Backport [https://github.com/moby/moby/commit/37545cc644344dcb576cba67eb=
7b6f51a463d31e]
> +
> +Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
> +---
> + .../builder-next/adapters/snapshot/layer.go   |  3 +++
> + .../adapters/snapshot/snapshot.go             | 19 +++++++++++--------
> + 2 files changed, 14 insertions(+), 8 deletions(-)
> +
> +diff --git a/builder/builder-next/adapters/snapshot/layer.go b/builder/b=
uilder-next/adapters/snapshot/layer.go
> +index 73120ea70b..fc83058339 100644
> +--- a/builder/builder-next/adapters/snapshot/layer.go
> ++++ b/builder/builder-next/adapters/snapshot/layer.go
> +@@ -22,6 +22,9 @@ func (s *snapshotter) GetDiffIDs(ctx context.Context, =
key string) ([]layer.DiffI
> + }
> +
> + func (s *snapshotter) EnsureLayer(ctx context.Context, key string) ([]l=
ayer.DiffID, error) {
> ++      s.layerCreateLocker.Lock(key)
> ++      defer s.layerCreateLocker.Unlock(key)
> ++
> +       diffIDs, err :=3D s.GetDiffIDs(ctx, key)
> +       if err !=3D nil {
> +               return nil, err
> +diff --git a/builder/builder-next/adapters/snapshot/snapshot.go b/builde=
r/builder-next/adapters/snapshot/snapshot.go
> +index a0d28ad984..510ffefb49 100644
> +--- a/builder/builder-next/adapters/snapshot/snapshot.go
> ++++ b/builder/builder-next/adapters/snapshot/snapshot.go
> +@@ -17,6 +17,7 @@ import (
> +       "github.com/moby/buildkit/identity"
> +       "github.com/moby/buildkit/snapshot"
> +       "github.com/moby/buildkit/util/leaseutil"
> ++      "github.com/moby/locker"
> +       "github.com/opencontainers/go-digest"
> +       "github.com/pkg/errors"
> +       bolt "go.etcd.io/bbolt"
> +@@ -51,10 +52,11 @@ type checksumCalculator interface {
> + type snapshotter struct {
> +       opt Opt
> +
> +-      refs map[string]layer.Layer
> +-      db   *bolt.DB
> +-      mu   sync.Mutex
> +-      reg  graphIDRegistrar
> ++      refs              map[string]layer.Layer
> ++      db                *bolt.DB
> ++      mu                sync.Mutex
> ++      reg               graphIDRegistrar
> ++      layerCreateLocker *locker.Locker
> + }
> +
> + // NewSnapshotter creates a new snapshotter
> +@@ -71,10 +73,11 @@ func NewSnapshotter(opt Opt, prevLM leases.Manager, =
ns string) (snapshot.Snapsho
> +       }
> +
> +       s :=3D &snapshotter{
> +-              opt:  opt,
> +-              db:   db,
> +-              refs: map[string]layer.Layer{},
> +-              reg:  reg,
> ++              opt:               opt,
> ++              db:                db,
> ++              refs:              map[string]layer.Layer{},
> ++              reg:               reg,
> ++              layerCreateLocker: locker.New(),
> +       }
> +
> +       slm :=3D newLeaseManager(s, prevLM)
> +--
> +2.40.0
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9175): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/9175
> Mute This Topic: https://lists.yoctoproject.org/mt/111924195/3617156
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

