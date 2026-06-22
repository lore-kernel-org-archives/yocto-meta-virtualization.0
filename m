Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCBAECD98F2
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 20:49:32 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6933.1782161364167264617
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 13:49:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=tDO0sA3S;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8dfd7b11e1eso20194736d6.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Jun 2026 13:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782161363; x=1782766163; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41JbcAYk6zT7bx1fxjT9n5/Kxk2r7RSu7asGhrHslv8=;
        b=tDO0sA3SkiSTTBsVspAdip1c32W1olddQBEW4QaCC7FKZgzVX3/RNgIyE9Aa5h1H0t
         J0Bwe7IiviF0YrN+WSPnjzhoOFUxc1WipQCYgQsGYuZmK1Izgk4b/rzdY0Q/szjurPmY
         /doBION8Rm7qb/MT55q838d+SXWkC+ePluDBb/q6iA7NlQeMH3uanpEtaXAWGgLDP1bU
         vrd0+e+W7apTsE0qSka6WrE3zlnS/l2PL2gbHDY5VsIHFTmD3NEgmYwpZTbnTVJX/Dkd
         xP910HDqfDFYDfdplbUk42nO1m+uMDzjY/qEnQZvOmG25dvhbABpDVrIL1w6pbupQpeu
         zXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782161363; x=1782766163;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=41JbcAYk6zT7bx1fxjT9n5/Kxk2r7RSu7asGhrHslv8=;
        b=E9t+oJoJfMi3MpI7yJ576nC6AHipj8Q+fK8Fv/JJ5mBDz3h6T40mrZctpyyuCLo2W9
         OqoIvuspgc011TvvuxONrslJzOyusmyerGxeiiLVCTtZmRQoepG/GtAjZak/1m6dQmBg
         EX6rISYBnK2TIjQV+v2nMWukIQ1TXBnd1jwmbIprWzYVkk7ujfiyzgg5pPh7IMqWX6AM
         CLOH9qdQN41WLV51szCOzPGIKHFUURjzFFD293uzJUzSUMp3Ex5OHBDSPA3T10B0p7OS
         HwhnbVbyHe23MtWCfdwvqn7brGR5lL+YeaanGIp8b6fCHre3U/mXe5RrRnQX3jDnmuaN
         ZQvQ==
X-Forwarded-Encrypted: i=1; AHgh+RogzQiTS8OhjTcSa/YxuwLP0i6IqXeXbRSiCXmsI/DtNXXfPnatvS3a3d6ySiuUgZJxM8nn3vc1UXqYdtVY35wUUNTI@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzOZYRpPPPuzC4qtmClxQnEamwDrqC0nhnDPsi6SzyXRy3hpF+l
	iUBxZQCDC0VbtGbTyHYeF09R6J1/4hB/aqLyQ6MpXbHDd8NeM3uv2UEZ
X-Gm-Gg: AfdE7ckfAaI7zM+m9sKWYOvOy5DF7dISd/4gek13TRuSkva7v2hibMBj9yorUqUMeC8
	RhGeUPhTe6A0w+eoj4HLY8/av4NHnDhZ9p+4QRmUi0leRcLFMmXXRszwJDAYBCScGk37/SrG8N0
	3f6bkxbEF3mX1hPIkhEc5HSo34u/Zc2zBq5IEpXc2P2EpEECdeGWiFKG4hp3SC/QdKjfBeX1cjo
	W1xJUYX3egArvLW9AmQbrjiBSeEmWMXPpliEwpvxAwp46HBj+/tbo3LsZSlq1TTpjDUa63HTnQm
	R+AXdO9QEHJMb6fZQBlN6qlMaCtd+oorIdApe8wojJemdxgQPNlfG9D8dZiKHIVcCzXWjAetSog
	0xqDl1CGZYJMJMFxKThLZVnfedU2iGheBzNXAW/aCRxFVZBG9znvUHFeChmah2S+qye1QIs/hoF
	UVwbmxcXc7U+NfZuRhmeQmDzkFwnDYZP87Utmvv5gO0PpCo6TmHAQ6g5473dXMH2U7GQBbqxi5q
	1/uS7asEU61RfiOYE3ic7n78yVaiYyTY+m7ad8Fr+t/4HjOcLme/Li2Ors9f6zZTU7dDR0/Rb6Q
	Ae3x/HI8hf46HA==
