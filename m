Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 587FEF483E1
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 18:12:47 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1506.1774289488681434666
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 23 Mar 2026 11:11:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=TX5WyvcJ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20260323181131359491bf2400020784-lpaxns@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260323181131359491bf2400020784
        for <meta-virtualization@lists.yoctoproject.org>;
        Mon, 23 Mar 2026 19:11:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=46The2NOKwoy0g785ta3cFusUm+yl/grb+kMkNGyddo=;
 b=TX5WyvcJVFJET4YFuZpSHEhCGpYN3doq8uJOMEATY8y1woP9jPC5OiRDwj7zngnuqjAn+b
 K9UmgrRNs3hmz7vWc+ZktQziAXmAd5AHtzdWCTsuvUbtLQsDGEJ2tNS3mL4xeRKRgZNKxa4k
 ARJb0xwj4LT0oPclnk/UM+PnxcL9/60Q+rmPEMBKGs1I+513gpqoG2QRKfeLgwO7o2TdPXOJ
 ZNaSPb0mejzcb9Cb5ra0NOMy2ICwvtJdFLdZG4I9n9nDdi0QHL5LPGslfq1TY1mwMg/lFbw7
 beB6xN1tCVoqlRA9A+XVj2XF+Wbi6YPrTDt34vX0vSvj+4Y3ui8LqRWg==;
From: Peter Marko <peter.marko@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 2/2] aardvark-dns: upgrade 1.16.0 -> 1.17.0
Date: Mon, 23 Mar 2026 19:11:03 +0100
Message-Id: <20260323181103.10030-2-peter.marko@siemens.com>
In-Reply-To: <20260323181103.10030-1-peter.marko@siemens.com>
References: <20260323181103.10030-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Mar 2026 18:12:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9673

From: Peter Marko <peter.marko@siemens.com>

$ git log --oneline --no-merges 513be8b5e111d46192f01a9739348eabf4a61797..2158073ba56807fb1a7731899712a54603c3d150
2158073 (tag: v1.17.0) release v1.17.0
8e8db13 release notes for v1.17.0
809f652 update MSRV to 1.86
188db02 run cargo update
aace910 fix download artifact action
728a48c [skip-ci] Update GitHub Artifact Actions
14aede7 fix(deps): update rust crate clap to ~4.5.51
b0a32c0 rotate key of imgt for meta_task
83f6934 rotate aws creds
e760751 fix(deps): update rust crate tokio to 1.48.0
91421f4 fix(deps): update rust crate clap to ~4.5.48
60cf016 fix(deps): update rust crate libc to 0.2.177
b2ff8a8 Update nameservers when resolv.conf is modified.
7a5c566 chore(deps): update rust crate chrono to 0.4.42
2c95552 fix(deps): update rust crate log to 0.4.28
32deed9 update CI images
071143f rpm: tests require socat instead of ncat now
50d7366 test: replace ncat with socat
e42b343 Packit: fetch copr rpm version from Cargo.toml
1c25e4f bump to v1.17.0-dev
56db1e0 (tag: v1.16.0) release v1.16.0
2cdc994 release notes for v1.16.0
0c392ba [skip-ci] Update actions/checkout action to v5
5d34b0f fix(deps): update rust crate libc to 0.2.175
254c6d1 test: Remove empty user= directive in dnsmasq.conf to avoid SIGSEGV
b8a6c4c [skip-ci] Update actions/download-artifact action to v5
52cf09a fix(deps): update rust crate tokio to 1.47.1
ef89561 fix(deps): update rust crate tokio to 1.47.0
83b2433 coredns: fix typo in debug message
cdcaf7c coredns: process more than one message per tcp connection
5061851 fix(deps): update rust crate tokio to 1.46.1
fece9be fix(deps): update rust crate tokio to 1.46.0
57e60fa fix new rust 1.88 lint errors
7706847 fix(deps): update rust crate clap to ~4.5.40

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../aardvark-dns/aardvark-dns-crates.inc      | 458 +++++++++---------
 ...k-dns_1.16.0.bb => aardvark-dns_1.17.0.bb} |   4 +-
 .../aardvark-dns/files/run-ptest              |   2 +
 3 files changed, 240 insertions(+), 224 deletions(-)
 rename recipes-containers/aardvark-dns/{aardvark-dns_1.16.0.bb => aardvark-dns_1.17.0.bb} (92%)

