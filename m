Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A51C00140
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 12:49:11 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web09.41746.1660826950759956125
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 18 Aug 2022 05:49:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b9k08g+L;
 spf=pass (domain: gmail.com, ip: 209.85.210.43,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id
 v12-20020a9d7d0c000000b00638e210c995so1006616otn.13
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 18 Aug 2022 05:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=+Enn+BTSMKlkjrscqRdBE7eJI/O4sWG8sUvsU7/M0FU=;
        b=b9k08g+LW+RD2XNwXmK3lJmEKMvurG2LknbsJ7W0oKjW9daSi9h2KBKxLI2V+YzMBv
         HrvIbYVvrBKc9ryoWs0743S16rf20bzC7aQQVDi75Dwy0dM6wOwYk2B11vVV7L1YEZ4G
         x7FgIy1h3c70NUxfNlhPd65NBJXaQzCc4wYe/WCfOon4BmHkiAdXyw7+Y/DQiUpLcxAW
         T+ILBEjTEYIozOu4Xw8H3zye47ClMpJYgxL/UIJDgSPYlfC3aw28Y7hXMTLihhCsHxue
         XDjF1x5pxAr6xAiGfHjVSb4HADYAo6n/QAwJ4lWDMzlrXgtVnUAg+zfpVJeY7GPnlhXS
         g9nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=+Enn+BTSMKlkjrscqRdBE7eJI/O4sWG8sUvsU7/M0FU=;
        b=Id/8+jfBARFrT4gAY4jsmVSoja+Xs30wYSSfyo8Eq7bHbM+1DHMboSZ8UaGYbUQkjH
         c8aSAMBYbOieueQzupWx1wyR7LKJ3zLIEEaGyT4K8VuVRmN5N6Y+i1gSk+pspYcfrDUt
         ERnGIwamUxFKJJm2mAmhMIN0yV3i+U6c4m99s8dC3B+ZdpBhLRpMBmzHY0N7Q7KCbjsf
         tUO3wUkxyyw8WPtp8GSNs4JfRZWnPg5TUCcPpamEhp7HunVGeTvDtgtP1wVVg+9svsZB
         7HZvsq9OcziuUwNQrpirTMSE7NFU0IKwmmXF1vNUrPsmd9iBzDrxI5z/9n+oXBymfIo4
         KoNA==
X-Gm-Message-State: ACgBeo2YNi9mPdxw1DrtKTmwt7o3yWKADTc/dcrqxvTKcb67u27Uo4Ac
	2ZaijjSGmQSvuASuXa9ciuDF1TliQrVyrKxMmPY=
X-Google-Smtp-Source: 
 AA6agR63+1+lYjMSuh2IV2AHoYRVc9rrlXvj9GG9vY+qRnVRkfSFX4njjUkBZtThnIcmRAZ9P9fhoCJi2/Rx7Saw7hM=
X-Received: by 2002:a9d:3e47:0:b0:638:e49d:4c9f with SMTP id
 h7-20020a9d3e47000000b00638e49d4c9fmr1057809otg.190.1660826949946; Thu, 18
 Aug 2022 05:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220818094304.1773112-1-pascal.bach@siemens.com>
In-Reply-To: <20220818094304.1773112-1-pascal.bach@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 18 Aug 2022 08:48:58 -0400
Message-ID: 
 <CADkTA4OGNgpUpfaLhk8-AdOXtzGoHt6dSqJQrZfeR0nO_4H-Cw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] netavark: init at 1.1.0
To: Pascal Bach <pascal.bach@siemens.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 18 Aug 2022 12:49:11 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7542

On Thu, Aug 18, 2022 at 5:43 AM Pascal Bach <pascal.bach@siemens.com> wrote:
>
> From: Pascal Bach <pascal.bach@siemens.com>
>
> Netavark is replaces cni for podman.
>

s/is replaces/is a replacement/

Since this can replace CNI, can they co-exist at the same time ? We
should mention that
in the commit message. If they both can't be active on the target at
the same time, then
we should have a RCONFLICTS in the recipe to make sure they aren't
both installed.

Bruce