X-Received: by 2002:a05:6214:600e:b0:8ca:164c:a85c with SMTP id 6a1803df08f44-8de407172eemr260968486d6.34.1782161362886;
        Mon, 22 Jun 2026 13:49:22 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df7f018566sm113141666d6.2.2026.06.22.13.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 13:49:22 -0700 (PDT)
Message-ID: <6a399fd2.40ff4c04.83ff5.dffb@mx.google.com>
Date: Mon, 22 Jun 2026 13:49:22 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: kraghava@qti.qualcomm.com, meta-virtualization@lists.yoctoproject.org
Cc: vkraleti@qti.qualcomm.com, anujmitt@qti.qualcomm.com,
 sbanerje@qti.qualcomm.com
Subject: Re: [PATCH v2 1/2] crosvm: add recipe for ChromeOS Virtual Machine
 Monitor (VMM)
In-Reply-To: =?utf-8?q?=3CCH8PR02MB10971460B68EFD02FD19E40DDF3EF2=40CH8PR02M?=
 =?utf-8?q?B10971=2Enamprd02=2Eprod=2Eoutlook=2Ecom=3E?=
References: <20260613060743.3120135-1-kraghava@qti.qualcomm.com>
 <20260613060743.3120135-2-kraghava@qti.qualcomm.com>
 <6a360c2b.eef12218.262e9b.f8ea@mx.google.com> =?utf-8?q?=3CCH8PR02MB1097146?=
 =?utf-8?q?0B68EFD02FD19E40DDF3EF2=40CH8PR02MB10971=2Enamprd02=2Eprod=2Eoutl?=
 =?utf-8?q?ook=2Ecom=3E?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Jun 2026 20:49:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9901

Thanks for the update =E2=80=94 the specific config.toml output and the
pointer to the rust/minijail subdir path made it easy to reproduce.
My earlier read was against an old, stale build state that masked the
real failure; once I cleansstate'd and went through a full do_compile
from scratch, the actual picture matched what you reported and I could
see what's going on.

Two things are happening:

1. cargo_common's auto-injection is the wrong tool for this case.

   cargo_common_do_patch_paths() (OE-core cargo_common.bbclass, walked
   from do_configure[postfuncs]) sees every git SRC_URI with both name=3D
   and destsuffix=3D set, and appends:

       [patch."https://github.com/google/minijail.git"]
       minijail =3D { path =3D "${UNPACKDIR}/git/third_party/minijail" }

   The path is the minijail repo root =E2=80=94 but minijail has no top-level
   Cargo.toml; the Rust crate lives at rust/minijail/Cargo.toml. Cargo
   eagerly validates every [patch."<url>"] entry by opening the path's
   Cargo.toml to learn which crate is there, so a missing file is a
   hard error that fires before "unused patch" warnings ever get a
   chance.

   crosvm's own upstream Cargo.toml already does the right redirect:

       [patch.crates-io]
       minijail =3D { path =3D "third_party/minijail/rust/minijail" }

   bitbake's destsuffix already places the minijail repo at exactly the
   location that relative path expects, so this entry resolves to a
   real Cargo.toml and is sufficient on its own. Cleaner than rewriting
   generated state after the fact is to drop cargo_common's auto-
   injection before it ever runs =E2=80=94 a four-line python anonymous block
   removes cargo_common_do_patch_paths from do_configure[postfuncs],
   config.toml stays clean, no sed needed.

