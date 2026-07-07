Return-Path: <kraghava@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD8AC43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 13:23:27 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.173196.1783430600650754921
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Jul 2026 06:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=K/FteI1H;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: kraghava@qti.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8aYx3783402;
	Tue, 7 Jul 2026 13:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H+fnITUxEr3I/tSL4eVH7gprf6Xf6QyYJx/ChHOdksg=; b=K/FteI1HHwPzGeuC
	ufHh6jJcd3rn0eQ0rpd9oNXwPLNYlJvr0SZQyXrXbQctS+2EUT3Tn4dfUyDO2RwD
	/6envHd7Jx9MFlfhff8IoYNzKoH3/Fq4gyyXfcTdVVHxQOvcHXP+CawLIa+Hc0E2
	L5OUUnvY9+BN38slo98WKVCbbTy4cP8bH9BNcBF7E6PdW5Pt3jwd9IKSM9bb4r/L
	5O+HinDvfHAChofqErqPyVLIh++YHrwW4WGIT85cClKxNeLV6o3eInqwzp4g3vfH
	AhvIF/rnFNlp3NL3nAGzsre0UEBSbxRznH3W2zeHHUvxsvTOAnGOQtRbtCxlN/8t
	YeP05w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w11sctc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 13:23:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 667DNIHi030295
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Jul 2026 13:23:18 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 7 Jul 2026 06:23:15 -0700
From: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
To: <anujmitt@qti.qualcomm.com>, <vkraleti@qti.qualcomm.com>,
        <sbanerje@qti.qualcomm.com>, <bruce.ashfield@gmail.com>,
        <meta-virtualization@lists.yoctoproject.org>
CC: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
Subject: [PATCH v3 1/2] crosvm: add recipe for ChromeOS Virtual Machine Monitor (VMM)
Date: Tue, 7 Jul 2026 18:52:48 +0530
Message-ID: <20260707132249.677711-2-kraghava@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260707132249.677711-1-kraghava@qti.qualcomm.com>
References: <20260707132249.677711-1-kraghava@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=DMe/JSNb c=1 sm=1 tr=0 ts=6a4cfdc7 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=YSxdmsDUfDDgI6FL-zAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: UVpGubhFQKl1uTXak1NBLh0qKSFpNnE2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMSBTYWx0ZWRfX59PqXCQ5TIZs
 Q3q0kIzLNkw5AZH/E68f7i9mZKz/MRCC3Le7ARr3IwLpTorXnz4Jk/AmWZPJVg40QPaRNZWS6vv
 t0XwLq6ddyBLbqpi7e164X9RHvwrSnM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMSBTYWx0ZWRfX3ww0dOgJhs7h
 FxWG2bfrHGrtpxD2/LmlwUuX7urCgS7oRX7pV2mgnCdcSkVtQsZ4BNGwyjy81qWXEcidn3lcAqS
 SoGZU5iHlwYDFfn4prwTO97vhmqyyVVPz+u/eM/fsZBsov6aAIeaT0rxZ1GPdq1JSCW3v61r5un
 jzR23t82b0uF50XfeUbIkdp/iEKgoBSEN6pew8qZmPn+udpq85JVNos4mnmaNcpQEAqGeBamA+a
 LV4NiPsziV9C3wRJPJcVedG+SXN1hi61i81Lr/SLknp8kF787FmZL/caH9L98a7tBbVvxe87Loh
 mLnF3eGzudlLjAQr8dG5xhPvs4l0dOm2poGrdzcP1s1IX9aaWQqS+yvMbz/X62gY/VDIAURbPgK
 vojekHX1FDDo9dWWIM7IYlZcuiRV4P1Dp3D0DzZHCpsLVRF1WzW22+RXoJuBxqWhHXfMzzHAVqK
 Jv7tIYZNSOPqYHFx3BA==
X-Proofpoint-ORIG-GUID: UVpGubhFQKl1uTXak1NBLh0qKSFpNnE2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070131
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 667C8aYx3783402
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Jul 2026 13:23:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9941

crosvm is a lightweight, Rust-based virtual
machine monitor originally developed for ChromeOS,
and provides an alternative to traditional VMMs such
as QEMU.

Signed-off-by: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
---
changes from v2:
- Fix license: corrected from BSD-3-Clause-Clear to BSD-3-Clause and upda=
ted LIC_FILES_CHKSUM to point to the in-tree LICENSE file
  with the correct md5sum.
- Add clang-native to DEPENDS to satisfy minijail-sys's bindgen-based FFI=
 generation at build time.
- Export LIBCLANG_PATH and BINDGEN_EXTRA_CLANG_ARGS so bindgen (used by m=
inijail-sys/build.rs) correctly resolves libclang and the
  cross-compilation sysroot.
- Replace the do_filter_minijail_cargo_config shell task (which used sed =
to strip minijail entries from ${CARGO_HOME}/config.toml)
  with a Python anonymous function that removes cargo_common_do_patch_pat=
hs from do_configure's postfuncs =E2=80=94 a cleaner fix that
  avoids the competing [patch] entry Cargo would reject.
- Drop BBCLASSEXTEND =3D "native" since a native build of crosvm is not n=
eeded.

 recipes-extended/crosvm/crosvm-crates.inc | 966 ++++++++++++++++++++++
 recipes-extended/crosvm/crosvm_0.1.0.bb   |  61 ++
 2 files changed, 1027 insertions(+)
 create mode 100644 recipes-extended/crosvm/crosvm-crates.inc
 create mode 100644 recipes-extended/crosvm/crosvm_0.1.0.bb

