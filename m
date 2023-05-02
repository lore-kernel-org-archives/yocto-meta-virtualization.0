Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9784C77B75
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 21:18:25 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.2835.1683062296551378318
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 02 May 2023 14:18:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Wwq4m1N1;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1683062297;
  x=1714598297;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Q5lMYDGRc/FmQRchYGqG90Skrv+j3NxH1oKSqohzXxE=;
  b=Wwq4m1N1nlgCDAtiSTjIK2+aYXDnML7SVJ48lYHr2a11NK9kl6gu7Ruj
   uNRpwP6pTUrPu/N/9ZLUm9Cj9PcIx6JHQaw3rSwO53LmglV/9ICS2hrpo
   Zo6Y+QTUYk+G7m0sCvbN8HcGuZj3uMYbcMvhRKRsXSeISfHwsq9WvltKK
   Qok6PzF60aHkEauppuLG5sAoW6x+Ggi15OUNq98e57v3tXo8IcY3HQ7mm
   NmzlC5i03G123mnCkKfH5iUhdFMuzVDKlqy4BYfCelP7YuS+N7V6GNZB7
   GrrxKInLY1eTHvsYjEqPskIn4leLZh3r9O9ZHaQlosmgBVJBnllDo2Cr9
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [PATCHv2 1/6] aardvark-dns: Move the crate URIs to a separate .inc file
Date: Tue, 2 May 2023 23:18:07 +0200
Message-ID: <20230502211812.2106891-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 02 May 2023 21:18:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8033

As a preparation for switching to using the cargo-update-recipe-crates
bbclass to update the crate URIs, move the existing crate URIs to the
aardvark-dns-crates.inc file that it expects.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../aardvark-dns/aardvark-dns-crates.inc      | 125 ++++++++++++++++
 .../aardvark-dns/aardvark-dns_1.2.0.bb        | 133 +-----------------
 2 files changed, 127 insertions(+), 131 deletions(-)
 create mode 100644 recipes-containers/aardvark-dns/aardvark-dns-crates.inc