2. minijail-sys bindgen wiring is missing from the recipe.

   On the way to validating (1), do_compile failed at:

       ../../libminijail.h:18:10: fatal error: 'stdbool.h' file not found
       thread 'main' panicked at ... third_party/minijail/
                                    rust/minijail-sys/build.rs:120:39:
       failed to generate bindings: ClangDiagnostic(...)

   minijail-sys' build.rs uses the bindgen crate (in-process libclang)
   to generate Rust FFI bindings for libminijail.h. Without clang-native
   in DEPENDS and the corresponding LIBCLANG_PATH /
   BINDGEN_EXTRA_CLANG_ARGS exports, libclang can't find its own
   resource dir, the C header parse blows up at stdbool.h, and bindings
   generation panics.

   v2 presumably builds for you because your environment provides
   clang-native and the right include paths via another route (meta-
   clang in bblayers, or a transitive dep). Adding the wiring to the
   recipe directly makes it work in a stock poky + meta-virt tree as
   well, which is what we need for the layer.

Patch below is a single diff against v2 1/2 =E2=80=94 full `bitbake crosvm`
from cleansstate, 1448 tasks, all succeeded, 12 MB aarch64 ELF
produced on cortexa57. Feel free to fold into v3 or just take it
verbatim.

----- 8< -----

>From e244155f1a869994928ea4ec35c4b869027ee379 Mon Sep 17 00:00:00 2001
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 22 Jun 2026 20:41:44 +0000
Subject: [PATCH] crosvm: replace cargo patch-table sed with postfunc-remove
 + add bindgen wiring

Two fixes to make the v2 recipe build on a stock OE-core + meta-virt
master tree.