diff --git a/recipes-extended/crosvm/crosvm-crates.inc b/recipes-extended=
/crosvm/crosvm-crates.inc
new file mode 100644
index 00000000..5cc3fa9e
--- /dev/null
+++ b/recipes-extended/crosvm/crosvm-crates.inc
@@ -0,0 +1,966 @@
+# Autogenerated with 'bitbake -c update_crates crosvm'
+
+# from Cargo.lock
+SRC_URI +=3D " \
+    crate://crates.io/addr2line/0.21.0 \
+    crate://crates.io/adler/1.0.2 \
+    crate://crates.io/ahash/0.8.6 \
+    crate://crates.io/aho-corasick/0.7.18 \
+    crate://crates.io/android_log-sys/0.3.1 \
+    crate://crates.io/anyhow/1.0.58 \
+    crate://crates.io/arbitrary/1.1.6 \
+    crate://crates.io/argh/0.1.10 \
+    crate://crates.io/argh_derive/0.1.10 \
+    crate://crates.io/argh_shared/0.1.10 \
+    crate://crates.io/ash/0.37.3+1.3.251 \
+    crate://crates.io/async-task/4.3.0 \
+    crate://crates.io/async-trait/0.1.85 \
+    crate://crates.io/atty/0.2.14 \
+    crate://crates.io/autocfg/1.1.0 \
+    crate://crates.io/backtrace/0.3.69 \
+    crate://crates.io/bindgen/0.63.0 \
+    crate://crates.io/bindgen/0.68.1 \
+    crate://crates.io/bindgen/0.70.1 \
+    crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/bitflags/2.4.0 \
+    crate://crates.io/bitreader/0.3.6 \
+    crate://crates.io/bytemuck/1.14.0 \
+    crate://crates.io/bytemuck_derive/1.5.0 \
+    crate://crates.io/byteorder/1.4.3 \
+    crate://crates.io/bytes/1.2.0 \
+    crate://crates.io/cbindgen/0.24.3 \
+    crate://crates.io/cc/1.0.90 \
+    crate://crates.io/cexpr/0.6.0 \
+    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/cfg_aliases/0.1.1 \
+    crate://crates.io/chrono/0.4.35 \
+    crate://crates.io/ciborium/0.2.2 \
+    crate://crates.io/ciborium-io/0.2.2 \
+    crate://crates.io/ciborium-ll/0.2.2 \
+    crate://crates.io/clang-sys/1.4.0 \
+    crate://crates.io/clap/3.2.23 \
+    crate://crates.io/clap/4.1.8 \
+    crate://crates.io/clap_derive/4.1.8 \
+    crate://crates.io/clap_lex/0.2.4 \
+    crate://crates.io/clap_lex/0.3.2 \
+    crate://crates.io/core-foundation/0.9.4 \
+    crate://crates.io/core-foundation-sys/0.8.6 \
+    crate://crates.io/core-graphics-types/0.1.3 \
+    crate://crates.io/crc32fast/1.3.2 \
+    crate://crates.io/cros-codecs/0.0.4 \
+    crate://crates.io/cros-libva/0.0.4 \
+    crate://crates.io/crossbeam-channel/0.5.8 \
+    crate://crates.io/crossbeam-deque/0.8.3 \
+    crate://crates.io/crossbeam-epoch/0.9.14 \
+    crate://crates.io/crossbeam-queue/0.3.11 \
+    crate://crates.io/crossbeam-utils/0.8.19 \
+    crate://crates.io/crunchy/0.2.2 \
+    crate://crates.io/ctrlc/3.2.5 \
+    crate://crates.io/dbus/0.9.7 \
+    crate://crates.io/derive-into-owned/0.1.0 \
+    crate://crates.io/document-features/0.2.6 \
+    crate://crates.io/downcast-rs/1.2.1 \
+    crate://crates.io/either/1.7.0 \
+    crate://crates.io/enumn/0.1.13 \
+    crate://crates.io/env_logger/0.9.0 \
+    crate://crates.io/equivalent/1.0.1 \
+    crate://crates.io/errno/0.2.8 \
+    crate://crates.io/errno/0.3.12 \
+    crate://crates.io/errno-dragonfly/0.1.2 \
+    crate://crates.io/euclid/0.22.7 \
+    crate://crates.io/fastrand/1.8.0 \
+    crate://crates.io/fnv/1.0.7 \
+    crate://crates.io/foreign-types/0.3.2 \
+    crate://crates.io/foreign-types-shared/0.1.1 \
+    crate://crates.io/form_urlencoded/1.1.0 \
+    crate://crates.io/futures/0.3.21 \
+    crate://crates.io/futures-channel/0.3.21 \
+    crate://crates.io/futures-core/0.3.21 \
+    crate://crates.io/futures-executor/0.3.21 \
+    crate://crates.io/futures-io/0.3.21 \
+    crate://crates.io/futures-macro/0.3.21 \
+    crate://crates.io/futures-sink/0.3.21 \
+    crate://crates.io/futures-task/0.3.21 \
+    crate://crates.io/futures-util/0.3.21 \
+    crate://crates.io/gdbstub/0.7.0 \
+    crate://crates.io/gdbstub_arch/0.3.0 \
+    crate://crates.io/getrandom/0.2.7 \
+    crate://crates.io/gimli/0.28.1 \
+    crate://crates.io/glob/0.3.0 \
+    crate://crates.io/half/2.4.1 \
+    crate://crates.io/hashbrown/0.12.3 \
+    crate://crates.io/hashbrown/0.15.0 \
+    crate://crates.io/heck/0.4.0 \
+    crate://crates.io/hermit-abi/0.1.19 \
+    crate://crates.io/hermit-abi/0.3.1 \
+    crate://crates.io/idna/0.3.0 \
+    crate://crates.io/indexmap/1.9.1 \
+    crate://crates.io/indexmap/2.6.0 \
+    crate://crates.io/instant/0.1.12 \
+    crate://crates.io/intrusive-collections/0.9.6 \
+    crate://crates.io/io-lifetimes/1.0.5 \
+    crate://crates.io/is-terminal/0.4.4 \
+    crate://crates.io/itertools/0.12.1 \
+    crate://crates.io/itoa/1.0.2 \
+    crate://crates.io/jobserver/0.1.24 \
+    crate://crates.io/lazy_static/1.4.0 \
+    crate://crates.io/lazycell/1.3.0 \
+    crate://crates.io/libc/0.2.174 \
+    crate://crates.io/libdbus-sys/0.2.5 \
+    crate://crates.io/libfuzzer-sys/0.4.4 \
+    crate://crates.io/libloading/0.7.3 \
+    crate://crates.io/libslirp-sys/4.2.1 \
+    crate://crates.io/libtest-mimic/0.6.0 \
+    crate://crates.io/linux-raw-sys/0.1.4 \
+    crate://crates.io/linux-raw-sys/0.9.4 \
+    crate://crates.io/litrs/0.2.3 \
+    crate://crates.io/lock_api/0.4.9 \
+    crate://crates.io/log/0.4.21 \
+    crate://crates.io/lz4_flex/0.11.1 \
+    crate://crates.io/malloc_buf/0.0.6 \
+    crate://crates.io/managed/0.8.0 \
+    crate://crates.io/memchr/2.5.0 \
+    crate://crates.io/memoffset/0.8.0 \
+    crate://crates.io/memoffset/0.9.0 \
+    crate://crates.io/mesa3d_util/0.1.75 \
+    crate://crates.io/minimal-lexical/0.2.1 \
+    crate://crates.io/miniz_oxide/0.7.2 \
+    crate://crates.io/mio/0.8.11 \
+    crate://crates.io/named-lock/0.3.0 \
+    crate://crates.io/nix/0.26.2 \
+    crate://crates.io/nix/0.27.1 \
+    crate://crates.io/nix/0.28.0 \
+    crate://crates.io/nom/7.1.1 \
+    crate://crates.io/num-traits/0.2.15 \
+    crate://crates.io/num_cpus/1.13.1 \
+    crate://crates.io/objc/0.2.7 \
+    crate://crates.io/object/0.32.2 \
+    crate://crates.io/once_cell/1.17.0 \
+    crate://crates.io/openssl/0.10.51 \
+    crate://crates.io/openssl-macros/0.1.0 \
+    crate://crates.io/openssl-sys/0.9.86 \
+    crate://crates.io/os_str_bytes/6.4.1 \
+    crate://crates.io/p9/0.3.2 \
+    crate://crates.io/p9_wire_format_derive/0.3.0 \
+    crate://crates.io/parking_lot/0.12.1 \
+    crate://crates.io/parking_lot_core/0.9.6 \
+    crate://crates.io/paste/1.0.7 \
+    crate://crates.io/pcap-file/1.1.1 \
+    crate://crates.io/peeking_take_while/0.1.2 \
+    crate://crates.io/percent-encoding/2.2.0 \
+    crate://crates.io/pin-project-lite/0.2.13 \
+    crate://crates.io/pin-utils/0.1.0 \
+    crate://crates.io/pkg-config/0.3.31 \
+    crate://crates.io/ppv-lite86/0.2.16 \
+    crate://crates.io/prettyplease/0.2.22 \
+    crate://crates.io/proc-macro-crate/1.3.1 \
+    crate://crates.io/proc-macro-error/1.0.4 \
+    crate://crates.io/proc-macro-error-attr/1.0.4 \
+    crate://crates.io/proc-macro2/1.0.85 \
+    crate://crates.io/protobuf/3.7.2 \
+    crate://crates.io/protobuf-codegen/3.7.2 \
+    crate://crates.io/protobuf-parse/3.7.2 \
+    crate://crates.io/protobuf-support/3.7.2 \
+    crate://crates.io/quote/0.3.15 \
+    crate://crates.io/quote/1.0.36 \
+    crate://crates.io/rand/0.8.5 \
+    crate://crates.io/rand_chacha/0.3.1 \
+    crate://crates.io/rand_core/0.6.3 \
+    crate://crates.io/rayon/1.7.0 \
+    crate://crates.io/rayon-core/1.11.0 \
+    crate://crates.io/redox_syscall/0.2.15 \
+    crate://crates.io/regex/1.6.0 \
+    crate://crates.io/regex-syntax/0.6.27 \
+    crate://crates.io/remain/0.2.6 \
+    crate://crates.io/remove_dir_all/0.5.3 \
+    crate://crates.io/rustc-demangle/0.1.23 \
+    crate://crates.io/rustc-hash/1.1.0 \
+    crate://crates.io/rustix/0.36.8 \
+    crate://crates.io/rustix/1.0.7 \
+    crate://crates.io/rutabaga_gfx/0.1.76-chromeos \
+    crate://crates.io/ryu/1.0.10 \
+    crate://crates.io/same-file/1.0.6 \
+    crate://crates.io/scopeguard/1.1.0 \
+    crate://crates.io/scudo/0.1.3 \
+    crate://crates.io/scudo-proc-macros/0.1.0 \
+    crate://crates.io/scudo-sys/0.2.2 \
+    crate://crates.io/serde/1.0.140 \
+    crate://crates.io/serde_derive/1.0.140 \
+    crate://crates.io/serde_json/1.0.82 \
+    crate://crates.io/shlex/1.3.0 \
+    crate://crates.io/slab/0.4.7 \
+    crate://crates.io/smallvec/1.9.0 \
+    crate://crates.io/socket2/0.4.10 \
+    crate://crates.io/static_assertions/1.1.0 \
+    crate://crates.io/strsim/0.10.0 \
+    crate://crates.io/syn/0.11.11 \
+    crate://crates.io/syn/1.0.103 \
+    crate://crates.io/syn/2.0.77 \
+    crate://crates.io/synom/0.11.3 \
+    crate://crates.io/tempfile/3.3.0 \
+    crate://crates.io/termcolor/1.1.3 \
+    crate://crates.io/textwrap/0.16.0 \
+    crate://crates.io/thiserror/1.0.38 \
+    crate://crates.io/thiserror-impl/1.0.38 \
+    crate://crates.io/thread_local/1.1.8 \
+    crate://crates.io/threadpool/1.8.1 \
+    crate://crates.io/tinyvec/1.6.0 \
+    crate://crates.io/tinyvec_macros/0.1.0 \
+    crate://crates.io/tokio/1.29.1 \
+    crate://crates.io/tokio-macros/2.1.0 \
+    crate://crates.io/toml/0.5.9 \
+    crate://crates.io/toml_datetime/0.6.8 \
+    crate://crates.io/toml_edit/0.19.15 \
+    crate://crates.io/twox-hash/1.6.3 \
+    crate://crates.io/unicode-bidi/0.3.8 \
+    crate://crates.io/unicode-ident/1.0.2 \
+    crate://crates.io/unicode-normalization/0.1.22 \
+    crate://crates.io/unicode-xid/0.0.4 \
+    crate://crates.io/url/2.3.1 \
+    crate://crates.io/userfaultfd/0.8.1 \
+    crate://crates.io/userfaultfd-sys/0.5.0 \
+    crate://crates.io/uuid/1.8.0 \
+    crate://crates.io/v4l2r/0.0.6 \
+    crate://crates.io/vcpkg/0.2.15 \
+    crate://crates.io/version_check/0.9.4 \
+    crate://crates.io/virtio-media/0.0.7 \
+    crate://crates.io/vk-parse/0.8.0 \
+    crate://crates.io/vulkano/0.31.1 \
+    crate://crates.io/vulkano/0.33.0 \
+    crate://crates.io/vulkano-macros/0.33.0 \
+    crate://crates.io/walkdir/2.5.0 \
+    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
+    crate://crates.io/which/4.2.5 \
+    crate://crates.io/widestring/1.0.2 \
+    crate://crates.io/winapi/0.3.9 \
+    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
+    crate://crates.io/winapi-util/0.1.5 \
+    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+    crate://crates.io/windows/0.61.1 \
+    crate://crates.io/windows-collections/0.2.0 \
+    crate://crates.io/windows-core/0.61.2 \
+    crate://crates.io/windows-future/0.2.1 \
+    crate://crates.io/windows-implement/0.60.0 \
+    crate://crates.io/windows-interface/0.59.1 \
+    crate://crates.io/windows-link/0.1.1 \
+    crate://crates.io/windows-numerics/0.2.0 \
+    crate://crates.io/windows-result/0.3.4 \
+    crate://crates.io/windows-strings/0.4.2 \
+    crate://crates.io/windows-sys/0.42.0 \
+    crate://crates.io/windows-sys/0.45.0 \
+    crate://crates.io/windows-sys/0.48.0 \
+    crate://crates.io/windows-sys/0.59.0 \
+    crate://crates.io/windows-targets/0.42.1 \
+    crate://crates.io/windows-targets/0.48.5 \
+    crate://crates.io/windows-targets/0.52.6 \
+    crate://crates.io/windows-threading/0.1.0 \
+    crate://crates.io/windows_aarch64_gnullvm/0.42.1 \
+    crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
+    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
+    crate://crates.io/windows_aarch64_msvc/0.42.1 \
+    crate://crates.io/windows_aarch64_msvc/0.48.5 \
+    crate://crates.io/windows_aarch64_msvc/0.52.6 \
+    crate://crates.io/windows_i686_gnu/0.42.1 \
+    crate://crates.io/windows_i686_gnu/0.48.5 \
+    crate://crates.io/windows_i686_gnu/0.52.6 \
+    crate://crates.io/windows_i686_gnullvm/0.52.6 \
+    crate://crates.io/windows_i686_msvc/0.42.1 \
+    crate://crates.io/windows_i686_msvc/0.48.5 \
+    crate://crates.io/windows_i686_msvc/0.52.6 \
+    crate://crates.io/windows_x86_64_gnu/0.42.1 \
+    crate://crates.io/windows_x86_64_gnu/0.48.5 \
+    crate://crates.io/windows_x86_64_gnu/0.52.6 \
+    crate://crates.io/windows_x86_64_gnullvm/0.42.1 \
+    crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
+    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
+    crate://crates.io/windows_x86_64_msvc/0.42.1 \
+    crate://crates.io/windows_x86_64_msvc/0.48.5 \
+    crate://crates.io/windows_x86_64_msvc/0.52.6 \
+    crate://crates.io/winnow/0.5.40 \
+    crate://crates.io/wio/0.2.2 \
+    crate://crates.io/xml-rs/0.8.19 \
+    crate://crates.io/zerocopy/0.7.32 \
+    crate://crates.io/zerocopy/0.8.14 \
+    crate://crates.io/zerocopy-derive/0.7.32 \
+    crate://crates.io/zerocopy-derive/0.8.14 \
+    crate://crates.io/zeroize/1.5.7 \
+    crate://crates.io/zstd/0.13.2 \
+    crate://crates.io/zstd-safe/7.2.1 \
+    crate://crates.io/zstd-sys/2.0.13+zstd.1.5.6 \
+"
+
+SRC_URI[addr2line-0.21.0.sha256sum] =3D "8a30b2e23b9e17a9f90641c7ab1549c=
d9b44f296d3ccbf309d2863cfe398a0cb"
+SRC_URI[adler-1.0.2.sha256sum] =3D "f26201604c87b1e01bd3d98f8d5d9a8fcbb8=
15e8cedb41ffccbeb4bf593a35fe"
+SRC_URI[ahash-0.8.6.sha256sum] =3D "91429305e9f0a25f6205c5b8e0d2db09e070=
8a7a6df0f42212bb56c32c8ac97a"
+SRC_URI[aho-corasick-0.7.18.sha256sum] =3D "1e37cfd5e7657ada45f742d6e99c=
a5788580b5c529dc78faf11ece6dc702656f"
+SRC_URI[android_log-sys-0.3.1.sha256sum] =3D "5ecc8056bf6ab9892dcd53216c=
83d1597487d7dacac16c8df6b877d127df9937"
+SRC_URI[anyhow-1.0.58.sha256sum] =3D "bb07d2053ccdbe10e2af2995a2f116c133=
0396493dc1269f6a91d0ae82e19704"
+SRC_URI[arbitrary-1.1.6.sha256sum] =3D "f44124848854b941eafdb34f05b3bcf5=
9472f643c7e151eba7c2b69daa469ed5"
+SRC_URI[argh-0.1.10.sha256sum] =3D "ab257697eb9496bf75526f0217b5ed64636a=
9cfafa78b8365c71bd283fcef93e"
+SRC_URI[argh_derive-0.1.10.sha256sum] =3D "b382dbd3288e053331f03399e1db1=
06c9fb0d8562ad62cb04859ae926f324fa6"
+SRC_URI[argh_shared-0.1.10.sha256sum] =3D "64cb94155d965e3d37ffbbe7cc5b8=
2c3dd79dd33bd48e536f73d2cfb8d85506f"
+SRC_URI[ash-0.37.3+1.3.251.sha256sum] =3D "39e9c3835d686b0a6084ab4234fcd=
1b07dbf6e4767dce60874b12356a25ecd4a"
+SRC_URI[async-task-4.3.0.sha256sum] =3D "7a40729d2133846d9ed0ea60a8b9541=
bccddab49cd30f0715a1da672fe9a2524"
+SRC_URI[async-trait-0.1.85.sha256sum] =3D "3f934833b4b7233644e5848f235df=
3f57ed8c80f1528a26c3dfa13d2147fa056"
+SRC_URI[atty-0.2.14.sha256sum] =3D "d9b39be18770d11421cdb1b9947a45dd3f37=
e93092cbf377614828a319d5fee8"
+SRC_URI[autocfg-1.1.0.sha256sum] =3D "d468802bab17cbc0cc575e9b053f41e72a=
a36bfa6b7f55e3529ffa43161b97fa"
+SRC_URI[backtrace-0.3.69.sha256sum] =3D "2089b7e3f35b9dd2d0ed921ead4f6d3=
18c27680d4a5bd167b3ee120edb105837"
+SRC_URI[bindgen-0.63.0.sha256sum] =3D "36d860121800b2a9a94f9b5604b332d5c=
ffb234ce17609ea479d723dbc9d3885"
+SRC_URI[bindgen-0.68.1.sha256sum] =3D "726e4313eb6ec35d2730258ad4e15b547=
ee75d6afaa1361a922e78e59b7d8078"
+SRC_URI[bindgen-0.70.1.sha256sum] =3D "f49d8fed880d473ea71efb9bf597651e7=
7201bdd4893efe54c9e5d65ae04ce6f"
+SRC_URI[bitflags-1.3.2.sha256sum] =3D "bef38d45163c2f1dde094a7dfd33ccf59=
5c92905c8f8f4fdc18d06fb1037718a"
+SRC_URI[bitflags-2.4.0.sha256sum] =3D "b4682ae6287fcf752ecaabbfcc7b6f9b7=
2aa33933dc23a554d853aea8eea8635"
+SRC_URI[bitreader-0.3.6.sha256sum] =3D "d84ea71c85d1fe98fe67a9b9988b1695=
bc24c0b0d3bfb18d4c510f44b4b09941"
+SRC_URI[bytemuck-1.14.0.sha256sum] =3D "374d28ec25809ee0e23827c2ab573d72=
9e293f281dfe393500e7ad618baa61c6"
+SRC_URI[bytemuck_derive-1.5.0.sha256sum] =3D "965ab7eb5f8f97d2a083c799f3=
a1b994fc397b2fe2da5d1da1626ce15a39f2b1"
+SRC_URI[byteorder-1.4.3.sha256sum] =3D "14c189c53d098945499cdfa7ecc63567=
cf3886b3332b312a5b4585d8d3a6a610"
+SRC_URI[bytes-1.2.0.sha256sum] =3D "f0b3de4a0c5e67e16066a0715723abd91edc=
2f9001d09c46e1dca929351e130e"
+SRC_URI[cbindgen-0.24.3.sha256sum] =3D "a6358dedf60f4d9b8db43ad187391afe=
959746101346fe51bb978126bec61dfb"
+SRC_URI[cc-1.0.90.sha256sum] =3D "8cd6604a82acf3039f1144f54b8eb34e91ffba=
622051189e71b781822d5ee1f5"
+SRC_URI[cexpr-0.6.0.sha256sum] =3D "6fac387a98bb7c37292057cffc56d62ecb62=
9900026402633ae9160df93a8766"
+SRC_URI[cfg-if-1.0.0.sha256sum] =3D "baf1de4339761588bc0619e3cbc0120ee58=
2ebb74b53b4efbf79117bd2da40fd"
+SRC_URI[cfg_aliases-0.1.1.sha256sum] =3D "fd16c4719339c4530435d38e511904=
438d07cce7950afa3718a84ac36c10e89e"
+SRC_URI[chrono-0.4.35.sha256sum] =3D "8eaf5903dcbc0a39312feb77df2ff4c763=
87d591b9fc7b04a238dcf8bb62639a"
+SRC_URI[ciborium-0.2.2.sha256sum] =3D "42e69ffd6f0917f5c029256a24d0161db=
17cea3997d185db0d35926308770f0e"
+SRC_URI[ciborium-io-0.2.2.sha256sum] =3D "05afea1e0a06c9be33d539b876f1ce=
3692f4afea2cb41f740e7743225ed1c757"
+SRC_URI[ciborium-ll-0.2.2.sha256sum] =3D "57663b653d948a338bfb3eeba9bb2f=
d5fcfaecb9e199e87e1eda4d9e8b240fd9"
+SRC_URI[clang-sys-1.4.0.sha256sum] =3D "fa2e27ae6ab525c3d369ded447057bca=
5438d86dc3a68f6faafb8269ba82ebf3"
+SRC_URI[clap-3.2.23.sha256sum] =3D "71655c45cb9845d3270c9d6df84ebe72b4da=
d3c2ba3f7023ad47c144e4e473a5"
+SRC_URI[clap-4.1.8.sha256sum] =3D "c3d7ae14b20b94cb02149ed21a86c423859cb=
e18dc7ed69845cace50e52b40a5"
+SRC_URI[clap_derive-4.1.8.sha256sum] =3D "44bec8e5c9d09e439c4335b1af0aba=
ab56dcf3b94999a936e1bb47b9134288f0"
+SRC_URI[clap_lex-0.2.4.sha256sum] =3D "2850f2f5a82cbf437dd5af4d49848fbdf=
c27c157c3d010345776f952765261c5"
+SRC_URI[clap_lex-0.3.2.sha256sum] =3D "350b9cf31731f9957399229e9b2adc51e=
eabdfbe9d71d9a0552275fd12710d09"
+SRC_URI[core-foundation-0.9.4.sha256sum] =3D "91e195e091a93c46f7102ec781=
8a2aa394e1e1771c3ab4825963fa03e45afb8f"
+SRC_URI[core-foundation-sys-0.8.6.sha256sum] =3D "06ea2b9bc92be3c2baa933=
4a323ebca2d6f074ff852cd1d7b11064035cd3868f"
+SRC_URI[core-graphics-types-0.1.3.sha256sum] =3D "45390e6114f68f718cc7a8=
30514a96f903cccd70d02a8f6d9f643ac4ba45afaf"
+SRC_URI[crc32fast-1.3.2.sha256sum] =3D "b540bd8bc810d3885c6ea91e2018302f=
68baba2129ab3e88f32389ee9370880d"
+SRC_URI[cros-codecs-0.0.4.sha256sum] =3D "277a30a0ddadfa014380ee30cc6033=
0d260369855417c492fa94421d7c7e9229"
+SRC_URI[cros-libva-0.0.4.sha256sum] =3D "dc78ee9952d72572d126ef28338857d=
12c08a013ba39b77fd8e20201837def3e"
+SRC_URI[crossbeam-channel-0.5.8.sha256sum] =3D "a33c2bf77f2df06183c3aa30=
d1e96c0695a313d4f9c453cc3762a6db39f99200"
+SRC_URI[crossbeam-deque-0.8.3.sha256sum] =3D "ce6fd6f855243022dcecf8702f=
ef0c297d4338e226845fe067f6341ad9fa0cef"
+SRC_URI[crossbeam-epoch-0.9.14.sha256sum] =3D "46bd5f3f85273295a9d14aedf=
b86f6aadbff6d8f5295c4a9edb08e819dcf5695"
+SRC_URI[crossbeam-queue-0.3.11.sha256sum] =3D "df0346b5d5e76ac2fe4e327c5=
fd1118d6be7c51dfb18f9b7922923f287471e35"
+SRC_URI[crossbeam-utils-0.8.19.sha256sum] =3D "248e3bacc7dc6baa3b21e405e=
e045c3047101a49145e7e9eca583ab4c2ca5345"
+SRC_URI[crunchy-0.2.2.sha256sum] =3D "7a81dae078cea95a014a339291cec439d2=
f232ebe854a9d672b796c6afafa9b7"
+SRC_URI[ctrlc-3.2.5.sha256sum] =3D "bbcf33c2a618cbe41ee43ae6e9f2e48368cd=
9f9db2896f10167d8d762679f639"
+SRC_URI[dbus-0.9.7.sha256sum] =3D "1bb21987b9fb1613058ba3843121dd18b163b=
254d8a6e797e144cbac14d96d1b"
+SRC_URI[derive-into-owned-0.1.0.sha256sum] =3D "576fce04d31d592013a5887b=
a8d9c3830adff329e5096d7e1eb5e8e61262ca62"
+SRC_URI[document-features-0.2.6.sha256sum] =3D "c3267e1ade4f1f6ddd35fed4=
4a04b6514e244ffeda90c6a14a9ee30f9c9fd7a1"
+SRC_URI[downcast-rs-1.2.1.sha256sum] =3D "75b325c5dbd37f80359721ad39aca5=
a29fb04c89279657cffdda8736d0c0b9d2"
+SRC_URI[either-1.7.0.sha256sum] =3D "3f107b87b6afc2a64fd13cac55fe06d6c88=
59f12d4b14cbcdd2c67d0976781be"
+SRC_URI[enumn-0.1.13.sha256sum] =3D "6fd000fd6988e73bbe993ea3db9b1aa6490=
6ab88766d654973924340c8cddb42"
+SRC_URI[env_logger-0.9.0.sha256sum] =3D "0b2cf0344971ee6c64c31be0d530793=
fba457d322dfec2810c453d0ef228f9c3"
+SRC_URI[equivalent-1.0.1.sha256sum] =3D "5443807d6dff69373d433ab9ef5378a=
d8df50ca6298caf15de6e52e24aaf54d5"
+SRC_URI[errno-0.2.8.sha256sum] =3D "f639046355ee4f37944e44f60642c6f3a7ef=
a3cf6b78c78a0d989a8ce6c396a1"
+SRC_URI[errno-0.3.12.sha256sum] =3D "cea14ef9355e3beab063703aa9dab15afd2=
5f0667c341310c1e5274bb1d0da18"
+SRC_URI[errno-dragonfly-0.1.2.sha256sum] =3D "aa68f1b12764fab894d2755d25=
18754e71b4fd80ecfb822714a1206c2aab39bf"
+SRC_URI[euclid-0.22.7.sha256sum] =3D "b52c2ef4a78da0ba68fbe1fd9206274110=
96d2ac478f7f4c9f3a54ba6705bade"
+SRC_URI[fastrand-1.8.0.sha256sum] =3D "a7a407cfaa3385c4ae6b23e84623d48c2=
798d06e3e6a1878f7f59f17b3f86499"
+SRC_URI[fnv-1.0.7.sha256sum] =3D "3f9eec918d3f24069decb9af1554cad7c880e2=
da24a9afd88aca000531ab82c1"
+SRC_URI[foreign-types-0.3.2.sha256sum] =3D "f6f339eb8adc052cd2ca78910fda=
869aefa38d22d5cb648e6485e4d3fc06f3b1"
+SRC_URI[foreign-types-shared-0.1.1.sha256sum] =3D "00b0228411908ca8685db=
a7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
+SRC_URI[form_urlencoded-1.1.0.sha256sum] =3D "a9c384f161156f5260c24a097c=
56119f9be8c798586aecc13afbcbe7b7e26bf8"
+SRC_URI[futures-0.3.21.sha256sum] =3D "f73fe65f54d1e12b726f517d3e2135ca3=
125a437b6d998caf1962961f7172d9e"
+SRC_URI[futures-channel-0.3.21.sha256sum] =3D "c3083ce4b914124575708913b=
ca19bfe887522d6e2e6d0952943f5eac4a74010"
+SRC_URI[futures-core-0.3.21.sha256sum] =3D "0c09fd04b7e4073ac7156a9539b5=
7a484a8ea920f79c7c675d05d289ab6110d3"
+SRC_URI[futures-executor-0.3.21.sha256sum] =3D "9420b90cfa29e327d0429f19=
be13e7ddb68fa1cccb09d65e5706b8c7a749b8a6"
+SRC_URI[futures-io-0.3.21.sha256sum] =3D "fc4045962a5a5e935ee2fdedaa4e08=
284547402885ab326734432bed5d12966b"
+SRC_URI[futures-macro-0.3.21.sha256sum] =3D "33c1e13800337f4d4d7a316bf45=
a567dbcb6ffe087f16424852d97e97a91f512"
+SRC_URI[futures-sink-0.3.21.sha256sum] =3D "21163e139fa306126e6eedaf49ec=
db4588f939600f0b1e770f4205ee4b7fa868"
+SRC_URI[futures-task-0.3.21.sha256sum] =3D "57c66a976bf5909d801bbef33416=
c41372779507e7a6b3a5e25e4749c58f776a"
+SRC_URI[futures-util-0.3.21.sha256sum] =3D "d8b7abd5d659d9b90c8cba917f6e=
c750a74e2dc23902ef9cd4cc8c8b22e6036a"
+SRC_URI[gdbstub-0.7.0.sha256sum] =3D "09a8b954f9d02b74fe8e89a1c77bd9a6b8=
206713ebf1b272bfad9573b4a86f88"
+SRC_URI[gdbstub_arch-0.3.0.sha256sum] =3D "4e3b1357bd3203fc09a6601327ae0=
ab38865d14231d0b65d3143f5762cc7977d"
+SRC_URI[getrandom-0.2.7.sha256sum] =3D "4eb1a864a501629691edf6c15a593b7a=
51eebaa1e8468e9ddc623de7c9b58ec6"
+SRC_URI[gimli-0.28.1.sha256sum] =3D "4271d37baee1b8c7e4b708028c57d816cf9=
d2434acb33a549475f78c181f6253"
+SRC_URI[glob-0.3.0.sha256sum] =3D "9b919933a397b79c37e33b77bb2aa3dc8eb6e=
165ad809e58ff75bc7db2e34574"
+SRC_URI[half-2.4.1.sha256sum] =3D "6dd08c532ae367adf81c312a4580bc67f1d0f=
e8bc9c460520283f4c0ff277888"
+SRC_URI[hashbrown-0.12.3.sha256sum] =3D "8a9ee70c43aaf417c914396645a0fa8=
52624801b24ebb7ae78fe8272889ac888"
+SRC_URI[hashbrown-0.15.0.sha256sum] =3D "1e087f84d4f86bf4b218b9271298623=
74b72199ae7d8657835f1e89000eea4fb"
+SRC_URI[heck-0.4.0.sha256sum] =3D "2540771e65fc8cb83cd6e8a237f70c319bd5c=
29f78ed1084ba5d50eeac86f7f9"
+SRC_URI[hermit-abi-0.1.19.sha256sum] =3D "62b467343b94ba476dcb2500d242da=
dbb39557df889310ac77c5d99100aaac33"
+SRC_URI[hermit-abi-0.3.1.sha256sum] =3D "fed44880c466736ef9a5c5b5facefb5=
ed0785676d0c02d612db14e54f0d84286"
+SRC_URI[idna-0.3.0.sha256sum] =3D "e14ddfc70884202db2244c223200c204c2bda=
1bc6e0998d11b5e024d657209e6"
+SRC_URI[indexmap-1.9.1.sha256sum] =3D "10a35a97730320ffe8e2d410b5d3b6927=
9b98d2c14bdb8b70ea89ecf7888d41e"
+SRC_URI[indexmap-2.6.0.sha256sum] =3D "707907fe3c25f5424cce2cb7e1cbcafee=
6bdbe735ca90ef77c29e84591e5b9da"
+SRC_URI[instant-0.1.12.sha256sum] =3D "7a5bbe824c507c5da5956355e86a746d8=
2e0e1464f65d862cc5e71da70e94b2c"
+SRC_URI[intrusive-collections-0.9.6.sha256sum] =3D "b694dc9f70c3bda87462=
6d2aed13b780f137aab435f4e9814121955cf706122e"
+SRC_URI[io-lifetimes-1.0.5.sha256sum] =3D "1abeb7a0dd0f8181267ff8adc3970=
75586500b81b28a73e8a0208b00fc170fb3"
+SRC_URI[is-terminal-0.4.4.sha256sum] =3D "21b6b32576413a8e69b90e952e4a02=
6476040d81017b80445deda5f2d3921857"
+SRC_URI[itertools-0.12.1.sha256sum] =3D "ba291022dbbd398a455acf126c1e341=
954079855bc60dfdda641363bd6922569"
+SRC_URI[itoa-1.0.2.sha256sum] =3D "112c678d4050afce233f4f2852bb2eb519230=
b3cf12f33585275537d7e41578d"
+SRC_URI[jobserver-0.1.24.sha256sum] =3D "af25a77299a7f711a01975c35a6a424=
eb6862092cc2d6c72c4ed6cbc56dfc1fa"
+SRC_URI[lazy_static-1.4.0.sha256sum] =3D "e2abad23fbc42b3700f2f279844dc8=
32adb2b2eb069b2df918f455c4e18cc646"
+SRC_URI[lazycell-1.3.0.sha256sum] =3D "830d08ce1d1d941e6b30645f1a0eb5643=
013d835ce3779a5fc208261dbe10f55"
+SRC_URI[libc-0.2.174.sha256sum] =3D "1171693293099992e19cddea4e8b849964e=
9846f4acee11b3948bcc337be8776"
+SRC_URI[libdbus-sys-0.2.5.sha256sum] =3D "06085512b750d640299b79be4bad3d=
2fa90a9c00b1fd9e1b46364f66f0485c72"
+SRC_URI[libfuzzer-sys-0.4.4.sha256sum] =3D "ae185684fe19814afd066da15a7c=
c41e126886c21282934225d9fc847582da58"
+SRC_URI[libloading-0.7.3.sha256sum] =3D "efbc0f03f9a775e9f6aed295c6a1ba2=
253c5757a9e03d55c6caa46a681abcddd"
+SRC_URI[libslirp-sys-4.2.1.sha256sum] =3D "2772370ce9b7fa05c7eae0bd03300=
5e139a64d52cee498a7905b3eb5d243c5f4"
+SRC_URI[libtest-mimic-0.6.0.sha256sum] =3D "d7b603516767d1ab23d0de09d023=
e62966c3322f7148297c35cf3d97aa8b37fa"
+SRC_URI[linux-raw-sys-0.1.4.sha256sum] =3D "f051f77a7c8e6957c0696eac88f2=
6b0117e54f52d3fc682ab19397a8812846a4"
+SRC_URI[linux-raw-sys-0.9.4.sha256sum] =3D "cd945864f07fe9f5371a27ad7b52=
a172b4b499999f1d97574c9fa68373937e12"
+SRC_URI[litrs-0.2.3.sha256sum] =3D "f9275e0933cf8bb20f008924c0cb07a0692f=
e54d8064996520bf998de9eb79aa"
+SRC_URI[lock_api-0.4.9.sha256sum] =3D "435011366fe56583b16cf956f9df0095b=
405b82d76425bc8981c0e22e60ec4df"
+SRC_URI[log-0.4.21.sha256sum] =3D "90ed8c1e510134f979dbc4f070f87d4313098=
b704861a105fe34231c70a3901c"
+SRC_URI[lz4_flex-0.11.1.sha256sum] =3D "3ea9b256699eda7b0387ffbc776dd625=
e28bde3918446381781245b7a50349d8"
+SRC_URI[malloc_buf-0.0.6.sha256sum] =3D "62bb907fe88d54d8d9ce32a3cceab42=
18ed2f6b7d35617cafe9adf84e43919cb"
+SRC_URI[managed-0.8.0.sha256sum] =3D "0ca88d725a0a943b096803bd34e73a4437=
208b6077654cc4ecb2947a5f91618d"
+SRC_URI[memchr-2.5.0.sha256sum] =3D "2dffe52ecf27772e601905b7522cb4ef790=
d2cc203488bbd0e2fe85fcb74566d"
+SRC_URI[memoffset-0.8.0.sha256sum] =3D "d61c719bcfbcf5d62b3a09efa6088de8=
c54bc0bfcd3ea7ae39fcc186108b8de1"
+SRC_URI[memoffset-0.9.0.sha256sum] =3D "5a634b1c61a95585bd15607c6ab0c4e5=
b226e695ff2800ba0cdccddf208c406c"
+SRC_URI[mesa3d_util-0.1.75.sha256sum] =3D "61c76e90ba0bde4c5eb7c1b23d9b0=
b87333ce3e3db9a3f5fd44b2caae3c99358"
+SRC_URI[minimal-lexical-0.2.1.sha256sum] =3D "68354c5c6bd36d73ff3feceb05=
efa59b6acb7626617f4962be322a825e61f79a"
+SRC_URI[miniz_oxide-0.7.2.sha256sum] =3D "9d811f3e15f28568be3407c8e7fdb6=
514c1cda3cb30683f15b6a1a1dc4ea14a7"
+SRC_URI[mio-0.8.11.sha256sum] =3D "a4a650543ca06a924e8b371db273b2756685f=
aae30f8487da1b56505a8f78b0c"
+SRC_URI[named-lock-0.3.0.sha256sum] =3D "0b4a84f3731e71a5792fca72324356b=
f700c8959d31a2ac34134b25989f254c3"
+SRC_URI[nix-0.26.2.sha256sum] =3D "bfdda3d196821d6af13126e40375cdf7da646=
a96114af134d5f417a9a1dc8e1a"
+SRC_URI[nix-0.27.1.sha256sum] =3D "2eb04e9c688eff1c89d72b407f168cf79bb9e=
867a9d3323ed6c01519eb9cc053"
+SRC_URI[nix-0.28.0.sha256sum] =3D "ab2156c4fce2f8df6c499cc1c763e4394b748=
2525bf2a9701c9d79d215f519e4"
+SRC_URI[nom-7.1.1.sha256sum] =3D "a8903e5a29a317527874d0402f867152a3d21c=
908bb0b933e416c65e301d4c36"
+SRC_URI[num-traits-0.2.15.sha256sum] =3D "578ede34cf02f8924ab9447f50c280=
75b4d3e5b269972345e7e0372b38c6cdcd"
+SRC_URI[num_cpus-1.13.1.sha256sum] =3D "19e64526ebdee182341572e50e9ad039=
65aa510cd94427a4549448f285e957a1"
+SRC_URI[objc-0.2.7.sha256sum] =3D "915b1b472bc21c53464d6c8461c9d3af805ba=
1ef837e1cac254428f4a77177b1"
+SRC_URI[object-0.32.2.sha256sum] =3D "a6a622008b6e321afc04970976f62ee297=
fdbaa6f95318ca343e3eebb9648441"
+SRC_URI[once_cell-1.17.0.sha256sum] =3D "6f61fba1741ea2b3d6a1e3178721804=
bb716a68a6aeba1149b5d52e3d464ea66"
+SRC_URI[openssl-0.10.51.sha256sum] =3D "97ea2d98598bf9ada7ea6ee8a30fb74f=
9156b63bbe495d64ec2b87c269d2dda3"
+SRC_URI[openssl-macros-0.1.0.sha256sum] =3D "b501e44f11665960c7e7fcf062c=
7d96a14ade4aa98116c004b2e37b5be7d736c"
+SRC_URI[openssl-sys-0.9.86.sha256sum] =3D "992bac49bdbab4423199c654a5515=
bd2a6c6a23bf03f2dd3bdb7e5ae6259bc69"
+SRC_URI[os_str_bytes-6.4.1.sha256sum] =3D "9b7820b9daea5457c9f21c6944890=
5d723fbd21136ccf521748f23fd49e723ee"
+SRC_URI[p9-0.3.2.sha256sum] =3D "0dc5b2b13cb6a9a5fcf7c668ebf2aef67e0d83d=
4451c1db95feb9fb0775874f0"
+SRC_URI[p9_wire_format_derive-0.3.0.sha256sum] =3D "9317f09e751274d3cb2a=
2678a785c456133a3d1f956f9f79bd460aec84acb600"
+SRC_URI[parking_lot-0.12.1.sha256sum] =3D "3742b2c103b9f06bc9fff0a37ff49=
12935851bee6d36f3c02bcc755bcfec228f"
+SRC_URI[parking_lot_core-0.9.6.sha256sum] =3D "ba1ef8814b5c993410bb3adfa=
d7a5ed269563e4a2f90c41f5d85be7fb47133bf"
+SRC_URI[paste-1.0.7.sha256sum] =3D "0c520e05135d6e763148b6426a837e239041=
653ba7becd2e538c076c738025fc"
+SRC_URI[pcap-file-1.1.1.sha256sum] =3D "6ad13fed1a83120159aea81b265074f2=
1d753d157dd16b10cc3790ecba40a341"
+SRC_URI[peeking_take_while-0.1.2.sha256sum] =3D "19b17cddbe7ec3f8bc80088=
7bab5e717348c95ea2ca0b1bf0837fb964dc67099"
+SRC_URI[percent-encoding-2.2.0.sha256sum] =3D "478c572c3d73181ff3c253904=
5f6eb99e5491218eae919370993b890cdbdd98e"
+SRC_URI[pin-project-lite-0.2.13.sha256sum] =3D "8afb450f006bf6385ca15ef4=
5d71d2288452bc3683ce2e2cacc0d18e4be60b58"
+SRC_URI[pin-utils-0.1.0.sha256sum] =3D "8b870d8c151b6f2fb93e84a13146138f=
05d02ed11c7e7c54f8826aaaf7c9f184"
+SRC_URI[pkg-config-0.3.31.sha256sum] =3D "953ec861398dccce10c670dfeaf3ec=
4911ca479e9c02154b3a215178c5f566f2"
+SRC_URI[ppv-lite86-0.2.16.sha256sum] =3D "eb9f9e6e233e5c4a35559a617bf40a=
4ec447db2e84c20b55a6f83167b7e57872"
+SRC_URI[prettyplease-0.2.22.sha256sum] =3D "479cf940fbbb3426c32c5d5176f6=
2ad57549a0bb84773423ba8be9d089f5faba"
+SRC_URI[proc-macro-crate-1.3.1.sha256sum] =3D "7f4c021e1093a56626774e812=
16a4ce732a735e5bad4868a03f3ed65ca0c3919"
+SRC_URI[proc-macro-error-1.0.4.sha256sum] =3D "da25490ff9892aab3fcf7c36f=
08cfb902dd3e71ca0f9f9517bea02a73a5ce38c"
+SRC_URI[proc-macro-error-attr-1.0.4.sha256sum] =3D "a1be40180e52ecc98ad8=
0b184934baf3d0d29f979574e439af5a55274b35f869"
+SRC_URI[proc-macro2-1.0.85.sha256sum] =3D "22244ce15aa966053a896d1accb3a=
6e68469b97c7f33f284b99f0d576879fc23"
+SRC_URI[protobuf-3.7.2.sha256sum] =3D "d65a1d4ddae7d8b5de68153b48f6aa3bb=
a8cb002b243dbdbc55a5afbc98f99f4"
+SRC_URI[protobuf-codegen-3.7.2.sha256sum] =3D "5d3976825c0014bbd2f3b34f0=
001876604fe87e0c86cd8fa54251530f1544ace"
+SRC_URI[protobuf-parse-3.7.2.sha256sum] =3D "b4aeaa1f2460f1d348eeaeed86a=
ea999ce98c1bded6f089ff8514c9d9dbdc973"
+SRC_URI[protobuf-support-3.7.2.sha256sum] =3D "3e36c2f31e0a47f9280fb347e=
f5e461ffcd2c52dd520d8e216b52f93b0b0d7d6"
+SRC_URI[quote-0.3.15.sha256sum] =3D "7a6e920b65c65f10b2ae65c831a81a073a8=
9edd28c7cce89475bff467ab4167a"
+SRC_URI[quote-1.0.36.sha256sum] =3D "0fa76aaf39101c457836aec0ce2316dbdc3=
ab723cdda1c6bd4e6ad4208acaca7"
+SRC_URI[rand-0.8.5.sha256sum] =3D "34af8d1a0e25924bc5b7c43c079c942339d8f=
0a8b57c39049bef581b46327404"
+SRC_URI[rand_chacha-0.3.1.sha256sum] =3D "e6c10a63a0fa32252be49d21e7709d=
4d4baf8d231c2dbce1eaa8141b9b127d88"
+SRC_URI[rand_core-0.6.3.sha256sum] =3D "d34f1408f55294453790c48b2f1ebbb1=
c5b4b7563eb1f418bcfcfdbb06ebb4e7"
+SRC_URI[rayon-1.7.0.sha256sum] =3D "1d2df5196e37bcc87abebc0053e20787d738=
47bb33134a69841207dd0a47f03b"
+SRC_URI[rayon-core-1.11.0.sha256sum] =3D "4b8f95bd6966f5c87776639160a66b=
d8ab9895d9d4ab01ddba9fc60661aebe8d"
+SRC_URI[redox_syscall-0.2.15.sha256sum] =3D "534cfe58d6a18cc17120fbf4635=
d53d14691c1fe4d951064df9bd326178d7d5a"
+SRC_URI[regex-1.6.0.sha256sum] =3D "4c4eb3267174b8c6c2f654116623910a0fef=
09c4753f8dd83db29c48a0df988b"
+SRC_URI[regex-syntax-0.6.27.sha256sum] =3D "a3f87b73ce11b1619a3c6332f453=
41e0047173771e8b8b73f87bfeefb7b56244"
+SRC_URI[remain-0.2.6.sha256sum] =3D "5704e2cda92fd54202f05430725317ba0ea=
7d0c96b246ca0a92e45177127ba3b"
+SRC_URI[remove_dir_all-0.5.3.sha256sum] =3D "3acd125665422973a33ac9d3dd2=
df85edad0f4ae9b00dafb1a05e43a9f5ef8e7"
+SRC_URI[rustc-demangle-0.1.23.sha256sum] =3D "d626bb9dae77e28219937af045=
c257c28bfd3f69333c512553507f5f9798cb76"
+SRC_URI[rustc-hash-1.1.0.sha256sum] =3D "08d43f7aa6b08d49f382cde6a798204=
7c3426db949b1424bc4b7ec9ae12c6ce2"
+SRC_URI[rustix-0.36.8.sha256sum] =3D "f43abb88211988493c1abb44a70efa56ff=
0ce98f233b7b276146f1f3f7ba9644"
+SRC_URI[rustix-1.0.7.sha256sum] =3D "c71e83d6afe7ff64890ec6b71d6a69bb8a6=
10ab78ce364b3352876bb4c801266"
+SRC_URI[rutabaga_gfx-0.1.76-chromeos.sha256sum] =3D "5a806736e3d23fb7c43=
0b67f8a3162233d98a9a34790a3f533278bcc140041af"
+SRC_URI[ryu-1.0.10.sha256sum] =3D "f3f6f92acf49d1b98f7a81226834412ada054=
58b7364277387724a237f062695"
+SRC_URI[same-file-1.0.6.sha256sum] =3D "93fc1dc3aaa9bfed95e02e6eadabb4ba=
f7e3078b0bd1b4d7b6b0b68378900502"
+SRC_URI[scopeguard-1.1.0.sha256sum] =3D "d29ab0c6d3fc0ee92fe66e2d99f700e=
ab17a8d57d1c1d3b748380fb20baa78cd"
+SRC_URI[scudo-0.1.3.sha256sum] =3D "12bfcb1ca07a487406afea13bdb7a2f3cf88=
e67b39c20dfd64e1801909b5c688"
+SRC_URI[scudo-proc-macros-0.1.0.sha256sum] =3D "b3267c900aee8fbc8451235b=
70c5e2dae96bb19110eabc325be5d5dfed8e7461"
+SRC_URI[scudo-sys-0.2.2.sha256sum] =3D "bcdbdfb28236bf083b47d0babb07e486=
bb003ed85011072b023ea4ed27760ddb"
+SRC_URI[serde-1.0.140.sha256sum] =3D "fc855a42c7967b7c369eb5860f7164ef1f=
6f81c20c7cc1141f2a604e18723b03"
+SRC_URI[serde_derive-1.0.140.sha256sum] =3D "6f2122636b9fe3b81f1cb25099f=
cf2d3f542cdb1d45940d56c713158884a05da"
+SRC_URI[serde_json-1.0.82.sha256sum] =3D "82c2c1fdcd807d1098552c5b9a36e4=
25e42e9fbd7c6a37a8425f390f781f7fa7"
+SRC_URI[shlex-1.3.0.sha256sum] =3D "0fda2ff0d084019ba4d7c6f371c95d8fd75c=
e3524c3cb8fb653a3023f6323e64"
+SRC_URI[slab-0.4.7.sha256sum] =3D "4614a76b2a8be0058caa9dbbaf66d988527d8=
6d003c11a94fbd335d7661edcef"
+SRC_URI[smallvec-1.9.0.sha256sum] =3D "2fd0db749597d91ff862fd1d55ea87f78=
55a744a8425a64695b6fca237d1dad1"
+SRC_URI[socket2-0.4.10.sha256sum] =3D "9f7916fc008ca5542385b89a3d3ce6899=
53c143e9304a9bf8beec1de48994c0d"
+SRC_URI[static_assertions-1.1.0.sha256sum] =3D "a2eb9349b6444b326872e140=
eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
+SRC_URI[strsim-0.10.0.sha256sum] =3D "73473c0e59e6d5812c5dfe2a064a644494=
9f089e20eec9a2e5506596494e4623"
+SRC_URI[syn-0.11.11.sha256sum] =3D "d3b891b9015c88c576343b9b3e41c2c11a51=
c219ef067b264bd9c8aa9b441dad"
+SRC_URI[syn-1.0.103.sha256sum] =3D "a864042229133ada95abf3b54fdc62ef5cca=
be9515b64717bcb9a1919e59445d"
+SRC_URI[syn-2.0.77.sha256sum] =3D "9f35bcdf61fd8e7be6caf75f429fdca8beb3e=
d76584befb503b1569faee373ed"
+SRC_URI[synom-0.11.3.sha256sum] =3D "a393066ed9010ebaed60b9eafa373d4b1ba=
ac186dd7e008555b0f702b51945b6"
+SRC_URI[tempfile-3.3.0.sha256sum] =3D "5cdb1ef4eaeeaddc8fbd371e501705706=
4af0911902ef36b39801f67cc6d79e4"
+SRC_URI[termcolor-1.1.3.sha256sum] =3D "bab24d30b911b2376f3a13cc2cd44314=
2f0c81dda04c118693e35b3835757755"
+SRC_URI[textwrap-0.16.0.sha256sum] =3D "222a222a5bfe1bba4a77b45ec488a741=
b3cb8872e5e499451fd7d0129c9c7c3d"
+SRC_URI[thiserror-1.0.38.sha256sum] =3D "6a9cd18aa97d5c45c6603caea1da662=
8790b37f7a34b6ca89522331c5180fed0"
+SRC_URI[thiserror-impl-1.0.38.sha256sum] =3D "1fb327af4685e4d03fa8cbcf17=
16380da910eeb2bb8be417e7f9fd3fb164f36f"
+SRC_URI[thread_local-1.1.8.sha256sum] =3D "8b9ef9bad013ada3808854ceac7b4=
6812a6465ba368859a37e2100283d2d719c"
+SRC_URI[threadpool-1.8.1.sha256sum] =3D "d050e60b33d41c19108b32cea321640=
33a9013fe3b46cbd4457559bfbf77afaa"
+SRC_URI[tinyvec-1.6.0.sha256sum] =3D "87cc5ceb3875bb20c2890005a4e226a465=
1264a5c75edb2421b52861a0a0cb50"
+SRC_URI[tinyvec_macros-0.1.0.sha256sum] =3D "cda74da7e1a664f795bb1f8a87e=
c406fb89a02522cf6e50620d016add6dbbf5c"
+SRC_URI[tokio-1.29.1.sha256sum] =3D "532826ff75199d5833b9d2c5fe410f29235=
e25704ee5f0ef599fb51c21f4a4da"
+SRC_URI[tokio-macros-2.1.0.sha256sum] =3D "630bdcf245f78637c13ec01ffae61=
87cca34625e8c63150d424b59e55af2675e"
+SRC_URI[toml-0.5.9.sha256sum] =3D "8d82e1a7758622a465f8cee077614c73484da=
c5b836c02ff6a40d5d1010324d7"
+SRC_URI[toml_datetime-0.6.8.sha256sum] =3D "0dd7358ecb8fc2f8d014bf86f6f6=
38ce72ba252a2c3a2572f2a795f1d23efb41"
+SRC_URI[toml_edit-0.19.15.sha256sum] =3D "1b5bb770da30e5cbfde35a2d7b9b8a=
2c4b8ef89548a7a6aeab5c9a576e3e7421"
+SRC_URI[twox-hash-1.6.3.sha256sum] =3D "97fee6b57c6a41524a810daee9286c02=
d7752c4253064d0b05472833a438f675"
+SRC_URI[unicode-bidi-0.3.8.sha256sum] =3D "099b7128301d285f79ddd55b9a83d=
5e6b9e97c92e0ea0daebee7263e932de992"
+SRC_URI[unicode-ident-1.0.2.sha256sum] =3D "15c61ba63f9235225a22310255a2=
9b806b907c9b8c964bcbd0a2c70f3f2deea7"
+SRC_URI[unicode-normalization-0.1.22.sha256sum] =3D "5c5713f0fc4b5db668a=
2ac63cdb7bb4469d8c9fed047b1d0292cc7b0ce2ba921"
+SRC_URI[unicode-xid-0.0.4.sha256sum] =3D "8c1f860d7d29cf02cb2f3f359fd359=
91af3d30bac52c57d265a3c461074cb4dc"
+SRC_URI[url-2.3.1.sha256sum] =3D "0d68c799ae75762b8c3fe375feb6600ef5602c=
883c5d21eb51c09f22b83c4643"
+SRC_URI[userfaultfd-0.8.1.sha256sum] =3D "18d8b176d4d3e420685e964f87c25d=
f5fdd5b26d7eb0d0e7c892d771f5b81035"
+SRC_URI[userfaultfd-sys-0.5.0.sha256sum] =3D "d75595d2a62b7db16bd47f5a1c=
e14e1fe05ccbe27d6c96721a958e0a027cad41"
+SRC_URI[uuid-1.8.0.sha256sum] =3D "a183cf7feeba97b4dd1c0d46788634f6221d8=
7fa961b305bed08c851829efcc0"
+SRC_URI[v4l2r-0.0.6.sha256sum] =3D "b4f8945ec08a0f9c9b3596c3437bfc8ed1e5=
c4feefcc230ecf5641aa9b44392b"
+SRC_URI[vcpkg-0.2.15.sha256sum] =3D "accd4ea62f7bb7a82fe23066fb0957d48ef=
677f6eeb8215f372f52e48bb32426"
+SRC_URI[version_check-0.9.4.sha256sum] =3D "49874b5167b65d7193b8aba1567f=
5c7d93d001cafc34600cee003eda787e483f"
+SRC_URI[virtio-media-0.0.7.sha256sum] =3D "a6fe4fe1401316867eda765926fe6=
742849ca33dd4ea4f887036661c3cd15625"
+SRC_URI[vk-parse-0.8.0.sha256sum] =3D "4c6a0bda9bbe6b9e50e6456c80aa8fe4c=
ca3b21e4311a1130c41e4915ec2e32a"
+SRC_URI[vulkano-0.31.1.sha256sum] =3D "49e6f6f908670b33ec1fcb1e9c25677cb=
4d6783893f89bc11d49d2eb5061ccb5"
+SRC_URI[vulkano-0.33.0.sha256sum] =3D "1e1f15eeb9d93a05eb3c237332a10806e=
ac1eb82444e54485bfcc1859c483c23"
+SRC_URI[vulkano-macros-0.33.0.sha256sum] =3D "895b8a2cac1e7650d2d0552f23=
92da0970a358515ac11a34adaf19bfdc771b98"
+SRC_URI[walkdir-2.5.0.sha256sum] =3D "29790946404f91d9c5d06f9874efddea1d=
c06c5efe94541a7d6863108e3a5e4b"
+SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] =3D "9c8d87e72b64a=
3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
+SRC_URI[which-4.2.5.sha256sum] =3D "5c4fb54e6113b6a8772ee41c3404fb0301ac=
79604489467e0a9ce1f3e97c24ae"
+SRC_URI[widestring-1.0.2.sha256sum] =3D "653f141f39ec16bba3c5abe400a0c60=
da7468261cc2cbf36805022876bc721a8"
+SRC_URI[winapi-0.3.9.sha256sum] =3D "5c839a674fcd7a98952e593242ea400abe9=
3992746761e38641405d28b00f419"
+SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] =3D "ac3b87c63620426=
dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
+SRC_URI[winapi-util-0.1.5.sha256sum] =3D "70ec6ce85bb158151cae5e5c87f95a=
8e97d2c0c4b001223f33a334e3ce5de178"
+SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] =3D "712e227841d05=
7c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
+SRC_URI[windows-0.61.1.sha256sum] =3D "c5ee8f3d025738cb02bad7868bbb5f8a6=
327501e870bf51f1b455b0a2454a419"
+SRC_URI[windows-collections-0.2.0.sha256sum] =3D "3beeceb5e5cfd9eb1d76b3=
81630e82c4241ccd0d27f1a39ed41b2760b255c5e8"
+SRC_URI[windows-core-0.61.2.sha256sum] =3D "c0fdd3ddb90610c7638aa2b3a3ab=
2904fb9e5cdbecc643ddb3647212781c4ae3"
+SRC_URI[windows-future-0.2.1.sha256sum] =3D "fc6a41e98427b19fe4b73c550f0=
60b59fa592d7d686537eebf9385621bfbad8e"
+SRC_URI[windows-implement-0.60.0.sha256sum] =3D "a47fddd13af08290e67f4ac=
abf4b459f647552718f683a7b415d290ac744a836"
+SRC_URI[windows-interface-0.59.1.sha256sum] =3D "bd9211b69f8dcdfa817bfd1=
4bf1c97c9188afa36f4750130fcdf3f400eca9fa8"
+SRC_URI[windows-link-0.1.1.sha256sum] =3D "76840935b766e1b0a05c0066835fb=
9ec80071d4c09a16f6bd5f7e655e3c14c38"
+SRC_URI[windows-numerics-0.2.0.sha256sum] =3D "9150af68066c4c5c07ddc0ce3=
0421554771e528bde427614c61038bc2c92c2b1"
+SRC_URI[windows-result-0.3.4.sha256sum] =3D "56f42bd332cc6c8eac5af113fc0=
c1fd6a8fd2aa08a0119358686e5160d0586c6"
+SRC_URI[windows-strings-0.4.2.sha256sum] =3D "56e6c93f3a0c3b36176cb1327a=
4958a0353d5d166c2a35cb268ace15e91d3b57"
+SRC_URI[windows-sys-0.42.0.sha256sum] =3D "5a3e1820f08b8513f676f7ab6c1f9=
9ff312fb97b553d30ff4dd86f9f15728aa7"
+SRC_URI[windows-sys-0.45.0.sha256sum] =3D "75283be5efb2831d37ea142365f00=
9c02ec203cd29a3ebecbc093d52315b66d0"
+SRC_URI[windows-sys-0.48.0.sha256sum] =3D "677d2418bec65e3338edb076e806b=
c1ec15693c5d0104683f2efe857f61056a9"
+SRC_URI[windows-sys-0.59.0.sha256sum] =3D "1e38bc4d79ed67fd075bcc251a1c3=
9b32a1776bbe92e5bef1f0bf1f8c531853b"
+SRC_URI[windows-targets-0.42.1.sha256sum] =3D "8e2522491fbfcd58cc84d47ae=
b2958948c4b8982e9a2d8a2a35bbaed431390e7"
+SRC_URI[windows-targets-0.48.5.sha256sum] =3D "9a2fa6e2155d7247be68c0964=
56083145c183cbbbc2764150dda45a87197940c"
+SRC_URI[windows-targets-0.52.6.sha256sum] =3D "9b724f72796e036ab90c1021d=
4780d4d3d648aca59e491e6b98e725b84e99973"
+SRC_URI[windows-threading-0.1.0.sha256sum] =3D "b66463ad2e0ea3bbf808b7f1=
d371311c80e115c0b71d60efc142cafbcfb057a6"
+SRC_URI[windows_aarch64_gnullvm-0.42.1.sha256sum] =3D "8c9864e83243fdec7=
fc9c5444389dcbbfd258f745e7853198f365e3c4968a608"
+SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] =3D "2b38e32f0abccf998=
7a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
+SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] =3D "32a4622180e7a0ec0=
44bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
+SRC_URI[windows_aarch64_msvc-0.42.1.sha256sum] =3D "4c8b1b673ffc16c47a9f=
f48570a9d85e25d265735c503681332589af6253c6c7"
+SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] =3D "dc35310971f3b2dbbf3f=
0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
+SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] =3D "09ec2a7bb152e2252b53=
fa7803150007879548bc709c039df7627cabbd05d469"
+SRC_URI[windows_i686_gnu-0.42.1.sha256sum] =3D "de3887528ad530ba7bdbb1fa=
a8275ec7a1155a45ffa57c37993960277145d640"
+SRC_URI[windows_i686_gnu-0.48.5.sha256sum] =3D "a75915e7def60c94dcef7220=
0b9a8e58e5091744960da64ec734a6c6e9b3743e"
+SRC_URI[windows_i686_gnu-0.52.6.sha256sum] =3D "8e9b5ad5ab802e97eb8e295a=
c6720e509ee4c243f69d781394014ebfe8bbfa0b"
+SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] =3D "0eee52d38c090b3caa76=
c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
+SRC_URI[windows_i686_msvc-0.42.1.sha256sum] =3D "bf4d1122317eddd6ff351aa=
852118a2418ad4214e6613a50e0191f7004372605"
+SRC_URI[windows_i686_msvc-0.48.5.sha256sum] =3D "8f55c233f70c4b27f66c523=
580f78f1004e8b5a8b659e05a4eb49d4166cca406"
+SRC_URI[windows_i686_msvc-0.52.6.sha256sum] =3D "240948bc05c5e7c6dabba28=
bf89d89ffce3e303022809e73deaefe4f6ec56c66"
+SRC_URI[windows_x86_64_gnu-0.42.1.sha256sum] =3D "c1040f221285e17ebccbc2=
591ffdc2d44ee1f9186324dd3e84e99ac68d699c45"
+SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] =3D "53d40abd2583d23e4718fd=
df1ebec84dbff8381c07cae67ff7768bbf19c6718e"
+SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] =3D "147a5c80aabfbf0c7d901c=
b5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
+SRC_URI[windows_x86_64_gnullvm-0.42.1.sha256sum] =3D "628bfdf232daa22b0d=
64fdb62b09fcc36bb01f05a3939e20ab73aaf9470d0463"
+SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] =3D "0b7b52767868a23d5b=
ab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
+SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] =3D "24d5b23dc417412679=
681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
+SRC_URI[windows_x86_64_msvc-0.42.1.sha256sum] =3D "447660ad36a13288b1db4=
d4248e857b510e8c3a225c822ba4fb748c0aafecffd"
+SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] =3D "ed94fce61571a4006852b=
7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
+SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] =3D "589f6da84c646204747d1=
270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
+SRC_URI[winnow-0.5.40.sha256sum] =3D "f593a95398737aeed53e489c785df13f36=
18e41dbcd6718c6addbf1395aa6876"
+SRC_URI[wio-0.2.2.sha256sum] =3D "5d129932f4644ac2396cb456385cbf9e63b5b3=
0c6e8dc4820bdca4eb082037a5"
+SRC_URI[xml-rs-0.8.19.sha256sum] =3D "0fcb9cbac069e033553e8bb871be2fbdff=
cab578eb25bd0f7c508cedc6dcd75a"
+SRC_URI[zerocopy-0.7.32.sha256sum] =3D "74d4d3961e53fa4c9a25a8637fc2bfaf=
2595b3d3ae34875568a5cf64787716be"
+SRC_URI[zerocopy-0.8.14.sha256sum] =3D "a367f292d93d4eab890745e75a778da4=
0909cab4d6ff8173693812f79c4a2468"
+SRC_URI[zerocopy-derive-0.7.32.sha256sum] =3D "9ce1b18ccd8e73a9321186f97=
e46f9f04b778851177567b1975109d26a08d2a6"
+SRC_URI[zerocopy-derive-0.8.14.sha256sum] =3D "d3931cb58c62c13adec22e386=
86b559c86a30565e16ad6e8510a337cedc611e1"
+SRC_URI[zeroize-1.5.7.sha256sum] =3D "c394b5bd0c6f669e7275d9c20aa90ae064=
cb22e75a1cad54e1b34088034b149f"
+SRC_URI[zstd-0.13.2.sha256sum] =3D "fcf2b778a664581e31e389454a7072dab164=
7606d44f7feea22cd5abb9c9f3f9"
+SRC_URI[zstd-safe-7.2.1.sha256sum] =3D "54a3ab4db68cea366acc5c897c7b4d4d=
1b8994a9cd6e6f841f8964566a419059"
+SRC_URI[zstd-sys-2.0.13+zstd.1.5.6.sha256sum] =3D "38ff0f21cfee8f97d94ce=
f41359e0c89aa6113028ab0291aa8ca0038995a95aa"
+# from tools/contrib/crosvmdump/Cargo.lock
+SRC_URI +=3D " \
+    crate://crates.io/anyhow/1.0.75 \
+    crate://crates.io/autocfg/1.1.0 \
+    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/crossbeam-channel/0.5.8 \
+    crate://crates.io/crossbeam-deque/0.8.3 \
+    crate://crates.io/crossbeam-epoch/0.9.15 \
+    crate://crates.io/crossbeam-utils/0.8.16 \
+    crate://crates.io/either/1.8.1 \
+    crate://crates.io/hermit-abi/0.3.2 \
+    crate://crates.io/libc/0.2.147 \
+    crate://crates.io/memoffset/0.9.0 \
+    crate://crates.io/num_cpus/1.16.0 \
+    crate://crates.io/rayon/1.7.0 \
+    crate://crates.io/rayon-core/1.11.0 \
+    crate://crates.io/scopeguard/1.2.0 \
+"
+
+SRC_URI[anyhow-1.0.75.sha256sum] =3D "a4668cab20f66d8d020e1fbc0ebe472174=
33c1b6c8f2040faf858554e394ace6"
+SRC_URI[autocfg-1.1.0.sha256sum] =3D "d468802bab17cbc0cc575e9b053f41e72a=
a36bfa6b7f55e3529ffa43161b97fa"
+SRC_URI[cfg-if-1.0.0.sha256sum] =3D "baf1de4339761588bc0619e3cbc0120ee58=
2ebb74b53b4efbf79117bd2da40fd"
+SRC_URI[crossbeam-channel-0.5.8.sha256sum] =3D "a33c2bf77f2df06183c3aa30=
d1e96c0695a313d4f9c453cc3762a6db39f99200"
+SRC_URI[crossbeam-deque-0.8.3.sha256sum] =3D "ce6fd6f855243022dcecf8702f=
ef0c297d4338e226845fe067f6341ad9fa0cef"
+SRC_URI[crossbeam-epoch-0.9.15.sha256sum] =3D "ae211234986c545741a7dc064=
309f67ee1e5ad243d0e48335adc0484d960bcc7"
+SRC_URI[crossbeam-utils-0.8.16.sha256sum] =3D "5a22b2d63d4d1dc0b7f1b6b27=
47dd0088008a9be28b6ddf0b1e7d335e3037294"
+SRC_URI[either-1.8.1.sha256sum] =3D "7fcaabb2fef8c910e7f4c7ce9f67a1283a1=
715879a7c230ca9d6d1ae31f16d91"
+SRC_URI[hermit-abi-0.3.2.sha256sum] =3D "443144c8cdadd93ebf52ddb4056d257=
f5b52c04d3c804e657d19eb73fc33668b"
+SRC_URI[libc-0.2.147.sha256sum] =3D "b4668fb0ea861c1df094127ac5f1da3409a=
82116a4ba74fca2e58ef927159bb3"
+SRC_URI[memoffset-0.9.0.sha256sum] =3D "5a634b1c61a95585bd15607c6ab0c4e5=
b226e695ff2800ba0cdccddf208c406c"
+SRC_URI[num_cpus-1.16.0.sha256sum] =3D "4161fcb6d602d4d2081af7c3a45852d8=
75a03dd337a6bfdd6e06407b61342a43"
+SRC_URI[rayon-1.7.0.sha256sum] =3D "1d2df5196e37bcc87abebc0053e20787d738=
47bb33134a69841207dd0a47f03b"
+SRC_URI[rayon-core-1.11.0.sha256sum] =3D "4b8f95bd6966f5c87776639160a66b=
d8ab9895d9d4ab01ddba9fc60661aebe8d"
+SRC_URI[scopeguard-1.2.0.sha256sum] =3D "94143f37725109f92c262ed2cf5e59b=
ce7498c01bcc1502d7b9afe439a4e9f49"
+# from tools/contrib/memstats_chart/Cargo.lock
+SRC_URI +=3D " \
+    crate://crates.io/aho-corasick/1.0.2 \
+    crate://crates.io/anyhow/1.0.72 \
+    crate://crates.io/argh/0.1.10 \
+    crate://crates.io/argh_derive/0.1.10 \
+    crate://crates.io/argh_shared/0.1.10 \
+    crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/bitflags/2.3.3 \
+    crate://crates.io/cc/1.0.79 \
+    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/ctrlc/3.4.0 \
+    crate://crates.io/env_logger/0.10.0 \
+    crate://crates.io/errno/0.3.1 \
+    crate://crates.io/errno-dragonfly/0.1.2 \
+    crate://crates.io/hermit-abi/0.3.2 \
+    crate://crates.io/humantime/2.1.0 \
+    crate://crates.io/is-terminal/0.4.9 \
+    crate://crates.io/itoa/1.0.9 \
+    crate://crates.io/libc/0.2.147 \
+    crate://crates.io/linux-raw-sys/0.4.3 \
+    crate://crates.io/log/0.4.19 \
+    crate://crates.io/memchr/2.5.0 \
+    crate://crates.io/nix/0.26.2 \
+    crate://crates.io/proc-macro2/1.0.66 \
+    crate://crates.io/quote/1.0.31 \
+    crate://crates.io/regex/1.9.1 \
+    crate://crates.io/regex-automata/0.3.3 \
+    crate://crates.io/regex-syntax/0.7.4 \
+    crate://crates.io/rustix/0.38.4 \
+    crate://crates.io/ryu/1.0.15 \
+    crate://crates.io/serde/1.0.171 \
+    crate://crates.io/serde_derive/1.0.171 \
+    crate://crates.io/serde_json/1.0.103 \
+    crate://crates.io/static_assertions/1.1.0 \
+    crate://crates.io/syn/1.0.109 \
+    crate://crates.io/syn/2.0.26 \
+    crate://crates.io/termcolor/1.2.0 \
+    crate://crates.io/unicode-ident/1.0.11 \
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
+SRC_URI[aho-corasick-1.0.2.sha256sum] =3D "43f6cb1bf222025340178f382c426=
f13757b2960e89779dfcb319c32542a5a41"
+SRC_URI[anyhow-1.0.72.sha256sum] =3D "3b13c32d80ecc7ab747b80c3784bce54ee=
8a7a0cc4fbda9bf4cda2cf6fe90854"
+SRC_URI[argh-0.1.10.sha256sum] =3D "ab257697eb9496bf75526f0217b5ed64636a=
9cfafa78b8365c71bd283fcef93e"
+SRC_URI[argh_derive-0.1.10.sha256sum] =3D "b382dbd3288e053331f03399e1db1=
06c9fb0d8562ad62cb04859ae926f324fa6"
+SRC_URI[argh_shared-0.1.10.sha256sum] =3D "64cb94155d965e3d37ffbbe7cc5b8=
2c3dd79dd33bd48e536f73d2cfb8d85506f"
+SRC_URI[bitflags-1.3.2.sha256sum] =3D "bef38d45163c2f1dde094a7dfd33ccf59=
5c92905c8f8f4fdc18d06fb1037718a"
+SRC_URI[bitflags-2.3.3.sha256sum] =3D "630be753d4e58660abd17930c71b647fe=
46c27ea6b63cc59e1e3851406972e42"
+SRC_URI[cc-1.0.79.sha256sum] =3D "50d30906286121d95be3d479533b458f87493b=
30a4b5f79a607db8f5d11aa91f"
+SRC_URI[cfg-if-1.0.0.sha256sum] =3D "baf1de4339761588bc0619e3cbc0120ee58=
2ebb74b53b4efbf79117bd2da40fd"
+SRC_URI[ctrlc-3.4.0.sha256sum] =3D "2a011bbe2c35ce9c1f143b7af6f94f29a167=
beb4cd1d29e6740ce836f723120e"
+SRC_URI[env_logger-0.10.0.sha256sum] =3D "85cdab6a89accf66733ad5a1693a4d=
cced6aeff64602b634530dd73c1f3ee9f0"
+SRC_URI[errno-0.3.1.sha256sum] =3D "4bcfec3a70f97c962c307b2d2c56e358cf1d=
00b558d74262b5f929ee8cc7e73a"
+SRC_URI[errno-dragonfly-0.1.2.sha256sum] =3D "aa68f1b12764fab894d2755d25=
18754e71b4fd80ecfb822714a1206c2aab39bf"
+SRC_URI[hermit-abi-0.3.2.sha256sum] =3D "443144c8cdadd93ebf52ddb4056d257=
f5b52c04d3c804e657d19eb73fc33668b"
+SRC_URI[humantime-2.1.0.sha256sum] =3D "9a3a5bfb195931eeb336b2a7b4d761da=
ec841b97f947d34394601737a7bba5e4"
+SRC_URI[is-terminal-0.4.9.sha256sum] =3D "cb0889898416213fab133e1d33a0e5=
858a48177452750691bde3666d0fdbaf8b"
+SRC_URI[itoa-1.0.9.sha256sum] =3D "af150ab688ff2122fcef229be89cb50dd66af=
9e01a4ff320cc137eecc9bacc38"
+SRC_URI[libc-0.2.147.sha256sum] =3D "b4668fb0ea861c1df094127ac5f1da3409a=
82116a4ba74fca2e58ef927159bb3"
+SRC_URI[linux-raw-sys-0.4.3.sha256sum] =3D "09fc20d2ca12cb9f044c93e3bd6d=
32d523e6e2ec3db4f7b2939cd99026ecd3f0"
+SRC_URI[log-0.4.19.sha256sum] =3D "b06a4cde4c0f271a446782e3eff8de789548c=
e57dbc8eca9292c27f4a42004b4"
+SRC_URI[memchr-2.5.0.sha256sum] =3D "2dffe52ecf27772e601905b7522cb4ef790=
d2cc203488bbd0e2fe85fcb74566d"
+SRC_URI[nix-0.26.2.sha256sum] =3D "bfdda3d196821d6af13126e40375cdf7da646=
a96114af134d5f417a9a1dc8e1a"
+SRC_URI[proc-macro2-1.0.66.sha256sum] =3D "18fb31db3f9bddb2ea821cde30a9f=
70117e3f119938b5ee630b7403aa6e2ead9"
+SRC_URI[quote-1.0.31.sha256sum] =3D "5fe8a65d69dd0808184ebb5f836ab526bb2=
59db23c657efa38711b1072ee47f0"
+SRC_URI[regex-1.9.1.sha256sum] =3D "b2eae68fc220f7cf2532e4494aded17545fc=
e192d59cd996e0fe7887f4ceb575"
+SRC_URI[regex-automata-0.3.3.sha256sum] =3D "39354c10dd07468c2e73926b23b=
b9c2caca74c5501e38a35da70406f1d923310"
+SRC_URI[regex-syntax-0.7.4.sha256sum] =3D "e5ea92a5b6195c6ef2a0295ea818b=
312502c6fc94dde986c5553242e18fd4ce2"
+SRC_URI[rustix-0.38.4.sha256sum] =3D "0a962918ea88d644592894bc6dc55acc6c=
0956488adcebbfb6e273506b7fd6e5"
+SRC_URI[ryu-1.0.15.sha256sum] =3D "1ad4cc8da4ef723ed60bced201181d83791ad=
433213d8c24efffda1eec85d741"
+SRC_URI[serde-1.0.171.sha256sum] =3D "30e27d1e4fd7659406c492fd6cfaf2066b=
a8773de45ca75e855590f856dc34a9"
+SRC_URI[serde_derive-1.0.171.sha256sum] =3D "389894603bd18c46fa56231694f=
8d827779c0951a667087194cf9de94ed24682"
+SRC_URI[serde_json-1.0.103.sha256sum] =3D "d03b412469450d4404fe8499a268e=
dd7f8b79fecb074b0d812ad64ca21f4031b"
+SRC_URI[static_assertions-1.1.0.sha256sum] =3D "a2eb9349b6444b326872e140=
eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
+SRC_URI[syn-1.0.109.sha256sum] =3D "72b64191b275b66ffe2469e8af2c1cfe3baf=
a67b529ead792a6d0160888b4237"
+SRC_URI[syn-2.0.26.sha256sum] =3D "45c3457aacde3c65315de5031ec191ce46604=
304d2446e803d71ade03308d970"
+SRC_URI[termcolor-1.2.0.sha256sum] =3D "be55cf8942feac5c765c2c9934228068=
43c9a9a45d4d5c407ad6dd2ea95eb9b6"
+SRC_URI[unicode-ident-1.0.11.sha256sum] =3D "301abaae475aa91687eb82514b3=
28ab47a211a533026cb25fc3e519b86adfc3c"
+SRC_URI[winapi-0.3.9.sha256sum] =3D "5c839a674fcd7a98952e593242ea400abe9=
3992746761e38641405d28b00f419"
+SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] =3D "ac3b87c63620426=
dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
+SRC_URI[winapi-util-0.1.5.sha256sum] =3D "70ec6ce85bb158151cae5e5c87f95a=
8e97d2c0c4b001223f33a334e3ce5de178"
+SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] =3D "712e227841d05=
7c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
+SRC_URI[windows-sys-0.48.0.sha256sum] =3D "677d2418bec65e3338edb076e806b=
c1ec15693c5d0104683f2efe857f61056a9"
+SRC_URI[windows-targets-0.48.1.sha256sum] =3D "05d4b17490f70499f20b9e791=
dcf6a299785ce8af4d709018206dc5b4953e95f"
+SRC_URI[windows_aarch64_gnullvm-0.48.0.sha256sum] =3D "91ae572e1b79dba88=
3e0d315474df7305d12f569b400fcf90581b06062f7e1bc"
+SRC_URI[windows_aarch64_msvc-0.48.0.sha256sum] =3D "b2ef27e0d7bdfcfc7b86=
8b317c1d32c641a6fe4629c171b8928c7b08d98d7cf3"
+SRC_URI[windows_i686_gnu-0.48.0.sha256sum] =3D "622a1962a7db830d6fd0a696=
83c80a18fda201879f0f447f065a3b7467daa241"
+SRC_URI[windows_i686_msvc-0.48.0.sha256sum] =3D "4542c6e364ce21bf45d69fd=
d2a8e455fa38d316158cfd43b3ac1c5b1b19f8e00"
+SRC_URI[windows_x86_64_gnu-0.48.0.sha256sum] =3D "ca2b8a661f7628cbd23440=
e50b05d705db3686f894fc9580820623656af974b1"
+SRC_URI[windows_x86_64_gnullvm-0.48.0.sha256sum] =3D "7896dbc1f41e08872e=
9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953"
+SRC_URI[windows_x86_64_msvc-0.48.0.sha256sum] =3D "1a515f5799fe4961cb532=
f983ce2b23082366b898e52ffbce459c86f67c8378a"
+# from tools/contrib/cros_tracing_analyser/Cargo.lock
+SRC_URI +=3D " \
+    crate://crates.io/aho-corasick/1.1.2 \
+    crate://crates.io/anyhow/1.0.75 \
+    crate://crates.io/argh/0.1.12 \
+    crate://crates.io/argh_derive/0.1.12 \
+    crate://crates.io/argh_shared/0.1.12 \
+    crate://crates.io/bindgen/0.65.1 \
+    crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/bitflags/2.4.1 \
+    crate://crates.io/cexpr/0.6.0 \
+    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/clang-sys/1.6.1 \
+    crate://crates.io/either/1.9.0 \
+    crate://crates.io/errno/0.3.5 \
+    crate://crates.io/glob/0.3.1 \
+    crate://crates.io/home/0.5.5 \
+    crate://crates.io/itoa/1.0.9 \
+    crate://crates.io/lazy_static/1.4.0 \
+    crate://crates.io/lazycell/1.3.0 \
+    crate://crates.io/libc/0.2.149 \
+    crate://crates.io/libloading/0.7.4 \
+    crate://crates.io/libtracecmd/0.2.1 \
+    crate://crates.io/linux-raw-sys/0.4.10 \
+    crate://crates.io/log/0.4.20 \
+    crate://crates.io/memchr/2.6.4 \
+    crate://crates.io/minimal-lexical/0.2.1 \
+    crate://crates.io/nom/7.1.3 \
+    crate://crates.io/once_cell/1.18.0 \
+    crate://crates.io/peeking_take_while/0.1.2 \
+    crate://crates.io/pkg-config/0.3.27 \
+    crate://crates.io/prettyplease/0.2.15 \
+    crate://crates.io/proc-macro2/1.0.69 \
+    crate://crates.io/quote/1.0.33 \
+    crate://crates.io/regex/1.10.2 \
+    crate://crates.io/regex-automata/0.4.3 \
+    crate://crates.io/regex-syntax/0.8.2 \
+    crate://crates.io/rustc-hash/1.1.0 \
+    crate://crates.io/rustix/0.38.21 \
+    crate://crates.io/ryu/1.0.15 \
+    crate://crates.io/serde/1.0.190 \
+    crate://crates.io/serde_derive/1.0.190 \
+    crate://crates.io/serde_json/1.0.108 \
+    crate://crates.io/shlex/1.3.0 \
+    crate://crates.io/syn/2.0.38 \
+    crate://crates.io/thiserror/1.0.50 \
+    crate://crates.io/thiserror-impl/1.0.50 \
+    crate://crates.io/unicode-ident/1.0.12 \
+    crate://crates.io/which/4.4.2 \
+    crate://crates.io/winapi/0.3.9 \
+    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
+    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+    crate://crates.io/windows-sys/0.48.0 \
+    crate://crates.io/windows-targets/0.48.5 \
+    crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
+    crate://crates.io/windows_aarch64_msvc/0.48.5 \
+    crate://crates.io/windows_i686_gnu/0.48.5 \
+    crate://crates.io/windows_i686_msvc/0.48.5 \
+    crate://crates.io/windows_x86_64_gnu/0.48.5 \
+    crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
+    crate://crates.io/windows_x86_64_msvc/0.48.5 \
+"
+
+SRC_URI[aho-corasick-1.1.2.sha256sum] =3D "b2969dcb958b36655471fc61f7e41=
6fa76033bdd4bfed0678d8fee1e2d07a1f0"
+SRC_URI[anyhow-1.0.75.sha256sum] =3D "a4668cab20f66d8d020e1fbc0ebe472174=
33c1b6c8f2040faf858554e394ace6"
+SRC_URI[argh-0.1.12.sha256sum] =3D "7af5ba06967ff7214ce4c7419c7d185be7ec=
d6cc4965a8f6e1d8ce0398aad219"
+SRC_URI[argh_derive-0.1.12.sha256sum] =3D "56df0aeedf6b7a2fc67d06db35b09=
684c3e8da0c95f8f27685cb17e08413d87a"
+SRC_URI[argh_shared-0.1.12.sha256sum] =3D "5693f39141bda5760ecc4111ab08d=
a40565d1771038c4a0250f03457ec707531"
+SRC_URI[bindgen-0.65.1.sha256sum] =3D "cfdf7b466f9a4903edc73f95d6d2bcd5b=
af8ae620638762244d3f60143643cc5"
+SRC_URI[bitflags-1.3.2.sha256sum] =3D "bef38d45163c2f1dde094a7dfd33ccf59=
5c92905c8f8f4fdc18d06fb1037718a"
+SRC_URI[bitflags-2.4.1.sha256sum] =3D "327762f6e5a765692301e5bb513e0d9fe=
f63be86bbc14528052b1cd3e6f03e07"
+SRC_URI[cexpr-0.6.0.sha256sum] =3D "6fac387a98bb7c37292057cffc56d62ecb62=
9900026402633ae9160df93a8766"
+SRC_URI[cfg-if-1.0.0.sha256sum] =3D "baf1de4339761588bc0619e3cbc0120ee58=
2ebb74b53b4efbf79117bd2da40fd"
+SRC_URI[clang-sys-1.6.1.sha256sum] =3D "c688fc74432808e3eb684cae8830a86b=
e1d66a2bd58e1f248ed0960a590baf6f"
+SRC_URI[either-1.9.0.sha256sum] =3D "a26ae43d7bcc3b814de94796a5e736d4029=
efb0ee900c12e2d54c993ad1a1e07"
+SRC_URI[errno-0.3.5.sha256sum] =3D "ac3e13f66a2f95e32a39eaa81f6b95d42878=
ca0e1db0c7543723dfe12557e860"
+SRC_URI[glob-0.3.1.sha256sum] =3D "d2fabcfbdc87f4758337ca535fb41a6d701b6=
5693ce38287d856d1674551ec9b"
+SRC_URI[home-0.5.5.sha256sum] =3D "5444c27eef6923071f7ebcc33e3444508466a=
76f7a2b93da00ed6e19f30c1ddb"
+SRC_URI[itoa-1.0.9.sha256sum] =3D "af150ab688ff2122fcef229be89cb50dd66af=
9e01a4ff320cc137eecc9bacc38"
+SRC_URI[lazy_static-1.4.0.sha256sum] =3D "e2abad23fbc42b3700f2f279844dc8=
32adb2b2eb069b2df918f455c4e18cc646"
+SRC_URI[lazycell-1.3.0.sha256sum] =3D "830d08ce1d1d941e6b30645f1a0eb5643=
013d835ce3779a5fc208261dbe10f55"
+SRC_URI[libc-0.2.149.sha256sum] =3D "a08173bc88b7955d1b3145aa561539096c4=
21ac8debde8cbc3612ec635fee29b"
+SRC_URI[libloading-0.7.4.sha256sum] =3D "b67380fd3b2fbe7527a606e18729d21=
c6f3951633d0500574c4dc22d2d638b9f"
+SRC_URI[libtracecmd-0.2.1.sha256sum] =3D "607a526f92ff1c8a64cef68c8d4b87=
ec3c58dbe0edab5f0f80b7f2f64c4910fb"
+SRC_URI[linux-raw-sys-0.4.10.sha256sum] =3D "da2479e8c062e40bf0066ffa0bc=
823de0a9368974af99c9f6df941d2c231e03f"
+SRC_URI[log-0.4.20.sha256sum] =3D "b5e6163cb8c49088c2c36f57875e58ccd8c87=
c7427f7fbd50ea6710b2f3f2e8f"
+SRC_URI[memchr-2.6.4.sha256sum] =3D "f665ee40bc4a3c5590afb1e9677db74a508=
659dfd71e126420da8274909a0167"
+SRC_URI[minimal-lexical-0.2.1.sha256sum] =3D "68354c5c6bd36d73ff3feceb05=
efa59b6acb7626617f4962be322a825e61f79a"
+SRC_URI[nom-7.1.3.sha256sum] =3D "d273983c5a657a70a3e8f2a01329822f3b8c81=
72b73826411a55751e404a0a4a"
+SRC_URI[once_cell-1.18.0.sha256sum] =3D "dd8b5dd2ae5ed71462c540258bedcb5=
1965123ad7e7ccf4b9a8cafaa4a63576d"
+SRC_URI[peeking_take_while-0.1.2.sha256sum] =3D "19b17cddbe7ec3f8bc80088=
7bab5e717348c95ea2ca0b1bf0837fb964dc67099"
+SRC_URI[pkg-config-0.3.27.sha256sum] =3D "26072860ba924cbfa98ea39c8c19b4=
dd6a4a25423dbdf219c1eca91aa0cf6964"
+SRC_URI[prettyplease-0.2.15.sha256sum] =3D "ae005bd773ab59b4725093fd7df8=
3fd7892f7d8eafb48dbd7de6e024e4215f9d"
+SRC_URI[proc-macro2-1.0.69.sha256sum] =3D "134c189feb4956b20f6f547d2cf72=
7d4c0fe06722b20a0eec87ed445a97f92da"
+SRC_URI[quote-1.0.33.sha256sum] =3D "5267fca4496028628a95160fc423a33e8b2=
e6af8a5302579e322e4b520293cae"
+SRC_URI[regex-1.10.2.sha256sum] =3D "380b951a9c5e80ddfd6136919eef3231072=
1aa4aacd4889a8d39124b026ab343"
+SRC_URI[regex-automata-0.4.3.sha256sum] =3D "5f804c7828047e88b2d32e2d7fe=
5a105da8ee3264f01902f796c8e067dc2483f"
+SRC_URI[regex-syntax-0.8.2.sha256sum] =3D "c08c74e62047bb2de4ff487b251e4=
a92e24f48745648451635cec7d591162d9f"
+SRC_URI[rustc-hash-1.1.0.sha256sum] =3D "08d43f7aa6b08d49f382cde6a798204=
7c3426db949b1424bc4b7ec9ae12c6ce2"
+SRC_URI[rustix-0.38.21.sha256sum] =3D "2b426b0506e5d50a7d8dafcf2e8147140=
0deb602392c7dd110815afb4eaf02a3"
+SRC_URI[ryu-1.0.15.sha256sum] =3D "1ad4cc8da4ef723ed60bced201181d83791ad=
433213d8c24efffda1eec85d741"
+SRC_URI[serde-1.0.190.sha256sum] =3D "91d3c334ca1ee894a2c6f6ad698fe8c435=
b76d504b13d436f0685d648d6d96f7"
+SRC_URI[serde_derive-1.0.190.sha256sum] =3D "67c5609f394e5c2bd7fc51efda4=
78004ea80ef42fee983d5c67a65e34f32c0e3"
+SRC_URI[serde_json-1.0.108.sha256sum] =3D "3d1c7e3eac408d115102c4c24ad39=
3e0821bb3a5df4d506a80f85f7a742a526b"
+SRC_URI[shlex-1.3.0.sha256sum] =3D "0fda2ff0d084019ba4d7c6f371c95d8fd75c=
e3524c3cb8fb653a3023f6323e64"
+SRC_URI[syn-2.0.38.sha256sum] =3D "e96b79aaa137db8f61e26363a0c9b47d8b4ec=
75da28b7d1d614c2303e232408b"
+SRC_URI[thiserror-1.0.50.sha256sum] =3D "f9a7210f5c9a7156bb50aa36aed4c95=
afb51df0df00713949448cf9e97d382d2"
+SRC_URI[thiserror-impl-1.0.50.sha256sum] =3D "266b2e40bc00e5a6c09c358401=
1e08b06f123c00362c92b975ba9843aaaa14b8"
+SRC_URI[unicode-ident-1.0.12.sha256sum] =3D "3354b9ac3fae1ff6755cb6db536=
83adb661634f67557942dea4facebec0fee4b"
+SRC_URI[which-4.4.2.sha256sum] =3D "87ba24419a2078cd2b0f2ede2691b6c66d8e=
47836da3b6db8265ebad47afbfc7"
+SRC_URI[winapi-0.3.9.sha256sum] =3D "5c839a674fcd7a98952e593242ea400abe9=
3992746761e38641405d28b00f419"
+SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] =3D "ac3b87c63620426=
dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
+SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] =3D "712e227841d05=
7c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
+SRC_URI[windows-sys-0.48.0.sha256sum] =3D "677d2418bec65e3338edb076e806b=
c1ec15693c5d0104683f2efe857f61056a9"
+SRC_URI[windows-targets-0.48.5.sha256sum] =3D "9a2fa6e2155d7247be68c0964=
56083145c183cbbbc2764150dda45a87197940c"
+SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] =3D "2b38e32f0abccf998=
7a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
+SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] =3D "dc35310971f3b2dbbf3f=
0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
+SRC_URI[windows_i686_gnu-0.48.5.sha256sum] =3D "a75915e7def60c94dcef7220=
0b9a8e58e5091744960da64ec734a6c6e9b3743e"
+SRC_URI[windows_i686_msvc-0.48.5.sha256sum] =3D "8f55c233f70c4b27f66c523=
580f78f1004e8b5a8b659e05a4eb49d4166cca406"
+SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] =3D "53d40abd2583d23e4718fd=
df1ebec84dbff8381c07cae67ff7768bbf19c6718e"
+SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] =3D "0b7b52767868a23d5b=
ab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
+SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] =3D "ed94fce61571a4006852b=
7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
+# from tools/contrib/vcpu_blocker_analyzer/Cargo.lock
+SRC_URI +=3D " \
+    crate://crates.io/aho-corasick/1.1.2 \
+    crate://crates.io/anyhow/1.0.79 \
+    crate://crates.io/argh/0.1.12 \
+    crate://crates.io/argh_derive/0.1.12 \
+    crate://crates.io/argh_shared/0.1.12 \
+    crate://crates.io/autocfg/1.1.0 \
+    crate://crates.io/bitflags/2.4.2 \
+    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/env_logger/0.10.2 \
+    crate://crates.io/errno/0.3.8 \
+    crate://crates.io/futures/0.3.30 \
+    crate://crates.io/futures-channel/0.3.30 \
+    crate://crates.io/futures-core/0.3.30 \
+    crate://crates.io/futures-executor/0.3.30 \
+    crate://crates.io/futures-io/0.3.30 \
+    crate://crates.io/futures-macro/0.3.30 \
+    crate://crates.io/futures-sink/0.3.30 \
+    crate://crates.io/futures-task/0.3.30 \
+    crate://crates.io/futures-timer/3.0.2 \
+    crate://crates.io/futures-util/0.3.30 \
+    crate://crates.io/glob/0.3.1 \
+    crate://crates.io/hermit-abi/0.3.4 \
+    crate://crates.io/humantime/2.1.0 \
+    crate://crates.io/is-terminal/0.4.10 \
+    crate://crates.io/itoa/1.0.10 \
+    crate://crates.io/libc/0.2.152 \
+    crate://crates.io/linux-raw-sys/0.4.13 \
+    crate://crates.io/log/0.4.20 \
+    crate://crates.io/memchr/2.7.1 \
+    crate://crates.io/pin-project-lite/0.2.13 \
+    crate://crates.io/pin-utils/0.1.0 \
+    crate://crates.io/proc-macro2/1.0.78 \
+    crate://crates.io/quote/1.0.35 \
+    crate://crates.io/regex/1.10.3 \
+    crate://crates.io/regex-automata/0.4.4 \
+    crate://crates.io/regex-syntax/0.8.2 \
+    crate://crates.io/relative-path/1.9.2 \
+    crate://crates.io/rstest/0.19.0 \
+    crate://crates.io/rstest_macros/0.19.0 \
+    crate://crates.io/rustc_version/0.4.0 \
+    crate://crates.io/rustix/0.38.30 \
+    crate://crates.io/ryu/1.0.16 \
+    crate://crates.io/semver/1.0.21 \
+    crate://crates.io/serde/1.0.195 \
+    crate://crates.io/serde_derive/1.0.195 \
+    crate://crates.io/serde_json/1.0.111 \
+    crate://crates.io/slab/0.4.9 \
+    crate://crates.io/syn/2.0.48 \
+    crate://crates.io/termcolor/1.4.1 \
+    crate://crates.io/unicode-ident/1.0.12 \
+    crate://crates.io/winapi/0.3.9 \
+    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
+    crate://crates.io/winapi-util/0.1.6 \
+    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+    crate://crates.io/windows-sys/0.52.0 \
+    crate://crates.io/windows-targets/0.52.0 \
+    crate://crates.io/windows_aarch64_gnullvm/0.52.0 \
+    crate://crates.io/windows_aarch64_msvc/0.52.0 \
+    crate://crates.io/windows_i686_gnu/0.52.0 \
+    crate://crates.io/windows_i686_msvc/0.52.0 \
+    crate://crates.io/windows_x86_64_gnu/0.52.0 \
+    crate://crates.io/windows_x86_64_gnullvm/0.52.0 \
+    crate://crates.io/windows_x86_64_msvc/0.52.0 \
+"
+
+SRC_URI[aho-corasick-1.1.2.sha256sum] =3D "b2969dcb958b36655471fc61f7e41=
6fa76033bdd4bfed0678d8fee1e2d07a1f0"
+SRC_URI[anyhow-1.0.79.sha256sum] =3D "080e9890a082662b09c1ad45f567faeeb4=
7f22b5fb23895fbe1e651e718e25ca"
+SRC_URI[argh-0.1.12.sha256sum] =3D "7af5ba06967ff7214ce4c7419c7d185be7ec=
d6cc4965a8f6e1d8ce0398aad219"
+SRC_URI[argh_derive-0.1.12.sha256sum] =3D "56df0aeedf6b7a2fc67d06db35b09=
684c3e8da0c95f8f27685cb17e08413d87a"
+SRC_URI[argh_shared-0.1.12.sha256sum] =3D "5693f39141bda5760ecc4111ab08d=
a40565d1771038c4a0250f03457ec707531"
+SRC_URI[autocfg-1.1.0.sha256sum] =3D "d468802bab17cbc0cc575e9b053f41e72a=
a36bfa6b7f55e3529ffa43161b97fa"
+SRC_URI[bitflags-2.4.2.sha256sum] =3D "ed570934406eb16438a4e976b1b450077=
4099c13b8cb96eec99f620f05090ddf"
+SRC_URI[cfg-if-1.0.0.sha256sum] =3D "baf1de4339761588bc0619e3cbc0120ee58=
2ebb74b53b4efbf79117bd2da40fd"
+SRC_URI[env_logger-0.10.2.sha256sum] =3D "4cd405aab171cb85d6735e5c8d9db0=
38c17d3ca007a4d2c25f337935c3d90580"
+SRC_URI[errno-0.3.8.sha256sum] =3D "a258e46cdc063eb8519c00b9fc845fc47bcf=
ca4130e2f08e88665ceda8474245"
+SRC_URI[futures-0.3.30.sha256sum] =3D "645c6916888f6cb6350d2550b80fb63e7=
34897a8498abe35cfb732b6487804b0"
+SRC_URI[futures-channel-0.3.30.sha256sum] =3D "eac8f7d7865dcb88bd4373ab6=
71c8cf4508703796caa2b1985a9ca867b3fcb78"
+SRC_URI[futures-core-0.3.30.sha256sum] =3D "dfc6580bb841c5a68e9ef15c77cc=
c837b40a7504914d52e47b8b0e9bbda25a1d"
+SRC_URI[futures-executor-0.3.30.sha256sum] =3D "a576fc72ae164fca6b9db127=
eaa9a9dda0d61316034f33a0a0d4eda41f02b01d"
+SRC_URI[futures-io-0.3.30.sha256sum] =3D "a44623e20b9681a318efdd71c299b6=
b222ed6f231972bfe2f224ebad6311f0c1"
+SRC_URI[futures-macro-0.3.30.sha256sum] =3D "87750cf4b7a4c0625b1529e4c54=
3c2182106e4dedc60a2a6455e00d212c489ac"
+SRC_URI[futures-sink-0.3.30.sha256sum] =3D "9fb8e00e87438d937621c1c6269e=
53f536c14d3fbd6a042bb24879e57d474fb5"
+SRC_URI[futures-task-0.3.30.sha256sum] =3D "38d84fa142264698cdce1a9f9172=
cf383a0c82de1bddcf3092901442c4097004"
+SRC_URI[futures-timer-3.0.2.sha256sum] =3D "e64b03909df88034c26dc1547e89=
70b91f98bdb65165d6a4e9110d94263dbb2c"
+SRC_URI[futures-util-0.3.30.sha256sum] =3D "3d6401deb83407ab3da39eba7e33=
987a73c3df0c82b4bb5813ee871c19c41d48"
+SRC_URI[glob-0.3.1.sha256sum] =3D "d2fabcfbdc87f4758337ca535fb41a6d701b6=
5693ce38287d856d1674551ec9b"
+SRC_URI[hermit-abi-0.3.4.sha256sum] =3D "5d3d0e0f38255e7fa3cf31335b3a56f=
05febd18025f4db5ef7a0cfb4f8da651f"
+SRC_URI[humantime-2.1.0.sha256sum] =3D "9a3a5bfb195931eeb336b2a7b4d761da=
ec841b97f947d34394601737a7bba5e4"
+SRC_URI[is-terminal-0.4.10.sha256sum] =3D "0bad00257d07be169d870ab665980=
b06cdb366d792ad690bf2e76876dc503455"
+SRC_URI[itoa-1.0.10.sha256sum] =3D "b1a46d1a171d865aa5f83f92695765caa047=
a9b4cbae2cbf37dbd613a793fd4c"
+SRC_URI[libc-0.2.152.sha256sum] =3D "13e3bf6590cbc649f4d1a3eefc9d5d6eb74=
6f5200ffb04e5e142700b8faa56e7"
+SRC_URI[linux-raw-sys-0.4.13.sha256sum] =3D "01cda141df6706de531b6c46c3a=
33ecca755538219bd484262fa09410c13539c"
+SRC_URI[log-0.4.20.sha256sum] =3D "b5e6163cb8c49088c2c36f57875e58ccd8c87=
c7427f7fbd50ea6710b2f3f2e8f"
+SRC_URI[memchr-2.7.1.sha256sum] =3D "523dc4f511e55ab87b694dc30d0f820d609=
06ef06413f93d4d7a1385599cc149"
+SRC_URI[pin-project-lite-0.2.13.sha256sum] =3D "8afb450f006bf6385ca15ef4=
5d71d2288452bc3683ce2e2cacc0d18e4be60b58"
+SRC_URI[pin-utils-0.1.0.sha256sum] =3D "8b870d8c151b6f2fb93e84a13146138f=
05d02ed11c7e7c54f8826aaaf7c9f184"
+SRC_URI[proc-macro2-1.0.78.sha256sum] =3D "e2422ad645d89c99f8f3e6b88a9fd=
eca7fabeac836b1002371c4367c8f984aae"
+SRC_URI[quote-1.0.35.sha256sum] =3D "291ec9ab5efd934aaf503a6466c5d525153=
5d108ee747472c3977cc5acc868ef"
+SRC_URI[regex-1.10.3.sha256sum] =3D "b62dbe01f0b06f9d8dc7d49e05a0785f153=
b00b2c227856282f671e0318c9b15"
+SRC_URI[regex-automata-0.4.4.sha256sum] =3D "3b7fa1134405e2ec9353fd416b1=
7f8dacd46c473d7d3fd1cf202706a14eb792a"
+SRC_URI[regex-syntax-0.8.2.sha256sum] =3D "c08c74e62047bb2de4ff487b251e4=
a92e24f48745648451635cec7d591162d9f"
+SRC_URI[relative-path-1.9.2.sha256sum] =3D "e898588f33fdd5b9420719948f9f=
2a32c922a246964576f71ba7f24f80610fbc"
+SRC_URI[rstest-0.19.0.sha256sum] =3D "9d5316d2a1479eeef1ea21e7f9ddc67c19=
1d497abc8fc3ba2467857abbb68330"
+SRC_URI[rstest_macros-0.19.0.sha256sum] =3D "04a9df72cc1f67020b0d63ad9bf=
e4a323e459ea7eb68e03bd9824db49f9a4c25"
+SRC_URI[rustc_version-0.4.0.sha256sum] =3D "bfa0f585226d2e68097d4f95d113=
b15b83a82e819ab25717ec0590d9584ef366"
+SRC_URI[rustix-0.38.30.sha256sum] =3D "322394588aaf33c24007e8bb3238ee3e4=
c5c09c084ab32bc73890b99ff326bca"
+SRC_URI[ryu-1.0.16.sha256sum] =3D "f98d2aa92eebf49b69786be48e4477826b256=
916e84a57ff2a4f21923b48eb4c"
+SRC_URI[semver-1.0.21.sha256sum] =3D "b97ed7a9823b74f99c7742f5336af7be5e=
cd3eeafcb1507d1fa93347b1d589b0"
+SRC_URI[serde-1.0.195.sha256sum] =3D "63261df402c67811e9ac6def069e478614=
8c4563f4b50fd4bf30aa370d626b02"
+SRC_URI[serde_derive-1.0.195.sha256sum] =3D "46fe8f8603d81ba86327b23a2e9=
cdf49e1255fb94a4c5f297f6ee0547178ea2c"
+SRC_URI[serde_json-1.0.111.sha256sum] =3D "176e46fa42316f18edd598015a516=
6857fc835ec732f5215eac6b7bdbf0a84f4"
+SRC_URI[slab-0.4.9.sha256sum] =3D "8f92a496fb766b417c996b9c5e57daf2f7ad3=
b0bebe1ccfca4856390e3d3bb67"
+SRC_URI[syn-2.0.48.sha256sum] =3D "0f3531638e407dfc0814761abb7c00a5b5499=
2b849452a0646b7f65c9f770f3f"
+SRC_URI[termcolor-1.4.1.sha256sum] =3D "06794f8f6c5c898b3275aebefa6b8a1c=
b24cd2c6c79397ab15774837a0bc5755"
+SRC_URI[unicode-ident-1.0.12.sha256sum] =3D "3354b9ac3fae1ff6755cb6db536=
83adb661634f67557942dea4facebec0fee4b"
+SRC_URI[winapi-0.3.9.sha256sum] =3D "5c839a674fcd7a98952e593242ea400abe9=
3992746761e38641405d28b00f419"
+SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] =3D "ac3b87c63620426=
dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
+SRC_URI[winapi-util-0.1.6.sha256sum] =3D "f29e6f9198ba0d26b4c9f07dbe6f9e=
d633e1f3d5b8b414090084349e46a52596"
+SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] =3D "712e227841d05=
7c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
+SRC_URI[windows-sys-0.52.0.sha256sum] =3D "282be5f36a8ce781fad8c8ae18fa3=
f9beff57ec1b52cb3de0789201425d9a33d"
+SRC_URI[windows-targets-0.52.0.sha256sum] =3D "8a18201040b24831fbb9e4eb2=
08f8892e1f50a37feb53cc7ff887feb8f50e7cd"
+SRC_URI[windows_aarch64_gnullvm-0.52.0.sha256sum] =3D "cb7764e35d4db8a79=
21e09562a0304bf2f93e0a51bfccee0bd0bb0b666b015ea"
+SRC_URI[windows_aarch64_msvc-0.52.0.sha256sum] =3D "bbaa0368d4f1d2aaefc5=
5b6fcfee13f41544ddf36801e793edbbfd7d7df075ef"
+SRC_URI[windows_i686_gnu-0.52.0.sha256sum] =3D "a28637cb1fa3560a16915793=
afb20081aba2c92ee8af57b4d5f28e4b3e7df313"
+SRC_URI[windows_i686_msvc-0.52.0.sha256sum] =3D "ffe5e8e31046ce6230cc721=
5707b816e339ff4d4d67c65dffa206fd0f7aa7b9a"
+SRC_URI[windows_x86_64_gnu-0.52.0.sha256sum] =3D "3d6fa32db2bc4a2f5abeac=
f2b69f7992cd09dca97498da74a151a3132c26befd"
+SRC_URI[windows_x86_64_gnullvm-0.52.0.sha256sum] =3D "1a657e1e9d3f514745=
a572a6846d3c7aa7dbe1658c056ed9c3344c4109a6949e"
+SRC_URI[windows_x86_64_msvc-0.52.0.sha256sum] =3D "dff9641d1cd4be8d1a070=
daf9e3773c5f67e78b4d9d42263020c057706765c04"
diff --git a/recipes-extended/crosvm/crosvm_0.1.0.bb b/recipes-extended/c=
rosvm/crosvm_0.1.0.bb
new file mode 100644
index 00000000..c192ae25
--- /dev/null
+++ b/recipes-extended/crosvm/crosvm_0.1.0.bb
@@ -0,0 +1,61 @@
+SUMMARY =3D "crosvm is a secure, lightweight, and performant Virtual Mac=
hine Monitor (VMM) written in Rust."
+
+DESCRIPTION =3D "\
+crosvm is a Rust-based virtual machine monitor (VMM) originally develope=
d \
+for ChromeOS. It uses KVM acceleration and process-level isolation to ru=
n guest VMs \
+with sandboxed device emulation.\
+"
+
+HOMEPAGE =3D "https://github.com/google/crosvm"
+
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4777ca8ce9fd4f089e88af15fce91=
131"
+
+inherit cargo pkgconfig cargo-update-recipe-crates features_check
+
+SRC_URI =3D " \
+    git://github.com/google/crosvm.git;branch=3Dmain;protocol=3Dhttps;na=
me=3Dcrosvm \
+    git://github.com/google/minijail.git;branch=3Dmain;protocol=3Dhttps;=
name=3Dminijail;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/third_party/min=
ijail \
+"
+
+SRCREV_crosvm =3D "b04c13a65b93034010b20612e3566d4f9d83c4f0"
+SRCREV_minijail =3D "bfd22f25fd2302fe4ae5121d80c836e0f124e742"
+
+SRCREV_FORMAT =3D "crosvm_minijail"
+
+# crosvm does not publish upstream release tags.
+# PV =3D "0.1.0" is an intentionally cosmetic/local version for layer
+# consistency, not an upstream project release.
+PV =3D "0.1.0+git"
+
+# TODO: Break this down into pkgconfig flags mapped to
+# rust cargo feature flags.
+DEPENDS +=3D "libcap wayland wayland-native protobuf-native wayland-prot=
ocols clang-native"
+
+REQUIRED_DISTRO_FEATURES =3D "kvm"
+
+COMPATIBLE_HOST =3D "(aarch64|x86_64).*-linux.*"
+
+# minijail-sys's build.rs uses the bindgen crate (in-process libclang) t=
o
+# generate Rust FFI bindings for libminijail.h. Point bindgen at the
+# clang-native libclang and pass the toolchain and target options so tha=
t
+# cross-compiled header parsing resolves correctly.
+export LIBCLANG_PATH =3D "${STAGING_LIBDIR_NATIVE}"
+export BINDGEN_EXTRA_CLANG_ARGS =3D "--sysroot=3D${STAGING_DIR_HOST}"
+
+# crosvm's own Cargo.toml already supplies [patch.crates-io] minijail =3D
+#   { path =3D "third_party/minijail/rust/minijail" }
+# pointing at the rust/minijail subdirectory, where minijail's Cargo.tom=
l
+# actually lives. cargo_common_do_patch_paths() would inject a competing
+# [patch."<minijail git URL>"] minijail =3D { path =3D "<unpackdir>/git/=
third_party/minijail" }
+# pointing at the minijail repo root, where there is no Cargo.toml =E2=80=
=94 Cargo
+# eagerly validates patch entries and errors out before it would even re=
ach
+# the "unused patch" path. Disable the auto-injection; crosvm's upstream
+# [patch] table is the authoritative one.
+python () {
+   pf =3D (d.getVarFlag("do_configure", "postfuncs") or "").split()
+   pf =3D [f for f in pf if f !=3D "cargo_common_do_patch_paths"]
+   d.setVarFlag("do_configure", "postfuncs", " ".join(pf))
+}
+
+require crosvm-crates.inc
--=20
2.34.1


