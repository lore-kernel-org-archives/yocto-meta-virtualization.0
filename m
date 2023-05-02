Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B189C7EE24
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 20:26:55 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.1431.1683059200075980734
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 02 May 2023 13:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=hscSQs0w;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1683059205;
  x=1714595205;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=CfRik4rQqgTLtlQAcbDEQZ1MmvqF3t/q8EvJ+3P78us=;
  b=hscSQs0wsI+qi4lJXumA9fiY4RF7Ea3Mg6QN1UtNZJJkMAWMsme3opgc
   +4iHj6VDYlxMvns/BhbJ0ZWYvXXl1pED0Za9NfOu4ToAcyNRtprEsoNgr
   +JmnxaDHH5Cx9yma2aU2WWOegT1icxecFOj7BTR8+emsJqtk1lWN824/m
   HyfjCdHjHCcKrLMtWjCJqHrLcS0XbjSpRn/vFNmQaEa/z8sQLuHFXKgvU
   eIu+JfWJKQQXBMix6+jSvX0YW7knKBx/ySdsB7BTC9ZLmjtYURR5Tbq0P
   RQ/v+7W/qTLuwsXTa6Ue9R6MdjYnis5xRJicBZG9LOx9B4AiH+rbCZApr
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCH 5/8] netavark: Move the crate URIs to a separate .inc file
Date: Tue, 2 May 2023 22:26:28 +0200
Message-ID: <20230502202631.2102074-5-pkj@axis.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230502202631.2102074-1-pkj@axis.com>
References: <20230502202631.2102074-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 02 May 2023 20:26:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8021

As a preparation for switching to using the cargo-update-recipe-crates
bbclass to update the crate URIs, move the existing crate URIs to the
netavark-crates.inc file that it expects.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../netavark/netavark-crates.inc              | 180 +++++++++++++++++
 recipes-containers/netavark/netavark_1.2.0.bb | 188 +-----------------
 2 files changed, 182 insertions(+), 186 deletions(-)
 create mode 100644 recipes-containers/netavark/netavark-crates.inc