diff --git a/recipes-containers/aardvark-dns/aardvark-dns-crates.inc b/recipes-containers/aardvark-dns/aardvark-dns-crates.inc
index 34a04278..749f8ecb 100644
--- a/recipes-containers/aardvark-dns/aardvark-dns-crates.inc
+++ b/recipes-containers/aardvark-dns/aardvark-dns-crates.inc
@@ -2,339 +2,353 @@
 
 # from Cargo.lock
 SRC_URI += " \
-    crate://crates.io/addr2line/0.24.2 \
-    crate://crates.io/adler2/2.0.0 \
-    crate://crates.io/android-tzdata/0.1.1 \
     crate://crates.io/android_system_properties/0.1.5 \
-    crate://crates.io/anstream/0.6.18 \
-    crate://crates.io/anstyle/1.0.10 \
-    crate://crates.io/anstyle-parse/0.2.6 \
-    crate://crates.io/anstyle-query/1.1.2 \
-    crate://crates.io/anstyle-wincon/3.0.7 \
+    crate://crates.io/anstream/0.6.21 \
+    crate://crates.io/anstyle/1.0.13 \
+    crate://crates.io/anstyle-parse/0.2.7 \
+    crate://crates.io/anstyle-query/1.1.4 \
+    crate://crates.io/anstyle-wincon/3.0.10 \
     crate://crates.io/arc-swap/1.7.1 \
-    crate://crates.io/async-trait/0.1.86 \
-    crate://crates.io/autocfg/1.4.0 \
-    crate://crates.io/backtrace/0.3.74 \
-    crate://crates.io/bitflags/2.8.0 \
-    crate://crates.io/bumpalo/3.17.0 \
-    crate://crates.io/byteorder/1.5.0 \
-    crate://crates.io/bytes/1.10.0 \
-    crate://crates.io/cc/1.2.12 \
-    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/async-trait/0.1.89 \
+    crate://crates.io/autocfg/1.5.0 \
+    crate://crates.io/bitflags/2.10.0 \
+    crate://crates.io/bumpalo/3.19.0 \
+    crate://crates.io/bytes/1.10.1 \
+    crate://crates.io/cc/1.2.44 \
+    crate://crates.io/cfg-if/1.0.4 \
     crate://crates.io/cfg_aliases/0.2.1 \
-    crate://crates.io/chrono/0.4.41 \
-    crate://crates.io/clap/4.5.39 \
-    crate://crates.io/clap_builder/4.5.39 \
-    crate://crates.io/clap_derive/4.5.32 \
-    crate://crates.io/clap_lex/0.7.4 \
-    crate://crates.io/colorchoice/1.0.3 \
+    crate://crates.io/chrono/0.4.42 \
+    crate://crates.io/clap/4.5.51 \
+    crate://crates.io/clap_builder/4.5.51 \
+    crate://crates.io/clap_derive/4.5.49 \
+    crate://crates.io/clap_lex/0.7.6 \
+    crate://crates.io/colorchoice/1.0.4 \
     crate://crates.io/core-foundation-sys/0.8.7 \
     crate://crates.io/critical-section/1.2.0 \
-    crate://crates.io/data-encoding/2.7.0 \
-    crate://crates.io/deranged/0.3.11 \
+    crate://crates.io/data-encoding/2.9.0 \
+    crate://crates.io/deranged/0.5.5 \
     crate://crates.io/displaydoc/0.2.5 \
     crate://crates.io/endian-type/0.1.2 \
     crate://crates.io/enum-as-inner/0.6.1 \
+    crate://crates.io/find-msvc-tools/0.1.4 \
     crate://crates.io/flume/0.11.1 \
-    crate://crates.io/form_urlencoded/1.2.1 \
+    crate://crates.io/form_urlencoded/1.2.2 \
+    crate://crates.io/futures/0.3.31 \
     crate://crates.io/futures-channel/0.3.31 \
     crate://crates.io/futures-core/0.3.31 \
+    crate://crates.io/futures-executor/0.3.31 \
     crate://crates.io/futures-io/0.3.31 \
+    crate://crates.io/futures-macro/0.3.31 \
     crate://crates.io/futures-sink/0.3.31 \
     crate://crates.io/futures-task/0.3.31 \
     crate://crates.io/futures-util/0.3.31 \
-    crate://crates.io/getrandom/0.2.15 \
-    crate://crates.io/getrandom/0.3.2 \
-    crate://crates.io/gimli/0.31.1 \
+    crate://crates.io/getrandom/0.2.16 \
+    crate://crates.io/getrandom/0.3.4 \
     crate://crates.io/heck/0.5.0 \
     crate://crates.io/hickory-client/0.25.2 \
     crate://crates.io/hickory-proto/0.25.2 \
     crate://crates.io/hickory-server/0.25.2 \
-    crate://crates.io/hostname/0.4.0 \
-    crate://crates.io/iana-time-zone/0.1.61 \
+    crate://crates.io/hostname/0.4.1 \
+    crate://crates.io/iana-time-zone/0.1.64 \
     crate://crates.io/iana-time-zone-haiku/0.1.2 \
-    crate://crates.io/icu_collections/1.5.0 \
-    crate://crates.io/icu_locid/1.5.0 \
-    crate://crates.io/icu_locid_transform/1.5.0 \
-    crate://crates.io/icu_locid_transform_data/1.5.0 \
-    crate://crates.io/icu_normalizer/1.5.0 \
-    crate://crates.io/icu_normalizer_data/1.5.0 \
-    crate://crates.io/icu_properties/1.5.1 \
-    crate://crates.io/icu_properties_data/1.5.0 \
-    crate://crates.io/icu_provider/1.5.0 \
-    crate://crates.io/icu_provider_macros/1.5.0 \
-    crate://crates.io/idna/1.0.3 \
-    crate://crates.io/idna_adapter/1.2.0 \
+    crate://crates.io/icu_collections/2.1.1 \
+    crate://crates.io/icu_locale_core/2.1.1 \
+    crate://crates.io/icu_normalizer/2.1.1 \
+    crate://crates.io/icu_normalizer_data/2.1.1 \
+    crate://crates.io/icu_properties/2.1.1 \
+    crate://crates.io/icu_properties_data/2.1.1 \
+    crate://crates.io/icu_provider/2.1.1 \
+    crate://crates.io/idna/1.1.0 \
+    crate://crates.io/idna_adapter/1.2.1 \
+    crate://crates.io/inotify/0.11.0 \
+    crate://crates.io/inotify-sys/0.1.5 \
     crate://crates.io/ipnet/2.11.0 \
-    crate://crates.io/is_terminal_polyfill/1.70.1 \
-    crate://crates.io/itoa/1.0.14 \
-    crate://crates.io/js-sys/0.3.77 \
-    crate://crates.io/libc/0.2.174 \
-    crate://crates.io/litemap/0.7.4 \
-    crate://crates.io/lock_api/0.4.12 \
-    crate://crates.io/log/0.4.27 \
-    crate://crates.io/memchr/2.7.4 \
+    crate://crates.io/is_terminal_polyfill/1.70.2 \
+    crate://crates.io/itoa/1.0.15 \
+    crate://crates.io/js-sys/0.3.82 \
+    crate://crates.io/libc/0.2.177 \
+    crate://crates.io/litemap/0.8.1 \
+    crate://crates.io/lock_api/0.4.14 \
+    crate://crates.io/log/0.4.28 \
+    crate://crates.io/memchr/2.7.6 \
     crate://crates.io/memoffset/0.9.1 \
-    crate://crates.io/miniz_oxide/0.8.3 \
-    crate://crates.io/mio/1.0.3 \
+    crate://crates.io/mio/1.1.0 \
     crate://crates.io/nanorand/0.7.0 \
     crate://crates.io/nibble_vec/0.1.0 \
     crate://crates.io/nix/0.30.1 \
     crate://crates.io/num-conv/0.1.0 \
     crate://crates.io/num-traits/0.2.19 \
     crate://crates.io/num_threads/0.1.7 \
-    crate://crates.io/object/0.36.7 \
-    crate://crates.io/once_cell/1.20.3 \
-    crate://crates.io/percent-encoding/2.3.1 \
+    crate://crates.io/once_cell/1.21.3 \
+    crate://crates.io/once_cell_polyfill/1.70.2 \
+    crate://crates.io/percent-encoding/2.3.2 \
     crate://crates.io/pin-project-lite/0.2.16 \
     crate://crates.io/pin-utils/0.1.0 \
-    crate://crates.io/portable-atomic/1.11.0 \
+    crate://crates.io/portable-atomic/1.11.1 \
+    crate://crates.io/potential_utf/0.1.4 \
     crate://crates.io/powerfmt/0.2.0 \
-    crate://crates.io/ppv-lite86/0.2.20 \
+    crate://crates.io/ppv-lite86/0.2.21 \
     crate://crates.io/prefix-trie/0.7.0 \
-    crate://crates.io/proc-macro2/1.0.93 \
-    crate://crates.io/quote/1.0.38 \
-    crate://crates.io/r-efi/5.2.0 \
+    crate://crates.io/proc-macro2/1.0.103 \
+    crate://crates.io/quote/1.0.41 \
+    crate://crates.io/r-efi/5.3.0 \
     crate://crates.io/radix_trie/0.2.1 \
-    crate://crates.io/rand/0.9.0 \
+    crate://crates.io/rand/0.9.2 \
     crate://crates.io/rand_chacha/0.9.0 \
     crate://crates.io/rand_core/0.9.3 \
     crate://crates.io/ring/0.17.14 \
-    crate://crates.io/rustc-demangle/0.1.24 \
-    crate://crates.io/rustversion/1.0.19 \
+    crate://crates.io/rustversion/1.0.22 \
     crate://crates.io/scopeguard/1.2.0 \
-    crate://crates.io/serde/1.0.217 \
-    crate://crates.io/serde_derive/1.0.217 \
+    crate://crates.io/serde/1.0.228 \
+    crate://crates.io/serde_core/1.0.228 \
+    crate://crates.io/serde_derive/1.0.228 \
     crate://crates.io/shlex/1.3.0 \
-    crate://crates.io/signal-hook-registry/1.4.2 \
-    crate://crates.io/slab/0.4.9 \
-    crate://crates.io/smallvec/1.13.2 \
-    crate://crates.io/socket2/0.5.8 \
+    crate://crates.io/signal-hook-registry/1.4.6 \
+    crate://crates.io/slab/0.4.11 \
+    crate://crates.io/smallvec/1.15.1 \
+    crate://crates.io/socket2/0.6.1 \
     crate://crates.io/spin/0.9.8 \
-    crate://crates.io/stable_deref_trait/1.2.0 \
+    crate://crates.io/stable_deref_trait/1.2.1 \
     crate://crates.io/strsim/0.11.1 \
-    crate://crates.io/syn/2.0.98 \
-    crate://crates.io/synstructure/0.13.1 \
+    crate://crates.io/syn/2.0.108 \
+    crate://crates.io/synstructure/0.13.2 \
     crate://crates.io/syslog/7.0.0 \
-    crate://crates.io/thiserror/2.0.12 \
-    crate://crates.io/thiserror-impl/2.0.12 \
-    crate://crates.io/time/0.3.37 \
-    crate://crates.io/time-core/0.1.2 \
-    crate://crates.io/time-macros/0.2.19 \
-    crate://crates.io/tinystr/0.7.6 \
-    crate://crates.io/tinyvec/1.8.1 \
+    crate://crates.io/thiserror/2.0.17 \
+    crate://crates.io/thiserror-impl/2.0.17 \
+    crate://crates.io/time/0.3.44 \
+    crate://crates.io/time-core/0.1.6 \
+    crate://crates.io/time-macros/0.2.24 \
+    crate://crates.io/tinystr/0.8.2 \
+    crate://crates.io/tinyvec/1.10.0 \
     crate://crates.io/tinyvec_macros/0.1.1 \
-    crate://crates.io/tokio/1.45.1 \
-    crate://crates.io/tokio-macros/2.5.0 \
-    crate://crates.io/tokio-util/0.7.13 \
+    crate://crates.io/tokio/1.48.0 \
+    crate://crates.io/tokio-macros/2.6.0 \
+    crate://crates.io/tokio-util/0.7.17 \
     crate://crates.io/tracing/0.1.41 \
-    crate://crates.io/tracing-core/0.1.33 \
-    crate://crates.io/unicode-ident/1.0.16 \
+    crate://crates.io/tracing-core/0.1.34 \
+    crate://crates.io/unicode-ident/1.0.22 \
     crate://crates.io/untrusted/0.9.0 \
-    crate://crates.io/url/2.5.4 \
-    crate://crates.io/utf16_iter/1.0.5 \
+    crate://crates.io/url/2.5.7 \
     crate://crates.io/utf8_iter/1.0.4 \
     crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