diff --git a/recipes-containers/aardvark-dns/aardvark-dns-crates.inc b/recipes-containers/aardvark-dns/aardvark-dns-crates.inc
new file mode 100644
index 0000000..d39c364
--- /dev/null
+++ b/recipes-containers/aardvark-dns/aardvark-dns-crates.inc
@@ -0,0 +1,125 @@
+SRC_URI += " \
+    crate://crates.io/anyhow/1.0.65 \
+    crate://crates.io/async-broadcast/0.4.1 \
+    crate://crates.io/async-trait/0.1.56 \
+    crate://crates.io/atty/0.2.14 \
+    crate://crates.io/autocfg/1.1.0 \
+    crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/bumpalo/3.10.0 \
+    crate://crates.io/bytes/1.1.0 \
+    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/chrono/0.4.20 \
+    crate://crates.io/clap/3.2.22 \
+    crate://crates.io/clap_derive/3.2.18 \
+    crate://crates.io/clap_lex/0.2.4 \
+    crate://crates.io/data-encoding/2.3.2 \
+    crate://crates.io/endian-type/0.1.2 \
+    crate://crates.io/enum-as-inner/0.3.4 \
+    crate://crates.io/enum-as-inner/0.5.1 \
+    crate://crates.io/error-chain/0.12.4 \
+    crate://crates.io/event-listener/2.5.2 \
+    crate://crates.io/form_urlencoded/1.0.1 \
+    crate://crates.io/futures-channel/0.3.21 \
+    crate://crates.io/futures-core/0.3.24 \
+    crate://crates.io/futures-executor/0.3.21 \
+    crate://crates.io/futures-io/0.3.21 \
+    crate://crates.io/futures-macro/0.3.24 \
+    crate://crates.io/futures-task/0.3.24 \
+    crate://crates.io/futures-util/0.3.24 \
+    crate://crates.io/getrandom/0.2.7 \
+    crate://crates.io/hashbrown/0.12.2 \
+    crate://crates.io/heck/0.4.0 \
+    crate://crates.io/hermit-abi/0.1.19 \
+    crate://crates.io/hostname/0.3.1 \
+    crate://crates.io/idna/0.2.3 \
+    crate://crates.io/indexmap/1.9.1 \
+    crate://crates.io/ipnet/2.5.0 \
+    crate://crates.io/itoa/1.0.2 \
+    crate://crates.io/js-sys/0.3.59 \
+    crate://crates.io/lazy_static/1.4.0 \
+    crate://crates.io/libc/0.2.133 \
+    crate://crates.io/lock_api/0.4.7 \
+    crate://crates.io/log/0.4.17 \
+    crate://crates.io/match_cfg/0.1.0 \
+    crate://crates.io/matches/0.1.9 \
+    crate://crates.io/memchr/2.5.0 \
+    crate://crates.io/memoffset/0.6.5 \
+    crate://crates.io/mio/0.8.4 \
+    crate://crates.io/nibble_vec/0.1.0 \
+    crate://crates.io/nix/0.25.0 \
+    crate://crates.io/num-integer/0.1.45 \
+    crate://crates.io/num-traits/0.2.15 \
+    crate://crates.io/num_cpus/1.13.1 \
+    crate://crates.io/num_threads/0.1.6 \
+    crate://crates.io/once_cell/1.13.0 \
+    crate://crates.io/os_str_bytes/6.1.0 \
+    crate://crates.io/parking_lot/0.12.1 \
+    crate://crates.io/parking_lot_core/0.9.3 \
+    crate://crates.io/percent-encoding/2.1.0 \
+    crate://crates.io/pin-project-lite/0.2.9 \
+    crate://crates.io/pin-utils/0.1.0 \
+    crate://crates.io/ppv-lite86/0.2.16 \
+    crate://crates.io/proc-macro-error-attr/1.0.4 \
+    crate://crates.io/proc-macro-error/1.0.4 \
+    crate://crates.io/proc-macro2/1.0.40 \
+    crate://crates.io/quick-error/1.2.3 \
+    crate://crates.io/quote/1.0.20 \
+    crate://crates.io/radix_trie/0.2.1 \
+    crate://crates.io/rand/0.8.5 \
+    crate://crates.io/rand_chacha/0.3.1 \
+    crate://crates.io/rand_core/0.6.3 \
+    crate://crates.io/redox_syscall/0.2.13 \
+    crate://crates.io/resolv-conf/0.7.0 \
+    crate://crates.io/scopeguard/1.1.0 \
+    crate://crates.io/serde/1.0.139 \
+    crate://crates.io/serde_derive/1.0.139 \
+    crate://crates.io/signal-hook-registry/1.4.0 \
+    crate://crates.io/signal-hook/0.3.14 \
+    crate://crates.io/slab/0.4.6 \
+    crate://crates.io/smallvec/1.9.0 \
+    crate://crates.io/socket2/0.4.4 \
+    crate://crates.io/strsim/0.10.0 \
+    crate://crates.io/syn/1.0.98 \
+    crate://crates.io/syslog/6.0.1 \
+    crate://crates.io/termcolor/1.1.3 \
+    crate://crates.io/textwrap/0.15.1 \
+    crate://crates.io/thiserror-impl/1.0.31 \
+    crate://crates.io/thiserror/1.0.31 \
+    crate://crates.io/time/0.1.44 \
+    crate://crates.io/time/0.3.11 \
+    crate://crates.io/tinyvec/1.6.0 \
+    crate://crates.io/tinyvec_macros/0.1.0 \
+    crate://crates.io/tokio-macros/1.8.0 \
+    crate://crates.io/tokio/1.21.1 \
+    crate://crates.io/toml/0.5.9 \
+    crate://crates.io/tracing-attributes/0.1.22 \
+    crate://crates.io/tracing-core/0.1.29 \
+    crate://crates.io/tracing/0.1.36 \
+    crate://crates.io/trust-dns-client/0.20.4 \
+    crate://crates.io/trust-dns-client/0.22.0 \
+    crate://crates.io/trust-dns-proto/0.20.4 \
+    crate://crates.io/trust-dns-proto/0.22.0 \
+    crate://crates.io/trust-dns-server/0.22.0 \
+    crate://crates.io/unicode-bidi/0.3.8 \
+    crate://crates.io/unicode-ident/1.0.1 \
+    crate://crates.io/unicode-normalization/0.1.21 \
+    crate://crates.io/url/2.2.2 \
+    crate://crates.io/version_check/0.9.4 \
+    crate://crates.io/wasi/0.10.0+wasi-snapshot-preview1 \
+    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
+    crate://crates.io/wasm-bindgen-backend/0.2.82 \
+    crate://crates.io/wasm-bindgen-macro-support/0.2.82 \
+    crate://crates.io/wasm-bindgen-macro/0.2.82 \
+    crate://crates.io/wasm-bindgen-shared/0.2.82 \
+    crate://crates.io/wasm-bindgen/0.2.82 \
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
+"
diff --git a/recipes-containers/aardvark-dns/aardvark-dns_1.2.0.bb b/recipes-containers/aardvark-dns/aardvark-dns_1.2.0.bb
index 6fb4a81..ad03869 100644
--- a/recipes-containers/aardvark-dns/aardvark-dns_1.2.0.bb
+++ b/recipes-containers/aardvark-dns/aardvark-dns_1.2.0.bb
@@ -8,141 +8,12 @@ inherit cargo
 # how to get aardvark-dns could be as easy as but default to a git checkout:
 # SRC_URI += "crate://crates.io/aardvark-dns/1.2.0"
 SRC_URI += "git://github.com/containers/aardvark-dns;protocol=https;nobranch=1"
