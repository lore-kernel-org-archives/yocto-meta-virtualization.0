Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB247C4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 13:38:13 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web10.8351.1702301893367186135
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Dec 2023 05:38:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V2EH4MT4;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-7b6f43740b4so181844239f.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Dec 2023 05:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702301892; x=1702906692; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bg+fF6c2fiWTqCGjw1Xzt/VAbD2mRoJlRSsnBHK55fk=;
        b=V2EH4MT4DNSLJ4f/0V4Z4qkDDBDWNJf9F1/Wcsj81cf0PjHgAJA46e2itF4M3zpqPS
         0BT6whvALjwLYexhTg331zunqbP7SsZIvlDeNic95dhW7bS8cAaXcURkNXv/M/mh1qw5
         4TCVjEfNr+U7hoge5n84llzhnCs2BCVhWmXgJprkRDiG20FmyQX2FIcReWShF+LBFsI/
         xPeU4qGew/HyskB+HBnUzpqajjkBP2ujKrsIhEt0UXWIiVznVnXjA5LY95WFW/V5b2AM
         pdp3s6ubKy8j6qmRGu5K5pj2Jrp8rnLwrcy2tZiwq1b7ZhK0apP+WOTlvr6Af7oGC8rS
         t9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702301892; x=1702906692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bg+fF6c2fiWTqCGjw1Xzt/VAbD2mRoJlRSsnBHK55fk=;
        b=Ck7i4x8xRrAaUgd1FGL9ZbDqX2MOE8e5Rkysqe8OXlmj4Ym/toYzTYPCcWYYGgr417
         Dl281zAOD0Ly6pfeoOnULJjRr4Sj7RV5VIud6bK+vwrwsbfn//ZfhjOrxezac8C/zL/i
         qLkUyeoBO1kcz8ZMOnUq8IoVsgoQv13D8Ixa+qyWUts2Wxq12bjn0dZdk9xT5cC+Ai/+
         tTZON+4EeEEOLk+Z2jvU7gIip84aSX1m93v4BvAcWe3SPfNZPMSn/9mN8ikiHwVNr3ka
         kiRKd5+cihGkIfRjHvxTw8L5+6jtsjRCZcNBIHGNDl+6j9Rol2m4bKGmIOdXSNTYDrEW
         fWmw==
X-Gm-Message-State: AOJu0Yx9Q1WVJsPubOmd92V1YV7iudMwAZKQ/IHgubVFSWtsdl+1gNhJ
	FKUrrILLFPGPYQu39BX4YOaplwM9QWAT/66DLbOsWYR80nM=
X-Google-Smtp-Source: AGHT+IGlIP30tVEe2OxZntKzOzlG6J27hFzDha8sQmC3jFHpUl5GIUUERsOGMYG9S/Mu6/lnmrjdGK8NisMTmyTU91M=
X-Received: by 2002:a6b:7847:0:b0:7b7:5850:7d6a with SMTP id
 h7-20020a6b7847000000b007b758507d6amr489794iop.29.1702301892244; Mon, 11 Dec
 2023 05:38:12 -0800 (PST)
MIME-Version: 1.0
References: <30f8f1c4ce0c3c6a0d51162f046340ac6c5e385d.1702296438.git.patrick.wicki@siemens.com>
 <7347b48e8b6e33ad9b12b06892e098c8ff55e1b8.1702296438.git.patrick.wicki@siemens.com>
In-Reply-To: <7347b48e8b6e33ad9b12b06892e098c8ff55e1b8.1702296438.git.patrick.wicki@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 11 Dec 2023 08:38:00 -0500
Message-ID: <CADkTA4MNaSBGHDjmcJ2u9eCC1j28FQYyXw_5ZhikxWmUejCyTQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/3] aardvark-dns: update from 1.7.0
 to 1.9.0
To: Patrick Wicki <patrick.wicki@subset.ch>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Patrick Wicki <patrick.wicki@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Dec 2023 13:38:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8502

I have a queue of package updates already in progress, so while I
won't take these directly, I will compare what I have against them
once my testing completes.

You can see the start of the updates on master-next.

Bruce