-    crate://crates.io/wasi/0.14.2+wasi-0.2.4 \
-    crate://crates.io/wasm-bindgen/0.2.100 \
-    crate://crates.io/wasm-bindgen-backend/0.2.100 \
-    crate://crates.io/wasm-bindgen-macro/0.2.100 \
-    crate://crates.io/wasm-bindgen-macro-support/0.2.100 \
-    crate://crates.io/wasm-bindgen-shared/0.2.100 \
-    crate://crates.io/windows/0.52.0 \
-    crate://crates.io/windows-core/0.52.0 \
-    crate://crates.io/windows-link/0.1.0 \
+    crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
+    crate://crates.io/wasip2/1.0.1+wasi-0.2.4 \
+    crate://crates.io/wasm-bindgen/0.2.105 \
+    crate://crates.io/wasm-bindgen-macro/0.2.105 \
+    crate://crates.io/wasm-bindgen-macro-support/0.2.105 \
+    crate://crates.io/wasm-bindgen-shared/0.2.105 \
+    crate://crates.io/windows-core/0.62.2 \
+    crate://crates.io/windows-implement/0.60.2 \
+    crate://crates.io/windows-interface/0.59.3 \
+    crate://crates.io/windows-link/0.1.3 \
+    crate://crates.io/windows-link/0.2.1 \
+    crate://crates.io/windows-result/0.4.1 \
+    crate://crates.io/windows-strings/0.5.1 \
     crate://crates.io/windows-sys/0.52.0 \
-    crate://crates.io/windows-sys/0.59.0 \
+    crate://crates.io/windows-sys/0.60.2 \
+    crate://crates.io/windows-sys/0.61.2 \
     crate://crates.io/windows-targets/0.52.6 \
+    crate://crates.io/windows-targets/0.53.5 \
     crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
+    crate://crates.io/windows_aarch64_gnullvm/0.53.1 \
     crate://crates.io/windows_aarch64_msvc/0.52.6 \
+    crate://crates.io/windows_aarch64_msvc/0.53.1 \
     crate://crates.io/windows_i686_gnu/0.52.6 \
+    crate://crates.io/windows_i686_gnu/0.53.1 \
     crate://crates.io/windows_i686_gnullvm/0.52.6 \
+    crate://crates.io/windows_i686_gnullvm/0.53.1 \
     crate://crates.io/windows_i686_msvc/0.52.6 \
+    crate://crates.io/windows_i686_msvc/0.53.1 \
     crate://crates.io/windows_x86_64_gnu/0.52.6 \
+    crate://crates.io/windows_x86_64_gnu/0.53.1 \
     crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
+    crate://crates.io/windows_x86_64_gnullvm/0.53.1 \
     crate://crates.io/windows_x86_64_msvc/0.52.6 \
-    crate://crates.io/wit-bindgen-rt/0.39.0 \
-    crate://crates.io/write16/1.0.0 \
-    crate://crates.io/writeable/0.5.5 \
-    crate://crates.io/yoke/0.7.5 \
-    crate://crates.io/yoke-derive/0.7.5 \
-    crate://crates.io/zerocopy/0.7.35 \
-    crate://crates.io/zerocopy/0.8.24 \
-    crate://crates.io/zerocopy-derive/0.7.35 \
-    crate://crates.io/zerocopy-derive/0.8.24 \
-    crate://crates.io/zerofrom/0.1.5 \
-    crate://crates.io/zerofrom-derive/0.1.5 \
-    crate://crates.io/zerovec/0.10.4 \
-    crate://crates.io/zerovec-derive/0.10.3 \
+    crate://crates.io/windows_x86_64_msvc/0.53.1 \
+    crate://crates.io/wit-bindgen/0.46.0 \
+    crate://crates.io/writeable/0.6.2 \
+    crate://crates.io/yoke/0.8.1 \
+    crate://crates.io/yoke-derive/0.8.1 \
+    crate://crates.io/zerocopy/0.8.27 \
+    crate://crates.io/zerocopy-derive/0.8.27 \
+    crate://crates.io/zerofrom/0.1.6 \
+    crate://crates.io/zerofrom-derive/0.1.6 \
+    crate://crates.io/zerotrie/0.2.3 \
+    crate://crates.io/zerovec/0.11.5 \
+    crate://crates.io/zerovec-derive/0.11.2 \
 "
 
-SRC_URI[addr2line-0.24.2.sha256sum] = "dfbe277e56a376000877090da837660b4427aad530e3028d44e0bffe4f89a1c1"
-SRC_URI[adler2-2.0.0.sha256sum] = "512761e0bb2578dd7380c6baaa0f4ce03e84f95e960231d1dec8bf4d7d6e2627"
-SRC_URI[android-tzdata-0.1.1.sha256sum] = "e999941b234f3131b00bc13c22d06e8c5ff726d1b6318ac7eb276997bbb4fef0"
 SRC_URI[android_system_properties-0.1.5.sha256sum] = "819e7219dbd41043ac279b19830f2efc897156490d7fd6ea916720117ee66311"
-SRC_URI[anstream-0.6.18.sha256sum] = "8acc5369981196006228e28809f761875c0327210a891e941f4c683b3a99529b"
-SRC_URI[anstyle-1.0.10.sha256sum] = "55cc3b69f167a1ef2e161439aa98aed94e6028e5f9a59be9a6ffb47aef1651f9"
-SRC_URI[anstyle-parse-0.2.6.sha256sum] = "3b2d16507662817a6a20a9ea92df6652ee4f94f914589377d69f3b21bc5798a9"
-SRC_URI[anstyle-query-1.1.2.sha256sum] = "79947af37f4177cfead1110013d678905c37501914fba0efea834c3fe9a8d60c"
-SRC_URI[anstyle-wincon-3.0.7.sha256sum] = "ca3534e77181a9cc07539ad51f2141fe32f6c3ffd4df76db8ad92346b003ae4e"
+SRC_URI[anstream-0.6.21.sha256sum] = "43d5b281e737544384e969a5ccad3f1cdd24b48086a0fc1b2a5262a26b8f4f4a"
+SRC_URI[anstyle-1.0.13.sha256sum] = "5192cca8006f1fd4f7237516f40fa183bb07f8fbdfedaa0036de5ea9b0b45e78"
+SRC_URI[anstyle-parse-0.2.7.sha256sum] = "4e7644824f0aa2c7b9384579234ef10eb7efb6a0deb83f9630a49594dd9c15c2"
+SRC_URI[anstyle-query-1.1.4.sha256sum] = "9e231f6134f61b71076a3eab506c379d4f36122f2af15a9ff04415ea4c3339e2"
+SRC_URI[anstyle-wincon-3.0.10.sha256sum] = "3e0633414522a32ffaac8ac6cc8f748e090c5717661fddeea04219e2344f5f2a"
 SRC_URI[arc-swap-1.7.1.sha256sum] = "69f7f8c3906b62b754cd5326047894316021dcfe5a194c8ea52bdd94934a3457"
-SRC_URI[async-trait-0.1.86.sha256sum] = "644dd749086bf3771a2fbc5f256fdb982d53f011c7d5d560304eafeecebce79d"
-SRC_URI[autocfg-1.4.0.sha256sum] = "ace50bade8e6234aa140d9a2f552bbee1db4d353f69b8217bc503490fc1a9f26"
-SRC_URI[backtrace-0.3.74.sha256sum] = "8d82cb332cdfaed17ae235a638438ac4d4839913cc2af585c3c6746e8f8bee1a"
-SRC_URI[bitflags-2.8.0.sha256sum] = "8f68f53c83ab957f72c32642f3868eec03eb974d1fb82e453128456482613d36"
-SRC_URI[bumpalo-3.17.0.sha256sum] = "1628fb46dfa0b37568d12e5edd512553eccf6a22a78e8bde00bb4aed84d5bdbf"
-SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
-SRC_URI[bytes-1.10.0.sha256sum] = "f61dac84819c6588b558454b194026eb1f09c293b9036ae9b159e74e73ab6cf9"
-SRC_URI[cc-1.2.12.sha256sum] = "755717a7de9ec452bf7f3f1a3099085deabd7f2962b861dae91ecd7a365903d2"
-SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
+SRC_URI[async-trait-0.1.89.sha256sum] = "9035ad2d096bed7955a320ee7e2230574d28fd3c3a0f186cbea1ff3c7eed5dbb"
+SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
+SRC_URI[bitflags-2.10.0.sha256sum] = "812e12b5285cc515a9c72a5c1d3b6d46a19dac5acfef5265968c166106e31dd3"
+SRC_URI[bumpalo-3.19.0.sha256sum] = "46c5e41b57b8bba42a04676d81cb89e9ee8e859a1a66f80a5a72e1cb76b34d43"
+SRC_URI[bytes-1.10.1.sha256sum] = "d71b6127be86fdcfddb610f7182ac57211d4b18a3e9c82eb2d17662f2227ad6a"
+SRC_URI[cc-1.2.44.sha256sum] = "37521ac7aabe3d13122dc382493e20c9416f299d2ccd5b3a5340a2570cdeb0f3"
+SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
 SRC_URI[cfg_aliases-0.2.1.sha256sum] = "613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724"