1. do_filter_minijail_cargo_config / sed -> postfunc-remove

   cargo_common_do_patch_paths() (in OE-core's cargo_common.bbclass) walks
   SRC_URI for git entries with both name=3D and destsuffix=3D set and appends
   to ${CARGO_HOME}/config.toml:

       [patch."https://github.com/google/minijail.git"]
       minijail =3D { path =3D "${UNPACKDIR}/git/third_party/minijail" }

   The path is the minijail repo root =E2=80=94 but minijail has no top-level
   Cargo.toml. The Rust crate lives at rust/minijail/Cargo.toml. cargo
   eagerly validates every [patch."<url>"] entry by reading the path's
   Cargo.toml to learn what crate is at that path; a missing file is a
   hard error before the "unused patch" diagnostic would ever fire.

   crosvm's own upstream Cargo.toml already supplies the correct redirect:

       [patch.crates-io]
       minijail =3D { path =3D "third_party/minijail/rust/minijail" }

   pointing at the rust/minijail subdirectory where the Cargo.toml lives.
   bitbake's destsuffix places the minijail repo at exactly the location
   that relative path expects, so this entry resolves to a real Cargo.toml
   and is sufficient on its own.

   The v2 recipe worked around this by sed'ing the cargo_common-injected
   line out of config.toml after the fact. Replace that with a python
   anonymous block that drops cargo_common_do_patch_paths from
   do_configure[postfuncs] before it ever runs =E2=80=94 config.toml stays cl=
ean
   and there's no rewrite of generated state.

2. minijail-sys bindgen wiring

   minijail-sys's build.rs uses the bindgen crate (in-process libclang)
   to generate Rust FFI bindings for libminijail.h. Without DEPENDS on
   clang-native and the corresponding LIBCLANG_PATH /
   BINDGEN_EXTRA_CLANG_ARGS exports, bindgen fails at do_compile:

       ../../libminijail.h:18:10: fatal error: 'stdbool.h' file not found
       thread 'main' panicked at ... third_party/minijail/rust/
                                    minijail-sys/build.rs:120:39:
       failed to generate bindings: ClangDiagnostic(...)

   v2 builds for environments that already provide clang-native and the
   right include paths via another route (e.g. meta-clang in bblayers),
   but the recipe should pull in its own wiring so it works in a stock
   tree.

Verified by a full `bitbake crosvm` from cleansstate on cortexa57 against
poky/meta-virtualization master: 1448 tasks, all succeeded, 12 MB
crosvm aarch64 ELF produced, do_package_qa clean.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 recipes-extended/crosvm/crosvm_0.1.0.bb | 43 ++++++++++++-------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/recipes-extended/crosvm/crosvm_0.1.0.bb b/recipes-extended/crosv=
m/crosvm_0.1.0.bb
index ab629c69..471d825c 100644
--- a/recipes-extended/crosvm/crosvm_0.1.0.bb
+++ b/recipes-extended/crosvm/crosvm_0.1.0.bb
@@ -28,7 +28,14 @@ SRCREV_FORMAT =3D "crosvm_minijail"
 # consistency, not an upstream project release.
 PV =3D "0.1.0+git"

-DEPENDS +=3D "libcap wayland wayland-native protobuf-native wayland-protocol=
s"
+DEPENDS +=3D "libcap wayland wayland-native protobuf-native wayland-protocol=
s clang-native"
+
+# minijail-sys' build.rs uses the bindgen crate (in-process libclang) to
+# generate Rust FFI bindings for libminijail.h. Point bindgen at the
+# clang-native libclang and pass the target sysroot so cross-compiled
+# header parsing resolves correctly.
+export LIBCLANG_PATH =3D "${STAGING_LIBDIR_NATIVE}"
+export BINDGEN_EXTRA_CLANG_ARGS =3D "--sysroot=3D${STAGING_DIR_HOST}"

 REQUIRED_DISTRO_FEATURES =3D "kvm"

@@ -36,27 +43,19 @@ COMPATIBLE_HOST =3D "(aarch64|x86_64).*-linux.*"

 BBCLASSEXTEND =3D "native"

-# cargo_common_do_patch_paths() auto-generates Cargo [patch] entries for
-# git SRC_URI items that set both "name" and "destsuffix".
-# When "subdir" is also used, cargo_common builds the path as
-# ${UNPACKDIR}/${destsuffix}/${subdir}, but BitBake unpacks as
-# ${UNPACKDIR}/${subdir}/${destsuffix}. For crosvm's minijail source, that
-# mismatch can point Cargo at a directory without Cargo.toml.
-# Remove the generated entry from ${CARGO_HOME}/config.toml; crosvm's
-# Cargo.toml already provides the correct patch path.
-do_filter_minijail_cargo_config() {
-
-    cfg=3D"${CARGO_HOME}/config.toml"
-
-    if [ ! -f "$cfg" ]; then
-        bbwarn "Skipping missing Cargo config: $cfg"
-        exit 0
-    fi
-
-    bbnote "Processing Cargo config: $cfg"
-    sed -i '/minijail/d' "$cfg"
+# crosvm's own Cargo.toml already supplies [patch.crates-io] minijail =3D
+#   { path =3D "third_party/minijail/rust/minijail" }
+# pointing at the rust/minijail subdirectory where minijail's Cargo.toml
+# actually lives. cargo_common_do_patch_paths() would inject a competing
+# [patch."<minijail git URL>"] minijail =3D { path =3D "<unpackdir>/git/thir=
d_party/minijail" }
+# pointing at the minijail repo root, where there is no Cargo.toml =E2=80=94=
 cargo
+# eagerly validates patch entries and errors out before it would even reach
+# the "unused patch" path. Disable the auto-injection; crosvm's upstream
+# table is the authoritative one.
+python () {
+    pf =3D (d.getVarFlag("do_configure", "postfuncs") or "").split()
+    pf =3D [f for f in pf if f !=3D "cargo_common_do_patch_paths"]
+    d.setVarFlag("do_configure", "postfuncs", " ".join(pf))
 }

-addtask filter_minijail_cargo_config after do_configure before do_compile
-
 require crosvm-crates.inc
--
2.34.1

Bruce