diff --git a/recipes-containers/netavark/netavark-crates.inc b/recipes-containers/netavark/netavark-crates.inc
new file mode 100644
index 0000000..26c8eec
--- /dev/null
+++ b/recipes-containers/netavark/netavark-crates.inc
@@ -0,0 +1,180 @@
+SRC_URI += " \
+    crate://crates.io/aho-corasick/0.7.18 \
+    crate://crates.io/android_system_properties/0.1.5 \
+    crate://crates.io/anyhow/1.0.65 \
+    crate://crates.io/async-broadcast/0.4.0 \
+    crate://crates.io/async-channel/1.6.1 \
+    crate://crates.io/async-executor/1.4.1 \
+    crate://crates.io/async-io/1.7.0 \
+    crate://crates.io/async-lock/2.5.0 \
+    crate://crates.io/async-recursion/0.3.2 \
+    crate://crates.io/async-task/4.3.0 \
+    crate://crates.io/async-trait/0.1.56 \
+    crate://crates.io/atty/0.2.14 \
+    crate://crates.io/autocfg/1.1.0 \
+    crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/block-buffer/0.10.2 \
+    crate://crates.io/bumpalo/3.10.0 \
+    crate://crates.io/byteorder/1.4.3 \
+    crate://crates.io/bytes/1.1.0 \
+    crate://crates.io/cache-padded/1.2.0 \
+    crate://crates.io/cc/1.0.73 \
+    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/chrono/0.4.22 \
+    crate://crates.io/clap/3.2.8 \
+    crate://crates.io/clap_derive/3.2.7 \
+    crate://crates.io/clap_lex/0.2.4 \
+    crate://crates.io/concurrent-queue/1.2.2 \
+    crate://crates.io/core-foundation-sys/0.8.3 \
+    crate://crates.io/cpufeatures/0.2.2 \
+    crate://crates.io/crypto-common/0.1.5 \
+    crate://crates.io/derivative/2.2.0 \
+    crate://crates.io/digest/0.10.5 \
+    crate://crates.io/dirs-sys/0.3.7 \
+    crate://crates.io/dirs/4.0.0 \
+    crate://crates.io/easy-parallel/3.2.0 \
+    crate://crates.io/enumflags2/0.7.5 \
+    crate://crates.io/enumflags2_derive/0.7.4 \
+    crate://crates.io/env_logger/0.9.1 \
+    crate://crates.io/event-listener/2.5.2 \
+    crate://crates.io/fastrand/1.7.0 \
+    crate://crates.io/form_urlencoded/1.1.0 \
+    crate://crates.io/fs2/0.4.3 \
+    crate://crates.io/futures-channel/0.3.24 \
+    crate://crates.io/futures-core/0.3.24 \
+    crate://crates.io/futures-executor/0.3.24 \
+    crate://crates.io/futures-io/0.3.24 \
+    crate://crates.io/futures-lite/1.12.0 \
+    crate://crates.io/futures-macro/0.3.24 \
+    crate://crates.io/futures-sink/0.3.24 \
+    crate://crates.io/futures-task/0.3.24 \
+    crate://crates.io/futures-util/0.3.24 \
+    crate://crates.io/futures/0.3.24 \
+    crate://crates.io/generic-array/0.14.5 \
+    crate://crates.io/getrandom/0.2.7 \
+    crate://crates.io/hashbrown/0.12.2 \
+    crate://crates.io/heck/0.4.0 \
+    crate://crates.io/hermit-abi/0.1.19 \
+    crate://crates.io/hex/0.4.3 \
+    crate://crates.io/humantime/2.1.0 \
+    crate://crates.io/iana-time-zone/0.1.46 \
+    crate://crates.io/idna/0.3.0 \
+    crate://crates.io/indexmap/1.9.1 \
+    crate://crates.io/instant/0.1.12 \
+    crate://crates.io/ipnet/2.5.0 \
+    crate://crates.io/iptables/0.5.0 \
+    crate://crates.io/itoa/1.0.2 \
+    crate://crates.io/js-sys/0.3.59 \
+    crate://crates.io/lazy_static/1.4.0 \
+    crate://crates.io/libc/0.2.133 \
+    crate://crates.io/lock_api/0.4.7 \
+    crate://crates.io/log/0.4.17 \
+    crate://crates.io/memchr/2.5.0 \
+    crate://crates.io/memoffset/0.6.5 \
+    crate://crates.io/mio/0.8.4 \
+    crate://crates.io/netlink-packet-core/0.4.2 \
+    crate://crates.io/netlink-packet-route/0.13.0 \
+    crate://crates.io/netlink-packet-utils/0.5.1 \
+    crate://crates.io/netlink-proto/0.10.0 \
+    crate://crates.io/netlink-sys/0.8.3 \
+    crate://crates.io/nix/0.23.1 \
+    crate://crates.io/nix/0.24.2 \
+    crate://crates.io/nix/0.25.0 \
+    crate://crates.io/num-integer/0.1.45 \
+    crate://crates.io/num-traits/0.2.15 \
+    crate://crates.io/num_cpus/1.13.1 \
+    crate://crates.io/once_cell/1.13.0 \
+    crate://crates.io/ordered-float/2.10.0 \
+    crate://crates.io/ordered-stream/0.0.1 \
+    crate://crates.io/os_str_bytes/6.1.0 \
+    crate://crates.io/parking/2.0.0 \
+    crate://crates.io/parking_lot/0.11.2 \
+    crate://crates.io/parking_lot/0.12.1 \
+    crate://crates.io/parking_lot_core/0.8.5 \
+    crate://crates.io/parking_lot_core/0.9.3 \
+    crate://crates.io/paste/1.0.7 \
+    crate://crates.io/percent-encoding/2.2.0 \
+    crate://crates.io/pin-project-lite/0.2.9 \
+    crate://crates.io/pin-utils/0.1.0 \
+    crate://crates.io/polling/2.2.0 \
+    crate://crates.io/ppv-lite86/0.2.16 \
+    crate://crates.io/proc-macro-crate/1.1.3 \
+    crate://crates.io/proc-macro-error-attr/1.0.4 \
+    crate://crates.io/proc-macro-error/1.0.4 \
+    crate://crates.io/proc-macro2/1.0.40 \
+    crate://crates.io/quote/1.0.20 \
+    crate://crates.io/rand/0.8.5 \
+    crate://crates.io/rand_chacha/0.3.1 \
+    crate://crates.io/rand_core/0.6.3 \
+    crate://crates.io/redox_syscall/0.2.13 \
+    crate://crates.io/redox_users/0.4.3 \
+    crate://crates.io/regex-syntax/0.6.27 \
+    crate://crates.io/regex/1.6.0 \
+    crate://crates.io/remove_dir_all/0.5.3 \
+    crate://crates.io/rtnetlink/0.11.0 \
+    crate://crates.io/ryu/1.0.10 \
+    crate://crates.io/same-file/1.0.6 \
+    crate://crates.io/scopeguard/1.1.0 \
+    crate://crates.io/serde-value/0.7.0 \
+    crate://crates.io/serde/1.0.144 \
+    crate://crates.io/serde_derive/1.0.144 \
+    crate://crates.io/serde_json/1.0.85 \
+    crate://crates.io/serde_repr/0.1.8 \
+    crate://crates.io/sha1/0.6.1 \
+    crate://crates.io/sha1_smol/1.0.0 \
+    crate://crates.io/sha2/0.10.6 \
+    crate://crates.io/signal-hook-registry/1.4.0 \
+    crate://crates.io/slab/0.4.6 \
+    crate://crates.io/smallvec/1.9.0 \
+    crate://crates.io/socket2/0.4.4 \
+    crate://crates.io/static_assertions/1.1.0 \
+    crate://crates.io/strsim/0.10.0 \
+    crate://crates.io/syn/1.0.98 \
+    crate://crates.io/sysctl/0.5.2 \
+    crate://crates.io/tempfile/3.3.0 \
+    crate://crates.io/termcolor/1.1.3 \
+    crate://crates.io/textwrap/0.15.0 \
+    crate://crates.io/thiserror-impl/1.0.34 \
+    crate://crates.io/thiserror/1.0.34 \
+    crate://crates.io/time/0.1.44 \
+    crate://crates.io/tinyvec/1.6.0 \
+    crate://crates.io/tinyvec_macros/0.1.0 \
+    crate://crates.io/tokio-macros/1.8.0 \
+    crate://crates.io/tokio/1.21.1 \
+    crate://crates.io/toml/0.5.9 \
+    crate://crates.io/tracing-attributes/0.1.22 \
+    crate://crates.io/tracing-core/0.1.28 \
+    crate://crates.io/tracing/0.1.35 \
+    crate://crates.io/typenum/1.15.0 \
+    crate://crates.io/uds_windows/1.0.2 \
+    crate://crates.io/unicode-bidi/0.3.8 \
+    crate://crates.io/unicode-ident/1.0.1 \
+    crate://crates.io/unicode-normalization/0.1.21 \
+    crate://crates.io/url/2.3.1 \
+    crate://crates.io/version_check/0.9.4 \
+    crate://crates.io/waker-fn/1.1.0 \
+    crate://crates.io/walkdir/2.3.2 \
+    crate://crates.io/wasi/0.10.0+wasi-snapshot-preview1 \
+    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
+    crate://crates.io/wasm-bindgen-backend/0.2.82 \
+    crate://crates.io/wasm-bindgen-macro-support/0.2.82 \
+    crate://crates.io/wasm-bindgen-macro/0.2.82 \
+    crate://crates.io/wasm-bindgen-shared/0.2.82 \
+    crate://crates.io/wasm-bindgen/0.2.82 \
+    crate://crates.io/wepoll-ffi/0.1.2 \
+    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
+    crate://crates.io/winapi-util/0.1.5 \
+    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+    crate://crates.io/winapi/0.3.9 \
+    crate://crates.io/windows-sys/0.36.1 \
+    crate://crates.io/windows_aarch64_msvc/0.36.1 \
+    crate://crates.io/windows_i686_gnu/0.36.1 \
+    crate://crates.io/windows_i686_msvc/0.36.1 \
+    crate://crates.io/windows_x86_64_gnu/0.36.1 \
+    crate://crates.io/windows_x86_64_msvc/0.36.1 \
+    crate://crates.io/zbus/2.3.2 \
+    crate://crates.io/zbus_macros/2.3.2 \
+    crate://crates.io/zbus_names/2.1.0 \
+    crate://crates.io/zvariant/3.4.1 \
+    crate://crates.io/zvariant_derive/3.4.1 \
+"
diff --git a/recipes-containers/netavark/netavark_1.2.0.bb b/recipes-containers/netavark/netavark_1.2.0.bb
index 851bf73..8be24c4 100644
--- a/recipes-containers/netavark/netavark_1.2.0.bb
+++ b/recipes-containers/netavark/netavark_1.2.0.bb
@@ -8,196 +8,12 @@ inherit cargo
 # how to get netavark could be as easy as but default to a git checkout:
 # SRC_URI += "crate://crates.io/netavark/1.2.0"
 SRC_URI += "git://github.com/containers/netavark.git;protocol=https;nobranch=1"