-SRC_URI[chrono-0.4.41.sha256sum] = "c469d952047f47f91b68d1cba3f10d63c11d73e4636f24f08daf0278abf01c4d"
-SRC_URI[clap-4.5.39.sha256sum] = "fd60e63e9be68e5fb56422e397cf9baddded06dae1d2e523401542383bc72a9f"
-SRC_URI[clap_builder-4.5.39.sha256sum] = "89cc6392a1f72bbeb820d71f32108f61fdaf18bc526e1d23954168a67759ef51"
-SRC_URI[clap_derive-4.5.32.sha256sum] = "09176aae279615badda0765c0c0b3f6ed53f4709118af73cf4655d85d1530cd7"
-SRC_URI[clap_lex-0.7.4.sha256sum] = "f46ad14479a25103f283c0f10005961cf086d8dc42205bb44c46ac563475dca6"
-SRC_URI[colorchoice-1.0.3.sha256sum] = "5b63caa9aa9397e2d9480a9b13673856c78d8ac123288526c37d7839f2a86990"
+SRC_URI[chrono-0.4.42.sha256sum] = "145052bdd345b87320e369255277e3fb5152762ad123a901ef5c262dd38fe8d2"
+SRC_URI[clap-4.5.51.sha256sum] = "4c26d721170e0295f191a69bd9a1f93efcdb0aff38684b61ab5750468972e5f5"
+SRC_URI[clap_builder-4.5.51.sha256sum] = "75835f0c7bf681bfd05abe44e965760fea999a5286c6eb2d59883634fd02011a"
+SRC_URI[clap_derive-4.5.49.sha256sum] = "2a0b5487afeab2deb2ff4e03a807ad1a03ac532ff5a2cee5d86884440c7f7671"
+SRC_URI[clap_lex-0.7.6.sha256sum] = "a1d728cc89cf3aee9ff92b05e62b19ee65a02b5702cff7d5a377e32c6ae29d8d"
+SRC_URI[colorchoice-1.0.4.sha256sum] = "b05b61dc5112cbb17e4b6cd61790d9845d13888356391624cbe7e41efeac1e75"
 SRC_URI[core-foundation-sys-0.8.7.sha256sum] = "773648b94d0e5d620f64f280777445740e61fe701025087ec8b57f45c791888b"
 SRC_URI[critical-section-1.2.0.sha256sum] = "790eea4361631c5e7d22598ecd5723ff611904e3344ce8720784c93e3d83d40b"
-SRC_URI[data-encoding-2.7.0.sha256sum] = "0e60eed09d8c01d3cee5b7d30acb059b76614c918fa0f992e0dd6eeb10daad6f"
-SRC_URI[deranged-0.3.11.sha256sum] = "b42b6fa04a440b495c8b04d0e71b707c585f83cb9cb28cf8cd0d976c315e31b4"
+SRC_URI[data-encoding-2.9.0.sha256sum] = "2a2330da5de22e8a3cb63252ce2abb30116bf5265e89c0e01bc17015ce30a476"
+SRC_URI[deranged-0.5.5.sha256sum] = "ececcb659e7ba858fb4f10388c250a7252eb0a27373f1a72b8748afdd248e587"
 SRC_URI[displaydoc-0.2.5.sha256sum] = "97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0"
 SRC_URI[endian-type-0.1.2.sha256sum] = "c34f04666d835ff5d62e058c3995147c06f42fe86ff053337632bca83e42702d"
 SRC_URI[enum-as-inner-0.6.1.sha256sum] = "a1e6a265c649f3f5979b601d26f1d05ada116434c87741c9493cb56218f76cbc"
+SRC_URI[find-msvc-tools-0.1.4.sha256sum] = "52051878f80a721bb68ebfbc930e07b65ba72f2da88968ea5c06fd6ca3d3a127"
 SRC_URI[flume-0.11.1.sha256sum] = "da0e4dd2a88388a1f4ccc7c9ce104604dab68d9f408dc34cd45823d5a9069095"
-SRC_URI[form_urlencoded-1.2.1.sha256sum] = "e13624c2627564efccf4934284bdd98cbaa14e79b0b5a141218e507b3a823456"
+SRC_URI[form_urlencoded-1.2.2.sha256sum] = "cb4cb245038516f5f85277875cdaa4f7d2c9a0fa0468de06ed190163b1581fcf"
+SRC_URI[futures-0.3.31.sha256sum] = "65bc07b1a8bc7c85c5f2e110c476c7389b4554ba72af57d8445ea63a576b0876"
 SRC_URI[futures-channel-0.3.31.sha256sum] = "2dff15bf788c671c1934e366d07e30c1814a8ef514e1af724a602e8a2fbe1b10"
 SRC_URI[futures-core-0.3.31.sha256sum] = "05f29059c0c2090612e8d742178b0580d2dc940c837851ad723096f87af6663e"
+SRC_URI[futures-executor-0.3.31.sha256sum] = "1e28d1d997f585e54aebc3f97d39e72338912123a67330d723fdbb564d646c9f"
 SRC_URI[futures-io-0.3.31.sha256sum] = "9e5c1b78ca4aae1ac06c48a526a655760685149f0d465d21f37abfe57ce075c6"
+SRC_URI[futures-macro-0.3.31.sha256sum] = "162ee34ebcb7c64a8abebc059ce0fee27c2262618d7b60ed8faf72fef13c3650"
 SRC_URI[futures-sink-0.3.31.sha256sum] = "e575fab7d1e0dcb8d0c7bcf9a63ee213816ab51902e6d244a95819acacf1d4f7"
 SRC_URI[futures-task-0.3.31.sha256sum] = "f90f7dce0722e95104fcb095585910c0977252f286e354b5e3bd38902cd99988"
 SRC_URI[futures-util-0.3.31.sha256sum] = "9fa08315bb612088cc391249efdc3bc77536f16c91f6cf495e6fbe85b20a4a81"
-SRC_URI[getrandom-0.2.15.sha256sum] = "c4567c8db10ae91089c99af84c68c38da3ec2f087c3f82960bcdbf3656b6f4d7"
-SRC_URI[getrandom-0.3.2.sha256sum] = "73fea8450eea4bac3940448fb7ae50d91f034f941199fcd9d909a5a07aa455f0"
-SRC_URI[gimli-0.31.1.sha256sum] = "07e28edb80900c19c28f1072f2e8aeca7fa06b23cd4169cefe1af5aa3260783f"
+SRC_URI[getrandom-0.2.16.sha256sum] = "335ff9f135e4384c8150d6f27c6daed433577f86b4750418338c01a1a2528592"
+SRC_URI[getrandom-0.3.4.sha256sum] = "899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
 SRC_URI[hickory-client-0.25.2.sha256sum] = "c466cd63a4217d5b2b8e32f23f58312741ce96e3c84bf7438677d2baff0fc555"
 SRC_URI[hickory-proto-0.25.2.sha256sum] = "f8a6fe56c0038198998a6f217ca4e7ef3a5e51f46163bd6dd60b5c71ca6c6502"
 SRC_URI[hickory-server-0.25.2.sha256sum] = "d53e5fe811b941c74ee46b8818228bfd2bc2688ba276a0eaeb0f2c95ea3b2585"
-SRC_URI[hostname-0.4.0.sha256sum] = "f9c7c7c8ac16c798734b8a24560c1362120597c40d5e1459f09498f8f6c8f2ba"
-SRC_URI[iana-time-zone-0.1.61.sha256sum] = "235e081f3925a06703c2d0117ea8b91f042756fd6e7a6e5d901e8ca1a996b220"
+SRC_URI[hostname-0.4.1.sha256sum] = "a56f203cd1c76362b69e3863fd987520ac36cf70a8c92627449b2f64a8cf7d65"
+SRC_URI[iana-time-zone-0.1.64.sha256sum] = "33e57f83510bb73707521ebaffa789ec8caf86f9657cad665b092b581d40e9fb"
 SRC_URI[iana-time-zone-haiku-0.1.2.sha256sum] = "f31827a206f56af32e590ba56d5d2d085f558508192593743f16b2306495269f"