On Mon, Dec 11, 2023 at 7:13=E2=80=AFAM Patrick Wicki <patrick.wicki@subset=
.ch> wrote:
>
> From: Patrick Wicki <patrick.wicki@siemens.com>
>
> Update consists of the following commits:
>
>     d2a7877 fix(deps): update rust crate tokio to 1.35.0
>     26e2439 fix duplicated IP CI flake
>     1525a69 server: remove unused kill switch
>     faf66df fix(deps): update rust crate clap to ~4.4.10
>     ffb59da Bump working version to v1.10.0-dev
>     e4785bd Release v1.9.0
>     e406f83 v1.9.0 Update release notes
>     8880d68 run cargo update
>     864fa96 chore(deps): update dependency containers/automation_images t=
o v20231116
>     a8642b3 fix(deps): update rust crate tokio to 1.34.0
>     b154c3b fix(deps): update rust crate async-broadcast to 0.6.0
>     5ee6646 update trust-dns to hickory
>     f516597 fix(deps): update rust crate futures-util to 0.3.29
>     20ab8f5 fix(deps): update rust crate trust-dns-server to 0.23.2
>     d9f023a fix(deps): update rust crate trust-dns-proto to 0.23.2
>     645fb12 tmt: initial enablement
>     3633db0 aardvark main: change error reporting
>     7820735 chore(deps): update dependency containers/automation_images t=
o v20231004
>     dc1ef13 fix(deps): update rust crate trust-dns-proto to 0.23.1
>     085608c fix(deps): update rust crate trust-dns-client to 0.23.1
>     ceca55b clippy: some format fixes
>     9c90865 fix(deps): update rust crate tokio to 1.33.0
>     3391c8d Bump to v1.9.0-dev
>     1ed9402 Release v1.8.0
>     a9e95ca update release notes for v1.8.0
>     1730fef run cargo update
>     2a3415e Packit: switch to @containers/packit-build team for copr fail=
ure notification comments
>     82752dd [CI:BUILD] Packit: tag @lsm5 on copr build failures
>     0356081 chore(deps): update rust crate chrono to 0.4.31
>     0d831cf cargo: bump chrono to 0.4.30
>     ea06d05 test: IPv6 format is changed in v1.72.0
>     d2a7527 bump nix to 0.27.1
>     20e5b56 vendor: bump trust_dns_proto and trust_dns_client to 0.23.0
>     cce63be fix(deps): update rust crate trust-dns-server to 0.23.0
>     c81a038 [CI:BUILD] rpm: spdx compatible license field
>     cae27d7 fix(deps): update rust crate anyhow to 1.0.75
>     b46553e fix(deps): update rust crate tokio to 1.32.0
>     1d8d421 chore(deps): update dependency containers/automation_images t=
o v20230816
>     f8bdbf1 fix(deps): update rust crate tokio to 1.31.0
>     88e847d fix(deps): update rust crate anyhow to 1.0.74
>     3f74fdc fix(deps): update rust crate anyhow to 1.0.73
>     17ca8a1 fix(deps): update rust crate log to 0.4.20
>     70ad545 chore(deps): update dependency containers/automation_images t=
o v20230809
>     cb2b0e6 fix(deps): update rust crate tokio to 1.30.0
>     def4232 fix(deps): update rust crate clap to 4.3.21
>     cd85a71 packit: Build PRs into default packit COPRs
>     4df6054 chore(deps): update dependency containers/automation_images t=
o v20230807
>     a713fa6 fix(deps): update rust crate anyhow to 1.0.72
>     dc36e6b fix(deps): update rust crate signal-hook to 0.3.17
>     62cd6e2 fix(deps): update rust crate clap to 4.3.19
>     7f3c50d fix(deps): update rust crate clap to 4.3.15
>     8821976 fix(deps): update rust crate signal-hook to 0.3.16
>     75a7b92 [CI:BUILD] Packit: remove pre-sync action
>     1e54ac4 fix(deps): update rust crate clap to 4.3.11
>     389a189 fix(deps): update rust crate tokio to 1.29.1
>     836a441 fix(deps): update rust crate clap to 4.3.10
>     c81743a [CI:BUILD] RPM: cleanup spec and fix eln builds
>     2703165 bump to v1.8.0-devel
>
> Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
> ---
>  .../aardvark-dns/aardvark-dns-crates.inc      | 370 +++++++++---------
>  ...dvark-dns_1.7.0.bb =3D> aardvark-dns_1.9.bb} |   2 +-
>  2 files changed, 177 insertions(+), 195 deletions(-)
>  rename recipes-containers/aardvark-dns/{aardvark-dns_1.7.0.bb =3D> aardv=
ark-dns_1.9.bb} (95%)
>
> diff --git a/recipes-containers/aardvark-dns/aardvark-dns-crates.inc b/re=
cipes-containers/aardvark-dns/aardvark-dns-crates.inc
> index 60f3459b..83132362 100644
> --- a/recipes-containers/aardvark-dns/aardvark-dns-crates.inc
> +++ b/recipes-containers/aardvark-dns/aardvark-dns-crates.inc
> @@ -2,287 +2,269 @@
>
>  # from Cargo.lock
>  SRC_URI +=3D " \
> -    crate://crates.io/addr2line/0.19.0 \
> +    crate://crates.io/addr2line/0.21.0 \
>      crate://crates.io/adler/1.0.2 \
>      crate://crates.io/android-tzdata/0.1.1 \
>      crate://crates.io/android_system_properties/0.1.5 \
> -    crate://crates.io/anstream/0.3.2 \
> -    crate://crates.io/anstyle/1.0.0 \
> -    crate://crates.io/anstyle-parse/0.2.0 \
> +    crate://crates.io/anstream/0.6.4 \
> +    crate://crates.io/anstyle/1.0.4 \
> +    crate://crates.io/anstyle-parse/0.2.2 \
>      crate://crates.io/anstyle-query/1.0.0 \
> -    crate://crates.io/anstyle-wincon/1.0.1 \
> -    crate://crates.io/anyhow/1.0.71 \
> -    crate://crates.io/async-broadcast/0.5.1 \
> -    crate://crates.io/async-trait/0.1.68 \
> +    crate://crates.io/anstyle-wincon/3.0.1 \
> +    crate://crates.io/anyhow/1.0.75 \
> +    crate://crates.io/async-broadcast/0.6.0 \
> +    crate://crates.io/async-trait/0.1.74 \
>      crate://crates.io/autocfg/1.1.0 \
> -    crate://crates.io/backtrace/0.3.67 \
> -    crate://crates.io/bitflags/1.3.2 \
> -    crate://crates.io/bumpalo/3.13.0 \
> -    crate://crates.io/bytes/1.4.0 \
> -    crate://crates.io/cc/1.0.79 \
> +    crate://crates.io/backtrace/0.3.69 \
> +    crate://crates.io/bitflags/2.4.1 \
> +    crate://crates.io/bumpalo/3.14.0 \
> +    crate://crates.io/bytes/1.5.0 \
> +    crate://crates.io/cc/1.0.83 \
>      crate://crates.io/cfg-if/1.0.0 \
> -    crate://crates.io/chrono/0.4.26 \
> -    crate://crates.io/clap/4.3.8 \
> -    crate://crates.io/clap_builder/4.3.8 \
> -    crate://crates.io/clap_derive/4.3.2 \
> -    crate://crates.io/clap_lex/0.5.0 \
> +    crate://crates.io/chrono/0.4.31 \
> +    crate://crates.io/clap/4.4.10 \
> +    crate://crates.io/clap_builder/4.4.9 \
> +    crate://crates.io/clap_derive/4.4.7 \
> +    crate://crates.io/clap_lex/0.6.0 \
>      crate://crates.io/colorchoice/1.0.0 \
> +    crate://crates.io/concurrent-queue/2.3.0 \
>      crate://crates.io/core-foundation-sys/0.8.4 \
> +    crate://crates.io/crossbeam-utils/0.8.16 \
>      crate://crates.io/data-encoding/2.4.0 \
> +    crate://crates.io/deranged/0.3.9 \
>      crate://crates.io/endian-type/0.1.2 \
> -    crate://crates.io/enum-as-inner/0.5.1 \
> -    crate://crates.io/errno/0.3.1 \
> -    crate://crates.io/errno-dragonfly/0.1.2 \
> +    crate://crates.io/enum-as-inner/0.6.0 \
>      crate://crates.io/error-chain/0.12.4 \
> -    crate://crates.io/event-listener/2.5.3 \
> +    crate://crates.io/event-listener/3.1.0 \
> +    crate://crates.io/event-listener-strategy/0.1.0 \
>      crate://crates.io/form_urlencoded/1.2.0 \
> -    crate://crates.io/futures-channel/0.3.28 \
> -    crate://crates.io/futures-core/0.3.28 \
> -    crate://crates.io/futures-executor/0.3.28 \
> -    crate://crates.io/futures-io/0.3.28 \
> -    crate://crates.io/futures-task/0.3.28 \
> -    crate://crates.io/futures-util/0.3.28 \
> -    crate://crates.io/getrandom/0.2.10 \
> -    crate://crates.io/gimli/0.27.3 \
> +    crate://crates.io/futures-channel/0.3.29 \
> +    crate://crates.io/futures-core/0.3.29 \
> +    crate://crates.io/futures-io/0.3.29 \
> +    crate://crates.io/futures-sink/0.3.29 \
> +    crate://crates.io/futures-task/0.3.29 \
> +    crate://crates.io/futures-util/0.3.29 \
> +    crate://crates.io/getrandom/0.2.11 \
> +    crate://crates.io/gimli/0.28.0 \
>      crate://crates.io/heck/0.4.1 \
> -    crate://crates.io/hermit-abi/0.2.6 \
> -    crate://crates.io/hermit-abi/0.3.1 \
> +    crate://crates.io/hermit-abi/0.3.3 \
> +    crate://crates.io/hickory-client/0.24.0 \
> +    crate://crates.io/hickory-proto/0.24.0 \
> +    crate://crates.io/hickory-server/0.24.0 \
>      crate://crates.io/hostname/0.3.1 \
> -    crate://crates.io/iana-time-zone/0.1.57 \
> +    crate://crates.io/iana-time-zone/0.1.58 \
>      crate://crates.io/iana-time-zone-haiku/0.1.2 \
> -    crate://crates.io/idna/0.2.3 \
>      crate://crates.io/idna/0.4.0 \
> -    crate://crates.io/io-lifetimes/1.0.11 \
> -    crate://crates.io/ipnet/2.7.2 \
> -    crate://crates.io/is-terminal/0.4.7 \
> -    crate://crates.io/itoa/1.0.6 \
> -    crate://crates.io/js-sys/0.3.64 \
> -    crate://crates.io/lazy_static/1.4.0 \
> -    crate://crates.io/libc/0.2.146 \
> -    crate://crates.io/linux-raw-sys/0.3.8 \
> -    crate://crates.io/log/0.4.19 \
> +    crate://crates.io/ipnet/2.9.0 \
> +    crate://crates.io/itoa/1.0.9 \
> +    crate://crates.io/js-sys/0.3.65 \
> +    crate://crates.io/libc/0.2.150 \
> +    crate://crates.io/log/0.4.20 \
>      crate://crates.io/match_cfg/0.1.0 \
> -    crate://crates.io/matches/0.1.10 \
> -    crate://crates.io/memchr/2.5.0 \
> -    crate://crates.io/memoffset/0.7.1 \
> -    crate://crates.io/miniz_oxide/0.6.2 \
> -    crate://crates.io/mio/0.8.8 \
> +    crate://crates.io/memchr/2.6.4 \
> +    crate://crates.io/miniz_oxide/0.7.1 \
> +    crate://crates.io/mio/0.8.9 \
>      crate://crates.io/nibble_vec/0.1.0 \
> -    crate://crates.io/nix/0.26.2 \
> -    crate://crates.io/num-traits/0.2.15 \
> -    crate://crates.io/num_cpus/1.15.0 \
> +    crate://crates.io/nix/0.27.1 \
> +    crate://crates.io/num-traits/0.2.17 \
> +    crate://crates.io/num_cpus/1.16.0 \
>      crate://crates.io/num_threads/0.1.6 \
> -    crate://crates.io/object/0.30.4 \
> +    crate://crates.io/object/0.32.1 \
>      crate://crates.io/once_cell/1.18.0 \
> +    crate://crates.io/parking/2.2.0 \
>      crate://crates.io/percent-encoding/2.3.0 \
> -    crate://crates.io/pin-project-lite/0.2.9 \
> +    crate://crates.io/pin-project-lite/0.2.13 \
>      crate://crates.io/pin-utils/0.1.0 \
> +    crate://crates.io/powerfmt/0.2.0 \
>      crate://crates.io/ppv-lite86/0.2.17 \
> -    crate://crates.io/proc-macro2/1.0.60 \
> +    crate://crates.io/proc-macro2/1.0.69 \
>      crate://crates.io/quick-error/1.2.3 \
> -    crate://crates.io/quote/1.0.28 \
> +    crate://crates.io/quote/1.0.33 \
>      crate://crates.io/radix_trie/0.2.1 \
>      crate://crates.io/rand/0.8.5 \
>      crate://crates.io/rand_chacha/0.3.1 \
>      crate://crates.io/rand_core/0.6.4 \
>      crate://crates.io/resolv-conf/0.7.0 \
>      crate://crates.io/rustc-demangle/0.1.23 \
> -    crate://crates.io/rustix/0.37.20 \
> -    crate://crates.io/serde/1.0.164 \
> -    crate://crates.io/serde_derive/1.0.164 \
> -    crate://crates.io/signal-hook/0.3.15 \
> +    crate://crates.io/serde/1.0.192 \
> +    crate://crates.io/serde_derive/1.0.192 \
> +    crate://crates.io/signal-hook/0.3.17 \
>      crate://crates.io/signal-hook-registry/1.4.1 \
> -    crate://crates.io/slab/0.4.8 \
> -    crate://crates.io/smallvec/1.10.0 \
> -    crate://crates.io/socket2/0.4.9 \
> -    crate://crates.io/static_assertions/1.1.0 \
> +    crate://crates.io/slab/0.4.9 \
> +    crate://crates.io/smallvec/1.11.2 \
> +    crate://crates.io/socket2/0.5.5 \
>      crate://crates.io/strsim/0.10.0 \
> -    crate://crates.io/syn/1.0.109 \
> -    crate://crates.io/syn/2.0.18 \
> +    crate://crates.io/syn/2.0.39 \
>      crate://crates.io/syslog/6.1.0 \
> -    crate://crates.io/thiserror/1.0.40 \
> -    crate://crates.io/thiserror-impl/1.0.40 \
> -    crate://crates.io/time/0.1.45 \
> -    crate://crates.io/time/0.3.22 \
> -    crate://crates.io/time-core/0.1.1 \
> -    crate://crates.io/time-macros/0.2.9 \
> +    crate://crates.io/thiserror/1.0.50 \
> +    crate://crates.io/thiserror-impl/1.0.50 \
> +    crate://crates.io/time/0.3.30 \
> +    crate://crates.io/time-core/0.1.2 \
> +    crate://crates.io/time-macros/0.2.15 \
>      crate://crates.io/tinyvec/1.6.0 \
>      crate://crates.io/tinyvec_macros/0.1.1 \
> -    crate://crates.io/tokio/1.29.0 \
> -    crate://crates.io/tokio-macros/2.1.0 \
> -    crate://crates.io/toml/0.5.11 \
> -    crate://crates.io/tracing/0.1.37 \
> -    crate://crates.io/tracing-attributes/0.1.24 \
> -    crate://crates.io/tracing-core/0.1.31 \
> -    crate://crates.io/trust-dns-client/0.22.0 \
> -    crate://crates.io/trust-dns-proto/0.22.0 \
> -    crate://crates.io/trust-dns-server/0.22.1 \
> +    crate://crates.io/tokio/1.35.0 \
> +    crate://crates.io/tokio-macros/2.2.0 \
> +    crate://crates.io/tokio-util/0.7.10 \
> +    crate://crates.io/tracing/0.1.40 \
> +    crate://crates.io/tracing-attributes/0.1.27 \
> +    crate://crates.io/tracing-core/0.1.32 \
>      crate://crates.io/unicode-bidi/0.3.13 \
> -    crate://crates.io/unicode-ident/1.0.9 \
> +    crate://crates.io/unicode-ident/1.0.12 \
>      crate://crates.io/unicode-normalization/0.1.22 \
> -    crate://crates.io/url/2.4.0 \
> +    crate://crates.io/url/2.4.1 \
>      crate://crates.io/utf8parse/0.2.1 \
>      crate://crates.io/version_check/0.9.4 \
> -    crate://crates.io/wasi/0.10.0+wasi-snapshot-preview1 \
>      crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
> -    crate://crates.io/wasm-bindgen/0.2.87 \
> -    crate://crates.io/wasm-bindgen-backend/0.2.87 \
> -    crate://crates.io/wasm-bindgen-macro/0.2.87 \
> -    crate://crates.io/wasm-bindgen-macro-support/0.2.87 \
> -    crate://crates.io/wasm-bindgen-shared/0.2.87 \
> +    crate://crates.io/wasm-bindgen/0.2.88 \
> +    crate://crates.io/wasm-bindgen-backend/0.2.88 \
> +    crate://crates.io/wasm-bindgen-macro/0.2.88 \
> +    crate://crates.io/wasm-bindgen-macro-support/0.2.88 \
> +    crate://crates.io/wasm-bindgen-shared/0.2.88 \
>      crate://crates.io/winapi/0.3.9 \
>      crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
>      crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
> -    crate://crates.io/windows/0.48.0 \
> +    crate://crates.io/windows-core/0.51.1 \
>      crate://crates.io/windows-sys/0.48.0 \
> -    crate://crates.io/windows-targets/0.48.0 \
> -    crate://crates.io/windows_aarch64_gnullvm/0.48.0 \
> -    crate://crates.io/windows_aarch64_msvc/0.48.0 \
> -    crate://crates.io/windows_i686_gnu/0.48.0 \
> -    crate://crates.io/windows_i686_msvc/0.48.0 \
> -    crate://crates.io/windows_x86_64_gnu/0.48.0 \
> -    crate://crates.io/windows_x86_64_gnullvm/0.48.0 \
> -    crate://crates.io/windows_x86_64_msvc/0.48.0 \
> +    crate://crates.io/windows-targets/0.48.5 \
> +    crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
> +    crate://crates.io/windows_aarch64_msvc/0.48.5 \
> +    crate://crates.io/windows_i686_gnu/0.48.5 \
> +    crate://crates.io/windows_i686_msvc/0.48.5 \
> +    crate://crates.io/windows_x86_64_gnu/0.48.5 \
> +    crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
> +    crate://crates.io/windows_x86_64_msvc/0.48.5 \
>  "
>
> -SRC_URI[addr2line-0.19.0.sha256sum] =3D "a76fd60b23679b7d19bd066031410fb=
7e458ccc5e958eb5c325888ce4baedc97"
> +SRC_URI[addr2line-0.21.0.sha256sum] =3D "8a30b2e23b9e17a9f90641c7ab1549c=
d9b44f296d3ccbf309d2863cfe398a0cb"
>  SRC_URI[adler-1.0.2.sha256sum] =3D "f26201604c87b1e01bd3d98f8d5d9a8fcbb8=
15e8cedb41ffccbeb4bf593a35fe"
>  SRC_URI[android-tzdata-0.1.1.sha256sum] =3D "e999941b234f3131b00bc13c22d=
06e8c5ff726d1b6318ac7eb276997bbb4fef0"
>  SRC_URI[android_system_properties-0.1.5.sha256sum] =3D "819e7219dbd41043=
ac279b19830f2efc897156490d7fd6ea916720117ee66311"
> -SRC_URI[anstream-0.3.2.sha256sum] =3D "0ca84f3628370c59db74ee214b3263d58=
f9aadd9b4fe7e711fd87dc452b7f163"
> -SRC_URI[anstyle-1.0.0.sha256sum] =3D "41ed9a86bf92ae6580e0a31281f65a1b1d=
867c0cc68d5346e2ae128dddfa6a7d"
> -SRC_URI[anstyle-parse-0.2.0.sha256sum] =3D "e765fd216e48e067936442276d1d=
57399e37bce53c264d6fefbe298080cb57ee"
> +SRC_URI[anstream-0.6.4.sha256sum] =3D "2ab91ebe16eb252986481c5b62f6098f3=
b698a45e34b5b98200cf20dd2484a44"
> +SRC_URI[anstyle-1.0.4.sha256sum] =3D "7079075b41f533b8c61d2a4d073c4676e1=
f8b249ff94a393b0595db304e0dd87"
> +SRC_URI[anstyle-parse-0.2.2.sha256sum] =3D "317b9a89c1868f5ea6ff1d9539a6=
9f45dffc21ce321ac1fd1160dfa48c8e2140"
>  SRC_URI[anstyle-query-1.0.0.sha256sum] =3D "5ca11d4be1bab0c8bc8734a9aa7b=
f4ee8316d462a08c6ac5052f888fef5b494b"
> -SRC_URI[anstyle-wincon-1.0.1.sha256sum] =3D "180abfa45703aebe0093f79bada=
cc01b8fd4ea2e35118747e5811127f926e188"
> -SRC_URI[anyhow-1.0.71.sha256sum] =3D "9c7d0618f0e0b7e8ff11427422b64564d5=
fb0be1940354bfe2e0529b18a9d9b8"
> -SRC_URI[async-broadcast-0.5.1.sha256sum] =3D "7c48ccdbf6ca6b121e0f586cbc=
0e73ae440e56c67c30fa0873b4e110d9c26d2b"
> -SRC_URI[async-trait-0.1.68.sha256sum] =3D "b9ccdd8f2a161be9bd5c023df56f1=
b2a0bd1d83872ae53b71a84a12c9bf6e842"
> +SRC_URI[anstyle-wincon-3.0.1.sha256sum] =3D "f0699d10d2f4d628a98ee7b57b2=
89abbc98ff3bad977cb3152709d4bf2330628"
> +SRC_URI[anyhow-1.0.75.sha256sum] =3D "a4668cab20f66d8d020e1fbc0ebe472174=
33c1b6c8f2040faf858554e394ace6"
> +SRC_URI[async-broadcast-0.6.0.sha256sum] =3D "334d75cf09b33bede6cbc20e52=
515853ae7bee3d4eadd9540e13ce92af983d34"
> +SRC_URI[async-trait-0.1.74.sha256sum] =3D "a66537f1bb974b254c98ed142ff99=
5236e81b9d0fe4db0575f46612cb15eb0f9"
>  SRC_URI[autocfg-1.1.0.sha256sum] =3D "d468802bab17cbc0cc575e9b053f41e72a=
a36bfa6b7f55e3529ffa43161b97fa"
> -SRC_URI[backtrace-0.3.67.sha256sum] =3D "233d376d6d185f2a3093e58f283f60f=
880315b6c60075b01f36b3b85154564ca"
> -SRC_URI[bitflags-1.3.2.sha256sum] =3D "bef38d45163c2f1dde094a7dfd33ccf59=
5c92905c8f8f4fdc18d06fb1037718a"
> -SRC_URI[bumpalo-3.13.0.sha256sum] =3D "a3e2c3daef883ecc1b5d58c15adae9347=
0a91d425f3532ba1695849656af3fc1"
> -SRC_URI[bytes-1.4.0.sha256sum] =3D "89b2fd2a0dcf38d7971e2194b6b6eebab45a=
e01067456a7fd93d5547a61b70be"
> -SRC_URI[cc-1.0.79.sha256sum] =3D "50d30906286121d95be3d479533b458f87493b=
30a4b5f79a607db8f5d11aa91f"
> +SRC_URI[backtrace-0.3.69.sha256sum] =3D "2089b7e3f35b9dd2d0ed921ead4f6d3=
18c27680d4a5bd167b3ee120edb105837"
> +SRC_URI[bitflags-2.4.1.sha256sum] =3D "327762f6e5a765692301e5bb513e0d9fe=
f63be86bbc14528052b1cd3e6f03e07"
> +SRC_URI[bumpalo-3.14.0.sha256sum] =3D "7f30e7476521f6f8af1a1c4c0b8cc94f0=
bee37d91763d0ca2665f299b6cd8aec"
> +SRC_URI[bytes-1.5.0.sha256sum] =3D "a2bd12c1caf447e69cd4528f47f94d203fd2=
582878ecb9e9465484c4148a8223"
> +SRC_URI[cc-1.0.83.sha256sum] =3D "f1174fb0b6ec23863f8b971027804a42614e34=
7eafb0a95bf0b12cdae21fc4d0"
>  SRC_URI[cfg-if-1.0.0.sha256sum] =3D "baf1de4339761588bc0619e3cbc0120ee58=
2ebb74b53b4efbf79117bd2da40fd"
> -SRC_URI[chrono-0.4.26.sha256sum] =3D "ec837a71355b28f6556dbd569b37b3f363=
091c0bd4b2e735674521b4c5fd9bc5"
> -SRC_URI[clap-4.3.8.sha256sum] =3D "d9394150f5b4273a1763355bd1c2ec54cc5a2=
593f790587bcd6b2c947cfa9211"
> -SRC_URI[clap_builder-4.3.8.sha256sum] =3D "9a78fbdd3cc2914ddf37ba444114b=
c7765bbdcb55ec9cbe6fa054f0137400717"
> -SRC_URI[clap_derive-4.3.2.sha256sum] =3D "b8cd2b2a819ad6eec39e8f1d6b5300=
1af1e5469f8c177579cdaeb313115b825f"
> -SRC_URI[clap_lex-0.5.0.sha256sum] =3D "2da6da31387c7e4ef160ffab6d5e7f00c=
42626fe39aea70a7b0f1773f7dd6c1b"
> +SRC_URI[chrono-0.4.31.sha256sum] =3D "7f2c685bad3eb3d45a01354cedb7d5faa6=
6194d1d58ba6e267a8de788f79db38"
> +SRC_URI[clap-4.4.10.sha256sum] =3D "41fffed7514f420abec6d183b1d3acfd9099=
c79c3a10a06ade4f8203f1411272"
> +SRC_URI[clap_builder-4.4.9.sha256sum] =3D "63361bae7eef3771745f02d8d892b=
ec2fee5f6e34af316ba556e7f97a7069ff1"
> +SRC_URI[clap_derive-4.4.7.sha256sum] =3D "cf9804afaaf59a91e75b022a30fb72=
29a7901f60c755489cc61c9b423b836442"
> +SRC_URI[clap_lex-0.6.0.sha256sum] =3D "702fc72eb24e5a1e48ce58027a675bc24=
edd52096d5397d4aea7c6dd9eca0bd1"
>  SRC_URI[colorchoice-1.0.0.sha256sum] =3D "acbf1af155f9b9ef647e42cdc158db=
4b64a1b61f743629225fde6f3e0be2a7c7"
> +SRC_URI[concurrent-queue-2.3.0.sha256sum] =3D "f057a694a54f12365049b0958=
a1685bb52d567f5593b355fbf685838e873d400"
>  SRC_URI[core-foundation-sys-0.8.4.sha256sum] =3D "e496a50fda8aacccc86d75=
29e2c1e0892dbd0f898a6b5645b5561b89c3210efa"
> +SRC_URI[crossbeam-utils-0.8.16.sha256sum] =3D "5a22b2d63d4d1dc0b7f1b6b27=
47dd0088008a9be28b6ddf0b1e7d335e3037294"
>  SRC_URI[data-encoding-2.4.0.sha256sum] =3D "c2e66c9d817f1720209181c316d2=
8635c050fa304f9c79e47a520882661b7308"
> +SRC_URI[deranged-0.3.9.sha256sum] =3D "0f32d04922c60427da6f9fef14d042d9e=
dddef64cb9d4ce0d64d0685fbeb1fd3"
>  SRC_URI[endian-type-0.1.2.sha256sum] =3D "c34f04666d835ff5d62e058c399514=
7c06f42fe86ff053337632bca83e42702d"
> -SRC_URI[enum-as-inner-0.5.1.sha256sum] =3D "c9720bba047d567ffc8a3cba48bf=
19126600e249ab7f128e9233e6376976a116"
> -SRC_URI[errno-0.3.1.sha256sum] =3D "4bcfec3a70f97c962c307b2d2c56e358cf1d=
00b558d74262b5f929ee8cc7e73a"
> -SRC_URI[errno-dragonfly-0.1.2.sha256sum] =3D "aa68f1b12764fab894d2755d25=
18754e71b4fd80ecfb822714a1206c2aab39bf"
> +SRC_URI[enum-as-inner-0.6.0.sha256sum] =3D "5ffccbb6966c05b32ef8fbac435d=
f276c4ae4d3dc55a8cd0eb9745e6c12f546a"
>  SRC_URI[error-chain-0.12.4.sha256sum] =3D "2d2f06b9cac1506ece98fe3231e3c=
c9c4410ec3d5b1f24ae1c8946f0742cdefc"
> -SRC_URI[event-listener-2.5.3.sha256sum] =3D "0206175f82b8d6bf6652ff7d71a=
1e27fd2e4efde587fd368662814d6ec1d9ce0"
> +SRC_URI[event-listener-3.1.0.sha256sum] =3D "d93877bcde0eb80ca09131a08d2=
3f0a5c18a620b01db137dba666d18cd9b30c2"
> +SRC_URI[event-listener-strategy-0.1.0.sha256sum] =3D "15c97b4e30ea7e4b7e=
7b429d6e2d8510433ba8cee4e70dfb3243794e539d29fd"
>  SRC_URI[form_urlencoded-1.2.0.sha256sum] =3D "a62bc1cf6f830c2ec14a513a9f=
b124d0a213a629668a4186f329db21fe045652"
> -SRC_URI[futures-channel-0.3.28.sha256sum] =3D "955518d47e09b25bbebc7a18d=
f10b81f0c766eaf4c4f1cccef2fca5f2a4fb5f2"
> -SRC_URI[futures-core-0.3.28.sha256sum] =3D "4bca583b7e26f571124fe5b7561d=
49cb2868d79116cfa0eefce955557c6fee8c"
> -SRC_URI[futures-executor-0.3.28.sha256sum] =3D "ccecee823288125bd88b4d7f=
565c9e58e41858e47ab72e8ea2d64e93624386e0"
> -SRC_URI[futures-io-0.3.28.sha256sum] =3D "4fff74096e71ed47f8e023204cfd0a=
a1289cd54ae5430a9523be060cdb849964"
> -SRC_URI[futures-task-0.3.28.sha256sum] =3D "76d3d132be6c0e6aa1534069c705=
a74a5997a356c0dc2f86a47765e5617c5b65"
> -SRC_URI[futures-util-0.3.28.sha256sum] =3D "26b01e40b772d54cf6c6d721c1d1=
abd0647a0106a12ecaa1c186273392a69533"
> -SRC_URI[getrandom-0.2.10.sha256sum] =3D "be4136b2a15dd319360be1c07d99335=
17ccf0be8f16bf62a3bee4f0d618df427"
> -SRC_URI[gimli-0.27.3.sha256sum] =3D "b6c80984affa11d98d1b88b66ac8853f143=
217b399d3c74116778ff8fdb4ed2e"
> +SRC_URI[futures-channel-0.3.29.sha256sum] =3D "ff4dd66668b557604244583e3=
e1e1eada8c5c2e96a6d0d6653ede395b78bbacb"
> +SRC_URI[futures-core-0.3.29.sha256sum] =3D "eb1d22c66e66d9d72e1758f0bd7d=
4fd0bee04cad842ee34587d68c07e45d088c"
> +SRC_URI[futures-io-0.3.29.sha256sum] =3D "8bf34a163b5c4c52d0478a4d757da8=
fb65cabef42ba90515efee0f6f9fa45aaa"
> +SRC_URI[futures-sink-0.3.29.sha256sum] =3D "e36d3378ee38c2a36ad710c5d30c=
2911d752cb941c00c72dbabfb786a7970817"
> +SRC_URI[futures-task-0.3.29.sha256sum] =3D "efd193069b0ddadc69c46389b740=
bbccdd97203899b48d09c5f7969591d6bae2"
> +SRC_URI[futures-util-0.3.29.sha256sum] =3D "a19526d624e703a3179b3d322efe=
c918b6246ea0fa51d41124525f00f1cc8104"
> +SRC_URI[getrandom-0.2.11.sha256sum] =3D "fe9006bed769170c11f845cf00c7c1e=
9092aeb3f268e007c3e760ac68008070f"
> +SRC_URI[gimli-0.28.0.sha256sum] =3D "6fb8d784f27acf97159b40fc4db5ecd8aa2=
3b9ad5ef69cdd136d3bc80665f0c0"
>  SRC_URI[heck-0.4.1.sha256sum] =3D "95505c38b4572b2d910cecb0281560f54b440=
a19336cbbcb27bf6ce6adc6f5a8"
> -SRC_URI[hermit-abi-0.2.6.sha256sum] =3D "ee512640fe35acbfb4bb779db6f0d80=
704c2cacfa2e39b601ef3e3f47d1ae4c7"
> -SRC_URI[hermit-abi-0.3.1.sha256sum] =3D "fed44880c466736ef9a5c5b5facefb5=
ed0785676d0c02d612db14e54f0d84286"
> +SRC_URI[hermit-abi-0.3.3.sha256sum] =3D "d77f7ec81a6d05a3abb01ab6eb7590f=
6083d08449fe5a1c8b1e620283546ccb7"
> +SRC_URI[hickory-client-0.24.0.sha256sum] =3D "7f3e08124cf0ddda93b1186d4a=
f73599de401f3b52f14cd9aaa719049379462e"
> +SRC_URI[hickory-proto-0.24.0.sha256sum] =3D "091a6fbccf4860009355e3efc52=
ff4acf37a63489aad7435372d44ceeb6fbbcf"
> +SRC_URI[hickory-server-0.24.0.sha256sum] =3D "4fbbb45bc4dcb456445732c705=
e3cfdc7393b8bcae5c36ecec36b9d76bd67cb5"
>  SRC_URI[hostname-0.3.1.sha256sum] =3D "3c731c3e10504cc8ed35cfe2f1db4c927=
4c3d35fa486e3b31df46f068ef3e867"
> -SRC_URI[iana-time-zone-0.1.57.sha256sum] =3D "2fad5b825842d2b38bd206f3e8=
1d6957625fd7f0a361e345c30e01a0ae2dd613"
> +SRC_URI[iana-time-zone-0.1.58.sha256sum] =3D "8326b86b6cff230b97d0d312a6=
c40a60726df3332e721f72a1b035f451663b20"
>  SRC_URI[iana-time-zone-haiku-0.1.2.sha256sum] =3D "f31827a206f56af32e590=
ba56d5d2d085f558508192593743f16b2306495269f"
> -SRC_URI[idna-0.2.3.sha256sum] =3D "418a0a6fab821475f634efe3ccc45c013f742=
efe03d853e8d3355d5cb850ecf8"
>  SRC_URI[idna-0.4.0.sha256sum] =3D "7d20d6b07bfbc108882d88ed8e37d39636dcc=
260e15e30c45e6ba089610b917c"
> -SRC_URI[io-lifetimes-1.0.11.sha256sum] =3D "eae7b9aee968036d54dce06cebae=
fd919e4472e753296daccd6d344e3e2df0c2"
> -SRC_URI[ipnet-2.7.2.sha256sum] =3D "12b6ee2129af8d4fb011108c73d99a1b83a8=
5977f23b82460c0ae2e25bb4b57f"
> -SRC_URI[is-terminal-0.4.7.sha256sum] =3D "adcf93614601c8129ddf72e2d5633d=
f827ba6551541c6d8c59520a371475be1f"
> -SRC_URI[itoa-1.0.6.sha256sum] =3D "453ad9f582a441959e5f0d088b02ce04cfe8d=
51a8eaf077f12ac6d3e94164ca6"
> -SRC_URI[js-sys-0.3.64.sha256sum] =3D "c5f195fe497f702db0f318b07fdd68edb1=
6955aed830df8363d837542f8f935a"
> -SRC_URI[lazy_static-1.4.0.sha256sum] =3D "e2abad23fbc42b3700f2f279844dc8=
32adb2b2eb069b2df918f455c4e18cc646"
> -SRC_URI[libc-0.2.146.sha256sum] =3D "f92be4933c13fd498862a9e02a3055f8a8d=
9c039ce33db97306fd5a6caa7f29b"
> -SRC_URI[linux-raw-sys-0.3.8.sha256sum] =3D "ef53942eb7bf7ff43a617b3e2c1c=
4a5ecf5944a7c1bc12d7ee39bbb15e5c1519"
> -SRC_URI[log-0.4.19.sha256sum] =3D "b06a4cde4c0f271a446782e3eff8de789548c=
e57dbc8eca9292c27f4a42004b4"
> +SRC_URI[ipnet-2.9.0.sha256sum] =3D "8f518f335dce6725a761382244631d86cf0c=
cb2863413590b31338feb467f9c3"
> +SRC_URI[itoa-1.0.9.sha256sum] =3D "af150ab688ff2122fcef229be89cb50dd66af=
9e01a4ff320cc137eecc9bacc38"
> +SRC_URI[js-sys-0.3.65.sha256sum] =3D "54c0c35952f67de54bb584e9fd912b3023=
117cbafc0a77d8f3dee1fb5f572fe8"
> +SRC_URI[libc-0.2.150.sha256sum] =3D "89d92a4743f9a61002fae18374ed11e7973=
f530cb3a3255fb354818118b2203c"
> +SRC_URI[log-0.4.20.sha256sum] =3D "b5e6163cb8c49088c2c36f57875e58ccd8c87=
c7427f7fbd50ea6710b2f3f2e8f"
>  SRC_URI[match_cfg-0.1.0.sha256sum] =3D "ffbee8634e0d45d258acb448e7eaab3f=
ce7a0a467395d4d9f228e3c1f01fb2e4"
> -SRC_URI[matches-0.1.10.sha256sum] =3D "2532096657941c2fea9c289d370a25097=
1c689d4f143798ff67113ec042024a5"
> -SRC_URI[memchr-2.5.0.sha256sum] =3D "2dffe52ecf27772e601905b7522cb4ef790=
d2cc203488bbd0e2fe85fcb74566d"
> -SRC_URI[memoffset-0.7.1.sha256sum] =3D "5de893c32cde5f383baa4c04c5d6dbdd=
735cfd4a794b0debdb2bb1b421da5ff4"
> -SRC_URI[miniz_oxide-0.6.2.sha256sum] =3D "b275950c28b37e794e8c55d88aeb5e=
139d0ce23fdbbeda68f8d7174abdf9e8fa"
> -SRC_URI[mio-0.8.8.sha256sum] =3D "927a765cd3fc26206e66b296465fa9d3e5ab00=
3e651c1b3c060e7956d96b19d2"
> +SRC_URI[memchr-2.6.4.sha256sum] =3D "f665ee40bc4a3c5590afb1e9677db74a508=
659dfd71e126420da8274909a0167"
> +SRC_URI[miniz_oxide-0.7.1.sha256sum] =3D "e7810e0be55b428ada41041c41f32c=
9f1a42817901b4ccf45fa3d4b6561e74c7"
> +SRC_URI[mio-0.8.9.sha256sum] =3D "3dce281c5e46beae905d4de1870d8b1509a914=
2b62eedf18b443b011ca8343d0"
>  SRC_URI[nibble_vec-0.1.0.sha256sum] =3D "77a5d83df9f36fe23f0c3648c6bbb8b=
0298bb5f1939c8f2704431371f4b84d43"
> -SRC_URI[nix-0.26.2.sha256sum] =3D "bfdda3d196821d6af13126e40375cdf7da646=
a96114af134d5f417a9a1dc8e1a"
> -SRC_URI[num-traits-0.2.15.sha256sum] =3D "578ede34cf02f8924ab9447f50c280=
75b4d3e5b269972345e7e0372b38c6cdcd"
> -SRC_URI[num_cpus-1.15.0.sha256sum] =3D "0fac9e2da13b5eb447a6ce3d392f23a2=
9d8694bff781bf03a16cd9ac8697593b"
> +SRC_URI[nix-0.27.1.sha256sum] =3D "2eb04e9c688eff1c89d72b407f168cf79bb9e=
867a9d3323ed6c01519eb9cc053"
> +SRC_URI[num-traits-0.2.17.sha256sum] =3D "39e3200413f237f41ab11ad6d161bc=
7239c84dcb631773ccd7de3dfe4b5c267c"
> +SRC_URI[num_cpus-1.16.0.sha256sum] =3D "4161fcb6d602d4d2081af7c3a45852d8=
75a03dd337a6bfdd6e06407b61342a43"
>  SRC_URI[num_threads-0.1.6.sha256sum] =3D "2819ce041d2ee131036f4fc9d6ae7a=
e125a3a40e97ba64d04fe799ad9dabbb44"
> -SRC_URI[object-0.30.4.sha256sum] =3D "03b4680b86d9cfafba8fc491dc9b6df26b=
68cf40e9e6cd73909194759a63c385"
> +SRC_URI[object-0.32.1.sha256sum] =3D "9cf5f9dd3933bd50a9e1f149ec995f39ae=
2c496d31fd772c1fd45ebc27e902b0"
>  SRC_URI[once_cell-1.18.0.sha256sum] =3D "dd8b5dd2ae5ed71462c540258bedcb5=
1965123ad7e7ccf4b9a8cafaa4a63576d"
> +SRC_URI[parking-2.2.0.sha256sum] =3D "bb813b8af86854136c6922af0598d71925=
5ecb2179515e6e7730d468f05c9cae"
>  SRC_URI[percent-encoding-2.3.0.sha256sum] =3D "9b2a4787296e9989611394c33=
f193f676704af1686e70b8f8033ab5ba9a35a94"
> -SRC_URI[pin-project-lite-0.2.9.sha256sum] =3D "e0a7ae3ac2f1173085d398531=
c705756c94a4c56843785df85a60c1a0afac116"
> +SRC_URI[pin-project-lite-0.2.13.sha256sum] =3D "8afb450f006bf6385ca15ef4=
5d71d2288452bc3683ce2e2cacc0d18e4be60b58"
>  SRC_URI[pin-utils-0.1.0.sha256sum] =3D "8b870d8c151b6f2fb93e84a13146138f=
05d02ed11c7e7c54f8826aaaf7c9f184"
> +SRC_URI[powerfmt-0.2.0.sha256sum] =3D "439ee305def115ba05938db6eb1644ff9=
4165c5ab5e9420d1c1bcedbba909391"
>  SRC_URI[ppv-lite86-0.2.17.sha256sum] =3D "5b40af805b3121feab8a3c29f04d8a=
d262fa8e0561883e7653e024ae4479e6de"
> -SRC_URI[proc-macro2-1.0.60.sha256sum] =3D "dec2b086b7a862cf4de201096214f=
a870344cf922b2b30c167badb3af3195406"
> +SRC_URI[proc-macro2-1.0.69.sha256sum] =3D "134c189feb4956b20f6f547d2cf72=
7d4c0fe06722b20a0eec87ed445a97f92da"
>  SRC_URI[quick-error-1.2.3.sha256sum] =3D "a1d01941d82fa2ab50be1e79e67142=
89dd7cde78eba4c074bc5a4374f650dfe0"
> -SRC_URI[quote-1.0.28.sha256sum] =3D "1b9ab9c7eadfd8df19006f1cf1a4aed1354=
0ed5cbc047010ece5826e10825488"
> +SRC_URI[quote-1.0.33.sha256sum] =3D "5267fca4496028628a95160fc423a33e8b2=
e6af8a5302579e322e4b520293cae"
>  SRC_URI[radix_trie-0.2.1.sha256sum] =3D "c069c179fcdc6a2fe24d8d18305cf08=
5fdbd4f922c041943e203685d6a1c58fd"
>  SRC_URI[rand-0.8.5.sha256sum] =3D "34af8d1a0e25924bc5b7c43c079c942339d8f=
0a8b57c39049bef581b46327404"
>  SRC_URI[rand_chacha-0.3.1.sha256sum] =3D "e6c10a63a0fa32252be49d21e7709d=
4d4baf8d231c2dbce1eaa8141b9b127d88"
>  SRC_URI[rand_core-0.6.4.sha256sum] =3D "ec0be4795e2f6a28069bec0b5ff3e2ac=
9bafc99e6a9a7dc3547996c5c816922c"
>  SRC_URI[resolv-conf-0.7.0.sha256sum] =3D "52e44394d2086d010551b14b53b1f2=
4e31647570cd1deb0379e2c21b329aba00"
>  SRC_URI[rustc-demangle-0.1.23.sha256sum] =3D "d626bb9dae77e28219937af045=
c257c28bfd3f69333c512553507f5f9798cb76"
> -SRC_URI[rustix-0.37.20.sha256sum] =3D "b96e891d04aa506a6d1f318d2771bcb1c=
7dfda84e126660ace067c9b474bb2c0"
> -SRC_URI[serde-1.0.164.sha256sum] =3D "9e8c8cf938e98f769bc164923b06dce91c=
ea1751522f46f8466461af04c9027d"
> -SRC_URI[serde_derive-1.0.164.sha256sum] =3D "d9735b638ccc51c28bf6914d90a=
2e9725b377144fc612c49a611fddd1b631d68"
> -SRC_URI[signal-hook-0.3.15.sha256sum] =3D "732768f1176d21d09e076c23a9312=
3d40bba92d50c4058da34d45c8de8e682b9"
> +SRC_URI[serde-1.0.192.sha256sum] =3D "bca2a08484b285dcb282d0f67b26cadc0d=
f8b19f8c12502c13d966bf9482f001"
> +SRC_URI[serde_derive-1.0.192.sha256sum] =3D "d6c7207fbec9faa48073f3e3074=
cbe553af6ea512d7c21ba46e434e70ea9fbc1"
> +SRC_URI[signal-hook-0.3.17.sha256sum] =3D "8621587d4798caf8eb44879d42e56=
b9a93ea5dcd315a6487c357130095b62801"
>  SRC_URI[signal-hook-registry-1.4.1.sha256sum] =3D "d8229b473baa5980ac72e=
f434c4415e70c4b5e71b423043adb4ba059f89c99a1"
> -SRC_URI[slab-0.4.8.sha256sum] =3D "6528351c9bc8ab22353f9d776db39a20288e8=
d6c37ef8cfe3317cf875eecfc2d"
> -SRC_URI[smallvec-1.10.0.sha256sum] =3D "a507befe795404456341dfab10cef66e=
ad4c041f62b8b11bbb92bffe5d0953e0"
> -SRC_URI[socket2-0.4.9.sha256sum] =3D "64a4a911eed85daf18834cfaa86a79b7d2=
66ff93ff5ba14005426219480ed662"
> -SRC_URI[static_assertions-1.1.0.sha256sum] =3D "a2eb9349b6444b326872e140=
eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
> +SRC_URI[slab-0.4.9.sha256sum] =3D "8f92a496fb766b417c996b9c5e57daf2f7ad3=
b0bebe1ccfca4856390e3d3bb67"
> +SRC_URI[smallvec-1.11.2.sha256sum] =3D "4dccd0940a2dcdf68d092b8cbab7dc0a=
d8fa938bf95787e1b916b0e3d0e8e970"
> +SRC_URI[socket2-0.5.5.sha256sum] =3D "7b5fac59a5cb5dd637972e5fca70daf052=
3c9067fcdc4842f053dae04a18f8e9"
>  SRC_URI[strsim-0.10.0.sha256sum] =3D "73473c0e59e6d5812c5dfe2a064a644494=
9f089e20eec9a2e5506596494e4623"
> -SRC_URI[syn-1.0.109.sha256sum] =3D "72b64191b275b66ffe2469e8af2c1cfe3baf=
a67b529ead792a6d0160888b4237"
> -SRC_URI[syn-2.0.18.sha256sum] =3D "32d41677bcbe24c20c52e7c70b0d8db04134c=
5d1066bf98662e2871ad200ea3e"
> +SRC_URI[syn-2.0.39.sha256sum] =3D "23e78b90f2fcf45d3e842032ce32e3f2d1545=
ba6636271dcbf24fa306d87be7a"
>  SRC_URI[syslog-6.1.0.sha256sum] =3D "7434e95bcccce1215d30f4bf84fe8c00e8d=
e1b9be4fb736d747ca53d36e7f96f"
> -SRC_URI[thiserror-1.0.40.sha256sum] =3D "978c9a314bd8dc99be594bc3c175faa=
a9794be04a5a5e153caba6915336cebac"
> -SRC_URI[thiserror-impl-1.0.40.sha256sum] =3D "f9456a42c5b0d803c8cd86e73d=
d7cc9edd429499f37a3550d286d5e86720569f"
> -SRC_URI[time-0.1.45.sha256sum] =3D "1b797afad3f312d1c66a56d11d0316f91635=
6d11bd158fbc6ca6389ff6bf805a"
> -SRC_URI[time-0.3.22.sha256sum] =3D "ea9e1b3cf1243ae005d9e74085d4d542f312=
5458f3a81af210d901dcd7411efd"
> -SRC_URI[time-core-0.1.1.sha256sum] =3D "7300fbefb4dadc1af235a9cef3737cea=
692a9d97e1b9cbcd4ebdae6f8868e6fb"
> -SRC_URI[time-macros-0.2.9.sha256sum] =3D "372950940a5f07bf38dbe211d7283c=
9e6d7327df53794992d293e534c733d09b"
> +SRC_URI[thiserror-1.0.50.sha256sum] =3D "f9a7210f5c9a7156bb50aa36aed4c95=
afb51df0df00713949448cf9e97d382d2"
> +SRC_URI[thiserror-impl-1.0.50.sha256sum] =3D "266b2e40bc00e5a6c09c358401=
1e08b06f123c00362c92b975ba9843aaaa14b8"
> +SRC_URI[time-0.3.30.sha256sum] =3D "c4a34ab300f2dee6e562c10a046fc05e358b=
29f9bf92277f30c3c8d82275f6f5"
> +SRC_URI[time-core-0.1.2.sha256sum] =3D "ef927ca75afb808a4d64dd374f00a2ad=
f8d0fcff8e7b184af886c3c87ec4a3f3"
> +SRC_URI[time-macros-0.2.15.sha256sum] =3D "4ad70d68dba9e1f8aceda7aa67119=
65dfec1cac869f311a51bd08b3a2ccbce20"
>  SRC_URI[tinyvec-1.6.0.sha256sum] =3D "87cc5ceb3875bb20c2890005a4e226a465=
1264a5c75edb2421b52861a0a0cb50"
>  SRC_URI[tinyvec_macros-0.1.1.sha256sum] =3D "1f3ccbac311fea05f86f61904b4=
62b55fb3df8837a366dfc601a0161d0532f20"
> -SRC_URI[tokio-1.29.0.sha256sum] =3D "374442f06ee49c3a28a8fc9f01a2596fed7=
559c6b99b31279c3261778e77d84f"
> -SRC_URI[tokio-macros-2.1.0.sha256sum] =3D "630bdcf245f78637c13ec01ffae61=
87cca34625e8c63150d424b59e55af2675e"
> -SRC_URI[toml-0.5.11.sha256sum] =3D "f4f7f0dd8d50a853a531c426359045b1998f=
04219d88799810762cd4ad314234"
> -SRC_URI[tracing-0.1.37.sha256sum] =3D "8ce8c33a8d48bd45d624a6e523445fd21=
ec13d3653cd51f681abf67418f54eb8"
> -SRC_URI[tracing-attributes-0.1.24.sha256sum] =3D "0f57e3ca2a01450b1a9211=
83a9c9cbfda207fd822cef4ccb00a65402cbba7a74"
> -SRC_URI[tracing-core-0.1.31.sha256sum] =3D "0955b8137a1df6f1a2e9a37d8a66=
56291ff0297c1a97c24e0d8425fe2312f79a"
> -SRC_URI[trust-dns-client-0.22.0.sha256sum] =3D "6c408c32e6a9dbb38037cece=
35740f2cf23c875d8ca134d33631cec83f74d3fe"
> -SRC_URI[trust-dns-proto-0.22.0.sha256sum] =3D "4f7f83d1e4a0e4358ac54c5c3=
681e5d7da5efc5a7a632c90bb6d6669ddd9bc26"
> -SRC_URI[trust-dns-server-0.22.1.sha256sum] =3D "99022f9befa6daec2a860be6=
8ac28b1f0d9d7ccf441d8c5a695e35a58d88840d"
> +SRC_URI[tokio-1.35.0.sha256sum] =3D "841d45b238a16291a4e1584e61820b8ae57=
d696cc5015c459c229ccc6990cc1c"
> +SRC_URI[tokio-macros-2.2.0.sha256sum] =3D "5b8a1e28f2deaa14e508979454cb3=
a223b10b938b45af148bc0986de36f1923b"
> +SRC_URI[tokio-util-0.7.10.sha256sum] =3D "5419f34732d9eb6ee4c3578b798907=
8579b7f039cbbb9ca2c4da015749371e15"
> +SRC_URI[tracing-0.1.40.sha256sum] =3D "c3523ab5a71916ccf420eebdf5521fcef=
02141234bbc0b8a49f2fdc4544364ef"
> +SRC_URI[tracing-attributes-0.1.27.sha256sum] =3D "34704c8d6ebcbc93982418=
0af020566b01a7c01f80641264eba0999f6c2b6be7"
> +SRC_URI[tracing-core-0.1.32.sha256sum] =3D "c06d3da6113f116aaee68e4d6011=
91614c9053067f9ab7f6edbcb161237daa54"
>  SRC_URI[unicode-bidi-0.3.13.sha256sum] =3D "92888ba5573ff080736b3648696b=
70cafad7d250551175acbaa4e0385b3e1460"
> -SRC_URI[unicode-ident-1.0.9.sha256sum] =3D "b15811caf2415fb889178633e772=
4bad2509101cde276048e013b9def5e51fa0"
> +SRC_URI[unicode-ident-1.0.12.sha256sum] =3D "3354b9ac3fae1ff6755cb6db536=
83adb661634f67557942dea4facebec0fee4b"
>  SRC_URI[unicode-normalization-0.1.22.sha256sum] =3D "5c5713f0fc4b5db668a=
2ac63cdb7bb4469d8c9fed047b1d0292cc7b0ce2ba921"
> -SRC_URI[url-2.4.0.sha256sum] =3D "50bff7831e19200a85b17131d085c25d7811bc=
4e186efdaf54bbd132994a88cb"
> +SRC_URI[url-2.4.1.sha256sum] =3D "143b538f18257fac9cad154828a57c6bf5157e=
1aa604d4816b5995bf6de87ae5"
>  SRC_URI[utf8parse-0.2.1.sha256sum] =3D "711b9620af191e0cdc7468a8d14e709c=
3dcdb115b36f838e601583af800a370a"
>  SRC_URI[version_check-0.9.4.sha256sum] =3D "49874b5167b65d7193b8aba1567f=
5c7d93d001cafc34600cee003eda787e483f"
> -SRC_URI[wasi-0.10.0+wasi-snapshot-preview1.sha256sum] =3D "1a143597ca7c7=
793eff794def352d41792a93c481eb1042423ff7ff72ba2c31f"
>  SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] =3D "9c8d87e72b64a=
3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
> -SRC_URI[wasm-bindgen-0.2.87.sha256sum] =3D "7706a72ab36d8cb1f80ffbf0e071=
533974a60d0a308d01a5d0375bf60499a342"
> -SRC_URI[wasm-bindgen-backend-0.2.87.sha256sum] =3D "5ef2b6d3c510e9625e5f=
e6f509ab07d66a760f0885d858736483c32ed7809abd"
> -SRC_URI[wasm-bindgen-macro-0.2.87.sha256sum] =3D "dee495e55982a3bd48105a=
7b947fd2a9b4a8ae3010041b9e0faab3f9cd028f1d"
> -SRC_URI[wasm-bindgen-macro-support-0.2.87.sha256sum] =3D "54681b18a46765=
f095758388f2d0cf16eb8d4169b639ab575a8f5693af210c7b"
> -SRC_URI[wasm-bindgen-shared-0.2.87.sha256sum] =3D "ca6ad05a4870b2bf5fe99=
5117d3728437bd27d7cd5f06f13c17443ef369775a1"
> +SRC_URI[wasm-bindgen-0.2.88.sha256sum] =3D "7daec296f25a1bae309c0cd5c29c=
4b260e510e6d813c286b19eaadf409d40fce"
> +SRC_URI[wasm-bindgen-backend-0.2.88.sha256sum] =3D "e397f4664c0e4e428e83=
13a469aaa58310d302159845980fd23b0f22a847f217"
> +SRC_URI[wasm-bindgen-macro-0.2.88.sha256sum] =3D "5961017b3b08ad5f3fe39f=
1e79877f8ee7c23c5e5fd5eb80de95abc41f1f16b2"
> +SRC_URI[wasm-bindgen-macro-support-0.2.88.sha256sum] =3D "c5353b8dab669f=
5e10f5bd76df26a9360c748f054f862ff5f3f8aae0c7fb3907"
> +SRC_URI[wasm-bindgen-shared-0.2.88.sha256sum] =3D "0d046c5d029ba91a1ed14=
da14dca44b68bf2f124cfbaf741c54151fdb3e0750b"
>  SRC_URI[winapi-0.3.9.sha256sum] =3D "5c839a674fcd7a98952e593242ea400abe9=
3992746761e38641405d28b00f419"
>  SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] =3D "ac3b87c63620426=
dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
>  SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] =3D "712e227841d05=
7c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
> -SRC_URI[windows-0.48.0.sha256sum] =3D "e686886bc078bc1b0b600cac0147aadb8=
15089b6e4da64016cbd754b6342700f"
> +SRC_URI[windows-core-0.51.1.sha256sum] =3D "f1f8cf84f35d2db49a46868f9477=
58c7a1138116f7fac3bc844f43ade1292e64"
>  SRC_URI[windows-sys-0.48.0.sha256sum] =3D "677d2418bec65e3338edb076e806b=
c1ec15693c5d0104683f2efe857f61056a9"
> -SRC_URI[windows-targets-0.48.0.sha256sum] =3D "7b1eb6f0cd7c80c79759c9291=
14ef071b87354ce476d9d94271031c0497adfd5"
> -SRC_URI[windows_aarch64_gnullvm-0.48.0.sha256sum] =3D "91ae572e1b79dba88=
3e0d315474df7305d12f569b400fcf90581b06062f7e1bc"
> -SRC_URI[windows_aarch64_msvc-0.48.0.sha256sum] =3D "b2ef27e0d7bdfcfc7b86=
8b317c1d32c641a6fe4629c171b8928c7b08d98d7cf3"
> -SRC_URI[windows_i686_gnu-0.48.0.sha256sum] =3D "622a1962a7db830d6fd0a696=
83c80a18fda201879f0f447f065a3b7467daa241"
> -SRC_URI[windows_i686_msvc-0.48.0.sha256sum] =3D "4542c6e364ce21bf45d69fd=
d2a8e455fa38d316158cfd43b3ac1c5b1b19f8e00"
> -SRC_URI[windows_x86_64_gnu-0.48.0.sha256sum] =3D "ca2b8a661f7628cbd23440=
e50b05d705db3686f894fc9580820623656af974b1"
> -SRC_URI[windows_x86_64_gnullvm-0.48.0.sha256sum] =3D "7896dbc1f41e08872e=
9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953"
> -SRC_URI[windows_x86_64_msvc-0.48.0.sha256sum] =3D "1a515f5799fe4961cb532=
f983ce2b23082366b898e52ffbce459c86f67c8378a"
> +SRC_URI[windows-targets-0.48.5.sha256sum] =3D "9a2fa6e2155d7247be68c0964=
56083145c183cbbbc2764150dda45a87197940c"
> +SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] =3D "2b38e32f0abccf998=
7a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
> +SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] =3D "dc35310971f3b2dbbf3f=
0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
> +SRC_URI[windows_i686_gnu-0.48.5.sha256sum] =3D "a75915e7def60c94dcef7220=
0b9a8e58e5091744960da64ec734a6c6e9b3743e"
> +SRC_URI[windows_i686_msvc-0.48.5.sha256sum] =3D "8f55c233f70c4b27f66c523=
580f78f1004e8b5a8b659e05a4eb49d4166cca406"
> +SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] =3D "53d40abd2583d23e4718fd=
df1ebec84dbff8381c07cae67ff7768bbf19c6718e"
> +SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] =3D "0b7b52767868a23d5b=
ab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
> +SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] =3D "ed94fce61571a4006852b=
7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
> diff --git a/recipes-containers/aardvark-dns/aardvark-dns_1.7.0.bb b/reci=
pes-containers/aardvark-dns/aardvark-dns_1.9.bb
> similarity index 95%
> rename from recipes-containers/aardvark-dns/aardvark-dns_1.7.0.bb
> rename to recipes-containers/aardvark-dns/aardvark-dns_1.9.bb
> index 56acbc1f..933eef93 100644
> --- a/recipes-containers/aardvark-dns/aardvark-dns_1.7.0.bb
> +++ b/recipes-containers/aardvark-dns/aardvark-dns_1.9.bb
> @@ -4,7 +4,7 @@ HOMEPAGE =3D "https://github.com/containers/aardvark-dns"
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4=
327"
>
> -SRCREV =3D "d27d3b39b519d4a2db3ae322c0d62846772a8624"
> +SRCREV =3D "f1c946c9c936cbd8a693bb5eddceecc6cb07804e"
>
>  # It is possible to fetch the source using the crate fetcher instead:
>  #SRC_URI =3D "crate://crates.io/${BPN}/${PV}"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8499): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8499
> Mute This Topic: https://lists.yoctoproject.org/mt/103107368/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