+require ${BPN}-crates.inc
+
 SRCREV = "90cccc1c21f26fbc473a201ce3b30d77667c7635"
 S = "${WORKDIR}/git"
 CARGO_SRC_DIR = ""
 
-
-# please note if you have entries that do not begin with crate://
-# you must change them to how that package can be fetched
-SRC_URI += " \
-    crate://crates.io/aho-corasick/0.7.18 \
-    crate://crates.io/android_system_properties/0.1.5 \
-    crate://crates.io/anyhow/1.0.65 \
-    crate://crates.io/async-broadcast/0.4.0 \
-    crate://crates.io/async-channel/1.6.1 \
-    crate://crates.io/async-executor/1.4.1 \
-    crate://crates.io/async-io/1.7.0 \
-    crate://crates.io/async-lock/2.5.0 \
-    crate://crates.io/async-recursion/0.3.2 \
-    crate://crates.io/async-task/4.3.0 \
-    crate://crates.io/async-trait/0.1.56 \
-    crate://crates.io/atty/0.2.14 \
-    crate://crates.io/autocfg/1.1.0 \
-    crate://crates.io/bitflags/1.3.2 \
-    crate://crates.io/block-buffer/0.10.2 \
-    crate://crates.io/bumpalo/3.10.0 \
-    crate://crates.io/byteorder/1.4.3 \
-    crate://crates.io/bytes/1.1.0 \
-    crate://crates.io/cache-padded/1.2.0 \
-    crate://crates.io/cc/1.0.73 \
-    crate://crates.io/cfg-if/1.0.0 \
-    crate://crates.io/chrono/0.4.22 \
-    crate://crates.io/clap/3.2.8 \
-    crate://crates.io/clap_derive/3.2.7 \
-    crate://crates.io/clap_lex/0.2.4 \
-    crate://crates.io/concurrent-queue/1.2.2 \
-    crate://crates.io/core-foundation-sys/0.8.3 \
-    crate://crates.io/cpufeatures/0.2.2 \
-    crate://crates.io/crypto-common/0.1.5 \
-    crate://crates.io/derivative/2.2.0 \
-    crate://crates.io/digest/0.10.5 \
-    crate://crates.io/dirs-sys/0.3.7 \
-    crate://crates.io/dirs/4.0.0 \
-    crate://crates.io/easy-parallel/3.2.0 \
-    crate://crates.io/enumflags2/0.7.5 \
-    crate://crates.io/enumflags2_derive/0.7.4 \
-    crate://crates.io/env_logger/0.9.1 \
-    crate://crates.io/event-listener/2.5.2 \
-    crate://crates.io/fastrand/1.7.0 \
-    crate://crates.io/form_urlencoded/1.1.0 \
-    crate://crates.io/fs2/0.4.3 \
-    crate://crates.io/futures-channel/0.3.24 \
-    crate://crates.io/futures-core/0.3.24 \
-    crate://crates.io/futures-executor/0.3.24 \
-    crate://crates.io/futures-io/0.3.24 \
-    crate://crates.io/futures-lite/1.12.0 \
-    crate://crates.io/futures-macro/0.3.24 \
-    crate://crates.io/futures-sink/0.3.24 \
-    crate://crates.io/futures-task/0.3.24 \
-    crate://crates.io/futures-util/0.3.24 \
-    crate://crates.io/futures/0.3.24 \
-    crate://crates.io/generic-array/0.14.5 \
-    crate://crates.io/getrandom/0.2.7 \
-    crate://crates.io/hashbrown/0.12.2 \
-    crate://crates.io/heck/0.4.0 \
-    crate://crates.io/hermit-abi/0.1.19 \
-    crate://crates.io/hex/0.4.3 \
-    crate://crates.io/humantime/2.1.0 \
-    crate://crates.io/iana-time-zone/0.1.46 \
-    crate://crates.io/idna/0.3.0 \
-    crate://crates.io/indexmap/1.9.1 \
-    crate://crates.io/instant/0.1.12 \
-    crate://crates.io/ipnet/2.5.0 \
-    crate://crates.io/iptables/0.5.0 \
-    crate://crates.io/itoa/1.0.2 \
-    crate://crates.io/js-sys/0.3.59 \
-    crate://crates.io/lazy_static/1.4.0 \
-    crate://crates.io/libc/0.2.133 \
-    crate://crates.io/lock_api/0.4.7 \
-    crate://crates.io/log/0.4.17 \
-    crate://crates.io/memchr/2.5.0 \
-    crate://crates.io/memoffset/0.6.5 \
-    crate://crates.io/mio/0.8.4 \
-    crate://crates.io/netlink-packet-core/0.4.2 \
-    crate://crates.io/netlink-packet-route/0.13.0 \
-    crate://crates.io/netlink-packet-utils/0.5.1 \
-    crate://crates.io/netlink-proto/0.10.0 \
-    crate://crates.io/netlink-sys/0.8.3 \
-    crate://crates.io/nix/0.23.1 \
-    crate://crates.io/nix/0.24.2 \
-    crate://crates.io/nix/0.25.0 \
-    crate://crates.io/num-integer/0.1.45 \
-    crate://crates.io/num-traits/0.2.15 \
-    crate://crates.io/num_cpus/1.13.1 \
-    crate://crates.io/once_cell/1.13.0 \
-    crate://crates.io/ordered-float/2.10.0 \
-    crate://crates.io/ordered-stream/0.0.1 \
-    crate://crates.io/os_str_bytes/6.1.0 \
-    crate://crates.io/parking/2.0.0 \
-    crate://crates.io/parking_lot/0.11.2 \
-    crate://crates.io/parking_lot/0.12.1 \
-    crate://crates.io/parking_lot_core/0.8.5 \
-    crate://crates.io/parking_lot_core/0.9.3 \
-    crate://crates.io/paste/1.0.7 \
-    crate://crates.io/percent-encoding/2.2.0 \
-    crate://crates.io/pin-project-lite/0.2.9 \
-    crate://crates.io/pin-utils/0.1.0 \
-    crate://crates.io/polling/2.2.0 \
-    crate://crates.io/ppv-lite86/0.2.16 \
-    crate://crates.io/proc-macro-crate/1.1.3 \
-    crate://crates.io/proc-macro-error-attr/1.0.4 \
-    crate://crates.io/proc-macro-error/1.0.4 \
-    crate://crates.io/proc-macro2/1.0.40 \
-    crate://crates.io/quote/1.0.20 \
-    crate://crates.io/rand/0.8.5 \
-    crate://crates.io/rand_chacha/0.3.1 \
-    crate://crates.io/rand_core/0.6.3 \
-    crate://crates.io/redox_syscall/0.2.13 \
-    crate://crates.io/redox_users/0.4.3 \
-    crate://crates.io/regex-syntax/0.6.27 \
-    crate://crates.io/regex/1.6.0 \
-    crate://crates.io/remove_dir_all/0.5.3 \
-    crate://crates.io/rtnetlink/0.11.0 \
-    crate://crates.io/ryu/1.0.10 \
-    crate://crates.io/same-file/1.0.6 \
-    crate://crates.io/scopeguard/1.1.0 \
-    crate://crates.io/serde-value/0.7.0 \
-    crate://crates.io/serde/1.0.144 \
-    crate://crates.io/serde_derive/1.0.144 \
-    crate://crates.io/serde_json/1.0.85 \
-    crate://crates.io/serde_repr/0.1.8 \
-    crate://crates.io/sha1/0.6.1 \
-    crate://crates.io/sha1_smol/1.0.0 \
-    crate://crates.io/sha2/0.10.6 \
-    crate://crates.io/signal-hook-registry/1.4.0 \
-    crate://crates.io/slab/0.4.6 \
-    crate://crates.io/smallvec/1.9.0 \
-    crate://crates.io/socket2/0.4.4 \
-    crate://crates.io/static_assertions/1.1.0 \
-    crate://crates.io/strsim/0.10.0 \
-    crate://crates.io/syn/1.0.98 \
-    crate://crates.io/sysctl/0.5.2 \
-    crate://crates.io/tempfile/3.3.0 \
-    crate://crates.io/termcolor/1.1.3 \
-    crate://crates.io/textwrap/0.15.0 \
-    crate://crates.io/thiserror-impl/1.0.34 \
-    crate://crates.io/thiserror/1.0.34 \
-    crate://crates.io/time/0.1.44 \
-    crate://crates.io/tinyvec/1.6.0 \
-    crate://crates.io/tinyvec_macros/0.1.0 \
-    crate://crates.io/tokio-macros/1.8.0 \
-    crate://crates.io/tokio/1.21.1 \
-    crate://crates.io/toml/0.5.9 \
-    crate://crates.io/tracing-attributes/0.1.22 \
-    crate://crates.io/tracing-core/0.1.28 \
-    crate://crates.io/tracing/0.1.35 \
-    crate://crates.io/typenum/1.15.0 \
-    crate://crates.io/uds_windows/1.0.2 \
-    crate://crates.io/unicode-bidi/0.3.8 \
-    crate://crates.io/unicode-ident/1.0.1 \
-    crate://crates.io/unicode-normalization/0.1.21 \
-    crate://crates.io/url/2.3.1 \
-    crate://crates.io/version_check/0.9.4 \
-    crate://crates.io/waker-fn/1.1.0 \
-    crate://crates.io/walkdir/2.3.2 \
-    crate://crates.io/wasi/0.10.0+wasi-snapshot-preview1 \
-    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
-    crate://crates.io/wasm-bindgen-backend/0.2.82 \
-    crate://crates.io/wasm-bindgen-macro-support/0.2.82 \
-    crate://crates.io/wasm-bindgen-macro/0.2.82 \
-    crate://crates.io/wasm-bindgen-shared/0.2.82 \
-    crate://crates.io/wasm-bindgen/0.2.82 \
-    crate://crates.io/wepoll-ffi/0.1.2 \
-    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
-    crate://crates.io/winapi-util/0.1.5 \
-    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
-    crate://crates.io/winapi/0.3.9 \
-    crate://crates.io/windows-sys/0.36.1 \
-    crate://crates.io/windows_aarch64_msvc/0.36.1 \
-    crate://crates.io/windows_i686_gnu/0.36.1 \
-    crate://crates.io/windows_i686_msvc/0.36.1 \
-    crate://crates.io/windows_x86_64_gnu/0.36.1 \
-    crate://crates.io/windows_x86_64_msvc/0.36.1 \
-    crate://crates.io/zbus/2.3.2 \
-    crate://crates.io/zbus_macros/2.3.2 \
-    crate://crates.io/zbus_names/2.1.0 \
-    crate://crates.io/zvariant/3.4.1 \
-    crate://crates.io/zvariant_derive/3.4.1 \
-"
-
-
-
 # FIXME: update generateme with the real MD5 of the license file
 LIC_FILES_CHKSUM = " \
     file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327 \