-SRC_URI[icu_collections-1.5.0.sha256sum] = "db2fa452206ebee18c4b5c2274dbf1de17008e874b4dc4f0aea9d01ca79e4526"
-SRC_URI[icu_locid-1.5.0.sha256sum] = "13acbb8371917fc971be86fc8057c41a64b521c184808a698c02acc242dbf637"
-SRC_URI[icu_locid_transform-1.5.0.sha256sum] = "01d11ac35de8e40fdeda00d9e1e9d92525f3f9d887cdd7aa81d727596788b54e"
-SRC_URI[icu_locid_transform_data-1.5.0.sha256sum] = "fdc8ff3388f852bede6b579ad4e978ab004f139284d7b28715f773507b946f6e"
-SRC_URI[icu_normalizer-1.5.0.sha256sum] = "19ce3e0da2ec68599d193c93d088142efd7f9c5d6fc9b803774855747dc6a84f"
-SRC_URI[icu_normalizer_data-1.5.0.sha256sum] = "f8cafbf7aa791e9b22bec55a167906f9e1215fd475cd22adfcf660e03e989516"
-SRC_URI[icu_properties-1.5.1.sha256sum] = "93d6020766cfc6302c15dbbc9c8778c37e62c14427cb7f6e601d849e092aeef5"
-SRC_URI[icu_properties_data-1.5.0.sha256sum] = "67a8effbc3dd3e4ba1afa8ad918d5684b8868b3b26500753effea8d2eed19569"
-SRC_URI[icu_provider-1.5.0.sha256sum] = "6ed421c8a8ef78d3e2dbc98a973be2f3770cb42b606e3ab18d6237c4dfde68d9"
-SRC_URI[icu_provider_macros-1.5.0.sha256sum] = "1ec89e9337638ecdc08744df490b221a7399bf8d164eb52a665454e60e075ad6"
-SRC_URI[idna-1.0.3.sha256sum] = "686f825264d630750a544639377bae737628043f20d38bbc029e8f29ea968a7e"
-SRC_URI[idna_adapter-1.2.0.sha256sum] = "daca1df1c957320b2cf139ac61e7bd64fed304c5040df000a745aa1de3b4ef71"
+SRC_URI[icu_collections-2.1.1.sha256sum] = "4c6b649701667bbe825c3b7e6388cb521c23d88644678e83c0c4d0a621a34b43"
+SRC_URI[icu_locale_core-2.1.1.sha256sum] = "edba7861004dd3714265b4db54a3c390e880ab658fec5f7db895fae2046b5bb6"
+SRC_URI[icu_normalizer-2.1.1.sha256sum] = "5f6c8828b67bf8908d82127b2054ea1b4427ff0230ee9141c54251934ab1b599"
+SRC_URI[icu_normalizer_data-2.1.1.sha256sum] = "7aedcccd01fc5fe81e6b489c15b247b8b0690feb23304303a9e560f37efc560a"
+SRC_URI[icu_properties-2.1.1.sha256sum] = "e93fcd3157766c0c8da2f8cff6ce651a31f0810eaa1c51ec363ef790bbb5fb99"
+SRC_URI[icu_properties_data-2.1.1.sha256sum] = "02845b3647bb045f1100ecd6480ff52f34c35f82d9880e029d329c21d1054899"
+SRC_URI[icu_provider-2.1.1.sha256sum] = "85962cf0ce02e1e0a629cc34e7ca3e373ce20dda4c4d7294bbd0bf1fdb59e614"
+SRC_URI[idna-1.1.0.sha256sum] = "3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d90788d47be1b1e4de"
+SRC_URI[idna_adapter-1.2.1.sha256sum] = "3acae9609540aa318d1bc588455225fb2085b9ed0c4f6bd0d9d5bcd86f1a0344"
+SRC_URI[inotify-0.11.0.sha256sum] = "f37dccff2791ab604f9babef0ba14fbe0be30bd368dc541e2b08d07c8aa908f3"
+SRC_URI[inotify-sys-0.1.5.sha256sum] = "e05c02b5e89bff3b946cedeca278abc628fe811e604f027c45a8aa3cf793d0eb"
 SRC_URI[ipnet-2.11.0.sha256sum] = "469fb0b9cefa57e3ef31275ee7cacb78f2fdca44e4765491884a2b119d4eb130"
-SRC_URI[is_terminal_polyfill-1.70.1.sha256sum] = "7943c866cc5cd64cbc25b2e01621d07fa8eb2a1a23160ee81ce38704e97b8ecf"
-SRC_URI[itoa-1.0.14.sha256sum] = "d75a2a4b1b190afb6f5425f10f6a8f959d2ea0b9c2b1d79553551850539e4674"
-SRC_URI[js-sys-0.3.77.sha256sum] = "1cfaf33c695fc6e08064efbc1f72ec937429614f25eef83af942d0e227c3a28f"
-SRC_URI[libc-0.2.174.sha256sum] = "1171693293099992e19cddea4e8b849964e9846f4acee11b3948bcc337be8776"
-SRC_URI[litemap-0.7.4.sha256sum] = "4ee93343901ab17bd981295f2cf0026d4ad018c7c31ba84549a4ddbb47a45104"
-SRC_URI[lock_api-0.4.12.sha256sum] = "07af8b9cdd281b7915f413fa73f29ebd5d55d0d3f0155584dade1ff18cea1b17"
-SRC_URI[log-0.4.27.sha256sum] = "13dc2df351e3202783a1fe0d44375f7295ffb4049267b0f3018346dc122a1d94"
-SRC_URI[memchr-2.7.4.sha256sum] = "78ca9ab1a0babb1e7d5695e3530886289c18cf2f87ec19a575a0abdce112e3a3"
+SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] = "a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695"
+SRC_URI[itoa-1.0.15.sha256sum] = "4a5f13b858c8d314ee3e8f639011f7ccefe71f97f96e50151fb991f267928e2c"
+SRC_URI[js-sys-0.3.82.sha256sum] = "b011eec8cc36da2aab2d5cff675ec18454fad408585853910a202391cf9f8e65"
+SRC_URI[libc-0.2.177.sha256sum] = "2874a2af47a2325c2001a6e6fad9b16a53b802102b528163885171cf92b15976"
+SRC_URI[litemap-0.8.1.sha256sum] = "6373607a59f0be73a39b6fe456b8192fcc3585f602af20751600e974dd455e77"
+SRC_URI[lock_api-0.4.14.sha256sum] = "224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965"
+SRC_URI[log-0.4.28.sha256sum] = "34080505efa8e45a4b816c349525ebe327ceaa8559756f0356cba97ef3bf7432"
+SRC_URI[memchr-2.7.6.sha256sum] = "f52b00d39961fc5b2736ea853c9cc86238e165017a493d1d5c8eac6bdc4cc273"
 SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
-SRC_URI[miniz_oxide-0.8.3.sha256sum] = "b8402cab7aefae129c6977bb0ff1b8fd9a04eb5b51efc50a70bea51cda0c7924"
-SRC_URI[mio-1.0.3.sha256sum] = "2886843bf800fba2e3377cff24abf6379b4c4d5c6681eaf9ea5b0d15090450bd"
+SRC_URI[mio-1.1.0.sha256sum] = "69d83b0086dc8ecf3ce9ae2874b2d1290252e2a30720bea58a5c6639b0092873"
 SRC_URI[nanorand-0.7.0.sha256sum] = "6a51313c5820b0b02bd422f4b44776fbf47961755c74ce64afc73bfad10226c3"
 SRC_URI[nibble_vec-0.1.0.sha256sum] = "77a5d83df9f36fe23f0c3648c6bbb8b0298bb5f1939c8f2704431371f4b84d43"
 SRC_URI[nix-0.30.1.sha256sum] = "74523f3a35e05aba87a1d978330aef40f67b0304ac79c1c00b294c9830543db6"
 SRC_URI[num-conv-0.1.0.sha256sum] = "51d515d32fb182ee37cda2ccdcb92950d6a3c2893aa280e540671c2cd0f3b1d9"
 SRC_URI[num-traits-0.2.19.sha256sum] = "071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841"
 SRC_URI[num_threads-0.1.7.sha256sum] = "5c7398b9c8b70908f6371f47ed36737907c87c52af34c268fed0bf0ceb92ead9"