+require ${BPN}-crates.inc
+
 SRCREV = "cb1a462dd8427e33355f6907394a0646f5a26bf2"
 S = "${WORKDIR}/git"
 CARGO_SRC_DIR = ""
 
-
-# please note if you have entries that do not begin with crate://
-# you must change them to how that package can be fetched
-SRC_URI += " \
-    crate://crates.io/anyhow/1.0.65 \
-    crate://crates.io/async-broadcast/0.4.1 \
-    crate://crates.io/async-trait/0.1.56 \
-    crate://crates.io/atty/0.2.14 \
-    crate://crates.io/autocfg/1.1.0 \
-    crate://crates.io/bitflags/1.3.2 \
-    crate://crates.io/bumpalo/3.10.0 \
-    crate://crates.io/bytes/1.1.0 \
-    crate://crates.io/cfg-if/1.0.0 \
-    crate://crates.io/chrono/0.4.20 \
-    crate://crates.io/clap/3.2.22 \
-    crate://crates.io/clap_derive/3.2.18 \
-    crate://crates.io/clap_lex/0.2.4 \
-    crate://crates.io/data-encoding/2.3.2 \
-    crate://crates.io/endian-type/0.1.2 \
-    crate://crates.io/enum-as-inner/0.3.4 \
-    crate://crates.io/enum-as-inner/0.5.1 \
-    crate://crates.io/error-chain/0.12.4 \
-    crate://crates.io/event-listener/2.5.2 \
-    crate://crates.io/form_urlencoded/1.0.1 \
-    crate://crates.io/futures-channel/0.3.21 \
-    crate://crates.io/futures-core/0.3.24 \
-    crate://crates.io/futures-executor/0.3.21 \
-    crate://crates.io/futures-io/0.3.21 \
-    crate://crates.io/futures-macro/0.3.24 \
-    crate://crates.io/futures-task/0.3.24 \
-    crate://crates.io/futures-util/0.3.24 \
-    crate://crates.io/getrandom/0.2.7 \
-    crate://crates.io/hashbrown/0.12.2 \
-    crate://crates.io/heck/0.4.0 \
-    crate://crates.io/hermit-abi/0.1.19 \
-    crate://crates.io/hostname/0.3.1 \
-    crate://crates.io/idna/0.2.3 \
-    crate://crates.io/indexmap/1.9.1 \
-    crate://crates.io/ipnet/2.5.0 \
-    crate://crates.io/itoa/1.0.2 \
-    crate://crates.io/js-sys/0.3.59 \
-    crate://crates.io/lazy_static/1.4.0 \
-    crate://crates.io/libc/0.2.133 \
-    crate://crates.io/lock_api/0.4.7 \
-    crate://crates.io/log/0.4.17 \
-    crate://crates.io/match_cfg/0.1.0 \
-    crate://crates.io/matches/0.1.9 \
-    crate://crates.io/memchr/2.5.0 \
-    crate://crates.io/memoffset/0.6.5 \
-    crate://crates.io/mio/0.8.4 \
-    crate://crates.io/nibble_vec/0.1.0 \
-    crate://crates.io/nix/0.25.0 \
-    crate://crates.io/num-integer/0.1.45 \
-    crate://crates.io/num-traits/0.2.15 \
-    crate://crates.io/num_cpus/1.13.1 \
-    crate://crates.io/num_threads/0.1.6 \
-    crate://crates.io/once_cell/1.13.0 \
-    crate://crates.io/os_str_bytes/6.1.0 \
-    crate://crates.io/parking_lot/0.12.1 \
-    crate://crates.io/parking_lot_core/0.9.3 \
-    crate://crates.io/percent-encoding/2.1.0 \
-    crate://crates.io/pin-project-lite/0.2.9 \
-    crate://crates.io/pin-utils/0.1.0 \
-    crate://crates.io/ppv-lite86/0.2.16 \
-    crate://crates.io/proc-macro-error-attr/1.0.4 \
-    crate://crates.io/proc-macro-error/1.0.4 \
-    crate://crates.io/proc-macro2/1.0.40 \
-    crate://crates.io/quick-error/1.2.3 \
-    crate://crates.io/quote/1.0.20 \
-    crate://crates.io/radix_trie/0.2.1 \
-    crate://crates.io/rand/0.8.5 \
-    crate://crates.io/rand_chacha/0.3.1 \
-    crate://crates.io/rand_core/0.6.3 \
-    crate://crates.io/redox_syscall/0.2.13 \
-    crate://crates.io/resolv-conf/0.7.0 \
-    crate://crates.io/scopeguard/1.1.0 \
-    crate://crates.io/serde/1.0.139 \
-    crate://crates.io/serde_derive/1.0.139 \
-    crate://crates.io/signal-hook-registry/1.4.0 \
-    crate://crates.io/signal-hook/0.3.14 \
-    crate://crates.io/slab/0.4.6 \
-    crate://crates.io/smallvec/1.9.0 \
-    crate://crates.io/socket2/0.4.4 \
-    crate://crates.io/strsim/0.10.0 \
-    crate://crates.io/syn/1.0.98 \
-    crate://crates.io/syslog/6.0.1 \
-    crate://crates.io/termcolor/1.1.3 \
-    crate://crates.io/textwrap/0.15.1 \
-    crate://crates.io/thiserror-impl/1.0.31 \
-    crate://crates.io/thiserror/1.0.31 \
-    crate://crates.io/time/0.1.44 \
-    crate://crates.io/time/0.3.11 \
-    crate://crates.io/tinyvec/1.6.0 \
-    crate://crates.io/tinyvec_macros/0.1.0 \
-    crate://crates.io/tokio-macros/1.8.0 \
-    crate://crates.io/tokio/1.21.1 \
-    crate://crates.io/toml/0.5.9 \
-    crate://crates.io/tracing-attributes/0.1.22 \
-    crate://crates.io/tracing-core/0.1.29 \
-    crate://crates.io/tracing/0.1.36 \
-    crate://crates.io/trust-dns-client/0.20.4 \
-    crate://crates.io/trust-dns-client/0.22.0 \
-    crate://crates.io/trust-dns-proto/0.20.4 \
-    crate://crates.io/trust-dns-proto/0.22.0 \
-    crate://crates.io/trust-dns-server/0.22.0 \
-    crate://crates.io/unicode-bidi/0.3.8 \
-    crate://crates.io/unicode-ident/1.0.1 \
-    crate://crates.io/unicode-normalization/0.1.21 \
-    crate://crates.io/url/2.2.2 \
-    crate://crates.io/version_check/0.9.4 \
-    crate://crates.io/wasi/0.10.0+wasi-snapshot-preview1 \
-    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
-    crate://crates.io/wasm-bindgen-backend/0.2.82 \
-    crate://crates.io/wasm-bindgen-macro-support/0.2.82 \
-    crate://crates.io/wasm-bindgen-macro/0.2.82 \
-    crate://crates.io/wasm-bindgen-shared/0.2.82 \
-    crate://crates.io/wasm-bindgen/0.2.82 \
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
-"
-
-
-
 # FIXME: update generateme with the real MD5 of the license file
 LIC_FILES_CHKSUM = " \
     file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327 \

