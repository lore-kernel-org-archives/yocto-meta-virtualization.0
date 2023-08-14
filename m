Return-Path: <erik.schilling@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B83DC001DB
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 08:04:32 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.102850.1692000269253293628
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Aug 2023 01:04:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=g1XM+aGm;
 spf=pass (domain: linaro.org, ip: 209.85.208.174, mailfrom: erik.schilling@linaro.org)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2b9a2033978so60205861fa.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Aug 2023 01:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692000267; x=1692605067;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rU1Hzaz9zV7P50IL0Rzb2R+HargB0I705s/UTn0c1Ls=;
        b=g1XM+aGmoRKEmSwQxrriY0vK8tsF5hmwMu0L/vLQPua7pZXnRRaETT01MgnZfkUtKX
         /Vreh+02OC003oo/NPzK8MpxzryJccTWtgIw2F+EVUnLj+We+dLaqjjSqHmK170cMlvH
         XlSUq24/Vmtc9VR7M2Z8JaECUk31AzZB7gUGpb/utrhl9DkZ124UR6RMGGR5Bx3HtfLJ
         F95uGyTmWEXHDCXit/pmXO0KSW1SiYqKKYQY1GrTHAVBUQoPICO55sJ2S9wobtZVy21A
         gn5YMsKgg2kBeQll+ulp1iW7YEXK7YFuuOIdU0l6kRiKvGdtJXXt3TQt3TAvxWqcMy+Q
         8Osw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692000267; x=1692605067;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rU1Hzaz9zV7P50IL0Rzb2R+HargB0I705s/UTn0c1Ls=;
        b=M+txRysNlfJ/+STAC6xsYzuD2e+o//cT7/KTREOJ1t2Xn+MQMuNIeVdvLqv8pUpKIL
         f1RD7QTNs24gPiShHzpxgyCIyCX6BG8S3AS4MxU/PzEbvoKquvJkwGPA262cMsS4HiCg
         ebcM7WvDcwEfHNHog74NedDI7aBlX2dy29y0P4eNsOdmAMGD9jsJmL91makQS23H4hc9
         UDuf1UtyjrZgXakrin0tvXGTncy3xh2YTqzc2HcO6m3wkVnDWF3Ws9ZrvXPZ3PkOL0ak
         pOs8HlDONpqFiKUNNFID33Ed19HWAgqziJACOD4HYij+E3towsHP8jmf+efzUNFzl7d/
         uuBQ==
X-Gm-Message-State: AOJu0Ywo0WyZUk31iIXprP4cFm3NGuNM/xoGs5LLNbt+mvcQviQ+py9m
	nafo96NIEoy93xLq7QtzrzuJwA==
X-Google-Smtp-Source: AGHT+IEVwp96QejeECWvdSdQ7uvdchpPHcBksNwGdyE/YO9sYOeAapKSHEonsgKMgM58V8e+p/cQjw==
X-Received: by 2002:a2e:b786:0:b0:2b9:e831:f165 with SMTP id n6-20020a2eb786000000b002b9e831f165mr6314743ljo.42.1692000266822;
        Mon, 14 Aug 2023 01:04:26 -0700 (PDT)
Received: from [192.168.1.149] (i5387890C.versanet.de. [83.135.137.12])
        by smtp.gmail.com with ESMTPSA id cb13-20020a170906a44d00b0099bc08862b6sm5478791ejb.171.2023.08.14.01.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 01:04:25 -0700 (PDT)
From: Erik Schilling <erik.schilling@linaro.org>
Date: Mon, 14 Aug 2023 10:04:06 +0200
Subject: [meta-virtualization][PATCH v2] vhost-device: add recipes for
 vhost-device daemons
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230814-vhost-device-v2-1-4ec4b7a005a9@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPXf2WQC/22NQQ6CMBBFr0JmbQ1tCYIr72FYlHaASZCSaW1Uw
 t2trF2+5P33NwjIhAGuxQaMiQL5JYM6FWAns4woyGUGVSpdXlQj0uRDFC6rFoVytq21LnVle8i
 TlXGg15G7wwOjEYk4Ps1MHxN/5S5LE4Xo+X1cJnmo/+tJCilcOzRSqqqva3ObaTHsz55H6PZ9/
 wKjpOjpvgAAAA==
To: meta-virtualization <meta-virtualization@lists.yoctoproject.org>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, 
 Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692000265; l=74764;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=HveZFCK2r5Jt2HbSAWCNf4CcUGJAFyKLmRA/ouaHWvI=;
 b=rI2icmSdlU5+PFRHb4pG8884uC0O4lYoT4aUh2Mkrz6jQhO1fSjGuJUftrF05jeFk822h1mP5
 sao7KriIm6aDdpDT/rjtEqijf5bK7EEsTpacxXyuJhSJqUU+gRgTd8+
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Aug 2023 08:04:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8178

This adds recipes for the first tagged release of the vhost-device
daemons of the rust-vmm project.

While the initial release was done for all daemons at the same time,
the daemons all have indepentend version numbers and will be released
on their own schedules in the future. Therefore, I splitted them into
independent recipes.

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
These are a bunch of daemons that implement various vhost-user virtio
devices. Currently, they are mostly tested with QEMU, but we are also
working on Xen support (most bits are upstream already).
---
Changes in v2:
- Added README.md to explain generation of dependency .inc files
- Link to v1: https://lore.kernel.org/r/20230728-vhost-device-v1-1-d9f81124b66a@linaro.org
---
 README.md                                          |  14 ++
 .../vhost-device/vhost-device-gpio-crates.inc      | 184 +++++++++++++++
 .../vhost-device/vhost-device-gpio_0.1.0.bb        |  20 ++
 .../vhost-device/vhost-device-i2c-crates.inc       | 126 ++++++++++
 .../vhost-device/vhost-device-i2c_0.1.0.bb         |  16 ++
 .../vhost-device/vhost-device-rng-crates.inc       | 158 +++++++++++++
 .../vhost-device/vhost-device-rng_0.1.0.bb         |  17 ++
 .../vhost-device/vhost-device-scsi-crates.inc      | 166 +++++++++++++
 .../vhost-device/vhost-device-scsi_0.1.0.bb        |  16 ++
 .../vhost-device/vhost-device-vsock-crates.inc     | 258 +++++++++++++++++++++
 .../vhost-device/vhost-device-vsock_0.1.0.bb       |  16 ++
 11 files changed, 991 insertions(+)