-SRC_URI[object-0.36.7.sha256sum] = "62948e14d923ea95ea2c7c86c71013138b66525b86bdc08d2dcc262bdb497b87"
-SRC_URI[once_cell-1.20.3.sha256sum] = "945462a4b81e43c4e3ba96bd7b49d834c6f61198356aa858733bc4acf3cbe62e"
-SRC_URI[percent-encoding-2.3.1.sha256sum] = "e3148f5046208a5d56bcfc03053e3ca6334e51da8dfb19b6cdc8b306fae3283e"
+SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
+SRC_URI[once_cell_polyfill-1.70.2.sha256sum] = "384b8ab6d37215f3c5301a95a4accb5d64aa607f1fcb26a11b5303878451b4fe"
+SRC_URI[percent-encoding-2.3.2.sha256sum] = "9b4f627cb1b25917193a259e49bdad08f671f8d9708acfd5fe0a8c1455d87220"
 SRC_URI[pin-project-lite-0.2.16.sha256sum] = "3b3cff922bd51709b605d9ead9aa71031d81447142d828eb4a6eba76fe619f9b"
 SRC_URI[pin-utils-0.1.0.sha256sum] = "8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184"
-SRC_URI[portable-atomic-1.11.0.sha256sum] = "350e9b48cbc6b0e028b0473b114454c6316e57336ee184ceab6e53f72c178b3e"
+SRC_URI[portable-atomic-1.11.1.sha256sum] = "f84267b20a16ea918e43c6a88433c2d54fa145c92a811b5b047ccbe153674483"
+SRC_URI[potential_utf-0.1.4.sha256sum] = "b73949432f5e2a09657003c25bca5e19a0e9c84f8058ca374f49e0ebe605af77"
 SRC_URI[powerfmt-0.2.0.sha256sum] = "439ee305def115ba05938db6eb1644ff94165c5ab5e9420d1c1bcedbba909391"
-SRC_URI[ppv-lite86-0.2.20.sha256sum] = "77957b295656769bb8ad2b6a6b09d897d94f05c41b069aede1fcdaa675eaea04"
+SRC_URI[ppv-lite86-0.2.21.sha256sum] = "85eae3c4ed2f50dcfe72643da4befc30deadb458a9b590d720cde2f2b1e97da9"
 SRC_URI[prefix-trie-0.7.0.sha256sum] = "85cf4c7c25f1dd66c76b451e9041a8cfce26e4ca754934fa7aed8d5a59a01d20"
-SRC_URI[proc-macro2-1.0.93.sha256sum] = "60946a68e5f9d28b0dc1c21bb8a97ee7d018a8b322fa57838ba31cc878e22d99"
-SRC_URI[quote-1.0.38.sha256sum] = "0e4dccaaaf89514f546c693ddc140f729f958c247918a13380cccc6078391acc"
-SRC_URI[r-efi-5.2.0.sha256sum] = "74765f6d916ee2faa39bc8e68e4f3ed8949b48cccdac59983d287a7cb71ce9c5"
+SRC_URI[proc-macro2-1.0.103.sha256sum] = "5ee95bc4ef87b8d5ba32e8b7714ccc834865276eab0aed5c9958d00ec45f49e8"
+SRC_URI[quote-1.0.41.sha256sum] = "ce25767e7b499d1b604768e7cde645d14cc8584231ea6b295e9c9eb22c02e1d1"
+SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
 SRC_URI[radix_trie-0.2.1.sha256sum] = "c069c179fcdc6a2fe24d8d18305cf085fdbd4f922c041943e203685d6a1c58fd"
-SRC_URI[rand-0.9.0.sha256sum] = "3779b94aeb87e8bd4e834cee3650289ee9e0d5677f976ecdb6d219e5f4f6cd94"
+SRC_URI[rand-0.9.2.sha256sum] = "6db2770f06117d490610c7488547d543617b21bfa07796d7a12f6f1bd53850d1"
 SRC_URI[rand_chacha-0.9.0.sha256sum] = "d3022b5f1df60f26e1ffddd6c66e8aa15de382ae63b3a0c1bfc0e4d3e3f325cb"
 SRC_URI[rand_core-0.9.3.sha256sum] = "99d9a13982dcf210057a8a78572b2217b667c3beacbf3a0d8b454f6f82837d38"
 SRC_URI[ring-0.17.14.sha256sum] = "a4689e6c2294d81e88dc6261c768b63bc4fcdb852be6d1352498b114f61383b7"
-SRC_URI[rustc-demangle-0.1.24.sha256sum] = "719b953e2095829ee67db738b3bfa9fa368c94900df327b3f07fe6e794d2fe1f"
-SRC_URI[rustversion-1.0.19.sha256sum] = "f7c45b9784283f1b2e7fb61b42047c2fd678ef0960d4f6f1eba131594cc369d4"
+SRC_URI[rustversion-1.0.22.sha256sum] = "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
 SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
-SRC_URI[serde-1.0.217.sha256sum] = "02fc4265df13d6fa1d00ecff087228cc0a2b5f3c0e87e258d8b94a156e984c70"
-SRC_URI[serde_derive-1.0.217.sha256sum] = "5a9bf7cf98d04a2b28aead066b7496853d4779c9cc183c440dbac457641e19a0"
+SRC_URI[serde-1.0.228.sha256sum] = "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
+SRC_URI[serde_core-1.0.228.sha256sum] = "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
+SRC_URI[serde_derive-1.0.228.sha256sum] = "d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79"
 SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
-SRC_URI[signal-hook-registry-1.4.2.sha256sum] = "a9e9e0b4211b72e7b8b6e85c807d36c212bdb33ea8587f7569562a84df5465b1"
-SRC_URI[slab-0.4.9.sha256sum] = "8f92a496fb766b417c996b9c5e57daf2f7ad3b0bebe1ccfca4856390e3d3bb67"
-SRC_URI[smallvec-1.13.2.sha256sum] = "3c5e1a9a646d36c3599cd173a41282daf47c44583ad367b8e6837255952e5c67"
-SRC_URI[socket2-0.5.8.sha256sum] = "c970269d99b64e60ec3bd6ad27270092a5394c4e309314b18ae3fe575695fbe8"
+SRC_URI[signal-hook-registry-1.4.6.sha256sum] = "b2a4719bff48cee6b39d12c020eeb490953ad2443b7055bd0b21fca26bd8c28b"
+SRC_URI[slab-0.4.11.sha256sum] = "7a2ae44ef20feb57a68b23d846850f861394c2e02dc425a50098ae8c90267589"
+SRC_URI[smallvec-1.15.1.sha256sum] = "67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03"
+SRC_URI[socket2-0.6.1.sha256sum] = "17129e116933cf371d018bb80ae557e889637989d8638274fb25622827b03881"
 SRC_URI[spin-0.9.8.sha256sum] = "6980e8d7511241f8acf4aebddbb1ff938df5eebe98691418c4468d0b72a96a67"
-SRC_URI[stable_deref_trait-1.2.0.sha256sum] = "a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3"
+SRC_URI[stable_deref_trait-1.2.1.sha256sum] = "6ce2be8dc25455e1f91df71bfa12ad37d7af1092ae736f3a6cd0e37bc7810596"
 SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
-SRC_URI[syn-2.0.98.sha256sum] = "36147f1a48ae0ec2b5b3bc5b537d267457555a10dc06f3dbc8cb11ba3006d3b1"
-SRC_URI[synstructure-0.13.1.sha256sum] = "c8af7666ab7b6390ab78131fb5b0fce11d6b7a6951602017c35fa82800708971"
+SRC_URI[syn-2.0.108.sha256sum] = "da58917d35242480a05c2897064da0a80589a2a0476c9a3f2fdc83b53502e917"
+SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
 SRC_URI[syslog-7.0.0.sha256sum] = "019f1500a13379b7d051455df397c75770de6311a7a188a699499502704d9f10"