> The recipe is generated via cargo-bitbake. Modifications are done
> in netavark.inc to allow re-genrating the recipe for future updates.
>
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  recipes-containers/netavark/netavark.inc      |   6 +
>  recipes-containers/netavark/netavark_1.1.0.bb | 203 ++++++++++++++++++
>  2 files changed, 209 insertions(+)
>  create mode 100644 recipes-containers/netavark/netavark.inc
>  create mode 100644 recipes-containers/netavark/netavark_1.1.0.bb
>
> diff --git a/recipes-containers/netavark/netavark.inc b/recipes-containers/netavark/netavark.inc
> new file mode 100644
> index 0000000..4123a2d
> --- /dev/null
> +++ b/recipes-containers/netavark/netavark.inc
> @@ -0,0 +1,6 @@
> +# Cargo installs the binary to bin so move it to where podman expects it
> +do_install:append() {
> +    install -d ${D}${libexecdir}/podman/
> +    mv ${D}${bindir}/* ${D}${libexecdir}/podman/
> +    rm -rf ${D}${bindir}/
> +}
> diff --git a/recipes-containers/netavark/netavark_1.1.0.bb b/recipes-containers/netavark/netavark_1.1.0.bb
> new file mode 100644
> index 0000000..3bbbad5
> --- /dev/null
> +++ b/recipes-containers/netavark/netavark_1.1.0.bb
> @@ -0,0 +1,203 @@
> +# Auto-Generated by cargo-bitbake 0.3.16-alpha.0
> +#
> +inherit cargo
> +
> +# If this is git based prefer versioned ones if they exist
> +# DEFAULT_PREFERENCE = "-1"
> +
> +# how to get netavark could be as easy as but default to a git checkout:
> +# SRC_URI += "crate://crates.io/netavark/1.1.0"
> +SRC_URI += "git://github.com/containers/netavark.git;protocol=https;nobranch=1"
> +SRCREV = "5d2b799537d080a82ed46725705cfcbcb36417f1"
> +S = "${WORKDIR}/git"
> +CARGO_SRC_DIR = ""
> +
> +
> +# please note if you have entries that do not begin with crate://
> +# you must change them to how that package can be fetched
> +SRC_URI += " \
> +    crate://crates.io/aho-corasick/0.7.18 \
> +    crate://crates.io/anyhow/1.0.58 \
> +    crate://crates.io/async-broadcast/0.4.0 \
> +    crate://crates.io/async-channel/1.6.1 \
> +    crate://crates.io/async-executor/1.4.1 \
> +    crate://crates.io/async-io/1.7.0 \
> +    crate://crates.io/async-lock/2.5.0 \
> +    crate://crates.io/async-recursion/0.3.2 \
> +    crate://crates.io/async-task/4.3.0 \
> +    crate://crates.io/async-trait/0.1.56 \
> +    crate://crates.io/atty/0.2.14 \
> +    crate://crates.io/autocfg/1.1.0 \
> +    crate://crates.io/bitflags/1.3.2 \
> +    crate://crates.io/block-buffer/0.10.2 \
> +    crate://crates.io/byteorder/1.4.3 \
> +    crate://crates.io/bytes/1.1.0 \
> +    crate://crates.io/cache-padded/1.2.0 \
> +    crate://crates.io/cc/1.0.73 \
> +    crate://crates.io/cfg-if/1.0.0 \
> +    crate://crates.io/chrono/0.4.19 \
> +    crate://crates.io/clap/3.2.8 \
> +    crate://crates.io/clap_derive/3.2.7 \
> +    crate://crates.io/clap_lex/0.2.4 \
> +    crate://crates.io/concurrent-queue/1.2.2 \
> +    crate://crates.io/cpufeatures/0.2.2 \
> +    crate://crates.io/crypto-common/0.1.5 \
> +    crate://crates.io/derivative/2.2.0 \
> +    crate://crates.io/digest/0.10.3 \
> +    crate://crates.io/dirs-sys/0.3.7 \
> +    crate://crates.io/dirs/4.0.0 \
> +    crate://crates.io/easy-parallel/3.2.0 \
> +    crate://crates.io/enumflags2/0.7.5 \
> +    crate://crates.io/enumflags2_derive/0.7.4 \
> +    crate://crates.io/env_logger/0.9.0 \
> +    crate://crates.io/event-listener/2.5.2 \
> +    crate://crates.io/fastrand/1.7.0 \
> +    crate://crates.io/form_urlencoded/1.0.1 \
> +    crate://crates.io/futures-channel/0.3.21 \
> +    crate://crates.io/futures-core/0.3.21 \
> +    crate://crates.io/futures-executor/0.3.21 \
> +    crate://crates.io/futures-io/0.3.21 \
> +    crate://crates.io/futures-lite/1.12.0 \
> +    crate://crates.io/futures-macro/0.3.21 \
> +    crate://crates.io/futures-sink/0.3.21 \
> +    crate://crates.io/futures-task/0.3.21 \
> +    crate://crates.io/futures-util/0.3.21 \
> +    crate://crates.io/futures/0.3.21 \
> +    crate://crates.io/generic-array/0.14.5 \
> +    crate://crates.io/getrandom/0.2.7 \
> +    crate://crates.io/hashbrown/0.12.2 \
> +    crate://crates.io/heck/0.4.0 \
> +    crate://crates.io/hermit-abi/0.1.19 \
> +    crate://crates.io/hex/0.4.3 \
> +    crate://crates.io/humantime/2.1.0 \
> +    crate://crates.io/idna/0.2.3 \
> +    crate://crates.io/indexmap/1.9.1 \
> +    crate://crates.io/instant/0.1.12 \
> +    crate://crates.io/ipnet/2.5.0 \
> +    crate://crates.io/iptables/0.5.0 \
> +    crate://crates.io/itoa/1.0.2 \
> +    crate://crates.io/lazy_static/1.4.0 \
> +    crate://crates.io/libc/0.2.126 \
> +    crate://crates.io/lock_api/0.4.7 \
> +    crate://crates.io/log/0.4.17 \
> +    crate://crates.io/matches/0.1.9 \
> +    crate://crates.io/memchr/2.5.0 \
> +    crate://crates.io/memoffset/0.6.5 \
> +    crate://crates.io/mio/0.8.4 \
> +    crate://crates.io/netlink-packet-core/0.4.2 \
> +    crate://crates.io/netlink-packet-route/0.13.0 \
> +    crate://crates.io/netlink-packet-utils/0.5.1 \
> +    crate://crates.io/netlink-proto/0.10.0 \
> +    crate://crates.io/netlink-sys/0.8.3 \
> +    crate://crates.io/nix/0.23.1 \
> +    crate://crates.io/nix/0.24.2 \
> +    crate://crates.io/num-integer/0.1.45 \
> +    crate://crates.io/num-traits/0.2.15 \
> +    crate://crates.io/num_cpus/1.13.1 \
> +    crate://crates.io/once_cell/1.13.0 \
> +    crate://crates.io/ordered-float/2.10.0 \
> +    crate://crates.io/ordered-stream/0.0.1 \
> +    crate://crates.io/os_str_bytes/6.1.0 \
> +    crate://crates.io/parking/2.0.0 \
> +    crate://crates.io/parking_lot/0.11.2 \
> +    crate://crates.io/parking_lot/0.12.1 \
> +    crate://crates.io/parking_lot_core/0.8.5 \
> +    crate://crates.io/parking_lot_core/0.9.3 \
> +    crate://crates.io/paste/1.0.7 \
> +    crate://crates.io/percent-encoding/2.1.0 \
> +    crate://crates.io/pin-project-lite/0.2.9 \
> +    crate://crates.io/pin-utils/0.1.0 \
> +    crate://crates.io/polling/2.2.0 \
> +    crate://crates.io/ppv-lite86/0.2.16 \
> +    crate://crates.io/proc-macro-crate/1.1.3 \
> +    crate://crates.io/proc-macro-error-attr/1.0.4 \
> +    crate://crates.io/proc-macro-error/1.0.4 \
> +    crate://crates.io/proc-macro2/1.0.40 \
> +    crate://crates.io/quote/1.0.20 \
> +    crate://crates.io/rand/0.8.5 \
> +    crate://crates.io/rand_chacha/0.3.1 \
> +    crate://crates.io/rand_core/0.6.3 \
> +    crate://crates.io/redox_syscall/0.2.13 \
> +    crate://crates.io/redox_users/0.4.3 \
> +    crate://crates.io/regex-syntax/0.6.27 \
> +    crate://crates.io/regex/1.6.0 \
> +    crate://crates.io/remove_dir_all/0.5.3 \
> +    crate://crates.io/rtnetlink/0.11.0 \
> +    crate://crates.io/ryu/1.0.10 \
> +    crate://crates.io/same-file/1.0.6 \
> +    crate://crates.io/scopeguard/1.1.0 \
> +    crate://crates.io/serde-value/0.7.0 \
> +    crate://crates.io/serde/1.0.140 \
> +    crate://crates.io/serde_derive/1.0.140 \
> +    crate://crates.io/serde_json/1.0.82 \
> +    crate://crates.io/serde_repr/0.1.8 \
> +    crate://crates.io/sha1/0.6.1 \
> +    crate://crates.io/sha1_smol/1.0.0 \
> +    crate://crates.io/sha2/0.10.2 \
> +    crate://crates.io/signal-hook-registry/1.4.0 \
> +    crate://crates.io/slab/0.4.6 \
> +    crate://crates.io/smallvec/1.9.0 \
> +    crate://crates.io/socket2/0.4.4 \
> +    crate://crates.io/static_assertions/1.1.0 \
> +    crate://crates.io/strsim/0.10.0 \
> +    crate://crates.io/syn/1.0.98 \
> +    crate://crates.io/sysctl/0.4.4 \
> +    crate://crates.io/tempfile/3.3.0 \
> +    crate://crates.io/termcolor/1.1.3 \
> +    crate://crates.io/textwrap/0.15.0 \
> +    crate://crates.io/thiserror-impl/1.0.31 \
> +    crate://crates.io/thiserror/1.0.31 \
> +    crate://crates.io/time/0.1.44 \
> +    crate://crates.io/tinyvec/1.6.0 \
> +    crate://crates.io/tinyvec_macros/0.1.0 \
> +    crate://crates.io/tokio-macros/1.8.0 \
> +    crate://crates.io/tokio/1.20.0 \
> +    crate://crates.io/toml/0.5.9 \
> +    crate://crates.io/tracing-attributes/0.1.22 \
> +    crate://crates.io/tracing-core/0.1.28 \
> +    crate://crates.io/tracing/0.1.35 \
> +    crate://crates.io/typenum/1.15.0 \
> +    crate://crates.io/uds_windows/1.0.2 \
> +    crate://crates.io/unicode-bidi/0.3.8 \
> +    crate://crates.io/unicode-ident/1.0.1 \
> +    crate://crates.io/unicode-normalization/0.1.21 \
> +    crate://crates.io/url/2.2.2 \
> +    crate://crates.io/version_check/0.9.4 \
> +    crate://crates.io/waker-fn/1.1.0 \
> +    crate://crates.io/walkdir/2.3.2 \
> +    crate://crates.io/wasi/0.10.0+wasi-snapshot-preview1 \
> +    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
> +    crate://crates.io/wepoll-ffi/0.1.2 \
> +    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
> +    crate://crates.io/winapi-util/0.1.5 \
> +    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
> +    crate://crates.io/winapi/0.3.9 \
> +    crate://crates.io/windows-sys/0.36.1 \
> +    crate://crates.io/windows_aarch64_msvc/0.36.1 \
> +    crate://crates.io/windows_i686_gnu/0.36.1 \
> +    crate://crates.io/windows_i686_msvc/0.36.1 \
> +    crate://crates.io/windows_x86_64_gnu/0.36.1 \
> +    crate://crates.io/windows_x86_64_msvc/0.36.1 \
> +    crate://crates.io/zbus/2.3.2 \
> +    crate://crates.io/zbus_macros/2.3.2 \
> +    crate://crates.io/zbus_names/2.1.0 \
> +    crate://crates.io/zvariant/3.4.1 \
> +    crate://crates.io/zvariant_derive/3.4.1 \
> +"
> +
> +
> +
> +# FIXME: update generateme with the real MD5 of the license file
> +LIC_FILES_CHKSUM = " \
> +    file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327 \
> +"
> +
> +SUMMARY = "A container network stack"
> +HOMEPAGE = "https://github.com/containers/netavark"
> +LICENSE = "Apache-2.0"
> +
> +# includes this file if it exists but does not fail
> +# this is useful for anything you may want to override from
> +# what cargo-bitbake generates.
> +include netavark-${PV}.inc
> +include netavark.inc
> --
> 2.37.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7541): https://lists.yoctoproject.org/g/meta-virtualization/message/7541
> Mute This Topic: https://lists.yoctoproject.org/mt/93100051/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