diff --git a/README.md b/README.md
new file mode 100644
index 0000000..dd79b48
--- /dev/null
+++ b/README.md
@@ -0,0 +1,14 @@
+# vhost-device: A collection of vhost-user devices
+
+[vhost-device](https://github.com/rust-vmm/vhost-device) provides a series of
+daemons that implement the
+[vhost-user protocol](https://qemu-project.gitlab.io/qemu/interop/vhost-user.html)
+for various virtio device types.
+
+## Updating the recipes
+
+1. Bump the version number to the newly published version listed on crates.io
+2. Regenerate the .inc file that list the dependencies:
+   `bitbake -c update_crates vhost-device-<type>`
+3. Review, build and test the changes
+
diff --git a/recipes-extended/vhost-device/vhost-device-gpio-crates.inc b/recipes-extended/vhost-device/vhost-device-gpio-crates.inc
new file mode 100644
index 0000000..4d73c1f
--- /dev/null
+++ b/recipes-extended/vhost-device/vhost-device-gpio-crates.inc
@@ -0,0 +1,184 @@
+# Autogenerated with 'bitbake -c update_crates vhost-device-gpio'
+
+# from Cargo.lock
+SRC_URI += " \
+    crate://crates.io/aho-corasick/1.0.2 \
+    crate://crates.io/anstream/0.3.2 \
+    crate://crates.io/anstyle/1.0.1 \
+    crate://crates.io/anstyle-parse/0.2.1 \
+    crate://crates.io/anstyle-query/1.0.0 \
+    crate://crates.io/anstyle-wincon/1.0.1 \
+    crate://crates.io/arc-swap/1.6.0 \
+    crate://crates.io/assert_matches/1.5.0 \
+    crate://crates.io/bindgen/0.63.0 \
+    crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/bitflags/2.3.3 \
+    crate://crates.io/cc/1.0.79 \
+    crate://crates.io/cexpr/0.6.0 \
+    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/clang-sys/1.6.1 \
+    crate://crates.io/clap/4.3.19 \
+    crate://crates.io/clap_builder/4.3.19 \
+    crate://crates.io/clap_derive/4.3.12 \
+    crate://crates.io/clap_lex/0.5.0 \
+    crate://crates.io/colorchoice/1.0.0 \
+    crate://crates.io/either/1.8.1 \
+    crate://crates.io/env_logger/0.10.0 \
+    crate://crates.io/errno/0.2.8 \
+    crate://crates.io/errno/0.3.1 \
+    crate://crates.io/errno-dragonfly/0.1.2 \
+    crate://crates.io/glob/0.3.1 \
+    crate://crates.io/heck/0.3.3 \
+    crate://crates.io/heck/0.4.1 \
+    crate://crates.io/hermit-abi/0.3.2 \
+    crate://crates.io/humantime/2.1.0 \
+    crate://crates.io/intmap/2.0.0 \
+    crate://crates.io/is-terminal/0.4.9 \
+    crate://crates.io/lazy_static/1.4.0 \
+    crate://crates.io/lazycell/1.3.0 \
+    crate://crates.io/libc/0.2.147 \
+    crate://crates.io/libgpiod/0.1.0 \
+    crate://crates.io/libgpiod-sys/0.1.0 \
+    crate://crates.io/libloading/0.7.4 \
+    crate://crates.io/linux-raw-sys/0.4.3 \
+    crate://crates.io/log/0.4.19 \
+    crate://crates.io/memchr/2.5.0 \
+    crate://crates.io/minimal-lexical/0.2.1 \
+    crate://crates.io/nom/7.1.3 \
+    crate://crates.io/once_cell/1.18.0 \
+    crate://crates.io/peeking_take_while/0.1.2 \
+    crate://crates.io/pkg-config/0.3.27 \
+    crate://crates.io/proc-macro2/1.0.63 \
+    crate://crates.io/quote/1.0.29 \
+    crate://crates.io/regex/1.9.1 \
+    crate://crates.io/regex-automata/0.3.2 \
+    crate://crates.io/regex-syntax/0.7.4 \
+    crate://crates.io/rustc-hash/1.1.0 \
+    crate://crates.io/rustix/0.38.3 \
+    crate://crates.io/serde/1.0.168 \
+    crate://crates.io/shlex/1.1.0 \
+    crate://crates.io/strsim/0.10.0 \
+    crate://crates.io/strum/0.20.0 \
+    crate://crates.io/strum_macros/0.20.1 \
+    crate://crates.io/syn/1.0.109 \
+    crate://crates.io/syn/2.0.23 \
+    crate://crates.io/system-deps/2.0.3 \
+    crate://crates.io/termcolor/1.2.0 \
+    crate://crates.io/thiserror/1.0.41 \
+    crate://crates.io/thiserror-impl/1.0.41 \
+    crate://crates.io/toml/0.5.11 \
+    crate://crates.io/unicode-ident/1.0.11 \
+    crate://crates.io/unicode-segmentation/1.10.1 \
+    crate://crates.io/utf8parse/0.2.1 \
+    crate://crates.io/version-compare/0.0.11 \
+    crate://crates.io/vhost/0.8.0 \
+    crate://crates.io/vhost-user-backend/0.10.0 \
+    crate://crates.io/virtio-bindings/0.2.1 \
+    crate://crates.io/virtio-queue/0.9.0 \
+    crate://crates.io/vm-memory/0.12.0 \
+    crate://crates.io/vmm-sys-util/0.11.1 \
+    crate://crates.io/which/4.4.0 \
+    crate://crates.io/winapi/0.3.9 \
+    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
+    crate://crates.io/winapi-util/0.1.5 \
+    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+    crate://crates.io/windows-sys/0.48.0 \
+    crate://crates.io/windows-targets/0.48.1 \
+    crate://crates.io/windows_aarch64_gnullvm/0.48.0 \
+    crate://crates.io/windows_aarch64_msvc/0.48.0 \
+    crate://crates.io/windows_i686_gnu/0.48.0 \
+    crate://crates.io/windows_i686_msvc/0.48.0 \
+    crate://crates.io/windows_x86_64_gnu/0.48.0 \
+    crate://crates.io/windows_x86_64_gnullvm/0.48.0 \
+    crate://crates.io/windows_x86_64_msvc/0.48.0 \
+"
+
+SRC_URI[aho-corasick-1.0.2.sha256sum] = "43f6cb1bf222025340178f382c426f13757b2960e89779dfcb319c32542a5a41"
+SRC_URI[anstream-0.3.2.sha256sum] = "0ca84f3628370c59db74ee214b3263d58f9aadd9b4fe7e711fd87dc452b7f163"
+SRC_URI[anstyle-1.0.1.sha256sum] = "3a30da5c5f2d5e72842e00bcb57657162cdabef0931f40e2deb9b4140440cecd"
+SRC_URI[anstyle-parse-0.2.1.sha256sum] = "938874ff5980b03a87c5524b3ae5b59cf99b1d6bc836848df7bc5ada9643c333"
+SRC_URI[anstyle-query-1.0.0.sha256sum] = "5ca11d4be1bab0c8bc8734a9aa7bf4ee8316d462a08c6ac5052f888fef5b494b"
+SRC_URI[anstyle-wincon-1.0.1.sha256sum] = "180abfa45703aebe0093f79badacc01b8fd4ea2e35118747e5811127f926e188"
+SRC_URI[arc-swap-1.6.0.sha256sum] = "bddcadddf5e9015d310179a59bb28c4d4b9920ad0f11e8e14dbadf654890c9a6"
+SRC_URI[assert_matches-1.5.0.sha256sum] = "9b34d609dfbaf33d6889b2b7106d3ca345eacad44200913df5ba02bfd31d2ba9"
+SRC_URI[bindgen-0.63.0.sha256sum] = "36d860121800b2a9a94f9b5604b332d5cffb234ce17609ea479d723dbc9d3885"
+SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
+SRC_URI[bitflags-2.3.3.sha256sum] = "630be753d4e58660abd17930c71b647fe46c27ea6b63cc59e1e3851406972e42"
+SRC_URI[cc-1.0.79.sha256sum] = "50d30906286121d95be3d479533b458f87493b30a4b5f79a607db8f5d11aa91f"
+SRC_URI[cexpr-0.6.0.sha256sum] = "6fac387a98bb7c37292057cffc56d62ecb629900026402633ae9160df93a8766"
+SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
+SRC_URI[clang-sys-1.6.1.sha256sum] = "c688fc74432808e3eb684cae8830a86be1d66a2bd58e1f248ed0960a590baf6f"
+SRC_URI[clap-4.3.19.sha256sum] = "5fd304a20bff958a57f04c4e96a2e7594cc4490a0e809cbd48bb6437edaa452d"
+SRC_URI[clap_builder-4.3.19.sha256sum] = "01c6a3f08f1fe5662a35cfe393aec09c4df95f60ee93b7556505260f75eee9e1"
+SRC_URI[clap_derive-4.3.12.sha256sum] = "54a9bb5758fc5dfe728d1019941681eccaf0cf8a4189b692a0ee2f2ecf90a050"
+SRC_URI[clap_lex-0.5.0.sha256sum] = "2da6da31387c7e4ef160ffab6d5e7f00c42626fe39aea70a7b0f1773f7dd6c1b"
+SRC_URI[colorchoice-1.0.0.sha256sum] = "acbf1af155f9b9ef647e42cdc158db4b64a1b61f743629225fde6f3e0be2a7c7"
+SRC_URI[either-1.8.1.sha256sum] = "7fcaabb2fef8c910e7f4c7ce9f67a1283a1715879a7c230ca9d6d1ae31f16d91"
+SRC_URI[env_logger-0.10.0.sha256sum] = "85cdab6a89accf66733ad5a1693a4dcced6aeff64602b634530dd73c1f3ee9f0"
+SRC_URI[errno-0.2.8.sha256sum] = "f639046355ee4f37944e44f60642c6f3a7efa3cf6b78c78a0d989a8ce6c396a1"
+SRC_URI[errno-0.3.1.sha256sum] = "4bcfec3a70f97c962c307b2d2c56e358cf1d00b558d74262b5f929ee8cc7e73a"
+SRC_URI[errno-dragonfly-0.1.2.sha256sum] = "aa68f1b12764fab894d2755d2518754e71b4fd80ecfb822714a1206c2aab39bf"
+SRC_URI[glob-0.3.1.sha256sum] = "d2fabcfbdc87f4758337ca535fb41a6d701b65693ce38287d856d1674551ec9b"
+SRC_URI[heck-0.3.3.sha256sum] = "6d621efb26863f0e9924c6ac577e8275e5e6b77455db64ffa6c65c904e9e132c"
+SRC_URI[heck-0.4.1.sha256sum] = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
+SRC_URI[hermit-abi-0.3.2.sha256sum] = "443144c8cdadd93ebf52ddb4056d257f5b52c04d3c804e657d19eb73fc33668b"
+SRC_URI[humantime-2.1.0.sha256sum] = "9a3a5bfb195931eeb336b2a7b4d761daec841b97f947d34394601737a7bba5e4"
+SRC_URI[intmap-2.0.0.sha256sum] = "ee87fd093563344074bacf24faa0bb0227fb6969fb223e922db798516de924d6"
+SRC_URI[is-terminal-0.4.9.sha256sum] = "cb0889898416213fab133e1d33a0e5858a48177452750691bde3666d0fdbaf8b"
+SRC_URI[lazy_static-1.4.0.sha256sum] = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646"
+SRC_URI[lazycell-1.3.0.sha256sum] = "830d08ce1d1d941e6b30645f1a0eb5643013d835ce3779a5fc208261dbe10f55"
+SRC_URI[libc-0.2.147.sha256sum] = "b4668fb0ea861c1df094127ac5f1da3409a82116a4ba74fca2e58ef927159bb3"
+SRC_URI[libgpiod-0.1.0.sha256sum] = "9e9fdf4b437063f5697151f9ead12bafa223958e243f2f736107ec68c2b88231"
+SRC_URI[libgpiod-sys-0.1.0.sha256sum] = "aa282e1da652deaeed776f6ef36d443689aeda19e5c0a3a2335c50b4611ce489"
+SRC_URI[libloading-0.7.4.sha256sum] = "b67380fd3b2fbe7527a606e18729d21c6f3951633d0500574c4dc22d2d638b9f"
+SRC_URI[linux-raw-sys-0.4.3.sha256sum] = "09fc20d2ca12cb9f044c93e3bd6d32d523e6e2ec3db4f7b2939cd99026ecd3f0"
+SRC_URI[log-0.4.19.sha256sum] = "b06a4cde4c0f271a446782e3eff8de789548ce57dbc8eca9292c27f4a42004b4"
+SRC_URI[memchr-2.5.0.sha256sum] = "2dffe52ecf27772e601905b7522cb4ef790d2cc203488bbd0e2fe85fcb74566d"
+SRC_URI[minimal-lexical-0.2.1.sha256sum] = "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a"
+SRC_URI[nom-7.1.3.sha256sum] = "d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a"
+SRC_URI[once_cell-1.18.0.sha256sum] = "dd8b5dd2ae5ed71462c540258bedcb51965123ad7e7ccf4b9a8cafaa4a63576d"
+SRC_URI[peeking_take_while-0.1.2.sha256sum] = "19b17cddbe7ec3f8bc800887bab5e717348c95ea2ca0b1bf0837fb964dc67099"
+SRC_URI[pkg-config-0.3.27.sha256sum] = "26072860ba924cbfa98ea39c8c19b4dd6a4a25423dbdf219c1eca91aa0cf6964"
+SRC_URI[proc-macro2-1.0.63.sha256sum] = "7b368fba921b0dce7e60f5e04ec15e565b3303972b42bcfde1d0713b881959eb"
+SRC_URI[quote-1.0.29.sha256sum] = "573015e8ab27661678357f27dc26460738fd2b6c86e46f386fde94cb5d913105"
+SRC_URI[regex-1.9.1.sha256sum] = "b2eae68fc220f7cf2532e4494aded17545fce192d59cd996e0fe7887f4ceb575"
+SRC_URI[regex-automata-0.3.2.sha256sum] = "83d3daa6976cffb758ec878f108ba0e062a45b2d6ca3a2cca965338855476caf"
+SRC_URI[regex-syntax-0.7.4.sha256sum] = "e5ea92a5b6195c6ef2a0295ea818b312502c6fc94dde986c5553242e18fd4ce2"
+SRC_URI[rustc-hash-1.1.0.sha256sum] = "08d43f7aa6b08d49f382cde6a7982047c3426db949b1424bc4b7ec9ae12c6ce2"
+SRC_URI[rustix-0.38.3.sha256sum] = "ac5ffa1efe7548069688cd7028f32591853cd7b5b756d41bcffd2353e4fc75b4"
+SRC_URI[serde-1.0.168.sha256sum] = "d614f89548720367ded108b3c843be93f3a341e22d5674ca0dd5cd57f34926af"
+SRC_URI[shlex-1.1.0.sha256sum] = "43b2853a4d09f215c24cc5489c992ce46052d359b5109343cbafbf26bc62f8a3"
+SRC_URI[strsim-0.10.0.sha256sum] = "73473c0e59e6d5812c5dfe2a064a6444949f089e20eec9a2e5506596494e4623"
+SRC_URI[strum-0.20.0.sha256sum] = "7318c509b5ba57f18533982607f24070a55d353e90d4cae30c467cdb2ad5ac5c"
+SRC_URI[strum_macros-0.20.1.sha256sum] = "ee8bc6b87a5112aeeab1f4a9f7ab634fe6cbefc4850006df31267f4cfb9e3149"
+SRC_URI[syn-1.0.109.sha256sum] = "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237"
+SRC_URI[syn-2.0.23.sha256sum] = "59fb7d6d8281a51045d62b8eb3a7d1ce347b76f312af50cd3dc0af39c87c1737"
+SRC_URI[system-deps-2.0.3.sha256sum] = "1b59b8aafd652f3c1469f16e6c223121e8a8dbe40c71475209c1401cff3a67ef"
+SRC_URI[termcolor-1.2.0.sha256sum] = "be55cf8942feac5c765c2c993422806843c9a9a45d4d5c407ad6dd2ea95eb9b6"
+SRC_URI[thiserror-1.0.41.sha256sum] = "c16a64ba9387ef3fdae4f9c1a7f07a0997fce91985c0336f1ddc1822b3b37802"
+SRC_URI[thiserror-impl-1.0.41.sha256sum] = "d14928354b01c4d6a4f0e549069adef399a284e7995c7ccca94e8a07a5346c59"
+SRC_URI[toml-0.5.11.sha256sum] = "f4f7f0dd8d50a853a531c426359045b1998f04219d88799810762cd4ad314234"
+SRC_URI[unicode-ident-1.0.11.sha256sum] = "301abaae475aa91687eb82514b328ab47a211a533026cb25fc3e519b86adfc3c"
+SRC_URI[unicode-segmentation-1.10.1.sha256sum] = "1dd624098567895118886609431a7c3b8f516e41d30e0643f03d94592a147e36"
+SRC_URI[utf8parse-0.2.1.sha256sum] = "711b9620af191e0cdc7468a8d14e709c3dcdb115b36f838e601583af800a370a"
+SRC_URI[version-compare-0.0.11.sha256sum] = "1c18c859eead79d8b95d09e4678566e8d70105c4e7b251f707a03df32442661b"
+SRC_URI[vhost-0.8.0.sha256sum] = "73832f4d8d636d63d9b145e8ef22a2c50b93f4d24eb7a99c9e6781b1b08549cf"
+SRC_URI[vhost-user-backend-0.10.0.sha256sum] = "e3ea9d5e8ec847cde4df1c04e586698a479706fd6beca37323f9d425b24b4c2f"
+SRC_URI[virtio-bindings-0.2.1.sha256sum] = "c18d7b74098a946470ea265b5bacbbf877abc3373021388454de0d47735a5b98"
+SRC_URI[virtio-queue-0.9.0.sha256sum] = "35aca00da06841bd99162c381ec65893cace23ca0fb89254302cfe4bec4c300f"
+SRC_URI[vm-memory-0.12.0.sha256sum] = "a77c7a0891cbac53618f5f6eec650ed1dc4f7e506bbe14877aff49d94b8408b0"
+SRC_URI[vmm-sys-util-0.11.1.sha256sum] = "dd64fe09d8e880e600c324e7d664760a17f56e9672b7495a86381b49e4f72f46"
+SRC_URI[which-4.4.0.sha256sum] = "2441c784c52b289a054b7201fc93253e288f094e2f4be9058343127c4226a269"
+SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
+SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
+SRC_URI[winapi-util-0.1.5.sha256sum] = "70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178"
+SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
+SRC_URI[windows-sys-0.48.0.sha256sum] = "677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9"
+SRC_URI[windows-targets-0.48.1.sha256sum] = "05d4b17490f70499f20b9e791dcf6a299785ce8af4d709018206dc5b4953e95f"
+SRC_URI[windows_aarch64_gnullvm-0.48.0.sha256sum] = "91ae572e1b79dba883e0d315474df7305d12f569b400fcf90581b06062f7e1bc"
+SRC_URI[windows_aarch64_msvc-0.48.0.sha256sum] = "b2ef27e0d7bdfcfc7b868b317c1d32c641a6fe4629c171b8928c7b08d98d7cf3"
+SRC_URI[windows_i686_gnu-0.48.0.sha256sum] = "622a1962a7db830d6fd0a69683c80a18fda201879f0f447f065a3b7467daa241"
+SRC_URI[windows_i686_msvc-0.48.0.sha256sum] = "4542c6e364ce21bf45d69fdd2a8e455fa38d316158cfd43b3ac1c5b1b19f8e00"
+SRC_URI[windows_x86_64_gnu-0.48.0.sha256sum] = "ca2b8a661f7628cbd23440e50b05d705db3686f894fc9580820623656af974b1"
+SRC_URI[windows_x86_64_gnullvm-0.48.0.sha256sum] = "7896dbc1f41e08872e9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953"
+SRC_URI[windows_x86_64_msvc-0.48.0.sha256sum] = "1a515f5799fe4961cb532f983ce2b23082366b898e52ffbce459c86f67c8378a"
diff --git a/recipes-extended/vhost-device/vhost-device-gpio_0.1.0.bb b/recipes-extended/vhost-device/vhost-device-gpio_0.1.0.bb
new file mode 100644
index 0000000..4ef9de4
--- /dev/null
+++ b/recipes-extended/vhost-device/vhost-device-gpio_0.1.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "vhost gpio backend device"
+DESCRIPTION = "A vhost-user backend that emulates a VirtIO GPIO device"
+HOMEPAGE = "https://github.com/rust-vmm/vhost-device"
+LICENSE = "Apache-2.0 | BSD-3-Clause"
+LIC_FILES_CHKSUM = "\
+    file://LICENSE-APACHE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
+    file://LICENSE-BSD-3-Clause;md5=2489db1359f496fff34bd393df63947e \
+"
+DEPENDS += "libgpiod"
+# libgpiod-sys generates bindings using bindgen, which depends on clang
+DEPENDS += "clang-native"
+
+SRC_URI += "crate://crates.io/vhost-device-gpio/0.1.0"
+SRC_URI[vhost-device-gpio-0.1.0.sha256sum] = "f4789dd127ce746d4f702d50256ff09e47b19fdb2bfee88a254b7e48efbf1100"
+
+inherit cargo
+inherit cargo-update-recipe-crates
+inherit pkgconfig
+
+include vhost-device-gpio-crates.inc
diff --git a/recipes-extended/vhost-device/vhost-device-i2c-crates.inc b/recipes-extended/vhost-device/vhost-device-i2c-crates.inc
new file mode 100644
index 0000000..ba6a757
--- /dev/null
+++ b/recipes-extended/vhost-device/vhost-device-i2c-crates.inc
@@ -0,0 +1,126 @@
+# Autogenerated with 'bitbake -c update_crates vhost-device-i2c'
+
+# from Cargo.lock
+SRC_URI += " \
+    crate://crates.io/aho-corasick/1.0.2 \
+    crate://crates.io/anstream/0.3.2 \
+    crate://crates.io/anstyle/1.0.1 \
+    crate://crates.io/anstyle-parse/0.2.1 \
+    crate://crates.io/anstyle-query/1.0.0 \
+    crate://crates.io/anstyle-wincon/1.0.1 \
+    crate://crates.io/arc-swap/1.6.0 \
+    crate://crates.io/assert_matches/1.5.0 \
+    crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/bitflags/2.3.3 \
+    crate://crates.io/cc/1.0.79 \
+    crate://crates.io/clap/4.3.19 \
+    crate://crates.io/clap_builder/4.3.19 \
+    crate://crates.io/clap_derive/4.3.12 \
+    crate://crates.io/clap_lex/0.5.0 \
+    crate://crates.io/colorchoice/1.0.0 \
+    crate://crates.io/env_logger/0.10.0 \
+    crate://crates.io/errno/0.3.1 \
+    crate://crates.io/errno-dragonfly/0.1.2 \
+    crate://crates.io/heck/0.4.1 \
+    crate://crates.io/hermit-abi/0.3.2 \
+    crate://crates.io/humantime/2.1.0 \
+    crate://crates.io/is-terminal/0.4.9 \
+    crate://crates.io/libc/0.2.147 \
+    crate://crates.io/linux-raw-sys/0.4.3 \
+    crate://crates.io/log/0.4.19 \
+    crate://crates.io/memchr/2.5.0 \
+    crate://crates.io/once_cell/1.18.0 \
+    crate://crates.io/proc-macro2/1.0.63 \
+    crate://crates.io/quote/1.0.29 \
+    crate://crates.io/regex/1.9.1 \
+    crate://crates.io/regex-automata/0.3.2 \
+    crate://crates.io/regex-syntax/0.7.4 \
+    crate://crates.io/rustix/0.38.3 \
+    crate://crates.io/strsim/0.10.0 \
+    crate://crates.io/syn/2.0.23 \
+    crate://crates.io/termcolor/1.2.0 \
+    crate://crates.io/thiserror/1.0.41 \
+    crate://crates.io/thiserror-impl/1.0.41 \
+    crate://crates.io/unicode-ident/1.0.11 \
+    crate://crates.io/utf8parse/0.2.1 \
+    crate://crates.io/vhost/0.8.0 \
+    crate://crates.io/vhost-user-backend/0.10.0 \
+    crate://crates.io/virtio-bindings/0.2.1 \
+    crate://crates.io/virtio-queue/0.9.0 \
+    crate://crates.io/vm-memory/0.12.0 \
+    crate://crates.io/vmm-sys-util/0.11.1 \
+    crate://crates.io/winapi/0.3.9 \
+    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
+    crate://crates.io/winapi-util/0.1.5 \
+    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+    crate://crates.io/windows-sys/0.48.0 \
+    crate://crates.io/windows-targets/0.48.1 \
+    crate://crates.io/windows_aarch64_gnullvm/0.48.0 \
+    crate://crates.io/windows_aarch64_msvc/0.48.0 \
+    crate://crates.io/windows_i686_gnu/0.48.0 \
+    crate://crates.io/windows_i686_msvc/0.48.0 \
+    crate://crates.io/windows_x86_64_gnu/0.48.0 \
+    crate://crates.io/windows_x86_64_gnullvm/0.48.0 \
+    crate://crates.io/windows_x86_64_msvc/0.48.0 \
+"
+
+SRC_URI[aho-corasick-1.0.2.sha256sum] = "43f6cb1bf222025340178f382c426f13757b2960e89779dfcb319c32542a5a41"
+SRC_URI[anstream-0.3.2.sha256sum] = "0ca84f3628370c59db74ee214b3263d58f9aadd9b4fe7e711fd87dc452b7f163"
+SRC_URI[anstyle-1.0.1.sha256sum] = "3a30da5c5f2d5e72842e00bcb57657162cdabef0931f40e2deb9b4140440cecd"
+SRC_URI[anstyle-parse-0.2.1.sha256sum] = "938874ff5980b03a87c5524b3ae5b59cf99b1d6bc836848df7bc5ada9643c333"
+SRC_URI[anstyle-query-1.0.0.sha256sum] = "5ca11d4be1bab0c8bc8734a9aa7bf4ee8316d462a08c6ac5052f888fef5b494b"
+SRC_URI[anstyle-wincon-1.0.1.sha256sum] = "180abfa45703aebe0093f79badacc01b8fd4ea2e35118747e5811127f926e188"
+SRC_URI[arc-swap-1.6.0.sha256sum] = "bddcadddf5e9015d310179a59bb28c4d4b9920ad0f11e8e14dbadf654890c9a6"
+SRC_URI[assert_matches-1.5.0.sha256sum] = "9b34d609dfbaf33d6889b2b7106d3ca345eacad44200913df5ba02bfd31d2ba9"
+SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
+SRC_URI[bitflags-2.3.3.sha256sum] = "630be753d4e58660abd17930c71b647fe46c27ea6b63cc59e1e3851406972e42"
+SRC_URI[cc-1.0.79.sha256sum] = "50d30906286121d95be3d479533b458f87493b30a4b5f79a607db8f5d11aa91f"
+SRC_URI[clap-4.3.19.sha256sum] = "5fd304a20bff958a57f04c4e96a2e7594cc4490a0e809cbd48bb6437edaa452d"
+SRC_URI[clap_builder-4.3.19.sha256sum] = "01c6a3f08f1fe5662a35cfe393aec09c4df95f60ee93b7556505260f75eee9e1"
+SRC_URI[clap_derive-4.3.12.sha256sum] = "54a9bb5758fc5dfe728d1019941681eccaf0cf8a4189b692a0ee2f2ecf90a050"
+SRC_URI[clap_lex-0.5.0.sha256sum] = "2da6da31387c7e4ef160ffab6d5e7f00c42626fe39aea70a7b0f1773f7dd6c1b"
+SRC_URI[colorchoice-1.0.0.sha256sum] = "acbf1af155f9b9ef647e42cdc158db4b64a1b61f743629225fde6f3e0be2a7c7"
+SRC_URI[env_logger-0.10.0.sha256sum] = "85cdab6a89accf66733ad5a1693a4dcced6aeff64602b634530dd73c1f3ee9f0"
+SRC_URI[errno-0.3.1.sha256sum] = "4bcfec3a70f97c962c307b2d2c56e358cf1d00b558d74262b5f929ee8cc7e73a"
+SRC_URI[errno-dragonfly-0.1.2.sha256sum] = "aa68f1b12764fab894d2755d2518754e71b4fd80ecfb822714a1206c2aab39bf"
+SRC_URI[heck-0.4.1.sha256sum] = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
+SRC_URI[hermit-abi-0.3.2.sha256sum] = "443144c8cdadd93ebf52ddb4056d257f5b52c04d3c804e657d19eb73fc33668b"
+SRC_URI[humantime-2.1.0.sha256sum] = "9a3a5bfb195931eeb336b2a7b4d761daec841b97f947d34394601737a7bba5e4"
+SRC_URI[is-terminal-0.4.9.sha256sum] = "cb0889898416213fab133e1d33a0e5858a48177452750691bde3666d0fdbaf8b"
+SRC_URI[libc-0.2.147.sha256sum] = "b4668fb0ea861c1df094127ac5f1da3409a82116a4ba74fca2e58ef927159bb3"
+SRC_URI[linux-raw-sys-0.4.3.sha256sum] = "09fc20d2ca12cb9f044c93e3bd6d32d523e6e2ec3db4f7b2939cd99026ecd3f0"
+SRC_URI[log-0.4.19.sha256sum] = "b06a4cde4c0f271a446782e3eff8de789548ce57dbc8eca9292c27f4a42004b4"
+SRC_URI[memchr-2.5.0.sha256sum] = "2dffe52ecf27772e601905b7522cb4ef790d2cc203488bbd0e2fe85fcb74566d"
+SRC_URI[once_cell-1.18.0.sha256sum] = "dd8b5dd2ae5ed71462c540258bedcb51965123ad7e7ccf4b9a8cafaa4a63576d"
+SRC_URI[proc-macro2-1.0.63.sha256sum] = "7b368fba921b0dce7e60f5e04ec15e565b3303972b42bcfde1d0713b881959eb"
+SRC_URI[quote-1.0.29.sha256sum] = "573015e8ab27661678357f27dc26460738fd2b6c86e46f386fde94cb5d913105"
+SRC_URI[regex-1.9.1.sha256sum] = "b2eae68fc220f7cf2532e4494aded17545fce192d59cd996e0fe7887f4ceb575"
+SRC_URI[regex-automata-0.3.2.sha256sum] = "83d3daa6976cffb758ec878f108ba0e062a45b2d6ca3a2cca965338855476caf"
+SRC_URI[regex-syntax-0.7.4.sha256sum] = "e5ea92a5b6195c6ef2a0295ea818b312502c6fc94dde986c5553242e18fd4ce2"
+SRC_URI[rustix-0.38.3.sha256sum] = "ac5ffa1efe7548069688cd7028f32591853cd7b5b756d41bcffd2353e4fc75b4"
+SRC_URI[strsim-0.10.0.sha256sum] = "73473c0e59e6d5812c5dfe2a064a6444949f089e20eec9a2e5506596494e4623"
+SRC_URI[syn-2.0.23.sha256sum] = "59fb7d6d8281a51045d62b8eb3a7d1ce347b76f312af50cd3dc0af39c87c1737"
+SRC_URI[termcolor-1.2.0.sha256sum] = "be55cf8942feac5c765c2c993422806843c9a9a45d4d5c407ad6dd2ea95eb9b6"
+SRC_URI[thiserror-1.0.41.sha256sum] = "c16a64ba9387ef3fdae4f9c1a7f07a0997fce91985c0336f1ddc1822b3b37802"
+SRC_URI[thiserror-impl-1.0.41.sha256sum] = "d14928354b01c4d6a4f0e549069adef399a284e7995c7ccca94e8a07a5346c59"
+SRC_URI[unicode-ident-1.0.11.sha256sum] = "301abaae475aa91687eb82514b328ab47a211a533026cb25fc3e519b86adfc3c"
+SRC_URI[utf8parse-0.2.1.sha256sum] = "711b9620af191e0cdc7468a8d14e709c3dcdb115b36f838e601583af800a370a"
+SRC_URI[vhost-0.8.0.sha256sum] = "73832f4d8d636d63d9b145e8ef22a2c50b93f4d24eb7a99c9e6781b1b08549cf"
+SRC_URI[vhost-user-backend-0.10.0.sha256sum] = "e3ea9d5e8ec847cde4df1c04e586698a479706fd6beca37323f9d425b24b4c2f"
+SRC_URI[virtio-bindings-0.2.1.sha256sum] = "c18d7b74098a946470ea265b5bacbbf877abc3373021388454de0d47735a5b98"
+SRC_URI[virtio-queue-0.9.0.sha256sum] = "35aca00da06841bd99162c381ec65893cace23ca0fb89254302cfe4bec4c300f"
+SRC_URI[vm-memory-0.12.0.sha256sum] = "a77c7a0891cbac53618f5f6eec650ed1dc4f7e506bbe14877aff49d94b8408b0"
+SRC_URI[vmm-sys-util-0.11.1.sha256sum] = "dd64fe09d8e880e600c324e7d664760a17f56e9672b7495a86381b49e4f72f46"
+SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
+SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
+SRC_URI[winapi-util-0.1.5.sha256sum] = "70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178"
+SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
+SRC_URI[windows-sys-0.48.0.sha256sum] = "677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9"
+SRC_URI[windows-targets-0.48.1.sha256sum] = "05d4b17490f70499f20b9e791dcf6a299785ce8af4d709018206dc5b4953e95f"
+SRC_URI[windows_aarch64_gnullvm-0.48.0.sha256sum] = "91ae572e1b79dba883e0d315474df7305d12f569b400fcf90581b06062f7e1bc"
+SRC_URI[windows_aarch64_msvc-0.48.0.sha256sum] = "b2ef27e0d7bdfcfc7b868b317c1d32c641a6fe4629c171b8928c7b08d98d7cf3"
+SRC_URI[windows_i686_gnu-0.48.0.sha256sum] = "622a1962a7db830d6fd0a69683c80a18fda201879f0f447f065a3b7467daa241"
+SRC_URI[windows_i686_msvc-0.48.0.sha256sum] = "4542c6e364ce21bf45d69fdd2a8e455fa38d316158cfd43b3ac1c5b1b19f8e00"
+SRC_URI[windows_x86_64_gnu-0.48.0.sha256sum] = "ca2b8a661f7628cbd23440e50b05d705db3686f894fc9580820623656af974b1"
+SRC_URI[windows_x86_64_gnullvm-0.48.0.sha256sum] = "7896dbc1f41e08872e9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953"
+SRC_URI[windows_x86_64_msvc-0.48.0.sha256sum] = "1a515f5799fe4961cb532f983ce2b23082366b898e52ffbce459c86f67c8378a"
diff --git a/recipes-extended/vhost-device/vhost-device-i2c_0.1.0.bb b/recipes-extended/vhost-device/vhost-device-i2c_0.1.0.bb
new file mode 100644
index 0000000..c9179da
--- /dev/null
+++ b/recipes-extended/vhost-device/vhost-device-i2c_0.1.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "vhost i2c backend device"
+DESCRIPTION = "A vhost-user backend that emulates a VirtIO I2C device"
+HOMEPAGE = "https://github.com/rust-vmm/vhost-device"
+LICENSE = "Apache-2.0 | BSD-3-Clause"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE-APACHE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
+    file://LICENSE-BSD-3-Clause;md5=2489db1359f496fff34bd393df63947e \
+"
+
+SRC_URI += "crate://crates.io/vhost-device-i2c/0.1.0"
+SRC_URI[vhost-device-i2c-0.1.0.sha256sum] = "a77923a4f161887ca2a19ead2d2f2271d62d1268e774265c42c277367f019a3f"
+
+inherit cargo
+inherit cargo-update-recipe-crates
+
+include vhost-device-i2c-crates.inc
diff --git a/recipes-extended/vhost-device/vhost-device-rng-crates.inc b/recipes-extended/vhost-device/vhost-device-rng-crates.inc
new file mode 100644
index 0000000..5a50da3
--- /dev/null
+++ b/recipes-extended/vhost-device/vhost-device-rng-crates.inc
@@ -0,0 +1,158 @@
+# Autogenerated with 'bitbake -c update_crates vhost-device-rng'
+
+# from Cargo.lock
+SRC_URI += " \
+    crate://crates.io/aho-corasick/1.0.2 \
+    crate://crates.io/anstream/0.3.2 \
+    crate://crates.io/anstyle/1.0.1 \
+    crate://crates.io/anstyle-parse/0.2.1 \
+    crate://crates.io/anstyle-query/1.0.0 \
+    crate://crates.io/anstyle-wincon/1.0.1 \
+    crate://crates.io/arc-swap/1.6.0 \
+    crate://crates.io/assert_matches/1.5.0 \
+    crate://crates.io/autocfg/1.1.0 \
+    crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/bitflags/2.3.3 \
+    crate://crates.io/cc/1.0.79 \
+    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/clap/4.3.19 \
+    crate://crates.io/clap_builder/4.3.19 \
+    crate://crates.io/clap_derive/4.3.12 \
+    crate://crates.io/clap_lex/0.5.0 \
+    crate://crates.io/colorchoice/1.0.0 \
+    crate://crates.io/env_logger/0.10.0 \
+    crate://crates.io/epoll/4.3.3 \
+    crate://crates.io/errno/0.3.1 \
+    crate://crates.io/errno-dragonfly/0.1.2 \
+    crate://crates.io/fastrand/1.9.0 \
+    crate://crates.io/getrandom/0.2.10 \
+    crate://crates.io/heck/0.4.1 \
+    crate://crates.io/hermit-abi/0.3.2 \
+    crate://crates.io/humantime/2.1.0 \
+    crate://crates.io/instant/0.1.12 \
+    crate://crates.io/io-lifetimes/1.0.11 \
+    crate://crates.io/is-terminal/0.4.9 \
+    crate://crates.io/libc/0.2.147 \
+    crate://crates.io/linux-raw-sys/0.3.8 \
+    crate://crates.io/linux-raw-sys/0.4.3 \
+    crate://crates.io/log/0.4.19 \
+    crate://crates.io/memchr/2.5.0 \
+    crate://crates.io/once_cell/1.18.0 \
+    crate://crates.io/ppv-lite86/0.2.17 \
+    crate://crates.io/proc-macro2/1.0.63 \
+    crate://crates.io/quote/1.0.29 \
+    crate://crates.io/rand/0.8.5 \
+    crate://crates.io/rand_chacha/0.3.1 \
+    crate://crates.io/rand_core/0.6.4 \
+    crate://crates.io/redox_syscall/0.3.5 \
+    crate://crates.io/regex/1.9.1 \
+    crate://crates.io/regex-automata/0.3.2 \
+    crate://crates.io/regex-syntax/0.7.4 \
+    crate://crates.io/rustix/0.37.23 \
+    crate://crates.io/rustix/0.38.3 \
+    crate://crates.io/strsim/0.10.0 \
+    crate://crates.io/syn/2.0.23 \
+    crate://crates.io/tempfile/3.6.0 \
+    crate://crates.io/termcolor/1.2.0 \
+    crate://crates.io/thiserror/1.0.41 \
+    crate://crates.io/thiserror-impl/1.0.41 \
+    crate://crates.io/unicode-ident/1.0.11 \
+    crate://crates.io/utf8parse/0.2.1 \
+    crate://crates.io/vhost/0.8.0 \
+    crate://crates.io/vhost-user-backend/0.10.0 \
+    crate://crates.io/virtio-bindings/0.2.1 \
+    crate://crates.io/virtio-queue/0.9.0 \
+    crate://crates.io/vm-memory/0.12.0 \
+    crate://crates.io/vmm-sys-util/0.11.1 \
+    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
+    crate://crates.io/winapi/0.3.9 \
+    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
+    crate://crates.io/winapi-util/0.1.5 \
+    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+    crate://crates.io/windows-sys/0.48.0 \
+    crate://crates.io/windows-targets/0.48.1 \
+    crate://crates.io/windows_aarch64_gnullvm/0.48.0 \
+    crate://crates.io/windows_aarch64_msvc/0.48.0 \
+    crate://crates.io/windows_i686_gnu/0.48.0 \
+    crate://crates.io/windows_i686_msvc/0.48.0 \
+    crate://crates.io/windows_x86_64_gnu/0.48.0 \
+    crate://crates.io/windows_x86_64_gnullvm/0.48.0 \
+    crate://crates.io/windows_x86_64_msvc/0.48.0 \
+"
+
+SRC_URI[aho-corasick-1.0.2.sha256sum] = "43f6cb1bf222025340178f382c426f13757b2960e89779dfcb319c32542a5a41"
+SRC_URI[anstream-0.3.2.sha256sum] = "0ca84f3628370c59db74ee214b3263d58f9aadd9b4fe7e711fd87dc452b7f163"
+SRC_URI[anstyle-1.0.1.sha256sum] = "3a30da5c5f2d5e72842e00bcb57657162cdabef0931f40e2deb9b4140440cecd"
+SRC_URI[anstyle-parse-0.2.1.sha256sum] = "938874ff5980b03a87c5524b3ae5b59cf99b1d6bc836848df7bc5ada9643c333"
+SRC_URI[anstyle-query-1.0.0.sha256sum] = "5ca11d4be1bab0c8bc8734a9aa7bf4ee8316d462a08c6ac5052f888fef5b494b"
+SRC_URI[anstyle-wincon-1.0.1.sha256sum] = "180abfa45703aebe0093f79badacc01b8fd4ea2e35118747e5811127f926e188"
+SRC_URI[arc-swap-1.6.0.sha256sum] = "bddcadddf5e9015d310179a59bb28c4d4b9920ad0f11e8e14dbadf654890c9a6"
+SRC_URI[assert_matches-1.5.0.sha256sum] = "9b34d609dfbaf33d6889b2b7106d3ca345eacad44200913df5ba02bfd31d2ba9"
+SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
+SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
+SRC_URI[bitflags-2.3.3.sha256sum] = "630be753d4e58660abd17930c71b647fe46c27ea6b63cc59e1e3851406972e42"
+SRC_URI[cc-1.0.79.sha256sum] = "50d30906286121d95be3d479533b458f87493b30a4b5f79a607db8f5d11aa91f"
+SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
+SRC_URI[clap-4.3.19.sha256sum] = "5fd304a20bff958a57f04c4e96a2e7594cc4490a0e809cbd48bb6437edaa452d"
+SRC_URI[clap_builder-4.3.19.sha256sum] = "01c6a3f08f1fe5662a35cfe393aec09c4df95f60ee93b7556505260f75eee9e1"
+SRC_URI[clap_derive-4.3.12.sha256sum] = "54a9bb5758fc5dfe728d1019941681eccaf0cf8a4189b692a0ee2f2ecf90a050"
+SRC_URI[clap_lex-0.5.0.sha256sum] = "2da6da31387c7e4ef160ffab6d5e7f00c42626fe39aea70a7b0f1773f7dd6c1b"
+SRC_URI[colorchoice-1.0.0.sha256sum] = "acbf1af155f9b9ef647e42cdc158db4b64a1b61f743629225fde6f3e0be2a7c7"
+SRC_URI[env_logger-0.10.0.sha256sum] = "85cdab6a89accf66733ad5a1693a4dcced6aeff64602b634530dd73c1f3ee9f0"
+SRC_URI[epoll-4.3.3.sha256sum] = "74351c3392ea1ff6cd2628e0042d268ac2371cb613252ff383b6dfa50d22fa79"
+SRC_URI[errno-0.3.1.sha256sum] = "4bcfec3a70f97c962c307b2d2c56e358cf1d00b558d74262b5f929ee8cc7e73a"
+SRC_URI[errno-dragonfly-0.1.2.sha256sum] = "aa68f1b12764fab894d2755d2518754e71b4fd80ecfb822714a1206c2aab39bf"
+SRC_URI[fastrand-1.9.0.sha256sum] = "e51093e27b0797c359783294ca4f0a911c270184cb10f85783b118614a1501be"
+SRC_URI[getrandom-0.2.10.sha256sum] = "be4136b2a15dd319360be1c07d9933517ccf0be8f16bf62a3bee4f0d618df427"
+SRC_URI[heck-0.4.1.sha256sum] = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
+SRC_URI[hermit-abi-0.3.2.sha256sum] = "443144c8cdadd93ebf52ddb4056d257f5b52c04d3c804e657d19eb73fc33668b"
+SRC_URI[humantime-2.1.0.sha256sum] = "9a3a5bfb195931eeb336b2a7b4d761daec841b97f947d34394601737a7bba5e4"
+SRC_URI[instant-0.1.12.sha256sum] = "7a5bbe824c507c5da5956355e86a746d82e0e1464f65d862cc5e71da70e94b2c"
+SRC_URI[io-lifetimes-1.0.11.sha256sum] = "eae7b9aee968036d54dce06cebaefd919e4472e753296daccd6d344e3e2df0c2"
+SRC_URI[is-terminal-0.4.9.sha256sum] = "cb0889898416213fab133e1d33a0e5858a48177452750691bde3666d0fdbaf8b"
+SRC_URI[libc-0.2.147.sha256sum] = "b4668fb0ea861c1df094127ac5f1da3409a82116a4ba74fca2e58ef927159bb3"
+SRC_URI[linux-raw-sys-0.3.8.sha256sum] = "ef53942eb7bf7ff43a617b3e2c1c4a5ecf5944a7c1bc12d7ee39bbb15e5c1519"
+SRC_URI[linux-raw-sys-0.4.3.sha256sum] = "09fc20d2ca12cb9f044c93e3bd6d32d523e6e2ec3db4f7b2939cd99026ecd3f0"
+SRC_URI[log-0.4.19.sha256sum] = "b06a4cde4c0f271a446782e3eff8de789548ce57dbc8eca9292c27f4a42004b4"
+SRC_URI[memchr-2.5.0.sha256sum] = "2dffe52ecf27772e601905b7522cb4ef790d2cc203488bbd0e2fe85fcb74566d"
+SRC_URI[once_cell-1.18.0.sha256sum] = "dd8b5dd2ae5ed71462c540258bedcb51965123ad7e7ccf4b9a8cafaa4a63576d"
+SRC_URI[ppv-lite86-0.2.17.sha256sum] = "5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de"
+SRC_URI[proc-macro2-1.0.63.sha256sum] = "7b368fba921b0dce7e60f5e04ec15e565b3303972b42bcfde1d0713b881959eb"
+SRC_URI[quote-1.0.29.sha256sum] = "573015e8ab27661678357f27dc26460738fd2b6c86e46f386fde94cb5d913105"
+SRC_URI[rand-0.8.5.sha256sum] = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
+SRC_URI[rand_chacha-0.3.1.sha256sum] = "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
+SRC_URI[rand_core-0.6.4.sha256sum] = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
+SRC_URI[redox_syscall-0.3.5.sha256sum] = "567664f262709473930a4bf9e51bf2ebf3348f2e748ccc50dea20646858f8f29"
+SRC_URI[regex-1.9.1.sha256sum] = "b2eae68fc220f7cf2532e4494aded17545fce192d59cd996e0fe7887f4ceb575"
+SRC_URI[regex-automata-0.3.2.sha256sum] = "83d3daa6976cffb758ec878f108ba0e062a45b2d6ca3a2cca965338855476caf"
+SRC_URI[regex-syntax-0.7.4.sha256sum] = "e5ea92a5b6195c6ef2a0295ea818b312502c6fc94dde986c5553242e18fd4ce2"
+SRC_URI[rustix-0.37.23.sha256sum] = "4d69718bf81c6127a49dc64e44a742e8bb9213c0ff8869a22c308f84c1d4ab06"
+SRC_URI[rustix-0.38.3.sha256sum] = "ac5ffa1efe7548069688cd7028f32591853cd7b5b756d41bcffd2353e4fc75b4"
+SRC_URI[strsim-0.10.0.sha256sum] = "73473c0e59e6d5812c5dfe2a064a6444949f089e20eec9a2e5506596494e4623"
+SRC_URI[syn-2.0.23.sha256sum] = "59fb7d6d8281a51045d62b8eb3a7d1ce347b76f312af50cd3dc0af39c87c1737"
+SRC_URI[tempfile-3.6.0.sha256sum] = "31c0432476357e58790aaa47a8efb0c5138f137343f3b5f23bd36a27e3b0a6d6"
+SRC_URI[termcolor-1.2.0.sha256sum] = "be55cf8942feac5c765c2c993422806843c9a9a45d4d5c407ad6dd2ea95eb9b6"
+SRC_URI[thiserror-1.0.41.sha256sum] = "c16a64ba9387ef3fdae4f9c1a7f07a0997fce91985c0336f1ddc1822b3b37802"
+SRC_URI[thiserror-impl-1.0.41.sha256sum] = "d14928354b01c4d6a4f0e549069adef399a284e7995c7ccca94e8a07a5346c59"
+SRC_URI[unicode-ident-1.0.11.sha256sum] = "301abaae475aa91687eb82514b328ab47a211a533026cb25fc3e519b86adfc3c"
+SRC_URI[utf8parse-0.2.1.sha256sum] = "711b9620af191e0cdc7468a8d14e709c3dcdb115b36f838e601583af800a370a"
+SRC_URI[vhost-0.8.0.sha256sum] = "73832f4d8d636d63d9b145e8ef22a2c50b93f4d24eb7a99c9e6781b1b08549cf"
+SRC_URI[vhost-user-backend-0.10.0.sha256sum] = "e3ea9d5e8ec847cde4df1c04e586698a479706fd6beca37323f9d425b24b4c2f"
+SRC_URI[virtio-bindings-0.2.1.sha256sum] = "c18d7b74098a946470ea265b5bacbbf877abc3373021388454de0d47735a5b98"
+SRC_URI[virtio-queue-0.9.0.sha256sum] = "35aca00da06841bd99162c381ec65893cace23ca0fb89254302cfe4bec4c300f"
+SRC_URI[vm-memory-0.12.0.sha256sum] = "a77c7a0891cbac53618f5f6eec650ed1dc4f7e506bbe14877aff49d94b8408b0"
+SRC_URI[vmm-sys-util-0.11.1.sha256sum] = "dd64fe09d8e880e600c324e7d664760a17f56e9672b7495a86381b49e4f72f46"
+SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
+SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
+SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
+SRC_URI[winapi-util-0.1.5.sha256sum] = "70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178"
+SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
+SRC_URI[windows-sys-0.48.0.sha256sum] = "677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9"
+SRC_URI[windows-targets-0.48.1.sha256sum] = "05d4b17490f70499f20b9e791dcf6a299785ce8af4d709018206dc5b4953e95f"
+SRC_URI[windows_aarch64_gnullvm-0.48.0.sha256sum] = "91ae572e1b79dba883e0d315474df7305d12f569b400fcf90581b06062f7e1bc"
+SRC_URI[windows_aarch64_msvc-0.48.0.sha256sum] = "b2ef27e0d7bdfcfc7b868b317c1d32c641a6fe4629c171b8928c7b08d98d7cf3"
+SRC_URI[windows_i686_gnu-0.48.0.sha256sum] = "622a1962a7db830d6fd0a69683c80a18fda201879f0f447f065a3b7467daa241"
+SRC_URI[windows_i686_msvc-0.48.0.sha256sum] = "4542c6e364ce21bf45d69fdd2a8e455fa38d316158cfd43b3ac1c5b1b19f8e00"
+SRC_URI[windows_x86_64_gnu-0.48.0.sha256sum] = "ca2b8a661f7628cbd23440e50b05d705db3686f894fc9580820623656af974b1"
+SRC_URI[windows_x86_64_gnullvm-0.48.0.sha256sum] = "7896dbc1f41e08872e9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953"
+SRC_URI[windows_x86_64_msvc-0.48.0.sha256sum] = "1a515f5799fe4961cb532f983ce2b23082366b898e52ffbce459c86f67c8378a"
diff --git a/recipes-extended/vhost-device/vhost-device-rng_0.1.0.bb b/recipes-extended/vhost-device/vhost-device-rng_0.1.0.bb
new file mode 100644
index 0000000..6e4cf82
--- /dev/null
+++ b/recipes-extended/vhost-device/vhost-device-rng_0.1.0.bb
@@ -0,0 +1,17 @@
+SUMMARY = "vhost rng backend device"
+DESCRIPTION = "A vhost-user backend that emulates a VirtIO random number \
+    generator device"
+HOMEPAGE = "https://github.com/rust-vmm/vhost-device"
+LICENSE = "Apache-2.0 | BSD-3-Clause"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE-APACHE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
+    file://LICENSE-BSD-3-Clause;md5=2489db1359f496fff34bd393df63947e \
+"
+
+SRC_URI += "crate://crates.io/vhost-device-rng/0.1.0"
+SRC_URI[vhost-device-rng-0.1.0.sha256sum] = "51e0af4acaaefc19a3d6c2e2cb00caf2130d728d857494c857662781da9f1329"
+
+inherit cargo
+inherit cargo-update-recipe-crates
+
+include vhost-device-rng-crates.inc
diff --git a/recipes-extended/vhost-device/vhost-device-scsi-crates.inc b/recipes-extended/vhost-device/vhost-device-scsi-crates.inc
new file mode 100644
index 0000000..3f9a08b
--- /dev/null
+++ b/recipes-extended/vhost-device/vhost-device-scsi-crates.inc
@@ -0,0 +1,166 @@
+# Autogenerated with 'bitbake -c update_crates vhost-device-scsi'
+
+# from Cargo.lock
+SRC_URI += " \
+    crate://crates.io/aho-corasick/1.0.2 \
+    crate://crates.io/anstream/0.3.2 \
+    crate://crates.io/anstyle/1.0.1 \
+    crate://crates.io/anstyle-parse/0.2.1 \
+    crate://crates.io/anstyle-query/1.0.0 \
+    crate://crates.io/anstyle-wincon/1.0.1 \
+    crate://crates.io/arc-swap/1.6.0 \
+    crate://crates.io/assert_matches/1.5.0 \
+    crate://crates.io/autocfg/1.1.0 \
+    crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/bitflags/2.3.3 \
+    crate://crates.io/cc/1.0.79 \
+    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/clap/4.3.19 \
+    crate://crates.io/clap_builder/4.3.19 \
+    crate://crates.io/clap_derive/4.3.12 \
+    crate://crates.io/clap_lex/0.5.0 \
+    crate://crates.io/colorchoice/1.0.0 \
+    crate://crates.io/env_logger/0.10.0 \
+    crate://crates.io/epoll/4.3.3 \
+    crate://crates.io/equivalent/1.0.0 \
+    crate://crates.io/errno/0.3.1 \
+    crate://crates.io/errno-dragonfly/0.1.2 \
+    crate://crates.io/fastrand/1.9.0 \
+    crate://crates.io/hashbrown/0.14.0 \
+    crate://crates.io/heck/0.4.1 \
+    crate://crates.io/hermit-abi/0.3.2 \
+    crate://crates.io/humantime/2.1.0 \
+    crate://crates.io/indexmap/2.0.0 \
+    crate://crates.io/instant/0.1.12 \
+    crate://crates.io/io-lifetimes/1.0.11 \
+    crate://crates.io/is-terminal/0.4.9 \
+    crate://crates.io/libc/0.2.147 \
+    crate://crates.io/linux-raw-sys/0.3.8 \
+    crate://crates.io/linux-raw-sys/0.4.3 \
+    crate://crates.io/log/0.4.19 \
+    crate://crates.io/memchr/2.5.0 \
+    crate://crates.io/num_enum/0.5.11 \
+    crate://crates.io/num_enum_derive/0.5.11 \
+    crate://crates.io/once_cell/1.18.0 \
+    crate://crates.io/proc-macro-crate/1.3.1 \
+    crate://crates.io/proc-macro2/1.0.63 \
+    crate://crates.io/quote/1.0.29 \
+    crate://crates.io/redox_syscall/0.3.5 \
+    crate://crates.io/regex/1.9.1 \
+    crate://crates.io/regex-automata/0.3.2 \
+    crate://crates.io/regex-syntax/0.7.4 \
+    crate://crates.io/rustix/0.37.23 \
+    crate://crates.io/rustix/0.38.3 \
+    crate://crates.io/strsim/0.10.0 \
+    crate://crates.io/syn/1.0.109 \
+    crate://crates.io/syn/2.0.23 \
+    crate://crates.io/tempfile/3.6.0 \
+    crate://crates.io/termcolor/1.2.0 \
+    crate://crates.io/thiserror/1.0.41 \
+    crate://crates.io/thiserror-impl/1.0.41 \
+    crate://crates.io/toml_datetime/0.6.3 \
+    crate://crates.io/toml_edit/0.19.12 \
+    crate://crates.io/unicode-ident/1.0.11 \
+    crate://crates.io/utf8parse/0.2.1 \
+    crate://crates.io/vhost/0.8.0 \
+    crate://crates.io/vhost-user-backend/0.10.0 \
+    crate://crates.io/virtio-bindings/0.2.1 \
+    crate://crates.io/virtio-queue/0.9.0 \
+    crate://crates.io/vm-memory/0.12.0 \
+    crate://crates.io/vmm-sys-util/0.11.1 \
+    crate://crates.io/winapi/0.3.9 \
+    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
+    crate://crates.io/winapi-util/0.1.5 \
+    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+    crate://crates.io/windows-sys/0.48.0 \
+    crate://crates.io/windows-targets/0.48.1 \
+    crate://crates.io/windows_aarch64_gnullvm/0.48.0 \
+    crate://crates.io/windows_aarch64_msvc/0.48.0 \
+    crate://crates.io/windows_i686_gnu/0.48.0 \
+    crate://crates.io/windows_i686_msvc/0.48.0 \
+    crate://crates.io/windows_x86_64_gnu/0.48.0 \
+    crate://crates.io/windows_x86_64_gnullvm/0.48.0 \
+    crate://crates.io/windows_x86_64_msvc/0.48.0 \
+    crate://crates.io/winnow/0.4.7 \
+"
+
+SRC_URI[aho-corasick-1.0.2.sha256sum] = "43f6cb1bf222025340178f382c426f13757b2960e89779dfcb319c32542a5a41"
+SRC_URI[anstream-0.3.2.sha256sum] = "0ca84f3628370c59db74ee214b3263d58f9aadd9b4fe7e711fd87dc452b7f163"
+SRC_URI[anstyle-1.0.1.sha256sum] = "3a30da5c5f2d5e72842e00bcb57657162cdabef0931f40e2deb9b4140440cecd"
+SRC_URI[anstyle-parse-0.2.1.sha256sum] = "938874ff5980b03a87c5524b3ae5b59cf99b1d6bc836848df7bc5ada9643c333"
+SRC_URI[anstyle-query-1.0.0.sha256sum] = "5ca11d4be1bab0c8bc8734a9aa7bf4ee8316d462a08c6ac5052f888fef5b494b"
+SRC_URI[anstyle-wincon-1.0.1.sha256sum] = "180abfa45703aebe0093f79badacc01b8fd4ea2e35118747e5811127f926e188"
+SRC_URI[arc-swap-1.6.0.sha256sum] = "bddcadddf5e9015d310179a59bb28c4d4b9920ad0f11e8e14dbadf654890c9a6"
+SRC_URI[assert_matches-1.5.0.sha256sum] = "9b34d609dfbaf33d6889b2b7106d3ca345eacad44200913df5ba02bfd31d2ba9"
+SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
+SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
+SRC_URI[bitflags-2.3.3.sha256sum] = "630be753d4e58660abd17930c71b647fe46c27ea6b63cc59e1e3851406972e42"
+SRC_URI[cc-1.0.79.sha256sum] = "50d30906286121d95be3d479533b458f87493b30a4b5f79a607db8f5d11aa91f"
+SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
+SRC_URI[clap-4.3.19.sha256sum] = "5fd304a20bff958a57f04c4e96a2e7594cc4490a0e809cbd48bb6437edaa452d"
+SRC_URI[clap_builder-4.3.19.sha256sum] = "01c6a3f08f1fe5662a35cfe393aec09c4df95f60ee93b7556505260f75eee9e1"
+SRC_URI[clap_derive-4.3.12.sha256sum] = "54a9bb5758fc5dfe728d1019941681eccaf0cf8a4189b692a0ee2f2ecf90a050"
+SRC_URI[clap_lex-0.5.0.sha256sum] = "2da6da31387c7e4ef160ffab6d5e7f00c42626fe39aea70a7b0f1773f7dd6c1b"
+SRC_URI[colorchoice-1.0.0.sha256sum] = "acbf1af155f9b9ef647e42cdc158db4b64a1b61f743629225fde6f3e0be2a7c7"
+SRC_URI[env_logger-0.10.0.sha256sum] = "85cdab6a89accf66733ad5a1693a4dcced6aeff64602b634530dd73c1f3ee9f0"
+SRC_URI[epoll-4.3.3.sha256sum] = "74351c3392ea1ff6cd2628e0042d268ac2371cb613252ff383b6dfa50d22fa79"
+SRC_URI[equivalent-1.0.0.sha256sum] = "88bffebc5d80432c9b140ee17875ff173a8ab62faad5b257da912bd2f6c1c0a1"
+SRC_URI[errno-0.3.1.sha256sum] = "4bcfec3a70f97c962c307b2d2c56e358cf1d00b558d74262b5f929ee8cc7e73a"
+SRC_URI[errno-dragonfly-0.1.2.sha256sum] = "aa68f1b12764fab894d2755d2518754e71b4fd80ecfb822714a1206c2aab39bf"
+SRC_URI[fastrand-1.9.0.sha256sum] = "e51093e27b0797c359783294ca4f0a911c270184cb10f85783b118614a1501be"
+SRC_URI[hashbrown-0.14.0.sha256sum] = "2c6201b9ff9fd90a5a3bac2e56a830d0caa509576f0e503818ee82c181b3437a"
+SRC_URI[heck-0.4.1.sha256sum] = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
+SRC_URI[hermit-abi-0.3.2.sha256sum] = "443144c8cdadd93ebf52ddb4056d257f5b52c04d3c804e657d19eb73fc33668b"
+SRC_URI[humantime-2.1.0.sha256sum] = "9a3a5bfb195931eeb336b2a7b4d761daec841b97f947d34394601737a7bba5e4"
+SRC_URI[indexmap-2.0.0.sha256sum] = "d5477fe2230a79769d8dc68e0eabf5437907c0457a5614a9e8dddb67f65eb65d"
+SRC_URI[instant-0.1.12.sha256sum] = "7a5bbe824c507c5da5956355e86a746d82e0e1464f65d862cc5e71da70e94b2c"
+SRC_URI[io-lifetimes-1.0.11.sha256sum] = "eae7b9aee968036d54dce06cebaefd919e4472e753296daccd6d344e3e2df0c2"
+SRC_URI[is-terminal-0.4.9.sha256sum] = "cb0889898416213fab133e1d33a0e5858a48177452750691bde3666d0fdbaf8b"
+SRC_URI[libc-0.2.147.sha256sum] = "b4668fb0ea861c1df094127ac5f1da3409a82116a4ba74fca2e58ef927159bb3"
+SRC_URI[linux-raw-sys-0.3.8.sha256sum] = "ef53942eb7bf7ff43a617b3e2c1c4a5ecf5944a7c1bc12d7ee39bbb15e5c1519"
+SRC_URI[linux-raw-sys-0.4.3.sha256sum] = "09fc20d2ca12cb9f044c93e3bd6d32d523e6e2ec3db4f7b2939cd99026ecd3f0"
+SRC_URI[log-0.4.19.sha256sum] = "b06a4cde4c0f271a446782e3eff8de789548ce57dbc8eca9292c27f4a42004b4"
+SRC_URI[memchr-2.5.0.sha256sum] = "2dffe52ecf27772e601905b7522cb4ef790d2cc203488bbd0e2fe85fcb74566d"
+SRC_URI[num_enum-0.5.11.sha256sum] = "1f646caf906c20226733ed5b1374287eb97e3c2a5c227ce668c1f2ce20ae57c9"
+SRC_URI[num_enum_derive-0.5.11.sha256sum] = "dcbff9bc912032c62bf65ef1d5aea88983b420f4f839db1e9b0c281a25c9c799"
+SRC_URI[once_cell-1.18.0.sha256sum] = "dd8b5dd2ae5ed71462c540258bedcb51965123ad7e7ccf4b9a8cafaa4a63576d"
+SRC_URI[proc-macro-crate-1.3.1.sha256sum] = "7f4c021e1093a56626774e81216a4ce732a735e5bad4868a03f3ed65ca0c3919"
+SRC_URI[proc-macro2-1.0.63.sha256sum] = "7b368fba921b0dce7e60f5e04ec15e565b3303972b42bcfde1d0713b881959eb"
+SRC_URI[quote-1.0.29.sha256sum] = "573015e8ab27661678357f27dc26460738fd2b6c86e46f386fde94cb5d913105"
+SRC_URI[redox_syscall-0.3.5.sha256sum] = "567664f262709473930a4bf9e51bf2ebf3348f2e748ccc50dea20646858f8f29"
+SRC_URI[regex-1.9.1.sha256sum] = "b2eae68fc220f7cf2532e4494aded17545fce192d59cd996e0fe7887f4ceb575"
+SRC_URI[regex-automata-0.3.2.sha256sum] = "83d3daa6976cffb758ec878f108ba0e062a45b2d6ca3a2cca965338855476caf"
+SRC_URI[regex-syntax-0.7.4.sha256sum] = "e5ea92a5b6195c6ef2a0295ea818b312502c6fc94dde986c5553242e18fd4ce2"
+SRC_URI[rustix-0.37.23.sha256sum] = "4d69718bf81c6127a49dc64e44a742e8bb9213c0ff8869a22c308f84c1d4ab06"
+SRC_URI[rustix-0.38.3.sha256sum] = "ac5ffa1efe7548069688cd7028f32591853cd7b5b756d41bcffd2353e4fc75b4"
+SRC_URI[strsim-0.10.0.sha256sum] = "73473c0e59e6d5812c5dfe2a064a6444949f089e20eec9a2e5506596494e4623"
+SRC_URI[syn-1.0.109.sha256sum] = "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237"
+SRC_URI[syn-2.0.23.sha256sum] = "59fb7d6d8281a51045d62b8eb3a7d1ce347b76f312af50cd3dc0af39c87c1737"
+SRC_URI[tempfile-3.6.0.sha256sum] = "31c0432476357e58790aaa47a8efb0c5138f137343f3b5f23bd36a27e3b0a6d6"
+SRC_URI[termcolor-1.2.0.sha256sum] = "be55cf8942feac5c765c2c993422806843c9a9a45d4d5c407ad6dd2ea95eb9b6"
+SRC_URI[thiserror-1.0.41.sha256sum] = "c16a64ba9387ef3fdae4f9c1a7f07a0997fce91985c0336f1ddc1822b3b37802"
+SRC_URI[thiserror-impl-1.0.41.sha256sum] = "d14928354b01c4d6a4f0e549069adef399a284e7995c7ccca94e8a07a5346c59"
+SRC_URI[toml_datetime-0.6.3.sha256sum] = "7cda73e2f1397b1262d6dfdcef8aafae14d1de7748d66822d3bfeeb6d03e5e4b"
+SRC_URI[toml_edit-0.19.12.sha256sum] = "c500344a19072298cd05a7224b3c0c629348b78692bf48466c5238656e315a78"
+SRC_URI[unicode-ident-1.0.11.sha256sum] = "301abaae475aa91687eb82514b328ab47a211a533026cb25fc3e519b86adfc3c"
+SRC_URI[utf8parse-0.2.1.sha256sum] = "711b9620af191e0cdc7468a8d14e709c3dcdb115b36f838e601583af800a370a"
+SRC_URI[vhost-0.8.0.sha256sum] = "73832f4d8d636d63d9b145e8ef22a2c50b93f4d24eb7a99c9e6781b1b08549cf"
+SRC_URI[vhost-user-backend-0.10.0.sha256sum] = "e3ea9d5e8ec847cde4df1c04e586698a479706fd6beca37323f9d425b24b4c2f"
+SRC_URI[virtio-bindings-0.2.1.sha256sum] = "c18d7b74098a946470ea265b5bacbbf877abc3373021388454de0d47735a5b98"
+SRC_URI[virtio-queue-0.9.0.sha256sum] = "35aca00da06841bd99162c381ec65893cace23ca0fb89254302cfe4bec4c300f"
+SRC_URI[vm-memory-0.12.0.sha256sum] = "a77c7a0891cbac53618f5f6eec650ed1dc4f7e506bbe14877aff49d94b8408b0"
+SRC_URI[vmm-sys-util-0.11.1.sha256sum] = "dd64fe09d8e880e600c324e7d664760a17f56e9672b7495a86381b49e4f72f46"
+SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
+SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
+SRC_URI[winapi-util-0.1.5.sha256sum] = "70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178"
+SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
+SRC_URI[windows-sys-0.48.0.sha256sum] = "677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9"
+SRC_URI[windows-targets-0.48.1.sha256sum] = "05d4b17490f70499f20b9e791dcf6a299785ce8af4d709018206dc5b4953e95f"
+SRC_URI[windows_aarch64_gnullvm-0.48.0.sha256sum] = "91ae572e1b79dba883e0d315474df7305d12f569b400fcf90581b06062f7e1bc"
+SRC_URI[windows_aarch64_msvc-0.48.0.sha256sum] = "b2ef27e0d7bdfcfc7b868b317c1d32c641a6fe4629c171b8928c7b08d98d7cf3"
+SRC_URI[windows_i686_gnu-0.48.0.sha256sum] = "622a1962a7db830d6fd0a69683c80a18fda201879f0f447f065a3b7467daa241"
+SRC_URI[windows_i686_msvc-0.48.0.sha256sum] = "4542c6e364ce21bf45d69fdd2a8e455fa38d316158cfd43b3ac1c5b1b19f8e00"
+SRC_URI[windows_x86_64_gnu-0.48.0.sha256sum] = "ca2b8a661f7628cbd23440e50b05d705db3686f894fc9580820623656af974b1"
+SRC_URI[windows_x86_64_gnullvm-0.48.0.sha256sum] = "7896dbc1f41e08872e9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953"
+SRC_URI[windows_x86_64_msvc-0.48.0.sha256sum] = "1a515f5799fe4961cb532f983ce2b23082366b898e52ffbce459c86f67c8378a"
+SRC_URI[winnow-0.4.7.sha256sum] = "ca0ace3845f0d96209f0375e6d367e3eb87eb65d27d445bdc9f1843a26f39448"
diff --git a/recipes-extended/vhost-device/vhost-device-scsi_0.1.0.bb b/recipes-extended/vhost-device/vhost-device-scsi_0.1.0.bb
new file mode 100644
index 0000000..6c9b49f
--- /dev/null
+++ b/recipes-extended/vhost-device/vhost-device-scsi_0.1.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "vhost scsi backend device"
+DESCRIPTION = "A vhost-user backend that emulates a VirtIO SCSI block device"
+HOMEPAGE = "https://github.com/rust-vmm/vhost-device"
+LICENSE = "Apache-2.0 | BSD-3-Clause"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE-APACHE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
+    file://LICENSE-BSD-3-Clause;md5=2489db1359f496fff34bd393df63947e \
+"
+
+SRC_URI += "crate://crates.io/vhost-device-scsi/0.1.0"
+SRC_URI[vhost-device-scsi-0.1.0.sha256sum] = "85e4abd5a07cb6abfe07b92e49c5cc81437058d7ec7beea441039e829cf82c22"
+
+inherit cargo
+inherit cargo-update-recipe-crates
+
+include vhost-device-scsi-crates.inc
diff --git a/recipes-extended/vhost-device/vhost-device-vsock-crates.inc b/recipes-extended/vhost-device/vhost-device-vsock-crates.inc
new file mode 100644
index 0000000..4ea2baa
--- /dev/null
+++ b/recipes-extended/vhost-device/vhost-device-vsock-crates.inc
@@ -0,0 +1,258 @@
+# Autogenerated with 'bitbake -c update_crates vhost-device-vsock'
+
+# from Cargo.lock
+SRC_URI += " \
+    crate://crates.io/ahash/0.7.6 \
+    crate://crates.io/aho-corasick/1.0.2 \
+    crate://crates.io/anstream/0.3.2 \
+    crate://crates.io/anstyle/1.0.1 \
+    crate://crates.io/anstyle-parse/0.2.1 \
+    crate://crates.io/anstyle-query/1.0.0 \
+    crate://crates.io/anstyle-wincon/1.0.1 \
+    crate://crates.io/arc-swap/1.6.0 \
+    crate://crates.io/async-trait/0.1.71 \
+    crate://crates.io/autocfg/1.1.0 \
+    crate://crates.io/base64/0.13.1 \
+    crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/bitflags/2.3.3 \
+    crate://crates.io/block-buffer/0.10.4 \
+    crate://crates.io/byteorder/1.4.3 \
+    crate://crates.io/cc/1.0.79 \
+    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/clap/4.3.19 \
+    crate://crates.io/clap_builder/4.3.19 \
+    crate://crates.io/clap_derive/4.3.12 \
+    crate://crates.io/clap_lex/0.5.0 \
+    crate://crates.io/colorchoice/1.0.0 \
+    crate://crates.io/config/0.13.3 \
+    crate://crates.io/cpufeatures/0.2.9 \
+    crate://crates.io/crypto-common/0.1.6 \
+    crate://crates.io/digest/0.10.7 \
+    crate://crates.io/dlv-list/0.3.0 \
+    crate://crates.io/env_logger/0.10.0 \
+    crate://crates.io/epoll/4.3.3 \
+    crate://crates.io/equivalent/1.0.0 \
+    crate://crates.io/errno/0.3.1 \
+    crate://crates.io/errno-dragonfly/0.1.2 \
+    crate://crates.io/fastrand/1.9.0 \
+    crate://crates.io/futures/0.3.28 \
+    crate://crates.io/futures-channel/0.3.28 \
+    crate://crates.io/futures-core/0.3.28 \
+    crate://crates.io/futures-executor/0.3.28 \
+    crate://crates.io/futures-io/0.3.28 \
+    crate://crates.io/futures-macro/0.3.28 \
+    crate://crates.io/futures-sink/0.3.28 \
+    crate://crates.io/futures-task/0.3.28 \
+    crate://crates.io/futures-util/0.3.28 \
+    crate://crates.io/generic-array/0.14.7 \
+    crate://crates.io/getrandom/0.2.10 \
+    crate://crates.io/hashbrown/0.12.3 \
+    crate://crates.io/hashbrown/0.14.0 \
+    crate://crates.io/heck/0.4.1 \
+    crate://crates.io/hermit-abi/0.3.2 \
+    crate://crates.io/humantime/2.1.0 \
+    crate://crates.io/indexmap/2.0.0 \
+    crate://crates.io/instant/0.1.12 \
+    crate://crates.io/io-lifetimes/1.0.11 \
+    crate://crates.io/is-terminal/0.4.9 \
+    crate://crates.io/itoa/1.0.8 \
+    crate://crates.io/json5/0.4.1 \
+    crate://crates.io/lazy_static/1.4.0 \
+    crate://crates.io/libc/0.2.147 \
+    crate://crates.io/linked-hash-map/0.5.6 \
+    crate://crates.io/linux-raw-sys/0.3.8 \
+    crate://crates.io/linux-raw-sys/0.4.3 \
+    crate://crates.io/log/0.4.19 \
+    crate://crates.io/memchr/2.5.0 \
+    crate://crates.io/minimal-lexical/0.2.1 \
+    crate://crates.io/nom/7.1.3 \
+    crate://crates.io/num_cpus/1.16.0 \
+    crate://crates.io/once_cell/1.18.0 \
+    crate://crates.io/ordered-multimap/0.4.3 \
+    crate://crates.io/pathdiff/0.2.1 \
+    crate://crates.io/pest/2.7.1 \
+    crate://crates.io/pest_derive/2.7.0 \
+    crate://crates.io/pest_generator/2.7.0 \
+    crate://crates.io/pest_meta/2.7.0 \
+    crate://crates.io/pin-project-lite/0.2.10 \
+    crate://crates.io/pin-utils/0.1.0 \
+    crate://crates.io/proc-macro2/1.0.63 \
+    crate://crates.io/quote/1.0.29 \
+    crate://crates.io/redox_syscall/0.3.5 \
+    crate://crates.io/regex/1.9.1 \
+    crate://crates.io/regex-automata/0.3.2 \
+    crate://crates.io/regex-syntax/0.7.4 \
+    crate://crates.io/ron/0.7.1 \
+    crate://crates.io/rust-ini/0.18.0 \
+    crate://crates.io/rustix/0.37.23 \
+    crate://crates.io/rustix/0.38.3 \
+    crate://crates.io/ryu/1.0.15 \
+    crate://crates.io/serde/1.0.168 \
+    crate://crates.io/serde_derive/1.0.168 \
+    crate://crates.io/serde_json/1.0.100 \
+    crate://crates.io/serde_yaml/0.9.22 \
+    crate://crates.io/sha2/0.10.7 \
+    crate://crates.io/slab/0.4.8 \
+    crate://crates.io/strsim/0.10.0 \
+    crate://crates.io/syn/2.0.23 \
+    crate://crates.io/tempfile/3.6.0 \
+    crate://crates.io/termcolor/1.2.0 \
+    crate://crates.io/thiserror/1.0.41 \
+    crate://crates.io/thiserror-impl/1.0.41 \
+    crate://crates.io/toml/0.5.11 \
+    crate://crates.io/typenum/1.16.0 \
+    crate://crates.io/ucd-trie/0.1.6 \
+    crate://crates.io/unicode-ident/1.0.11 \
+    crate://crates.io/unsafe-libyaml/0.2.8 \
+    crate://crates.io/utf8parse/0.2.1 \
+    crate://crates.io/version_check/0.9.4 \
+    crate://crates.io/vhost/0.8.0 \
+    crate://crates.io/vhost-user-backend/0.10.0 \
+    crate://crates.io/virtio-bindings/0.2.1 \
+    crate://crates.io/virtio-queue/0.9.0 \
+    crate://crates.io/virtio-vsock/0.3.1 \
+    crate://crates.io/vm-memory/0.12.0 \
+    crate://crates.io/vmm-sys-util/0.11.1 \
+    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
+    crate://crates.io/winapi/0.3.9 \
+    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
+    crate://crates.io/winapi-util/0.1.5 \
+    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+    crate://crates.io/windows-sys/0.48.0 \
+    crate://crates.io/windows-targets/0.48.1 \
+    crate://crates.io/windows_aarch64_gnullvm/0.48.0 \
+    crate://crates.io/windows_aarch64_msvc/0.48.0 \
+    crate://crates.io/windows_i686_gnu/0.48.0 \
+    crate://crates.io/windows_i686_msvc/0.48.0 \
+    crate://crates.io/windows_x86_64_gnu/0.48.0 \
+    crate://crates.io/windows_x86_64_gnullvm/0.48.0 \
+    crate://crates.io/windows_x86_64_msvc/0.48.0 \
+    crate://crates.io/yaml-rust/0.4.5 \
+"
+
+SRC_URI[ahash-0.7.6.sha256sum] = "fcb51a0695d8f838b1ee009b3fbf66bda078cd64590202a864a8f3e8c4315c47"
+SRC_URI[aho-corasick-1.0.2.sha256sum] = "43f6cb1bf222025340178f382c426f13757b2960e89779dfcb319c32542a5a41"
+SRC_URI[anstream-0.3.2.sha256sum] = "0ca84f3628370c59db74ee214b3263d58f9aadd9b4fe7e711fd87dc452b7f163"
+SRC_URI[anstyle-1.0.1.sha256sum] = "3a30da5c5f2d5e72842e00bcb57657162cdabef0931f40e2deb9b4140440cecd"
+SRC_URI[anstyle-parse-0.2.1.sha256sum] = "938874ff5980b03a87c5524b3ae5b59cf99b1d6bc836848df7bc5ada9643c333"
+SRC_URI[anstyle-query-1.0.0.sha256sum] = "5ca11d4be1bab0c8bc8734a9aa7bf4ee8316d462a08c6ac5052f888fef5b494b"
+SRC_URI[anstyle-wincon-1.0.1.sha256sum] = "180abfa45703aebe0093f79badacc01b8fd4ea2e35118747e5811127f926e188"
+SRC_URI[arc-swap-1.6.0.sha256sum] = "bddcadddf5e9015d310179a59bb28c4d4b9920ad0f11e8e14dbadf654890c9a6"
+SRC_URI[async-trait-0.1.71.sha256sum] = "a564d521dd56509c4c47480d00b80ee55f7e385ae48db5744c67ad50c92d2ebf"
+SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
+SRC_URI[base64-0.13.1.sha256sum] = "9e1b586273c5702936fe7b7d6896644d8be71e6314cfe09d3167c95f712589e8"
+SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
+SRC_URI[bitflags-2.3.3.sha256sum] = "630be753d4e58660abd17930c71b647fe46c27ea6b63cc59e1e3851406972e42"
+SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
+SRC_URI[byteorder-1.4.3.sha256sum] = "14c189c53d098945499cdfa7ecc63567cf3886b3332b312a5b4585d8d3a6a610"
+SRC_URI[cc-1.0.79.sha256sum] = "50d30906286121d95be3d479533b458f87493b30a4b5f79a607db8f5d11aa91f"
+SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
+SRC_URI[clap-4.3.19.sha256sum] = "5fd304a20bff958a57f04c4e96a2e7594cc4490a0e809cbd48bb6437edaa452d"
+SRC_URI[clap_builder-4.3.19.sha256sum] = "01c6a3f08f1fe5662a35cfe393aec09c4df95f60ee93b7556505260f75eee9e1"
+SRC_URI[clap_derive-4.3.12.sha256sum] = "54a9bb5758fc5dfe728d1019941681eccaf0cf8a4189b692a0ee2f2ecf90a050"
+SRC_URI[clap_lex-0.5.0.sha256sum] = "2da6da31387c7e4ef160ffab6d5e7f00c42626fe39aea70a7b0f1773f7dd6c1b"
+SRC_URI[colorchoice-1.0.0.sha256sum] = "acbf1af155f9b9ef647e42cdc158db4b64a1b61f743629225fde6f3e0be2a7c7"
+SRC_URI[config-0.13.3.sha256sum] = "d379af7f68bfc21714c6c7dea883544201741d2ce8274bb12fa54f89507f52a7"
+SRC_URI[cpufeatures-0.2.9.sha256sum] = "a17b76ff3a4162b0b27f354a0c87015ddad39d35f9c0c36607a3bdd175dde1f1"
+SRC_URI[crypto-common-0.1.6.sha256sum] = "1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3"
+SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
+SRC_URI[dlv-list-0.3.0.sha256sum] = "0688c2a7f92e427f44895cd63841bff7b29f8d7a1648b9e7e07a4a365b2e1257"
+SRC_URI[env_logger-0.10.0.sha256sum] = "85cdab6a89accf66733ad5a1693a4dcced6aeff64602b634530dd73c1f3ee9f0"
+SRC_URI[epoll-4.3.3.sha256sum] = "74351c3392ea1ff6cd2628e0042d268ac2371cb613252ff383b6dfa50d22fa79"
+SRC_URI[equivalent-1.0.0.sha256sum] = "88bffebc5d80432c9b140ee17875ff173a8ab62faad5b257da912bd2f6c1c0a1"
+SRC_URI[errno-0.3.1.sha256sum] = "4bcfec3a70f97c962c307b2d2c56e358cf1d00b558d74262b5f929ee8cc7e73a"
+SRC_URI[errno-dragonfly-0.1.2.sha256sum] = "aa68f1b12764fab894d2755d2518754e71b4fd80ecfb822714a1206c2aab39bf"
+SRC_URI[fastrand-1.9.0.sha256sum] = "e51093e27b0797c359783294ca4f0a911c270184cb10f85783b118614a1501be"
+SRC_URI[futures-0.3.28.sha256sum] = "23342abe12aba583913b2e62f22225ff9c950774065e4bfb61a19cd9770fec40"
+SRC_URI[futures-channel-0.3.28.sha256sum] = "955518d47e09b25bbebc7a18df10b81f0c766eaf4c4f1cccef2fca5f2a4fb5f2"
+SRC_URI[futures-core-0.3.28.sha256sum] = "4bca583b7e26f571124fe5b7561d49cb2868d79116cfa0eefce955557c6fee8c"
+SRC_URI[futures-executor-0.3.28.sha256sum] = "ccecee823288125bd88b4d7f565c9e58e41858e47ab72e8ea2d64e93624386e0"
+SRC_URI[futures-io-0.3.28.sha256sum] = "4fff74096e71ed47f8e023204cfd0aa1289cd54ae5430a9523be060cdb849964"
+SRC_URI[futures-macro-0.3.28.sha256sum] = "89ca545a94061b6365f2c7355b4b32bd20df3ff95f02da9329b34ccc3bd6ee72"
+SRC_URI[futures-sink-0.3.28.sha256sum] = "f43be4fe21a13b9781a69afa4985b0f6ee0e1afab2c6f454a8cf30e2b2237b6e"
+SRC_URI[futures-task-0.3.28.sha256sum] = "76d3d132be6c0e6aa1534069c705a74a5997a356c0dc2f86a47765e5617c5b65"
+SRC_URI[futures-util-0.3.28.sha256sum] = "26b01e40b772d54cf6c6d721c1d1abd0647a0106a12ecaa1c186273392a69533"
+SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
+SRC_URI[getrandom-0.2.10.sha256sum] = "be4136b2a15dd319360be1c07d9933517ccf0be8f16bf62a3bee4f0d618df427"
+SRC_URI[hashbrown-0.12.3.sha256sum] = "8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae78fe8272889ac888"
+SRC_URI[hashbrown-0.14.0.sha256sum] = "2c6201b9ff9fd90a5a3bac2e56a830d0caa509576f0e503818ee82c181b3437a"
+SRC_URI[heck-0.4.1.sha256sum] = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
+SRC_URI[hermit-abi-0.3.2.sha256sum] = "443144c8cdadd93ebf52ddb4056d257f5b52c04d3c804e657d19eb73fc33668b"
+SRC_URI[humantime-2.1.0.sha256sum] = "9a3a5bfb195931eeb336b2a7b4d761daec841b97f947d34394601737a7bba5e4"
+SRC_URI[indexmap-2.0.0.sha256sum] = "d5477fe2230a79769d8dc68e0eabf5437907c0457a5614a9e8dddb67f65eb65d"
+SRC_URI[instant-0.1.12.sha256sum] = "7a5bbe824c507c5da5956355e86a746d82e0e1464f65d862cc5e71da70e94b2c"
+SRC_URI[io-lifetimes-1.0.11.sha256sum] = "eae7b9aee968036d54dce06cebaefd919e4472e753296daccd6d344e3e2df0c2"
+SRC_URI[is-terminal-0.4.9.sha256sum] = "cb0889898416213fab133e1d33a0e5858a48177452750691bde3666d0fdbaf8b"
+SRC_URI[itoa-1.0.8.sha256sum] = "62b02a5381cc465bd3041d84623d0fa3b66738b52b8e2fc3bab8ad63ab032f4a"
+SRC_URI[json5-0.4.1.sha256sum] = "96b0db21af676c1ce64250b5f40f3ce2cf27e4e47cb91ed91eb6fe9350b430c1"
+SRC_URI[lazy_static-1.4.0.sha256sum] = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646"
+SRC_URI[libc-0.2.147.sha256sum] = "b4668fb0ea861c1df094127ac5f1da3409a82116a4ba74fca2e58ef927159bb3"
+SRC_URI[linked-hash-map-0.5.6.sha256sum] = "0717cef1bc8b636c6e1c1bbdefc09e6322da8a9321966e8928ef80d20f7f770f"
+SRC_URI[linux-raw-sys-0.3.8.sha256sum] = "ef53942eb7bf7ff43a617b3e2c1c4a5ecf5944a7c1bc12d7ee39bbb15e5c1519"
+SRC_URI[linux-raw-sys-0.4.3.sha256sum] = "09fc20d2ca12cb9f044c93e3bd6d32d523e6e2ec3db4f7b2939cd99026ecd3f0"
+SRC_URI[log-0.4.19.sha256sum] = "b06a4cde4c0f271a446782e3eff8de789548ce57dbc8eca9292c27f4a42004b4"
+SRC_URI[memchr-2.5.0.sha256sum] = "2dffe52ecf27772e601905b7522cb4ef790d2cc203488bbd0e2fe85fcb74566d"
+SRC_URI[minimal-lexical-0.2.1.sha256sum] = "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a"
+SRC_URI[nom-7.1.3.sha256sum] = "d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a"
+SRC_URI[num_cpus-1.16.0.sha256sum] = "4161fcb6d602d4d2081af7c3a45852d875a03dd337a6bfdd6e06407b61342a43"
+SRC_URI[once_cell-1.18.0.sha256sum] = "dd8b5dd2ae5ed71462c540258bedcb51965123ad7e7ccf4b9a8cafaa4a63576d"
+SRC_URI[ordered-multimap-0.4.3.sha256sum] = "ccd746e37177e1711c20dd619a1620f34f5c8b569c53590a72dedd5344d8924a"
+SRC_URI[pathdiff-0.2.1.sha256sum] = "8835116a5c179084a830efb3adc117ab007512b535bc1a21c991d3b32a6b44dd"
+SRC_URI[pest-2.7.1.sha256sum] = "0d2d1d55045829d65aad9d389139882ad623b33b904e7c9f1b10c5b8927298e5"
+SRC_URI[pest_derive-2.7.0.sha256sum] = "aef623c9bbfa0eedf5a0efba11a5ee83209c326653ca31ff019bec3a95bfff2b"
+SRC_URI[pest_generator-2.7.0.sha256sum] = "b3e8cba4ec22bada7fc55ffe51e2deb6a0e0db2d0b7ab0b103acc80d2510c190"
+SRC_URI[pest_meta-2.7.0.sha256sum] = "a01f71cb40bd8bb94232df14b946909e14660e33fc05db3e50ae2a82d7ea0ca0"
+SRC_URI[pin-project-lite-0.2.10.sha256sum] = "4c40d25201921e5ff0c862a505c6557ea88568a4e3ace775ab55e93f2f4f9d57"
+SRC_URI[pin-utils-0.1.0.sha256sum] = "8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184"
+SRC_URI[proc-macro2-1.0.63.sha256sum] = "7b368fba921b0dce7e60f5e04ec15e565b3303972b42bcfde1d0713b881959eb"
+SRC_URI[quote-1.0.29.sha256sum] = "573015e8ab27661678357f27dc26460738fd2b6c86e46f386fde94cb5d913105"
+SRC_URI[redox_syscall-0.3.5.sha256sum] = "567664f262709473930a4bf9e51bf2ebf3348f2e748ccc50dea20646858f8f29"
+SRC_URI[regex-1.9.1.sha256sum] = "b2eae68fc220f7cf2532e4494aded17545fce192d59cd996e0fe7887f4ceb575"
+SRC_URI[regex-automata-0.3.2.sha256sum] = "83d3daa6976cffb758ec878f108ba0e062a45b2d6ca3a2cca965338855476caf"
+SRC_URI[regex-syntax-0.7.4.sha256sum] = "e5ea92a5b6195c6ef2a0295ea818b312502c6fc94dde986c5553242e18fd4ce2"
+SRC_URI[ron-0.7.1.sha256sum] = "88073939a61e5b7680558e6be56b419e208420c2adb92be54921fa6b72283f1a"
+SRC_URI[rust-ini-0.18.0.sha256sum] = "f6d5f2436026b4f6e79dc829837d467cc7e9a55ee40e750d716713540715a2df"
+SRC_URI[rustix-0.37.23.sha256sum] = "4d69718bf81c6127a49dc64e44a742e8bb9213c0ff8869a22c308f84c1d4ab06"
+SRC_URI[rustix-0.38.3.sha256sum] = "ac5ffa1efe7548069688cd7028f32591853cd7b5b756d41bcffd2353e4fc75b4"
+SRC_URI[ryu-1.0.15.sha256sum] = "1ad4cc8da4ef723ed60bced201181d83791ad433213d8c24efffda1eec85d741"
+SRC_URI[serde-1.0.168.sha256sum] = "d614f89548720367ded108b3c843be93f3a341e22d5674ca0dd5cd57f34926af"
+SRC_URI[serde_derive-1.0.168.sha256sum] = "d4fe589678c688e44177da4f27152ee2d190757271dc7f1d5b6b9f68d869d641"
+SRC_URI[serde_json-1.0.100.sha256sum] = "0f1e14e89be7aa4c4b78bdbdc9eb5bf8517829a600ae8eaa39a6e1d960b5185c"
+SRC_URI[serde_yaml-0.9.22.sha256sum] = "452e67b9c20c37fa79df53201dc03839651086ed9bbe92b3ca585ca9fdaa7d85"
+SRC_URI[sha2-0.10.7.sha256sum] = "479fb9d862239e610720565ca91403019f2f00410f1864c5aa7479b950a76ed8"
+SRC_URI[slab-0.4.8.sha256sum] = "6528351c9bc8ab22353f9d776db39a20288e8d6c37ef8cfe3317cf875eecfc2d"
+SRC_URI[strsim-0.10.0.sha256sum] = "73473c0e59e6d5812c5dfe2a064a6444949f089e20eec9a2e5506596494e4623"
+SRC_URI[syn-2.0.23.sha256sum] = "59fb7d6d8281a51045d62b8eb3a7d1ce347b76f312af50cd3dc0af39c87c1737"
+SRC_URI[tempfile-3.6.0.sha256sum] = "31c0432476357e58790aaa47a8efb0c5138f137343f3b5f23bd36a27e3b0a6d6"
+SRC_URI[termcolor-1.2.0.sha256sum] = "be55cf8942feac5c765c2c993422806843c9a9a45d4d5c407ad6dd2ea95eb9b6"
+SRC_URI[thiserror-1.0.41.sha256sum] = "c16a64ba9387ef3fdae4f9c1a7f07a0997fce91985c0336f1ddc1822b3b37802"
+SRC_URI[thiserror-impl-1.0.41.sha256sum] = "d14928354b01c4d6a4f0e549069adef399a284e7995c7ccca94e8a07a5346c59"
+SRC_URI[toml-0.5.11.sha256sum] = "f4f7f0dd8d50a853a531c426359045b1998f04219d88799810762cd4ad314234"
+SRC_URI[typenum-1.16.0.sha256sum] = "497961ef93d974e23eb6f433eb5fe1b7930b659f06d12dec6fc44a8f554c0bba"
+SRC_URI[ucd-trie-0.1.6.sha256sum] = "ed646292ffc8188ef8ea4d1e0e0150fb15a5c2e12ad9b8fc191ae7a8a7f3c4b9"
+SRC_URI[unicode-ident-1.0.11.sha256sum] = "301abaae475aa91687eb82514b328ab47a211a533026cb25fc3e519b86adfc3c"
+SRC_URI[unsafe-libyaml-0.2.8.sha256sum] = "1865806a559042e51ab5414598446a5871b561d21b6764f2eabb0dd481d880a6"
+SRC_URI[utf8parse-0.2.1.sha256sum] = "711b9620af191e0cdc7468a8d14e709c3dcdb115b36f838e601583af800a370a"
+SRC_URI[version_check-0.9.4.sha256sum] = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
+SRC_URI[vhost-0.8.0.sha256sum] = "73832f4d8d636d63d9b145e8ef22a2c50b93f4d24eb7a99c9e6781b1b08549cf"
+SRC_URI[vhost-user-backend-0.10.0.sha256sum] = "e3ea9d5e8ec847cde4df1c04e586698a479706fd6beca37323f9d425b24b4c2f"
+SRC_URI[virtio-bindings-0.2.1.sha256sum] = "c18d7b74098a946470ea265b5bacbbf877abc3373021388454de0d47735a5b98"
+SRC_URI[virtio-queue-0.9.0.sha256sum] = "35aca00da06841bd99162c381ec65893cace23ca0fb89254302cfe4bec4c300f"
+SRC_URI[virtio-vsock-0.3.1.sha256sum] = "c92d1d0c0db339e03dc275e86e5de2654ed94b351f02d405a3a0260dfc1b839f"
+SRC_URI[vm-memory-0.12.0.sha256sum] = "a77c7a0891cbac53618f5f6eec650ed1dc4f7e506bbe14877aff49d94b8408b0"
+SRC_URI[vmm-sys-util-0.11.1.sha256sum] = "dd64fe09d8e880e600c324e7d664760a17f56e9672b7495a86381b49e4f72f46"
+SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
+SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
+SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
+SRC_URI[winapi-util-0.1.5.sha256sum] = "70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178"
+SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
+SRC_URI[windows-sys-0.48.0.sha256sum] = "677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9"
+SRC_URI[windows-targets-0.48.1.sha256sum] = "05d4b17490f70499f20b9e791dcf6a299785ce8af4d709018206dc5b4953e95f"
+SRC_URI[windows_aarch64_gnullvm-0.48.0.sha256sum] = "91ae572e1b79dba883e0d315474df7305d12f569b400fcf90581b06062f7e1bc"
+SRC_URI[windows_aarch64_msvc-0.48.0.sha256sum] = "b2ef27e0d7bdfcfc7b868b317c1d32c641a6fe4629c171b8928c7b08d98d7cf3"
+SRC_URI[windows_i686_gnu-0.48.0.sha256sum] = "622a1962a7db830d6fd0a69683c80a18fda201879f0f447f065a3b7467daa241"
+SRC_URI[windows_i686_msvc-0.48.0.sha256sum] = "4542c6e364ce21bf45d69fdd2a8e455fa38d316158cfd43b3ac1c5b1b19f8e00"
+SRC_URI[windows_x86_64_gnu-0.48.0.sha256sum] = "ca2b8a661f7628cbd23440e50b05d705db3686f894fc9580820623656af974b1"
+SRC_URI[windows_x86_64_gnullvm-0.48.0.sha256sum] = "7896dbc1f41e08872e9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953"
+SRC_URI[windows_x86_64_msvc-0.48.0.sha256sum] = "1a515f5799fe4961cb532f983ce2b23082366b898e52ffbce459c86f67c8378a"
+SRC_URI[yaml-rust-0.4.5.sha256sum] = "56c1936c4cc7a1c9ab21a1ebb602eb942ba868cbd44a99cb7cdc5892335e1c85"
diff --git a/recipes-extended/vhost-device/vhost-device-vsock_0.1.0.bb b/recipes-extended/vhost-device/vhost-device-vsock_0.1.0.bb
new file mode 100644
index 0000000..12ef88f
--- /dev/null
+++ b/recipes-extended/vhost-device/vhost-device-vsock_0.1.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "vhost vsock backend device"
+DESCRIPTION = "A vhost-user backend that emulates a VirtIO socket device"
+HOMEPAGE = "https://github.com/rust-vmm/vhost-device"
+LICENSE = "Apache-2.0 | BSD-3-Clause"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE-APACHE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
+    file://LICENSE-BSD-3-Clause;md5=2489db1359f496fff34bd393df63947e \
+"
+
+SRC_URI += "crate://crates.io/vhost-device-vsock/0.1.0"
+SRC_URI[vhost-device-vsock-0.1.0.sha256sum] = "b1b22596359e46c3986574707a0f616c6e200a6751adeaa353db8cfdbc0472f6"
+
+inherit cargo
+inherit cargo-update-recipe-crates
+
+include vhost-device-vsock-crates.inc

---
base-commit: 5bb2ad0d25969f93964c7870ebafeab92271013f
change-id: 20230728-vhost-device-2dc9633034cb

Best regards,
-- 
Erik Schilling <erik.schilling@linaro.org>