-SRC_URI[thiserror-2.0.12.sha256sum] = "567b8a2dae586314f7be2a752ec7474332959c6460e02bde30d702a66d488708"
-SRC_URI[thiserror-impl-2.0.12.sha256sum] = "7f7cf42b4507d8ea322120659672cf1b9dbb93f8f2d4ecfd6e51350ff5b17a1d"
-SRC_URI[time-0.3.37.sha256sum] = "35e7868883861bd0e56d9ac6efcaaca0d6d5d82a2a7ec8209ff492c07cf37b21"
-SRC_URI[time-core-0.1.2.sha256sum] = "ef927ca75afb808a4d64dd374f00a2adf8d0fcff8e7b184af886c3c87ec4a3f3"
-SRC_URI[time-macros-0.2.19.sha256sum] = "2834e6017e3e5e4b9834939793b282bc03b37a3336245fa820e35e233e2a85de"
-SRC_URI[tinystr-0.7.6.sha256sum] = "9117f5d4db391c1cf6927e7bea3db74b9a1c1add8f7eda9ffd5364f40f57b82f"
-SRC_URI[tinyvec-1.8.1.sha256sum] = "022db8904dfa342efe721985167e9fcd16c29b226db4397ed752a761cfce81e8"
+SRC_URI[thiserror-2.0.17.sha256sum] = "f63587ca0f12b72a0600bcba1d40081f830876000bb46dd2337a3051618f4fc8"
+SRC_URI[thiserror-impl-2.0.17.sha256sum] = "3ff15c8ecd7de3849db632e14d18d2571fa09dfc5ed93479bc4485c7a517c913"
+SRC_URI[time-0.3.44.sha256sum] = "91e7d9e3bb61134e77bde20dd4825b97c010155709965fedf0f49bb138e52a9d"
+SRC_URI[time-core-0.1.6.sha256sum] = "40868e7c1d2f0b8d73e4a8c7f0ff63af4f6d19be117e90bd73eb1d62cf831c6b"
+SRC_URI[time-macros-0.2.24.sha256sum] = "30cfb0125f12d9c277f35663a0a33f8c30190f4e4574868a330595412d34ebf3"
+SRC_URI[tinystr-0.8.2.sha256sum] = "42d3e9c45c09de15d06dd8acf5f4e0e399e85927b7f00711024eb7ae10fa4869"
+SRC_URI[tinyvec-1.10.0.sha256sum] = "bfa5fdc3bce6191a1dbc8c02d5c8bffcf557bafa17c124c5264a458f1b0613fa"
 SRC_URI[tinyvec_macros-0.1.1.sha256sum] = "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
-SRC_URI[tokio-1.45.1.sha256sum] = "75ef51a33ef1da925cea3e4eb122833cb377c61439ca401b770f54902b806779"
-SRC_URI[tokio-macros-2.5.0.sha256sum] = "6e06d43f1345a3bcd39f6a56dbb7dcab2ba47e68e8ac134855e7e2bdbaf8cab8"
-SRC_URI[tokio-util-0.7.13.sha256sum] = "d7fcaa8d55a2bdd6b83ace262b016eca0d79ee02818c5c1bcdf0305114081078"
+SRC_URI[tokio-1.48.0.sha256sum] = "ff360e02eab121e0bc37a2d3b4d4dc622e6eda3a8e5253d5435ecf5bd4c68408"
+SRC_URI[tokio-macros-2.6.0.sha256sum] = "af407857209536a95c8e56f8231ef2c2e2aff839b22e07a1ffcbc617e9db9fa5"
+SRC_URI[tokio-util-0.7.17.sha256sum] = "2efa149fe76073d6e8fd97ef4f4eca7b67f599660115591483572e406e165594"
 SRC_URI[tracing-0.1.41.sha256sum] = "784e0ac535deb450455cbfa28a6f0df145ea1bb7ae51b821cf5e7927fdcfbdd0"
-SRC_URI[tracing-core-0.1.33.sha256sum] = "e672c95779cf947c5311f83787af4fa8fffd12fb27e4993211a84bdfd9610f9c"
-SRC_URI[unicode-ident-1.0.16.sha256sum] = "a210d160f08b701c8721ba1c726c11662f877ea6b7094007e1ca9a1041945034"
+SRC_URI[tracing-core-0.1.34.sha256sum] = "b9d12581f227e93f094d3af2ae690a574abb8a2b9b7a96e7cfe9647b2b617678"
+SRC_URI[unicode-ident-1.0.22.sha256sum] = "9312f7c4f6ff9069b165498234ce8be658059c6728633667c526e27dc2cf1df5"
 SRC_URI[untrusted-0.9.0.sha256sum] = "8ecb6da28b8a351d773b68d5825ac39017e680750f980f3a1a85cd8dd28a47c1"
-SRC_URI[url-2.5.4.sha256sum] = "32f8b686cadd1473f4bd0117a5d28d36b1ade384ea9b5069a1c40aefed7fda60"
-SRC_URI[utf16_iter-1.0.5.sha256sum] = "c8232dd3cdaed5356e0f716d285e4b40b932ac434100fe9b7e0e8e935b9e6246"
+SRC_URI[url-2.5.7.sha256sum] = "08bc136a29a3d1758e07a9cca267be308aeebf5cfd5a10f3f67ab2097683ef5b"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
-SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
-SRC_URI[wasi-0.14.2+wasi-0.2.4.sha256sum] = "9683f9a5a998d873c0d21fcbe3c083009670149a8fab228644b8bd36b2c48cb3"
-SRC_URI[wasm-bindgen-0.2.100.sha256sum] = "1edc8929d7499fc4e8f0be2262a241556cfc54a0bea223790e71446f2aab1ef5"
-SRC_URI[wasm-bindgen-backend-0.2.100.sha256sum] = "2f0a0651a5c2bc21487bde11ee802ccaf4c51935d0d3d42a6101f98161700bc6"
-SRC_URI[wasm-bindgen-macro-0.2.100.sha256sum] = "7fe63fc6d09ed3792bd0897b314f53de8e16568c2b3f7982f468c0bf9bd0b407"
-SRC_URI[wasm-bindgen-macro-support-0.2.100.sha256sum] = "8ae87ea40c9f689fc23f209965b6fb8a99ad69aeeb0231408be24920604395de"
-SRC_URI[wasm-bindgen-shared-0.2.100.sha256sum] = "1a05d73b933a847d6cccdda8f838a22ff101ad9bf93e33684f39c1f5f0eece3d"
-SRC_URI[windows-0.52.0.sha256sum] = "e48a53791691ab099e5e2ad123536d0fff50652600abaf43bbf952894110d0be"
-SRC_URI[windows-core-0.52.0.sha256sum] = "33ab640c8d7e35bf8ba19b884ba838ceb4fba93a4e8c65a9059d08afcfc683d9"
-SRC_URI[windows-link-0.1.0.sha256sum] = "6dccfd733ce2b1753b03b6d3c65edf020262ea35e20ccdf3e288043e6dd620e3"
+SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] = "ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
+SRC_URI[wasip2-1.0.1+wasi-0.2.4.sha256sum] = "0562428422c63773dad2c345a1882263bbf4d65cf3f42e90921f787ef5ad58e7"
+SRC_URI[wasm-bindgen-0.2.105.sha256sum] = "da95793dfc411fbbd93f5be7715b0578ec61fe87cb1a42b12eb625caa5c5ea60"
+SRC_URI[wasm-bindgen-macro-0.2.105.sha256sum] = "04264334509e04a7bf8690f2384ef5265f05143a4bff3889ab7a3269adab59c2"
+SRC_URI[wasm-bindgen-macro-support-0.2.105.sha256sum] = "420bc339d9f322e562942d52e115d57e950d12d88983a14c79b86859ee6c7ebc"
+SRC_URI[wasm-bindgen-shared-0.2.105.sha256sum] = "76f218a38c84bcb33c25ec7059b07847d465ce0e0a76b995e134a45adcb6af76"
+SRC_URI[windows-core-0.62.2.sha256sum] = "b8e83a14d34d0623b51dce9581199302a221863196a1dde71a7663a4c2be9deb"
+SRC_URI[windows-implement-0.60.2.sha256sum] = "053e2e040ab57b9dc951b72c264860db7eb3b0200ba345b4e4c3b14f67855ddf"
+SRC_URI[windows-interface-0.59.3.sha256sum] = "3f316c4a2570ba26bbec722032c4099d8c8bc095efccdc15688708623367e358"
+SRC_URI[windows-link-0.1.3.sha256sum] = "5e6ad25900d524eaabdbbb96d20b4311e1e7ae1699af4fb28c17ae66c80d798a"
+SRC_URI[windows-link-0.2.1.sha256sum] = "f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5"
+SRC_URI[windows-result-0.4.1.sha256sum] = "7781fa89eaf60850ac3d2da7af8e5242a5ea78d1a11c49bf2910bb5a73853eb5"
+SRC_URI[windows-strings-0.5.1.sha256sum] = "7837d08f69c77cf6b07689544538e017c1bfcf57e34b4c0ff58e6c2cd3b37091"
 SRC_URI[windows-sys-0.52.0.sha256sum] = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
-SRC_URI[windows-sys-0.59.0.sha256sum] = "1e38bc4d79ed67fd075bcc251a1c39b32a1776bbe92e5bef1f0bf1f8c531853b"
+SRC_URI[windows-sys-0.60.2.sha256sum] = "f2f500e4d28234f72040990ec9d39e3a6b950f9f22d3dba18416c35882612bcb"
+SRC_URI[windows-sys-0.61.2.sha256sum] = "ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc"
 SRC_URI[windows-targets-0.52.6.sha256sum] = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
+SRC_URI[windows-targets-0.53.5.sha256sum] = "4945f9f551b88e0d65f3db0bc25c33b8acea4d9e41163edf90dcd0b19f9069f3"
 SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
+SRC_URI[windows_aarch64_gnullvm-0.53.1.sha256sum] = "a9d8416fa8b42f5c947f8482c43e7d89e73a173cead56d044f6a56104a6d1b53"
 SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
+SRC_URI[windows_aarch64_msvc-0.53.1.sha256sum] = "b9d782e804c2f632e395708e99a94275910eb9100b2114651e04744e9b125006"
 SRC_URI[windows_i686_gnu-0.52.6.sha256sum] = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
+SRC_URI[windows_i686_gnu-0.53.1.sha256sum] = "960e6da069d81e09becb0ca57a65220ddff016ff2d6af6a223cf372a506593a3"
 SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
+SRC_URI[windows_i686_gnullvm-0.53.1.sha256sum] = "fa7359d10048f68ab8b09fa71c3daccfb0e9b559aed648a8f95469c27057180c"
 SRC_URI[windows_i686_msvc-0.52.6.sha256sum] = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
+SRC_URI[windows_i686_msvc-0.53.1.sha256sum] = "1e7ac75179f18232fe9c285163565a57ef8d3c89254a30685b57d83a38d326c2"
 SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
+SRC_URI[windows_x86_64_gnu-0.53.1.sha256sum] = "9c3842cdd74a865a8066ab39c8a7a473c0778a3f29370b5fd6b4b9aa7df4a499"
 SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
+SRC_URI[windows_x86_64_gnullvm-0.53.1.sha256sum] = "0ffa179e2d07eee8ad8f57493436566c7cc30ac536a3379fdf008f47f6bb7ae1"
 SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
-SRC_URI[wit-bindgen-rt-0.39.0.sha256sum] = "6f42320e61fe2cfd34354ecb597f86f413484a798ba44a8ca1165c58d42da6c1"
-SRC_URI[write16-1.0.0.sha256sum] = "d1890f4022759daae28ed4fe62859b1236caebfc61ede2f63ed4e695f3f6d936"
-SRC_URI[writeable-0.5.5.sha256sum] = "1e9df38ee2d2c3c5948ea468a8406ff0db0b29ae1ffde1bcf20ef305bcc95c51"
-SRC_URI[yoke-0.7.5.sha256sum] = "120e6aef9aa629e3d4f52dc8cc43a015c7724194c97dfaf45180d2daf2b77f40"
-SRC_URI[yoke-derive-0.7.5.sha256sum] = "2380878cad4ac9aac1e2435f3eb4020e8374b5f13c296cb75b4620ff8e229154"
-SRC_URI[zerocopy-0.7.35.sha256sum] = "1b9b4fd18abc82b8136838da5d50bae7bdea537c574d8dc1a34ed098d6c166f0"
-SRC_URI[zerocopy-0.8.24.sha256sum] = "2586fea28e186957ef732a5f8b3be2da217d65c5969d4b1e17f973ebbe876879"
-SRC_URI[zerocopy-derive-0.7.35.sha256sum] = "fa4f8080344d4671fb4e831a13ad1e68092748387dfc4f55e356242fae12ce3e"
-SRC_URI[zerocopy-derive-0.8.24.sha256sum] = "a996a8f63c5c4448cd959ac1bab0aaa3306ccfd060472f85943ee0750f0169be"
-SRC_URI[zerofrom-0.1.5.sha256sum] = "cff3ee08c995dee1859d998dea82f7374f2826091dd9cd47def953cae446cd2e"
-SRC_URI[zerofrom-derive-0.1.5.sha256sum] = "595eed982f7d355beb85837f651fa22e90b3c044842dc7f2c2842c086f295808"
-SRC_URI[zerovec-0.10.4.sha256sum] = "aa2b893d79df23bfb12d5461018d408ea19dfafe76c2c7ef6d4eba614f8ff079"
-SRC_URI[zerovec-derive-0.10.3.sha256sum] = "6eafa6dfb17584ea3e2bd6e76e0cc15ad7af12b09abdd1ca55961bed9b1063c6"
+SRC_URI[windows_x86_64_msvc-0.53.1.sha256sum] = "d6bbff5f0aada427a1e5a6da5f1f98158182f26556f345ac9e04d36d0ebed650"
+SRC_URI[wit-bindgen-0.46.0.sha256sum] = "f17a85883d4e6d00e8a97c586de764dabcc06133f7f1d55dce5cdc070ad7fe59"
+SRC_URI[writeable-0.6.2.sha256sum] = "9edde0db4769d2dc68579893f2306b26c6ecfbe0ef499b013d731b7b9247e0b9"
+SRC_URI[yoke-0.8.1.sha256sum] = "72d6e5c6afb84d73944e5cedb052c4680d5657337201555f9f2a16b7406d4954"
+SRC_URI[yoke-derive-0.8.1.sha256sum] = "b659052874eb698efe5b9e8cf382204678a0086ebf46982b79d6ca3182927e5d"
+SRC_URI[zerocopy-0.8.27.sha256sum] = "0894878a5fa3edfd6da3f88c4805f4c8558e2b996227a3d864f47fe11e38282c"
+SRC_URI[zerocopy-derive-0.8.27.sha256sum] = "88d2b8d9c68ad2b9e4340d7832716a4d21a22a1154777ad56ea55c51a9cf3831"
+SRC_URI[zerofrom-0.1.6.sha256sum] = "50cc42e0333e05660c3587f3bf9d0478688e15d870fab3346451ce7f8c9fbea5"
+SRC_URI[zerofrom-derive-0.1.6.sha256sum] = "d71e5d6e06ab090c67b5e44993ec16b72dcbaabc526db883a360057678b48502"
+SRC_URI[zerotrie-0.2.3.sha256sum] = "2a59c17a5562d507e4b54960e8569ebee33bee890c70aa3fe7b97e85a9fd7851"
+SRC_URI[zerovec-0.11.5.sha256sum] = "6c28719294829477f525be0186d13efa9a3c602f7ec202ca9e353d310fb9a002"
+SRC_URI[zerovec-derive-0.11.2.sha256sum] = "eadce39539ca5cb3985590102671f2567e659fca9666581ad3411d59207951f3"
diff --git a/recipes-containers/aardvark-dns/aardvark-dns_1.16.0.bb b/recipes-containers/aardvark-dns/aardvark-dns_1.17.0.bb
similarity index 92%
rename from recipes-containers/aardvark-dns/aardvark-dns_1.16.0.bb
rename to recipes-containers/aardvark-dns/aardvark-dns_1.17.0.bb
index 683964eb..d8f16798 100644
--- a/recipes-containers/aardvark-dns/aardvark-dns_1.16.0.bb
+++ b/recipes-containers/aardvark-dns/aardvark-dns_1.17.0.bb
@@ -4,11 +4,11 @@ HOMEPAGE = "https://github.com/containers/aardvark-dns"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "513be8b5e111d46192f01a9739348eabf4a61797"
+SRCREV = "2158073ba56807fb1a7731899712a54603c3d150"
 
 # It is possible to fetch the source using the crate fetcher instead:
 #SRC_URI = "crate://crates.io/${BPN}/${PV}"
-SRC_URI = "git://github.com/containers/aardvark-dns;protocol=https;nobranch=1 \
+SRC_URI = "git://github.com/containers/aardvark-dns;protocol=https;branch=main;tag=v${PV} \
            file://run-ptest"
 require ${BPN}-crates.inc
 
diff --git a/recipes-containers/aardvark-dns/files/run-ptest b/recipes-containers/aardvark-dns/files/run-ptest
index d7abbb34..3b5d7903 100644
--- a/recipes-containers/aardvark-dns/files/run-ptest
+++ b/recipes-containers/aardvark-dns/files/run-ptest
@@ -1,3 +1,5 @@
 #!/bin/bash
 
+echo "nameserver 8.8.8.8" >> /etc/resolv.conf
+
 NETAVARK=/usr/libexec/podman/netavark AARDVARK=/usr/libexec/podman/aardvark-dns bats -t ./test/ | sed -e '/^ok/ s/^ok/PASS:/g' | sed -e '/^not ok/ s/^not ok/FAIL:/g'

