Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30CBCD3442
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 20:18:41 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5212.1778185117145570778
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 07 May 2026 13:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AGVm+db9;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b4583f0a1aso8260525ad.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 07 May 2026 13:18:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778185116; cv=none;
        d=google.com; s=arc-20240605;
        b=da50jTc9kird/zcAblt8hwLMjHPxWPqhQq4hKKmWHofm37Wqm3OMUVadukkfvB6UPk
         uveK/YT0aLj3Z2sSldKlZyqGjpYZLUOmHfm8l7BFFl8LTv5I+X55iUYzJJrSJcvbA2B4
         2T0cSzIqZdBIGjckioE1MsnJzlAXWtiaiehl0zQsdMjMhGVlHCrbjV7XHDytrdtFOPzt
         9YcBMHCPd7KunLCQV3CCIjKMleqVr9WurNK5QsCzCfTEyeMsU1B2SkCQXcnj8HCiCqx9
         hn1lEga5dvJVOmNlmxRhd0A8IvYmRfTKXwLsLSjNPFtyQ+Zz/jGtzrsF9bPsqV7W1Q4M
         QxtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RSh8u8P4MfwQvIfHbMIBpnb5ZDDihEODm4Q2d9Cthsk=;
        fh=ivt4HnH7m5AgOhvWf+8Hs/NHFEcGo3+S/FGTR/J6uug=;
        b=lziKbSXN+WJBHPtNfdnDt2S1BYTi6oyqKfI0nOmymTN3ZDdL1ucGWO72HcTh6/j28Z
         f0sR3ZnrvtzYdIpPLiZxr5RcagKsALUIysu83uJ15LuZbaICwouBpvTSmODJuOvYD4nR
         lmU4KpxDAWO4Q9AUvEeAcKREC0J86xnNteQ4o2GXn87z0Gqg78k9yl+umyYMgzEa0f5j
         hZIYES4Ny+oFYmmBbjuI7z6GofJfy1Rw+HkJSPxnqj0zJz3IFMGneuSmtmYx5sF/tqrq
         DmTZH0N+h02cayxnZxodF2uyy/nu4DQE+V+hBZp3YqZXsmFVEHOqS5DIo21uqH0BrOd5
         MXXg==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778185116; x=1778789916; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RSh8u8P4MfwQvIfHbMIBpnb5ZDDihEODm4Q2d9Cthsk=;
        b=AGVm+db9UV30aR3qDGDKLyLca6LYmi/o91j+tEHZjPzA4ikPujmX5BOwSQ+vLasgFr
         M1HqYm5WPhnIZYr0fhoy6pqFRS44mOjcrHfHr3WS8aKLByJR4T3jfo9HUM0YYBwWQDDW
         odbhD0d/mW3oASGUOz5lYJgAtooRMTDVUx3tGxb/jgCeZ4mRBZVTKpq1WtfisVjaMx4q
         BaQT0Iq0u9C9+MGFJNVSe0FPnLJWzoTokE0AoX2zSRPi+0T95GakAGJ9mQL2DW/PHpzU
         IX/ulgKRfGvzQARzhqPFCxmzbfQSZdR5K1WDyro33RMKaklJYn/TF9NKHVNpVI/PZaxE
         P6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778185116; x=1778789916;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RSh8u8P4MfwQvIfHbMIBpnb5ZDDihEODm4Q2d9Cthsk=;
        b=qp44rDcyGfjq/x0TP3+FHm9LC0BakuhX2s/kjMiVLKB6pYw/UpoT3+ChGCmOpJ3NfR
         irORf+t4rup9TFo5QxZSMkiYKEURhywbukl0H7O1ImlyaTl4Qk2wY23autBuBvgjT/tO
         upHs/aSPZPAJylFSq/+4wEojlE7GBj/vrEevmP60LbbGhH+lfFADLgb3nM0wnlnoMOa2
         uVnJ8VCvF09t1kQ8FNgjHHCeGFKYZ6nmm92dczVLFmyYA+cDUhjMiI2AhbW3gm/E0Jtc
         X4un5dOd7u56HBsL1R9fW4ybHHK8W5UeXU71UJEVe30RawJwlO3KRlstSWz6j8Y0EflF
         Hmeg==
X-Gm-Message-State: AOJu0Yz+6An6Vm81gBbMtG5rkJcmFap+o9AzpSAlf2KTmrlNwtpqhsZU
	QtbOtjX+cnzqKh9l3c8hbsDKFA6M+Lfq42Xsdel3ze6/8uoGcaRe53LuOMy9/WHOG4CwsNxJ8V6
	R0767pB2PE45krL+mccimnfx4y0K3DJw=
X-Gm-Gg: Acq92OFfBNPpgHHXNCpvFXCxpE7FushgrsroQPeFxhv091sBbPdnHf3+FEJ2htQK/AE
	nygZTnFJ0QzEVX2A387oP4N+d6LMO036+vcYD7KLhgn7PqxmbmSGpZufmpWqr50TUNnCIxfcJvv
	O7gAu+B5AobwstpB1sWS/ea3uauuCyDt5Oex3IRI2+Y+VG1paIjSUrgs7ulNJBfyqni7KEd6p83
	Hqem5OIKMSKBkzKBhxGVHQswbtVnjMvJtyIXksB5vrLQn9Z9/gOIC9b6xrqhxhqMFZgroEB0XoJ
	YyWqW6dKzCI7dWTuIUvk3/EfSwHg1dfNMsVFFI7I88UWgT1DCS0=
X-Received: by 2002:a17:903:13cf:b0:2ba:1756:aea7 with SMTP id
 d9443c01a7336-2ba78b4402cmr95478435ad.2.1778185115942; Thu, 07 May 2026
 13:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260430-add_podlet-v1-1-95216e9666e6@belden.com>
In-Reply-To: <20260430-add_podlet-v1-1-95216e9666e6@belden.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 7 May 2026 17:18:23 -0300
X-Gm-Features: AVHnY4KpjTllmGyUDLymyNAImy6FqWutrylcUgiGCNVivFoPwfC284yC4afKYuo
Message-ID: <CADkTA4Mf0hox8vZXFpmfKvWDDF1Z1jiQsJG0o6_oReu1MvVzDg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] podlet: add podlet utility
To: patrick.vogelaar@belden.com
Cc: meta-virtualization@lists.yoctoproject.org, 
	patrick.vogelaar.dev@mailbox.org
Content-Type: multipart/alternative; boundary="0000000000002e408506513ffcb7"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 07 May 2026 20:18:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9787

--0000000000002e408506513ffcb7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the delay in replying, I've been out of the office and am
catching up with things while my release testing runs.

One thing that struck me with this is .. are you using it on the build
side, or on the target ? Obviously the build side is part of it with the
native extensions, but is it ever used on the target ?

Bruce

On Thu, Apr 30, 2026 at 3:32=E2=80=AFAM Patrick Vogelaar via B4 Relay via
lists.yoctoproject.org <patrick.vogelaar=3Dbelden.com@lists.yoctoproject.or=
g>
wrote:

> From: Patrick Vogelaar <patrick.vogelaar@belden.com>
>
> Podlet generates Podman Quadlet files from a Podman command, compose file=
,
> or existing object.
>
> Signed-off-by: Patrick Vogelaar <patrick.vogelaar@belden.com>
> ---
>  recipes-containers/podlet/podlet-crates.inc | 364
> ++++++++++++++++++++++++++++
>  recipes-containers/podlet/podlet_git.bb     |  14 ++
>  2 files changed, 378 insertions(+)
>
> diff --git a/recipes-containers/podlet/podlet-crates.inc
> b/recipes-containers/podlet/podlet-crates.inc
> new file mode 100644
> index 00000000..4e80fc4c
> --- /dev/null
> +++ b/recipes-containers/podlet/podlet-crates.inc
> @@ -0,0 +1,364 @@
> +# Autogenerated with 'bitbake -c update_crates podlet'
> +
> +# from Cargo.lock
> +SRC_URI +=3D " \
> +    crate://crates.io/addr2line/0.25.1 \
> +    crate://crates.io/adler2/2.0.1 \
> +    crate://crates.io/anstream/0.6.21 \
> +    crate://crates.io/anstyle/1.0.13 \
> +    crate://crates.io/anstyle-parse/0.2.7 \
> +    crate://crates.io/anstyle-query/1.1.5 \
> +    crate://crates.io/anstyle-wincon/3.0.11 \
> +    crate://crates.io/async-broadcast/0.7.2 \
> +    crate://crates.io/async-channel/2.5.0 \
> +    crate://crates.io/async-executor/1.13.3 \
> +    crate://crates.io/async-io/2.6.0 \
> +    crate://crates.io/async-lock/3.4.2 \
> +    crate://crates.io/async-process/2.5.0 \
> +    crate://crates.io/async-recursion/1.1.1 \
> +    crate://crates.io/async-signal/0.2.13 \
> +    crate://crates.io/async-task/4.7.1 \
> +    crate://crates.io/async-trait/0.1.89 \
> +    crate://crates.io/atomic-waker/1.1.2 \
> +    crate://crates.io/autocfg/1.5.0 \
> +    crate://crates.io/backtrace/0.3.76 \
> +    crate://crates.io/base64/0.22.1 \
> +    crate://crates.io/bitflags/2.10.0 \
> +    crate://crates.io/blocking/1.6.2 \
> +    crate://crates.io/bumpalo/3.19.1 \
> +    crate://crates.io/cfg-if/1.0.4 \
> +    crate://crates.io/clap/4.5.55 \
> +    crate://crates.io/clap_builder/4.5.55 \
> +    crate://crates.io/clap_derive/4.5.55 \
> +    crate://crates.io/clap_lex/0.7.7 \
> +    crate://crates.io/color-eyre/0.6.5 \
> +    crate://crates.io/color-spantrace/0.3.0 \
> +    crate://crates.io/colorchoice/1.0.4 \
> +    crate://crates.io/compose_spec/0.3.0 \
> +    crate://crates.io/compose_spec_macros/0.1.1 \
> +    crate://crates.io/concurrent-queue/2.5.0 \
> +    crate://crates.io/crossbeam-utils/0.8.21 \
> +    crate://crates.io/displaydoc/0.2.5 \
> +    crate://crates.io/endi/1.1.1 \
> +    crate://crates.io/enumflags2/0.7.12 \
> +    crate://crates.io/enumflags2_derive/0.7.12 \
> +    crate://crates.io/equivalent/1.0.2 \
> +    crate://crates.io/errno/0.3.14 \
> +    crate://crates.io/event-listener/5.4.1 \
> +    crate://crates.io/event-listener-strategy/0.5.4 \
> +    crate://crates.io/eyre/0.6.12 \
> +    crate://crates.io/fastrand/2.3.0 \
> +    crate://crates.io/form_urlencoded/1.2.2 \
> +    crate://crates.io/futures-core/0.3.31 \
> +    crate://crates.io/futures-io/0.3.31 \
> +    crate://crates.io/futures-lite/2.6.1 \
> +    crate://crates.io/getrandom/0.3.4 \
> +    crate://crates.io/gimli/0.32.3 \
> +    crate://crates.io/hashbrown/0.16.1 \
> +    crate://crates.io/heck/0.5.0 \
> +    crate://crates.io/hermit-abi/0.5.2 \
> +    crate://crates.io/hex/0.4.3 \
> +    crate://crates.io/icu_collections/2.1.1 \
> +    crate://crates.io/icu_locale_core/2.1.1 \
> +    crate://crates.io/icu_normalizer/2.1.1 \
> +    crate://crates.io/icu_normalizer_data/2.1.1 \
> +    crate://crates.io/icu_properties/2.1.2 \
> +    crate://crates.io/icu_properties_data/2.1.2 \
> +    crate://crates.io/icu_provider/2.1.1 \
> +    crate://crates.io/idna/1.1.0 \
> +    crate://crates.io/idna_adapter/1.2.1 \
> +    crate://crates.io/indenter/0.3.4 \
> +    crate://crates.io/indexmap/2.13.0 \
> +    crate://crates.io/ipnet/2.11.0 \
> +    crate://crates.io/is_terminal_polyfill/1.70.2 \
> +    crate://crates.io/itoa/1.0.17 \
> +    crate://crates.io/jiff/0.2.18 \
> +    crate://crates.io/jiff-static/0.2.18 \
> +    crate://crates.io/js-sys/0.3.85 \
> +    crate://crates.io/k8s-openapi/0.27.0 \
> +    crate://crates.io/lazy_static/1.5.0 \
> +    crate://crates.io/libc/0.2.180 \
> +    crate://crates.io/linux-raw-sys/0.11.0 \
> +    crate://crates.io/litemap/0.8.1 \
> +    crate://crates.io/memchr/2.7.6 \
> +    crate://crates.io/memoffset/0.9.1 \
> +    crate://crates.io/miniz_oxide/0.8.9 \
> +    crate://crates.io/object/0.37.3 \
> +    crate://crates.io/once_cell/1.21.3 \
> +    crate://crates.io/once_cell_polyfill/1.70.2 \
> +    crate://crates.io/ordered-stream/0.2.0 \
> +    crate://crates.io/owo-colors/4.2.3 \
> +    crate://crates.io/parking/2.2.1 \
> +    crate://crates.io/path-clean/1.0.1 \
> +    crate://crates.io/percent-encoding/2.3.2 \
> +    crate://crates.io/pin-project-lite/0.2.16 \
> +    crate://crates.io/piper/0.2.4 \
> +    crate://crates.io/polling/3.11.0 \
> +    crate://crates.io/portable-atomic/1.13.0 \
> +    crate://crates.io/portable-atomic-util/0.2.4 \
> +    crate://crates.io/potential_utf/0.1.4 \
> +    crate://crates.io/proc-macro-crate/3.4.0 \
> +    crate://crates.io/proc-macro2/1.0.106 \
> +    crate://crates.io/quote/1.0.44 \
> +    crate://crates.io/r-efi/5.3.0 \
> +    crate://crates.io/rustc-demangle/0.1.27 \
> +    crate://crates.io/rustix/1.1.3 \
> +    crate://crates.io/rustversion/1.0.22 \
> +    crate://crates.io/ryu/1.0.22 \
> +    crate://crates.io/serde/1.0.228 \
> +    crate://crates.io/serde_core/1.0.228 \
> +    crate://crates.io/serde_derive/1.0.228 \
> +    crate://crates.io/serde_json/1.0.149 \
> +    crate://crates.io/serde_repr/0.1.20 \
> +    crate://crates.io/serde_yaml/0.9.34+deprecated \
> +    crate://crates.io/sharded-slab/0.1.7 \
> +    crate://crates.io/shlex/1.3.0 \
> +    crate://crates.io/signal-hook-registry/1.4.8 \
> +    crate://crates.io/slab/0.4.11 \
> +    crate://crates.io/smallvec/1.15.1 \
> +    crate://crates.io/smart-default/0.7.1 \
> +    crate://crates.io/stable_deref_trait/1.2.1 \
> +    crate://crates.io/strsim/0.11.1 \
> +    crate://crates.io/syn/2.0.114 \
> +    crate://crates.io/synstructure/0.13.2 \
> +    crate://crates.io/tempfile/3.24.0 \
> +    crate://crates.io/terminal_size/0.4.3 \
> +    crate://crates.io/thiserror/1.0.69 \
> +    crate://crates.io/thiserror-impl/1.0.69 \
> +    crate://crates.io/thread_local/1.1.9 \
> +    crate://crates.io/tinystr/0.8.2 \
> +    crate://crates.io/toml_datetime/0.7.5+spec-1.1.0 \
> +    crate://crates.io/toml_edit/0.23.10+spec-1.0.0 \
> +    crate://crates.io/toml_parser/1.0.6+spec-1.1.0 \
> +    crate://crates.io/tracing/0.1.44 \
> +    crate://crates.io/tracing-attributes/0.1.31 \
> +    crate://crates.io/tracing-core/0.1.36 \
> +    crate://crates.io/tracing-error/0.2.1 \
> +    crate://crates.io/tracing-subscriber/0.3.22 \
> +    crate://crates.io/uds_windows/1.1.0 \
> +    crate://crates.io/umask/2.1.0 \
> +    crate://crates.io/unicode-ident/1.0.22 \
> +    crate://crates.io/unsafe-libyaml/0.2.11 \
> +    crate://crates.io/url/2.5.8 \
> +    crate://crates.io/utf8_iter/1.0.4 \
> +    crate://crates.io/utf8parse/0.2.2 \
> +    crate://crates.io/uuid/1.20.0 \
> +    crate://crates.io/valuable/0.1.1 \
> +    crate://crates.io/wasip2/1.0.1+wasi-0.2.4 \
> +    crate://crates.io/wasm-bindgen/0.2.108 \
> +    crate://crates.io/wasm-bindgen-macro/0.2.108 \
> +    crate://crates.io/wasm-bindgen-macro-support/0.2.108 \
> +    crate://crates.io/wasm-bindgen-shared/0.2.108 \
> +    crate://crates.io/winapi/0.3.9 \
> +    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
> +    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
> +    crate://crates.io/windows-link/0.2.1 \
> +    crate://crates.io/windows-sys/0.60.2 \
> +    crate://crates.io/windows-sys/0.61.2 \
> +    crate://crates.io/windows-targets/0.53.5 \
> +    crate://crates.io/windows_aarch64_gnullvm/0.53.1 \
> +    crate://crates.io/windows_aarch64_msvc/0.53.1 \
> +    crate://crates.io/windows_i686_gnu/0.53.1 \
> +    crate://crates.io/windows_i686_gnullvm/0.53.1 \
> +    crate://crates.io/windows_i686_msvc/0.53.1 \
> +    crate://crates.io/windows_x86_64_gnu/0.53.1 \
> +    crate://crates.io/windows_x86_64_gnullvm/0.53.1 \
> +    crate://crates.io/windows_x86_64_msvc/0.53.1 \
> +    crate://crates.io/winnow/0.7.14 \
> +    crate://crates.io/wit-bindgen/0.46.0 \
> +    crate://crates.io/writeable/0.6.2 \
> +    crate://crates.io/yoke/0.8.1 \
> +    crate://crates.io/yoke-derive/0.8.1 \
> +    crate://crates.io/zbus/5.13.2 \
> +    crate://crates.io/zbus_macros/5.13.2 \
> +    crate://crates.io/zbus_names/4.3.1 \
> +    crate://crates.io/zerofrom/0.1.6 \
> +    crate://crates.io/zerofrom-derive/0.1.6 \
> +    crate://crates.io/zerotrie/0.2.3 \
> +    crate://crates.io/zerovec/0.11.5 \
> +    crate://crates.io/zerovec-derive/0.11.2 \
> +    crate://crates.io/zmij/1.0.17 \
> +    crate://crates.io/zvariant/5.9.2 \
> +    crate://crates.io/zvariant_derive/5.9.2 \
> +    crate://crates.io/zvariant_utils/3.3.0 \
> +"
> +
> +SRC_URI[addr2line-0.25.1.sha256sum] =3D
> "1b5d307320b3181d6d7954e663bd7c774a838b8220fe0593c86d9fb09f498b4b"
> +SRC_URI[adler2-2.0.1.sha256sum] =3D
> "320119579fcad9c21884f5c4861d16174d0e06250625266f50fe6898340abefa"
> +SRC_URI[anstream-0.6.21.sha256sum] =3D
> "43d5b281e737544384e969a5ccad3f1cdd24b48086a0fc1b2a5262a26b8f4f4a"
> +SRC_URI[anstyle-1.0.13.sha256sum] =3D
> "5192cca8006f1fd4f7237516f40fa183bb07f8fbdfedaa0036de5ea9b0b45e78"
> +SRC_URI[anstyle-parse-0.2.7.sha256sum] =3D
> "4e7644824f0aa2c7b9384579234ef10eb7efb6a0deb83f9630a49594dd9c15c2"
> +SRC_URI[anstyle-query-1.1.5.sha256sum] =3D
> "40c48f72fd53cd289104fc64099abca73db4166ad86ea0b4341abe65af83dadc"
> +SRC_URI[anstyle-wincon-3.0.11.sha256sum] =3D
> "291e6a250ff86cd4a820112fb8898808a366d8f9f58ce16d1f538353ad55747d"
> +SRC_URI[async-broadcast-0.7.2.sha256sum] =3D
> "435a87a52755b8f27fcf321ac4f04b2802e337c8c4872923137471ec39c37532"
> +SRC_URI[async-channel-2.5.0.sha256sum] =3D
> "924ed96dd52d1b75e9c1a3e6275715fd320f5f9439fb5a4a11fa51f4221158d2"
> +SRC_URI[async-executor-1.13.3.sha256sum] =3D
> "497c00e0fd83a72a79a39fcbd8e3e2f055d6f6c7e025f3b3d91f4f8e76527fb8"
> +SRC_URI[async-io-2.6.0.sha256sum] =3D
> "456b8a8feb6f42d237746d4b3e9a178494627745c3c56c6ea55d92ba50d026fc"
> +SRC_URI[async-lock-3.4.2.sha256sum] =3D
> "290f7f2596bd5b78a9fec8088ccd89180d7f9f55b94b0576823bbbdc72ee8311"
> +SRC_URI[async-process-2.5.0.sha256sum] =3D
> "fc50921ec0055cdd8a16de48773bfeec5c972598674347252c0399676be7da75"
> +SRC_URI[async-recursion-1.1.1.sha256sum] =3D
> "3b43422f69d8ff38f95f1b2bb76517c91589a924d1559a0e935d7c8ce0274c11"
> +SRC_URI[async-signal-0.2.13.sha256sum] =3D
> "43c070bbf59cd3570b6b2dd54cd772527c7c3620fce8be898406dd3ed6adc64c"
> +SRC_URI[async-task-4.7.1.sha256sum] =3D
> "8b75356056920673b02621b35afd0f7dda9306d03c79a30f5c56c44cf256e3de"
> +SRC_URI[async-trait-0.1.89.sha256sum] =3D
> "9035ad2d096bed7955a320ee7e2230574d28fd3c3a0f186cbea1ff3c7eed5dbb"
> +SRC_URI[atomic-waker-1.1.2.sha256sum] =3D
> "1505bd5d3d116872e7271a6d4e16d81d0c8570876c8de68093a09ac269d8aac0"
> +SRC_URI[autocfg-1.5.0.sha256sum] =3D
> "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
> +SRC_URI[backtrace-0.3.76.sha256sum] =3D
> "bb531853791a215d7c62a30daf0dde835f381ab5de4589cfe7c649d2cbe92bd6"
> +SRC_URI[base64-0.22.1.sha256sum] =3D
> "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
> +SRC_URI[bitflags-2.10.0.sha256sum] =3D
> "812e12b5285cc515a9c72a5c1d3b6d46a19dac5acfef5265968c166106e31dd3"
> +SRC_URI[blocking-1.6.2.sha256sum] =3D
> "e83f8d02be6967315521be875afa792a316e28d57b5a2d401897e2a7921b7f21"
> +SRC_URI[bumpalo-3.19.1.sha256sum] =3D
> "5dd9dc738b7a8311c7ade152424974d8115f2cdad61e8dab8dac9f2362298510"
> +SRC_URI[cfg-if-1.0.4.sha256sum] =3D
> "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
> +SRC_URI[clap-4.5.55.sha256sum] =3D
> "3e34525d5bbbd55da2bb745d34b36121baac88d07619a9a09cfcf4a6c0832785"
> +SRC_URI[clap_builder-4.5.55.sha256sum] =3D
> "59a20016a20a3da95bef50ec7238dbd09baeef4311dcdd38ec15aba69812fb61"
> +SRC_URI[clap_derive-4.5.55.sha256sum] =3D
> "a92793da1a46a5f2a02a6f4c46c6496b28c43638adea8306fcb0caa1634f24e5"
> +SRC_URI[clap_lex-0.7.7.sha256sum] =3D
> "c3e64b0cc0439b12df2fa678eae89a1c56a529fd067a9115f7827f1fffd22b32"
> +SRC_URI[color-eyre-0.6.5.sha256sum] =3D
> "e5920befb47832a6d61ee3a3a846565cfa39b331331e68a3b1d1116630f2f26d"
> +SRC_URI[color-spantrace-0.3.0.sha256sum] =3D
> "b8b88ea9df13354b55bc7234ebcce36e6ef896aca2e42a15de9e10edce01b427"
> +SRC_URI[colorchoice-1.0.4.sha256sum] =3D
> "b05b61dc5112cbb17e4b6cd61790d9845d13888356391624cbe7e41efeac1e75"
> +SRC_URI[compose_spec-0.3.0.sha256sum] =3D
> "3fd9b9dc67f2b3024582ec6d861950f0af0aeaabb8350ccda1f0e51ff8e5895c"
> +SRC_URI[compose_spec_macros-0.1.1.sha256sum] =3D
> "b77735bd89be8da01c8d7e61faec5a9ccb0e313cece3c773c6b3ae251b90c7d4"
> +SRC_URI[concurrent-queue-2.5.0.sha256sum] =3D
> "4ca0197aee26d1ae37445ee532fefce43251d24cc7c166799f4d46817f1d3973"
> +SRC_URI[crossbeam-utils-0.8.21.sha256sum] =3D
> "d0a5c400df2834b80a4c3327b3aad3a4c4cd4de0629063962b03235697506a28"
> +SRC_URI[displaydoc-0.2.5.sha256sum] =3D
> "97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0"
> +SRC_URI[endi-1.1.1.sha256sum] =3D
> "66b7e2430c6dff6a955451e2cfc438f09cea1965a9d6f87f7e3b90decc014099"
> +SRC_URI[enumflags2-0.7.12.sha256sum] =3D
> "1027f7680c853e056ebcec683615fb6fbbc07dbaa13b4d5d9442b146ded4ecef"
> +SRC_URI[enumflags2_derive-0.7.12.sha256sum] =3D
> "67c78a4d8fdf9953a5c9d458f9efe940fd97a0cab0941c075a813ac594733827"
> +SRC_URI[equivalent-1.0.2.sha256sum] =3D
> "877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f"
> +SRC_URI[errno-0.3.14.sha256sum] =3D
> "39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb"
> +SRC_URI[event-listener-5.4.1.sha256sum] =3D
> "e13b66accf52311f30a0db42147dadea9850cb48cd070028831ae5f5d4b856ab"
> +SRC_URI[event-listener-strategy-0.5.4.sha256sum] =3D
> "8be9f3dfaaffdae2972880079a491a1a8bb7cbed0b8dd7a347f668b4150a3b93"
> +SRC_URI[eyre-0.6.12.sha256sum] =3D
> "7cd915d99f24784cdc19fd37ef22b97e3ff0ae756c7e492e9fbfe897d61e2aec"
> +SRC_URI[fastrand-2.3.0.sha256sum] =3D
> "37909eebbb50d72f9059c3b6d82c0463f2ff062c9e95845c43a6c9c0355411be"
> +SRC_URI[form_urlencoded-1.2.2.sha256sum] =3D
> "cb4cb245038516f5f85277875cdaa4f7d2c9a0fa0468de06ed190163b1581fcf"
> +SRC_URI[futures-core-0.3.31.sha256sum] =3D
> "05f29059c0c2090612e8d742178b0580d2dc940c837851ad723096f87af6663e"
> +SRC_URI[futures-io-0.3.31.sha256sum] =3D
> "9e5c1b78ca4aae1ac06c48a526a655760685149f0d465d21f37abfe57ce075c6"
> +SRC_URI[futures-lite-2.6.1.sha256sum] =3D
> "f78e10609fe0e0b3f4157ffab1876319b5b0db102a2c60dc4626306dc46b44ad"
> +SRC_URI[getrandom-0.3.4.sha256sum] =3D
> "899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd"
> +SRC_URI[gimli-0.32.3.sha256sum] =3D
> "e629b9b98ef3dd8afe6ca2bd0f89306cec16d43d907889945bc5d6687f2f13c7"
> +SRC_URI[hashbrown-0.16.1.sha256sum] =3D
> "841d1cc9bed7f9236f321df977030373f4a4163ae1a7dbfe1a51a2c1a51d9100"
> +SRC_URI[heck-0.5.0.sha256sum] =3D
> "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
> +SRC_URI[hermit-abi-0.5.2.sha256sum] =3D
> "fc0fef456e4baa96da950455cd02c081ca953b141298e41db3fc7e36b1da849c"
> +SRC_URI[hex-0.4.3.sha256sum] =3D
> "7f24254aa9a54b5c858eaee2f5bccdb46aaf0e486a595ed5fd8f86ba55232a70"
> +SRC_URI[icu_collections-2.1.1.sha256sum] =3D
> "4c6b649701667bbe825c3b7e6388cb521c23d88644678e83c0c4d0a621a34b43"
> +SRC_URI[icu_locale_core-2.1.1.sha256sum] =3D
> "edba7861004dd3714265b4db54a3c390e880ab658fec5f7db895fae2046b5bb6"
> +SRC_URI[icu_normalizer-2.1.1.sha256sum] =3D
> "5f6c8828b67bf8908d82127b2054ea1b4427ff0230ee9141c54251934ab1b599"
> +SRC_URI[icu_normalizer_data-2.1.1.sha256sum] =3D
> "7aedcccd01fc5fe81e6b489c15b247b8b0690feb23304303a9e560f37efc560a"
> +SRC_URI[icu_properties-2.1.2.sha256sum] =3D
> "020bfc02fe870ec3a66d93e677ccca0562506e5872c650f893269e08615d74ec"
> +SRC_URI[icu_properties_data-2.1.2.sha256sum] =3D
> "616c294cf8d725c6afcd8f55abc17c56464ef6211f9ed59cccffe534129c77af"
> +SRC_URI[icu_provider-2.1.1.sha256sum] =3D
> "85962cf0ce02e1e0a629cc34e7ca3e373ce20dda4c4d7294bbd0bf1fdb59e614"
> +SRC_URI[idna-1.1.0.sha256sum] =3D
> "3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d90788d47be1b1e4de"
> +SRC_URI[idna_adapter-1.2.1.sha256sum] =3D
> "3acae9609540aa318d1bc588455225fb2085b9ed0c4f6bd0d9d5bcd86f1a0344"
> +SRC_URI[indenter-0.3.4.sha256sum] =3D
> "964de6e86d545b246d84badc0fef527924ace5134f30641c203ef52ba83f58d5"
> +SRC_URI[indexmap-2.13.0.sha256sum] =3D
> "7714e70437a7dc3ac8eb7e6f8df75fd8eb422675fc7678aff7364301092b1017"
> +SRC_URI[ipnet-2.11.0.sha256sum] =3D
> "469fb0b9cefa57e3ef31275ee7cacb78f2fdca44e4765491884a2b119d4eb130"
> +SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] =3D
> "a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695"
> +SRC_URI[itoa-1.0.17.sha256sum] =3D
> "92ecc6618181def0457392ccd0ee51198e065e016d1d527a7ac1b6dc7c1f09d2"
> +SRC_URI[jiff-0.2.18.sha256sum] =3D
> "e67e8da4c49d6d9909fe03361f9b620f58898859f5c7aded68351e85e71ecf50"
> +SRC_URI[jiff-static-0.2.18.sha256sum] =3D
> "e0c84ee7f197eca9a86c6fd6cb771e55eb991632f15f2bc3ca6ec838929e6e78"
> +SRC_URI[js-sys-0.3.85.sha256sum] =3D
> "8c942ebf8e95485ca0d52d97da7c5a2c387d0e7f0ba4c35e93bfcaee045955b3"
> +SRC_URI[k8s-openapi-0.27.0.sha256sum] =3D
> "05a6d6f3611ad1d21732adbd7a2e921f598af6c92d71ae6e2620da4b67ee1f0d"
> +SRC_URI[lazy_static-1.5.0.sha256sum] =3D
> "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
> +SRC_URI[libc-0.2.180.sha256sum] =3D
> "bcc35a38544a891a5f7c865aca548a982ccb3b8650a5b06d0fd33a10283c56fc"
> +SRC_URI[linux-raw-sys-0.11.0.sha256sum] =3D
> "df1d3c3b53da64cf5760482273a98e575c651a67eec7f77df96b5b642de8f039"
> +SRC_URI[litemap-0.8.1.sha256sum] =3D
> "6373607a59f0be73a39b6fe456b8192fcc3585f602af20751600e974dd455e77"
> +SRC_URI[memchr-2.7.6.sha256sum] =3D
> "f52b00d39961fc5b2736ea853c9cc86238e165017a493d1d5c8eac6bdc4cc273"
> +SRC_URI[memoffset-0.9.1.sha256sum] =3D
> "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
> +SRC_URI[miniz_oxide-0.8.9.sha256sum] =3D
> "1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316"
> +SRC_URI[object-0.37.3.sha256sum] =3D
> "ff76201f031d8863c38aa7f905eca4f53abbfa15f609db4277d44cd8938f33fe"
> +SRC_URI[once_cell-1.21.3.sha256sum] =3D
> "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
> +SRC_URI[once_cell_polyfill-1.70.2.sha256sum] =3D
> "384b8ab6d37215f3c5301a95a4accb5d64aa607f1fcb26a11b5303878451b4fe"
> +SRC_URI[ordered-stream-0.2.0.sha256sum] =3D
> "9aa2b01e1d916879f73a53d01d1d6cee68adbb31d6d9177a8cfce093cced1d50"
> +SRC_URI[owo-colors-4.2.3.sha256sum] =3D
> "9c6901729fa79e91a0913333229e9ca5dc725089d1c363b2f4b4760709dc4a52"
> +SRC_URI[parking-2.2.1.sha256sum] =3D
> "f38d5652c16fde515bb1ecef450ab0f6a219d619a7274976324d5e377f7dceba"
> +SRC_URI[path-clean-1.0.1.sha256sum] =3D
> "17359afc20d7ab31fdb42bb844c8b3bb1dabd7dcf7e68428492da7f16966fcef"
> +SRC_URI[percent-encoding-2.3.2.sha256sum] =3D
> "9b4f627cb1b25917193a259e49bdad08f671f8d9708acfd5fe0a8c1455d87220"
> +SRC_URI[pin-project-lite-0.2.16.sha256sum] =3D
> "3b3cff922bd51709b605d9ead9aa71031d81447142d828eb4a6eba76fe619f9b"
> +SRC_URI[piper-0.2.4.sha256sum] =3D
> "96c8c490f422ef9a4efd2cb5b42b76c8613d7e7dfc1caf667b8a3350a5acc066"
> +SRC_URI[polling-3.11.0.sha256sum] =3D
> "5d0e4f59085d47d8241c88ead0f274e8a0cb551f3625263c05eb8dd897c34218"
> +SRC_URI[portable-atomic-1.13.0.sha256sum] =3D
> "f89776e4d69bb58bc6993e99ffa1d11f228b839984854c7daeb5d37f87cbe950"
> +SRC_URI[portable-atomic-util-0.2.4.sha256sum] =3D
> "d8a2f0d8d040d7848a709caf78912debcc3f33ee4b3cac47d73d1e1069e83507"
> +SRC_URI[potential_utf-0.1.4.sha256sum] =3D
> "b73949432f5e2a09657003c25bca5e19a0e9c84f8058ca374f49e0ebe605af77"
> +SRC_URI[proc-macro-crate-3.4.0.sha256sum] =3D
> "219cb19e96be00ab2e37d6e299658a0cfa83e52429179969b0f0121b4ac46983"
> +SRC_URI[proc-macro2-1.0.106.sha256sum] =3D
> "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
> +SRC_URI[quote-1.0.44.sha256sum] =3D
> "21b2ebcf727b7760c461f091f9f0f539b77b8e87f2fd88131e7f1b433b3cece4"
> +SRC_URI[r-efi-5.3.0.sha256sum] =3D
> "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
> +SRC_URI[rustc-demangle-0.1.27.sha256sum] =3D
> "b50b8869d9fc858ce7266cce0194bd74df58b9d0e3f6df3a9fc8eb470d95c09d"
> +SRC_URI[rustix-1.1.3.sha256sum] =3D
> "146c9e247ccc180c1f61615433868c99f3de3ae256a30a43b49f67c2d9171f34"
> +SRC_URI[rustversion-1.0.22.sha256sum] =3D
> "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
> +SRC_URI[ryu-1.0.22.sha256sum] =3D
> "a50f4cf475b65d88e057964e0e9bb1f0aa9bbb2036dc65c64596b42932536984"
> +SRC_URI[serde-1.0.228.sha256sum] =3D
> "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
> +SRC_URI[serde_core-1.0.228.sha256sum] =3D
> "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
> +SRC_URI[serde_derive-1.0.228.sha256sum] =3D
> "d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79"
> +SRC_URI[serde_json-1.0.149.sha256sum] =3D
> "83fc039473c5595ace860d8c4fafa220ff474b3fc6bfdb4293327f1a37e94d86"
> +SRC_URI[serde_repr-0.1.20.sha256sum] =3D
> "175ee3e80ae9982737ca543e96133087cbd9a485eecc3bc4de9c1a37b47ea59c"
> +SRC_URI[serde_yaml-0.9.34+deprecated.sha256sum] =3D
> "6a8b1a1a2ebf674015cc02edccce75287f1a0130d394307b36743c2f5d504b47"
> +SRC_URI[sharded-slab-0.1.7.sha256sum] =3D
> "f40ca3c46823713e0d4209592e8d6e826aa57e928f09752619fc696c499637f6"
> +SRC_URI[shlex-1.3.0.sha256sum] =3D
> "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
> +SRC_URI[signal-hook-registry-1.4.8.sha256sum] =3D
> "c4db69cba1110affc0e9f7bcd48bbf87b3f4fc7c61fc9155afd4c469eb3d6c1b"
> +SRC_URI[slab-0.4.11.sha256sum] =3D
> "7a2ae44ef20feb57a68b23d846850f861394c2e02dc425a50098ae8c90267589"
> +SRC_URI[smallvec-1.15.1.sha256sum] =3D
> "67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03"
> +SRC_URI[smart-default-0.7.1.sha256sum] =3D
> "0eb01866308440fc64d6c44d9e86c5cc17adfe33c4d6eed55da9145044d0ffc1"
> +SRC_URI[stable_deref_trait-1.2.1.sha256sum] =3D
> "6ce2be8dc25455e1f91df71bfa12ad37d7af1092ae736f3a6cd0e37bc7810596"
> +SRC_URI[strsim-0.11.1.sha256sum] =3D
> "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
> +SRC_URI[syn-2.0.114.sha256sum] =3D
> "d4d107df263a3013ef9b1879b0df87d706ff80f65a86ea879bd9c31f9b307c2a"
> +SRC_URI[synstructure-0.13.2.sha256sum] =3D
> "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
> +SRC_URI[tempfile-3.24.0.sha256sum] =3D
> "655da9c7eb6305c55742045d5a8d2037996d61d8de95806335c7c86ce0f82e9c"
> +SRC_URI[terminal_size-0.4.3.sha256sum] =3D
> "60b8cb979cb11c32ce1603f8137b22262a9d131aaa5c37b5678025f22b8becd0"
> +SRC_URI[thiserror-1.0.69.sha256sum] =3D
> "b6aaf5339b578ea85b50e080feb250a3e8ae8cfcdff9a461c9ec2904bc923f52"
> +SRC_URI[thiserror-impl-1.0.69.sha256sum] =3D
> "4fee6c4efc90059e10f81e6d42c60a18f76588c3d74cb83a0b242a2b6c7504c1"
> +SRC_URI[thread_local-1.1.9.sha256sum] =3D
> "f60246a4944f24f6e018aa17cdeffb7818b76356965d03b07d6a9886e8962185"
> +SRC_URI[tinystr-0.8.2.sha256sum] =3D
> "42d3e9c45c09de15d06dd8acf5f4e0e399e85927b7f00711024eb7ae10fa4869"
> +SRC_URI[toml_datetime-0.7.5+spec-1.1.0.sha256sum] =3D
> "92e1cfed4a3038bc5a127e35a2d360f145e1f4b971b551a2ba5fd7aedf7e1347"
> +SRC_URI[toml_edit-0.23.10+spec-1.0.0.sha256sum] =3D
> "84c8b9f757e028cee9fa244aea147aab2a9ec09d5325a9b01e0a49730c2b5269"
> +SRC_URI[toml_parser-1.0.6+spec-1.1.0.sha256sum] =3D
> "a3198b4b0a8e11f09dd03e133c0280504d0801269e9afa46362ffde1cbeebf44"
> +SRC_URI[tracing-0.1.44.sha256sum] =3D
> "63e71662fa4b2a2c3a26f570f037eb95bb1f85397f3cd8076caed2f026a6d100"
> +SRC_URI[tracing-attributes-0.1.31.sha256sum] =3D
> "7490cfa5ec963746568740651ac6781f701c9c5ea257c58e057f3ba8cf69e8da"
> +SRC_URI[tracing-core-0.1.36.sha256sum] =3D
> "db97caf9d906fbde555dd62fa95ddba9eecfd14cb388e4f491a66d74cd5fb79a"
> +SRC_URI[tracing-error-0.2.1.sha256sum] =3D
> "8b1581020d7a273442f5b45074a6a57d5757ad0a47dac0e9f0bd57b81936f3db"
> +SRC_URI[tracing-subscriber-0.3.22.sha256sum] =3D
> "2f30143827ddab0d256fd843b7a66d164e9f271cfa0dde49142c5ca0ca291f1e"
> +SRC_URI[uds_windows-1.1.0.sha256sum] =3D
> "89daebc3e6fd160ac4aa9fc8b3bf71e1f74fbf92367ae71fb83a037e8bf164b9"
> +SRC_URI[umask-2.1.0.sha256sum] =3D
> "ec9a46c2549e35c054e0ffe281a3a6ec0007793db4df106604d37ed3f4d73d1c"
> +SRC_URI[unicode-ident-1.0.22.sha256sum] =3D
> "9312f7c4f6ff9069b165498234ce8be658059c6728633667c526e27dc2cf1df5"
> +SRC_URI[unsafe-libyaml-0.2.11.sha256sum] =3D
> "673aac59facbab8a9007c7f6108d11f63b603f7cabff99fabf650fea5c32b861"
> +SRC_URI[url-2.5.8.sha256sum] =3D
> "ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed"
> +SRC_URI[utf8_iter-1.0.4.sha256sum] =3D
> "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
> +SRC_URI[utf8parse-0.2.2.sha256sum] =3D
> "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
> +SRC_URI[uuid-1.20.0.sha256sum] =3D
> "ee48d38b119b0cd71fe4141b30f5ba9c7c5d9f4e7a3a8b4a674e4b6ef789976f"
> +SRC_URI[valuable-0.1.1.sha256sum] =3D
> "ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65"
> +SRC_URI[wasip2-1.0.1+wasi-0.2.4.sha256sum] =3D
> "0562428422c63773dad2c345a1882263bbf4d65cf3f42e90921f787ef5ad58e7"
> +SRC_URI[wasm-bindgen-0.2.108.sha256sum] =3D
> "64024a30ec1e37399cf85a7ffefebdb72205ca1c972291c51512360d90bd8566"
> +SRC_URI[wasm-bindgen-macro-0.2.108.sha256sum] =3D
> "008b239d9c740232e71bd39e8ef6429d27097518b6b30bdf9086833bd5b6d608"
> +SRC_URI[wasm-bindgen-macro-support-0.2.108.sha256sum] =3D
> "5256bae2d58f54820e6490f9839c49780dff84c65aeab9e772f15d5f0e913a55"
> +SRC_URI[wasm-bindgen-shared-0.2.108.sha256sum] =3D
> "1f01b580c9ac74c8d8f0c0e4afb04eeef2acf145458e52c03845ee9cd23e3d12"
> +SRC_URI[winapi-0.3.9.sha256sum] =3D
> "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
> +SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] =3D
> "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
> +SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] =3D
> "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
> +SRC_URI[windows-link-0.2.1.sha256sum] =3D
> "f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5"
> +SRC_URI[windows-sys-0.60.2.sha256sum] =3D
> "f2f500e4d28234f72040990ec9d39e3a6b950f9f22d3dba18416c35882612bcb"
> +SRC_URI[windows-sys-0.61.2.sha256sum] =3D
> "ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc"
> +SRC_URI[windows-targets-0.53.5.sha256sum] =3D
> "4945f9f551b88e0d65f3db0bc25c33b8acea4d9e41163edf90dcd0b19f9069f3"
> +SRC_URI[windows_aarch64_gnullvm-0.53.1.sha256sum] =3D
> "a9d8416fa8b42f5c947f8482c43e7d89e73a173cead56d044f6a56104a6d1b53"
> +SRC_URI[windows_aarch64_msvc-0.53.1.sha256sum] =3D
> "b9d782e804c2f632e395708e99a94275910eb9100b2114651e04744e9b125006"
> +SRC_URI[windows_i686_gnu-0.53.1.sha256sum] =3D
> "960e6da069d81e09becb0ca57a65220ddff016ff2d6af6a223cf372a506593a3"
> +SRC_URI[windows_i686_gnullvm-0.53.1.sha256sum] =3D
> "fa7359d10048f68ab8b09fa71c3daccfb0e9b559aed648a8f95469c27057180c"
> +SRC_URI[windows_i686_msvc-0.53.1.sha256sum] =3D
> "1e7ac75179f18232fe9c285163565a57ef8d3c89254a30685b57d83a38d326c2"
> +SRC_URI[windows_x86_64_gnu-0.53.1.sha256sum] =3D
> "9c3842cdd74a865a8066ab39c8a7a473c0778a3f29370b5fd6b4b9aa7df4a499"
> +SRC_URI[windows_x86_64_gnullvm-0.53.1.sha256sum] =3D
> "0ffa179e2d07eee8ad8f57493436566c7cc30ac536a3379fdf008f47f6bb7ae1"
> +SRC_URI[windows_x86_64_msvc-0.53.1.sha256sum] =3D
> "d6bbff5f0aada427a1e5a6da5f1f98158182f26556f345ac9e04d36d0ebed650"
> +SRC_URI[winnow-0.7.14.sha256sum] =3D
> "5a5364e9d77fcdeeaa6062ced926ee3381faa2ee02d3eb83a5c27a8825540829"
> +SRC_URI[wit-bindgen-0.46.0.sha256sum] =3D
> "f17a85883d4e6d00e8a97c586de764dabcc06133f7f1d55dce5cdc070ad7fe59"
> +SRC_URI[writeable-0.6.2.sha256sum] =3D
> "9edde0db4769d2dc68579893f2306b26c6ecfbe0ef499b013d731b7b9247e0b9"
> +SRC_URI[yoke-0.8.1.sha256sum] =3D
> "72d6e5c6afb84d73944e5cedb052c4680d5657337201555f9f2a16b7406d4954"
> +SRC_URI[yoke-derive-0.8.1.sha256sum] =3D
> "b659052874eb698efe5b9e8cf382204678a0086ebf46982b79d6ca3182927e5d"
> +SRC_URI[zbus-5.13.2.sha256sum] =3D
> "1bfeff997a0aaa3eb20c4652baf788d2dfa6d2839a0ead0b3ff69ce2f9c4bdd1"
> +SRC_URI[zbus_macros-5.13.2.sha256sum] =3D
> "0bbd5a90dbe8feee5b13def448427ae314ccd26a49cac47905cafefb9ff846f1"
> +SRC_URI[zbus_names-4.3.1.sha256sum] =3D
> "ffd8af6d5b78619bab301ff3c560a5bd22426150253db278f164d6cf3b72c50f"
> +SRC_URI[zerofrom-0.1.6.sha256sum] =3D
> "50cc42e0333e05660c3587f3bf9d0478688e15d870fab3346451ce7f8c9fbea5"
> +SRC_URI[zerofrom-derive-0.1.6.sha256sum] =3D
> "d71e5d6e06ab090c67b5e44993ec16b72dcbaabc526db883a360057678b48502"
> +SRC_URI[zerotrie-0.2.3.sha256sum] =3D
> "2a59c17a5562d507e4b54960e8569ebee33bee890c70aa3fe7b97e85a9fd7851"
> +SRC_URI[zerovec-0.11.5.sha256sum] =3D
> "6c28719294829477f525be0186d13efa9a3c602f7ec202ca9e353d310fb9a002"
> +SRC_URI[zerovec-derive-0.11.2.sha256sum] =3D
> "eadce39539ca5cb3985590102671f2567e659fca9666581ad3411d59207951f3"
> +SRC_URI[zmij-1.0.17.sha256sum] =3D
> "02aae0f83f69aafc94776e879363e9771d7ecbffe2c7fbb6c14c5e00dfe88439"
> +SRC_URI[zvariant-5.9.2.sha256sum] =3D
> "68b64ef4f40c7951337ddc7023dd03528a57a3ce3408ee9da5e948bd29b232c4"
> +SRC_URI[zvariant_derive-5.9.2.sha256sum] =3D
> "484d5d975eb7afb52cc6b929c13d3719a20ad650fea4120e6310de3fc55e415c"
> +SRC_URI[zvariant_utils-3.3.0.sha256sum] =3D
> "f75c23a64ef8f40f13a6989991e643554d9bef1d682a281160cf0c1bc389c5e9"
> diff --git a/recipes-containers/podlet/podlet_git.bb
> b/recipes-containers/podlet/podlet_git.bb
> new file mode 100644
> index 00000000..4977bf0d
> --- /dev/null
> +++ b/recipes-containers/podlet/podlet_git.bb
> @@ -0,0 +1,14 @@
> +SUMMARY =3D "Generator for quadlet files"
> +DESCRIPTION =3D "Podlet generates Podman Quadlet files from a Podman
> command, compose file, or existing object."
> +LICENSE =3D "MPL-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df75d2927d3c1ed2414ef72048f5ad=
640"
> +
> +inherit cargo cargo-update-recipe-crates
> +
> +PV =3D "0.3.16"
> +SRC_URI =3D "git://
> github.com/containers/podlet.git;protocol=3Dhttps;branch=3Dmain"
> +SRCREV =3D "ca463af859931a9a43688d869eae5fe3a95e7143"
> +
> +require ${BPN}-crates.inc
> +
> +BBCLASSEXTEND =3D "native nativesdk"
>
> ---
> base-commit: b9b7e17eae46c6e3e561f3675870be94eea69332
> change-id: 20260430-add_podlet-5c691a09b7ff
>
> Best regards,
> --
> Patrick Vogelaar <patrick.vogelaar@belden.com>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9783):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9783
> Mute This Topic: https://lists.yoctoproject.org/mt/119077829/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000002e408506513ffcb7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Sor=
ry for the delay in replying, I&#39;ve been out of the office and am catchi=
ng up with things while my release testing runs.<br><br>One thing that stru=
ck me with this is .. are you using it on the build side, or on the target =
? Obviously the build side is part of it with the native extensions, but is=
 it ever used on the target ?<br><br>Bruce</div></div><br><div class=3D"gma=
il_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Th=
u, Apr 30, 2026 at 3:32=E2=80=AFAM Patrick Vogelaar via B4 Relay via <a hre=
f=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;patrick.=
vogelaar=3D<a href=3D"mailto:belden.com@lists.yoctoproject.org">belden.com@=
lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">From: Patrick Vogelaar &lt;<a href=3D"mailto:patrick.=
vogelaar@belden.com" target=3D"_blank">patrick.vogelaar@belden.com</a>&gt;<=
br>
<br>
Podlet generates Podman Quadlet files from a Podman command, compose file, =
or existing object.<br>
<br>
Signed-off-by: Patrick Vogelaar &lt;<a href=3D"mailto:patrick.vogelaar@beld=
en.com" target=3D"_blank">patrick.vogelaar@belden.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/podlet/podlet-crates.inc | 364 +++++++++++++++++++=
+++++++++<br>
=C2=A0recipes-containers/podlet/<a href=3D"http://podlet_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">podlet_git.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 14 =
++<br>
=C2=A02 files changed, 378 insertions(+)<br>
<br>
diff --git a/recipes-containers/podlet/podlet-crates.inc b/recipes-containe=
rs/podlet/podlet-crates.inc<br>
new file mode 100644<br>
index 00000000..4e80fc4c<br>
--- /dev/null<br>
+++ b/recipes-containers/podlet/podlet-crates.inc<br>
@@ -0,0 +1,364 @@<br>
+# Autogenerated with &#39;bitbake -c update_crates podlet&#39;<br>
+<br>
+# from Cargo.lock<br>
+SRC_URI +=3D &quot; \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/addr2line/0.25.1" rel=3D=
"noreferrer" target=3D"_blank">crates.io/addr2line/0.25.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/adler2/2.0.1" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/adler2/2.0.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/anstream/0.6.21" rel=3D"=
noreferrer" target=3D"_blank">crates.io/anstream/0.6.21</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/anstyle/1.0.13" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/anstyle/1.0.13</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/anstyle-parse/0.2.7" rel=
=3D"noreferrer" target=3D"_blank">crates.io/anstyle-parse/0.2.7</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/anstyle-query/1.1.5" rel=
=3D"noreferrer" target=3D"_blank">crates.io/anstyle-query/1.1.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/anstyle-wincon/3.0.11" r=
el=3D"noreferrer" target=3D"_blank">crates.io/anstyle-wincon/3.0.11</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/async-broadcast/0.7.2" r=
el=3D"noreferrer" target=3D"_blank">crates.io/async-broadcast/0.7.2</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/async-channel/2.5.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/async-channel/2.5.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/async-executor/1.13.3" r=
el=3D"noreferrer" target=3D"_blank">crates.io/async-executor/1.13.3</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/async-io/2.6.0" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/async-io/2.6.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/async-lock/3.4.2" rel=3D=
"noreferrer" target=3D"_blank">crates.io/async-lock/3.4.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/async-process/2.5.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/async-process/2.5.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/async-recursion/1.1.1" r=
el=3D"noreferrer" target=3D"_blank">crates.io/async-recursion/1.1.1</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/async-signal/0.2.13" rel=
=3D"noreferrer" target=3D"_blank">crates.io/async-signal/0.2.13</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/async-task/4.7.1" rel=3D=
"noreferrer" target=3D"_blank">crates.io/async-task/4.7.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/async-trait/0.1.89" rel=
=3D"noreferrer" target=3D"_blank">crates.io/async-trait/0.1.89</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/atomic-waker/1.1.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/atomic-waker/1.1.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/autocfg/1.5.0" rel=3D"no=
referrer" target=3D"_blank">crates.io/autocfg/1.5.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/backtrace/0.3.76" rel=3D=
"noreferrer" target=3D"_blank">crates.io/backtrace/0.3.76</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/base64/0.22.1" rel=3D"no=
referrer" target=3D"_blank">crates.io/base64/0.22.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bitflags/2.10.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/bitflags/2.10.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/blocking/1.6.2" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/blocking/1.6.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bumpalo/3.19.1" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/bumpalo/3.19.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cfg-if/1.0.4" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/cfg-if/1.0.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/clap/4.5.55" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/clap/4.5.55</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/clap_builder/4.5.55" rel=
=3D"noreferrer" target=3D"_blank">crates.io/clap_builder/4.5.55</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/clap_derive/4.5.55" rel=
=3D"noreferrer" target=3D"_blank">crates.io/clap_derive/4.5.55</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/clap_lex/0.7.7" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/clap_lex/0.7.7</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/color-eyre/0.6.5" rel=3D=
"noreferrer" target=3D"_blank">crates.io/color-eyre/0.6.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/color-spantrace/0.3.0" r=
el=3D"noreferrer" target=3D"_blank">crates.io/color-spantrace/0.3.0</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/colorchoice/1.0.4" rel=
=3D"noreferrer" target=3D"_blank">crates.io/colorchoice/1.0.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/compose_spec/0.3.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/compose_spec/0.3.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/compose_spec_macros/0.1.=
1" rel=3D"noreferrer" target=3D"_blank">crates.io/compose_spec_macros/0.1.1=
</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/concurrent-queue/2.5.0" =
rel=3D"noreferrer" target=3D"_blank">crates.io/concurrent-queue/2.5.0</a> \=
<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-utils/0.8.21" =
rel=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-utils/0.8.21</a> \=
<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/displaydoc/0.2.5" rel=3D=
"noreferrer" target=3D"_blank">crates.io/displaydoc/0.2.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/endi/1.1.1" rel=3D"noref=
errer" target=3D"_blank">crates.io/endi/1.1.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/enumflags2/0.7.12" rel=
=3D"noreferrer" target=3D"_blank">crates.io/enumflags2/0.7.12</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/enumflags2_derive/0.7.12=
" rel=3D"noreferrer" target=3D"_blank">crates.io/enumflags2_derive/0.7.12</=
a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/equivalent/1.0.2" rel=3D=
"noreferrer" target=3D"_blank">crates.io/equivalent/1.0.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/errno/0.3.14" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/errno/0.3.14</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/event-listener/5.4.1" re=
l=3D"noreferrer" target=3D"_blank">crates.io/event-listener/5.4.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/event-listener-strategy/=
0.5.4" rel=3D"noreferrer" target=3D"_blank">crates.io/event-listener-strate=
gy/0.5.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/eyre/0.6.12" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/eyre/0.6.12</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/fastrand/2.3.0" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/fastrand/2.3.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/form_urlencoded/1.2.2" r=
el=3D"noreferrer" target=3D"_blank">crates.io/form_urlencoded/1.2.2</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/futures-core/0.3.31" rel=
=3D"noreferrer" target=3D"_blank">crates.io/futures-core/0.3.31</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/futures-io/0.3.31" rel=
=3D"noreferrer" target=3D"_blank">crates.io/futures-io/0.3.31</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/futures-lite/2.6.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/futures-lite/2.6.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/getrandom/0.3.4" rel=3D"=
noreferrer" target=3D"_blank">crates.io/getrandom/0.3.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/gimli/0.32.3" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/gimli/0.32.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/hashbrown/0.16.1" rel=3D=
"noreferrer" target=3D"_blank">crates.io/hashbrown/0.16.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/heck/0.5.0" rel=3D"noref=
errer" target=3D"_blank">crates.io/heck/0.5.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/hermit-abi/0.5.2" rel=3D=
"noreferrer" target=3D"_blank">crates.io/hermit-abi/0.5.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/hex/0.4.3" rel=3D"norefe=
rrer" target=3D"_blank">crates.io/hex/0.4.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/icu_collections/2.1.1" r=
el=3D"noreferrer" target=3D"_blank">crates.io/icu_collections/2.1.1</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/icu_locale_core/2.1.1" r=
el=3D"noreferrer" target=3D"_blank">crates.io/icu_locale_core/2.1.1</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/icu_normalizer/2.1.1" re=
l=3D"noreferrer" target=3D"_blank">crates.io/icu_normalizer/2.1.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/icu_normalizer_data/2.1.=
1" rel=3D"noreferrer" target=3D"_blank">crates.io/icu_normalizer_data/2.1.1=
</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/icu_properties/2.1.2" re=
l=3D"noreferrer" target=3D"_blank">crates.io/icu_properties/2.1.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/icu_properties_data/2.1.=
2" rel=3D"noreferrer" target=3D"_blank">crates.io/icu_properties_data/2.1.2=
</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/icu_provider/2.1.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/icu_provider/2.1.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/idna/1.1.0" rel=3D"noref=
errer" target=3D"_blank">crates.io/idna/1.1.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/idna_adapter/1.2.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/idna_adapter/1.2.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/indenter/0.3.4" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/indenter/0.3.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/indexmap/2.13.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/indexmap/2.13.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ipnet/2.11.0" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/ipnet/2.11.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/is_terminal_polyfill/1.7=
0.2" rel=3D"noreferrer" target=3D"_blank">crates.io/is_terminal_polyfill/1.=
70.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/itoa/1.0.17" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/itoa/1.0.17</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/jiff/0.2.18" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/jiff/0.2.18</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/jiff-static/0.2.18" rel=
=3D"noreferrer" target=3D"_blank">crates.io/jiff-static/0.2.18</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/js-sys/0.3.85" rel=3D"no=
referrer" target=3D"_blank">crates.io/js-sys/0.3.85</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/k8s-openapi/0.27.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/k8s-openapi/0.27.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lazy_static/1.5.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/lazy_static/1.5.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libc/0.2.180" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/libc/0.2.180</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/linux-raw-sys/0.11.0" re=
l=3D"noreferrer" target=3D"_blank">crates.io/linux-raw-sys/0.11.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/litemap/0.8.1" rel=3D"no=
referrer" target=3D"_blank">crates.io/litemap/0.8.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memchr/2.7.6" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/memchr/2.7.6</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memoffset/0.9.1" rel=3D"=
noreferrer" target=3D"_blank">crates.io/memoffset/0.9.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/miniz_oxide/0.8.9" rel=
=3D"noreferrer" target=3D"_blank">crates.io/miniz_oxide/0.8.9</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/object/0.37.3" rel=3D"no=
referrer" target=3D"_blank">crates.io/object/0.37.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/once_cell/1.21.3" rel=3D=
"noreferrer" target=3D"_blank">crates.io/once_cell/1.21.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/once_cell_polyfill/1.70.=
2" rel=3D"noreferrer" target=3D"_blank">crates.io/once_cell_polyfill/1.70.2=
</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ordered-stream/0.2.0" re=
l=3D"noreferrer" target=3D"_blank">crates.io/ordered-stream/0.2.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/owo-colors/4.2.3" rel=3D=
"noreferrer" target=3D"_blank">crates.io/owo-colors/4.2.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/parking/2.2.1" rel=3D"no=
referrer" target=3D"_blank">crates.io/parking/2.2.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/path-clean/1.0.1" rel=3D=
"noreferrer" target=3D"_blank">crates.io/path-clean/1.0.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/percent-encoding/2.3.2" =
rel=3D"noreferrer" target=3D"_blank">crates.io/percent-encoding/2.3.2</a> \=
<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pin-project-lite/0.2.16"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/pin-project-lite/0.2.16</a>=
 \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/piper/0.2.4" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/piper/0.2.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/polling/3.11.0" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/polling/3.11.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/portable-atomic/1.13.0" =
rel=3D"noreferrer" target=3D"_blank">crates.io/portable-atomic/1.13.0</a> \=
<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/portable-atomic-util/0.2=
.4" rel=3D"noreferrer" target=3D"_blank">crates.io/portable-atomic-util/0.2=
.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/potential_utf/0.1.4" rel=
=3D"noreferrer" target=3D"_blank">crates.io/potential_utf/0.1.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro-crate/3.4.0" =
rel=3D"noreferrer" target=3D"_blank">crates.io/proc-macro-crate/3.4.0</a> \=
<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro2/1.0.106" rel=
=3D"noreferrer" target=3D"_blank">crates.io/proc-macro2/1.0.106</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quote/1.0.44" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/quote/1.0.44</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r-efi/5.3.0" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/r-efi/5.3.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustc-demangle/0.1.27" r=
el=3D"noreferrer" target=3D"_blank">crates.io/rustc-demangle/0.1.27</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustix/1.1.3" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/rustix/1.1.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rustversion/1.0.22" rel=
=3D"noreferrer" target=3D"_blank">crates.io/rustversion/1.0.22</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ryu/1.0.22" rel=3D"noref=
errer" target=3D"_blank">crates.io/ryu/1.0.22</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde/1.0.228" rel=3D"no=
referrer" target=3D"_blank">crates.io/serde/1.0.228</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_core/1.0.228" rel=
=3D"noreferrer" target=3D"_blank">crates.io/serde_core/1.0.228</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_derive/1.0.228" re=
l=3D"noreferrer" target=3D"_blank">crates.io/serde_derive/1.0.228</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_json/1.0.149" rel=
=3D"noreferrer" target=3D"_blank">crates.io/serde_json/1.0.149</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_repr/0.1.20" rel=
=3D"noreferrer" target=3D"_blank">crates.io/serde_repr/0.1.20</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_yaml/0.9.34+deprec=
ated" rel=3D"noreferrer" target=3D"_blank">crates.io/serde_yaml/0.9.34+depr=
ecated</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/sharded-slab/0.1.7" rel=
=3D"noreferrer" target=3D"_blank">crates.io/sharded-slab/0.1.7</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/shlex/1.3.0" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/shlex/1.3.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/signal-hook-registry/1.4=
.8" rel=3D"noreferrer" target=3D"_blank">crates.io/signal-hook-registry/1.4=
.8</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/slab/0.4.11" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/slab/0.4.11</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/smallvec/1.15.1" rel=3D"=
noreferrer" target=3D"_blank">crates.io/smallvec/1.15.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/smart-default/0.7.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/smart-default/0.7.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/stable_deref_trait/1.2.1=
" rel=3D"noreferrer" target=3D"_blank">crates.io/stable_deref_trait/1.2.1</=
a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/strsim/0.11.1" rel=3D"no=
referrer" target=3D"_blank">crates.io/strsim/0.11.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/2.0.114" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/syn/2.0.114</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/synstructure/0.13.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/synstructure/0.13.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/tempfile/3.24.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/tempfile/3.24.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/terminal_size/0.4.3" rel=
=3D"noreferrer" target=3D"_blank">crates.io/terminal_size/0.4.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/thiserror/1.0.69" rel=3D=
"noreferrer" target=3D"_blank">crates.io/thiserror/1.0.69</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/thiserror-impl/1.0.69" r=
el=3D"noreferrer" target=3D"_blank">crates.io/thiserror-impl/1.0.69</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/thread_local/1.1.9" rel=
=3D"noreferrer" target=3D"_blank">crates.io/thread_local/1.1.9</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/tinystr/0.8.2" rel=3D"no=
referrer" target=3D"_blank">crates.io/tinystr/0.8.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/toml_datetime/0.7.5+spec=
-1.1.0" rel=3D"noreferrer" target=3D"_blank">crates.io/toml_datetime/0.7.5+=
spec-1.1.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/toml_edit/0.23.10+spec-1=
.0.0" rel=3D"noreferrer" target=3D"_blank">crates.io/toml_edit/0.23.10+spec=
-1.0.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/toml_parser/1.0.6+spec-1=
.1.0" rel=3D"noreferrer" target=3D"_blank">crates.io/toml_parser/1.0.6+spec=
-1.1.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/tracing/0.1.44" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/tracing/0.1.44</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/tracing-attributes/0.1.3=
1" rel=3D"noreferrer" target=3D"_blank">crates.io/tracing-attributes/0.1.31=
</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/tracing-core/0.1.36" rel=
=3D"noreferrer" target=3D"_blank">crates.io/tracing-core/0.1.36</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/tracing-error/0.2.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/tracing-error/0.2.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/tracing-subscriber/0.3.2=
2" rel=3D"noreferrer" target=3D"_blank">crates.io/tracing-subscriber/0.3.22=
</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/uds_windows/1.1.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/uds_windows/1.1.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/umask/2.1.0" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/umask/2.1.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-ident/1.0.22" re=
l=3D"noreferrer" target=3D"_blank">crates.io/unicode-ident/1.0.22</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unsafe-libyaml/0.2.11" r=
el=3D"noreferrer" target=3D"_blank">crates.io/unsafe-libyaml/0.2.11</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/url/2.5.8" rel=3D"norefe=
rrer" target=3D"_blank">crates.io/url/2.5.8</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/utf8_iter/1.0.4" rel=3D"=
noreferrer" target=3D"_blank">crates.io/utf8_iter/1.0.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/utf8parse/0.2.2" rel=3D"=
noreferrer" target=3D"_blank">crates.io/utf8parse/0.2.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/uuid/1.20.0" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/uuid/1.20.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/valuable/0.1.1" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/valuable/0.1.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasip2/1.0.1+wasi-0.2.4"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/wasip2/1.0.1+wasi-0.2.4</a>=
 \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasm-bindgen/0.2.108" re=
l=3D"noreferrer" target=3D"_blank">crates.io/wasm-bindgen/0.2.108</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasm-bindgen-macro/0.2.1=
08" rel=3D"noreferrer" target=3D"_blank">crates.io/wasm-bindgen-macro/0.2.1=
08</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasm-bindgen-macro-suppo=
rt/0.2.108" rel=3D"noreferrer" target=3D"_blank">crates.io/wasm-bindgen-mac=
ro-support/0.2.108</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasm-bindgen-shared/0.2.=
108" rel=3D"noreferrer" target=3D"_blank">crates.io/wasm-bindgen-shared/0.2=
.108</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi/0.3.9" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/winapi/0.3.9</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-i686-pc-windows-g=
nu/0.4.0" rel=3D"noreferrer" target=3D"_blank">crates.io/winapi-i686-pc-win=
dows-gnu/0.4.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-x86_64-pc-windows=
-gnu/0.4.0" rel=3D"noreferrer" target=3D"_blank">crates.io/winapi-x86_64-pc=
-windows-gnu/0.4.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows-link/0.2.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/windows-link/0.2.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows-sys/0.60.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/windows-sys/0.60.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows-sys/0.61.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/windows-sys/0.61.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows-targets/0.53.5" =
rel=3D"noreferrer" target=3D"_blank">crates.io/windows-targets/0.53.5</a> \=
<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_aarch64_gnullvm/=
0.53.1" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_aarch64_gnul=
lvm/0.53.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_aarch64_msvc/0.5=
3.1" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_aarch64_msvc/0.=
53.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_i686_gnu/0.53.1"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/windows_i686_gnu/0.53.1</a>=
 \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_i686_gnullvm/0.5=
3.1" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_i686_gnullvm/0.=
53.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_i686_msvc/0.53.1=
" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_i686_msvc/0.53.1</=
a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x86_64_gnu/0.53.=
1" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86_64_gnu/0.53.1=
</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x86_64_gnullvm/0=
.53.1" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86_64_gnullv=
m/0.53.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x86_64_msvc/0.53=
.1" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86_64_msvc/0.53=
.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winnow/0.7.14" rel=3D"no=
referrer" target=3D"_blank">crates.io/winnow/0.7.14</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wit-bindgen/0.46.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/wit-bindgen/0.46.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/writeable/0.6.2" rel=3D"=
noreferrer" target=3D"_blank">crates.io/writeable/0.6.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/yoke/0.8.1" rel=3D"noref=
errer" target=3D"_blank">crates.io/yoke/0.8.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/yoke-derive/0.8.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/yoke-derive/0.8.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zbus/5.13.2" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/zbus/5.13.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zbus_macros/5.13.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/zbus_macros/5.13.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zbus_names/4.3.1" rel=3D=
"noreferrer" target=3D"_blank">crates.io/zbus_names/4.3.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zerofrom/0.1.6" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/zerofrom/0.1.6</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zerofrom-derive/0.1.6" r=
el=3D"noreferrer" target=3D"_blank">crates.io/zerofrom-derive/0.1.6</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zerotrie/0.2.3" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/zerotrie/0.2.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zerovec/0.11.5" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/zerovec/0.11.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zerovec-derive/0.11.2" r=
el=3D"noreferrer" target=3D"_blank">crates.io/zerovec-derive/0.11.2</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zmij/1.0.17" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/zmij/1.0.17</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zvariant/5.9.2" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/zvariant/5.9.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zvariant_derive/5.9.2" r=
el=3D"noreferrer" target=3D"_blank">crates.io/zvariant_derive/5.9.2</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zvariant_utils/3.3.0" re=
l=3D"noreferrer" target=3D"_blank">crates.io/zvariant_utils/3.3.0</a> \<br>
+&quot;<br>
+<br>
+SRC_URI[addr2line-0.25.1.sha256sum] =3D &quot;1b5d307320b3181d6d7954e663bd=
7c774a838b8220fe0593c86d9fb09f498b4b&quot;<br>
+SRC_URI[adler2-2.0.1.sha256sum] =3D &quot;320119579fcad9c21884f5c4861d1617=
4d0e06250625266f50fe6898340abefa&quot;<br>
+SRC_URI[anstream-0.6.21.sha256sum] =3D &quot;43d5b281e737544384e969a5ccad3=
f1cdd24b48086a0fc1b2a5262a26b8f4f4a&quot;<br>
+SRC_URI[anstyle-1.0.13.sha256sum] =3D &quot;5192cca8006f1fd4f7237516f40fa1=
83bb07f8fbdfedaa0036de5ea9b0b45e78&quot;<br>
+SRC_URI[anstyle-parse-0.2.7.sha256sum] =3D &quot;4e7644824f0aa2c7b93845792=
34ef10eb7efb6a0deb83f9630a49594dd9c15c2&quot;<br>
+SRC_URI[anstyle-query-1.1.5.sha256sum] =3D &quot;40c48f72fd53cd289104fc640=
99abca73db4166ad86ea0b4341abe65af83dadc&quot;<br>
+SRC_URI[anstyle-wincon-3.0.11.sha256sum] =3D &quot;291e6a250ff86cd4a820112=
fb8898808a366d8f9f58ce16d1f538353ad55747d&quot;<br>
+SRC_URI[async-broadcast-0.7.2.sha256sum] =3D &quot;435a87a52755b8f27fcf321=
ac4f04b2802e337c8c4872923137471ec39c37532&quot;<br>
+SRC_URI[async-channel-2.5.0.sha256sum] =3D &quot;924ed96dd52d1b75e9c1a3e62=
75715fd320f5f9439fb5a4a11fa51f4221158d2&quot;<br>
+SRC_URI[async-executor-1.13.3.sha256sum] =3D &quot;497c00e0fd83a72a79a39fc=
bd8e3e2f055d6f6c7e025f3b3d91f4f8e76527fb8&quot;<br>
+SRC_URI[async-io-2.6.0.sha256sum] =3D &quot;456b8a8feb6f42d237746d4b3e9a17=
8494627745c3c56c6ea55d92ba50d026fc&quot;<br>
+SRC_URI[async-lock-3.4.2.sha256sum] =3D &quot;290f7f2596bd5b78a9fec8088ccd=
89180d7f9f55b94b0576823bbbdc72ee8311&quot;<br>
+SRC_URI[async-process-2.5.0.sha256sum] =3D &quot;fc50921ec0055cdd8a16de487=
73bfeec5c972598674347252c0399676be7da75&quot;<br>
+SRC_URI[async-recursion-1.1.1.sha256sum] =3D &quot;3b43422f69d8ff38f95f1b2=
bb76517c91589a924d1559a0e935d7c8ce0274c11&quot;<br>
+SRC_URI[async-signal-0.2.13.sha256sum] =3D &quot;43c070bbf59cd3570b6b2dd54=
cd772527c7c3620fce8be898406dd3ed6adc64c&quot;<br>
+SRC_URI[async-task-4.7.1.sha256sum] =3D &quot;8b75356056920673b02621b35afd=
0f7dda9306d03c79a30f5c56c44cf256e3de&quot;<br>
+SRC_URI[async-trait-0.1.89.sha256sum] =3D &quot;9035ad2d096bed7955a320ee7e=
2230574d28fd3c3a0f186cbea1ff3c7eed5dbb&quot;<br>
+SRC_URI[atomic-waker-1.1.2.sha256sum] =3D &quot;1505bd5d3d116872e7271a6d4e=
16d81d0c8570876c8de68093a09ac269d8aac0&quot;<br>
+SRC_URI[autocfg-1.5.0.sha256sum] =3D &quot;c08606f8c3cbf4ce6ec8e28fb0014a2=
c086708fe954eaa885384a6165172e7e8&quot;<br>
+SRC_URI[backtrace-0.3.76.sha256sum] =3D &quot;bb531853791a215d7c62a30daf0d=
de835f381ab5de4589cfe7c649d2cbe92bd6&quot;<br>
+SRC_URI[base64-0.22.1.sha256sum] =3D &quot;72b3254f16251a8381aa12e40e3c4d2=
f0199f8c6508fbecb9d91f575e0fbb8c6&quot;<br>
+SRC_URI[bitflags-2.10.0.sha256sum] =3D &quot;812e12b5285cc515a9c72a5c1d3b6=
d46a19dac5acfef5265968c166106e31dd3&quot;<br>
+SRC_URI[blocking-1.6.2.sha256sum] =3D &quot;e83f8d02be6967315521be875afa79=
2a316e28d57b5a2d401897e2a7921b7f21&quot;<br>
+SRC_URI[bumpalo-3.19.1.sha256sum] =3D &quot;5dd9dc738b7a8311c7ade152424974=
d8115f2cdad61e8dab8dac9f2362298510&quot;<br>
+SRC_URI[cfg-if-1.0.4.sha256sum] =3D &quot;9330f8b2ff13f34540b44e946ef35111=
825727b38d33286ef986142615121801&quot;<br>
+SRC_URI[clap-4.5.55.sha256sum] =3D &quot;3e34525d5bbbd55da2bb745d34b36121b=
aac88d07619a9a09cfcf4a6c0832785&quot;<br>
+SRC_URI[clap_builder-4.5.55.sha256sum] =3D &quot;59a20016a20a3da95bef50ec7=
238dbd09baeef4311dcdd38ec15aba69812fb61&quot;<br>
+SRC_URI[clap_derive-4.5.55.sha256sum] =3D &quot;a92793da1a46a5f2a02a6f4c46=
c6496b28c43638adea8306fcb0caa1634f24e5&quot;<br>
+SRC_URI[clap_lex-0.7.7.sha256sum] =3D &quot;c3e64b0cc0439b12df2fa678eae89a=
1c56a529fd067a9115f7827f1fffd22b32&quot;<br>
+SRC_URI[color-eyre-0.6.5.sha256sum] =3D &quot;e5920befb47832a6d61ee3a3a846=
565cfa39b331331e68a3b1d1116630f2f26d&quot;<br>
+SRC_URI[color-spantrace-0.3.0.sha256sum] =3D &quot;b8b88ea9df13354b55bc723=
4ebcce36e6ef896aca2e42a15de9e10edce01b427&quot;<br>
+SRC_URI[colorchoice-1.0.4.sha256sum] =3D &quot;b05b61dc5112cbb17e4b6cd6179=
0d9845d13888356391624cbe7e41efeac1e75&quot;<br>
+SRC_URI[compose_spec-0.3.0.sha256sum] =3D &quot;3fd9b9dc67f2b3024582ec6d86=
1950f0af0aeaabb8350ccda1f0e51ff8e5895c&quot;<br>
+SRC_URI[compose_spec_macros-0.1.1.sha256sum] =3D &quot;b77735bd89be8da01c8=
d7e61faec5a9ccb0e313cece3c773c6b3ae251b90c7d4&quot;<br>
+SRC_URI[concurrent-queue-2.5.0.sha256sum] =3D &quot;4ca0197aee26d1ae37445e=
e532fefce43251d24cc7c166799f4d46817f1d3973&quot;<br>
+SRC_URI[crossbeam-utils-0.8.21.sha256sum] =3D &quot;d0a5c400df2834b80a4c33=
27b3aad3a4c4cd4de0629063962b03235697506a28&quot;<br>
+SRC_URI[displaydoc-0.2.5.sha256sum] =3D &quot;97369cbbc041bc366949bc74d346=
58d6cda5621039731c6310521892a3a20ae0&quot;<br>
+SRC_URI[endi-1.1.1.sha256sum] =3D &quot;66b7e2430c6dff6a955451e2cfc438f09c=
ea1965a9d6f87f7e3b90decc014099&quot;<br>
+SRC_URI[enumflags2-0.7.12.sha256sum] =3D &quot;1027f7680c853e056ebcec68361=
5fb6fbbc07dbaa13b4d5d9442b146ded4ecef&quot;<br>
+SRC_URI[enumflags2_derive-0.7.12.sha256sum] =3D &quot;67c78a4d8fdf9953a5c9=
d458f9efe940fd97a0cab0941c075a813ac594733827&quot;<br>
+SRC_URI[equivalent-1.0.2.sha256sum] =3D &quot;877a4ace8713b0bcf2a4e7eec825=
29c029f1d0619886d18145fea96c3ffe5c0f&quot;<br>
+SRC_URI[errno-0.3.14.sha256sum] =3D &quot;39cab71617ae0d63f51a36d69f866391=
735b51691dbda63cf6f96d042b63efeb&quot;<br>
+SRC_URI[event-listener-5.4.1.sha256sum] =3D &quot;e13b66accf52311f30a0db42=
147dadea9850cb48cd070028831ae5f5d4b856ab&quot;<br>
+SRC_URI[event-listener-strategy-0.5.4.sha256sum] =3D &quot;8be9f3dfaaffdae=
2972880079a491a1a8bb7cbed0b8dd7a347f668b4150a3b93&quot;<br>
+SRC_URI[eyre-0.6.12.sha256sum] =3D &quot;7cd915d99f24784cdc19fd37ef22b97e3=
ff0ae756c7e492e9fbfe897d61e2aec&quot;<br>
+SRC_URI[fastrand-2.3.0.sha256sum] =3D &quot;37909eebbb50d72f9059c3b6d82c04=
63f2ff062c9e95845c43a6c9c0355411be&quot;<br>
+SRC_URI[form_urlencoded-1.2.2.sha256sum] =3D &quot;cb4cb245038516f5f852778=
75cdaa4f7d2c9a0fa0468de06ed190163b1581fcf&quot;<br>
+SRC_URI[futures-core-0.3.31.sha256sum] =3D &quot;05f29059c0c2090612e8d7421=
78b0580d2dc940c837851ad723096f87af6663e&quot;<br>
+SRC_URI[futures-io-0.3.31.sha256sum] =3D &quot;9e5c1b78ca4aae1ac06c48a526a=
655760685149f0d465d21f37abfe57ce075c6&quot;<br>
+SRC_URI[futures-lite-2.6.1.sha256sum] =3D &quot;f78e10609fe0e0b3f4157ffab1=
876319b5b0db102a2c60dc4626306dc46b44ad&quot;<br>
+SRC_URI[getrandom-0.3.4.sha256sum] =3D &quot;899def5c37c4fd7b2664648c28120=
ecec138e4d395b459e5ca34f9cce2dd77fd&quot;<br>
+SRC_URI[gimli-0.32.3.sha256sum] =3D &quot;e629b9b98ef3dd8afe6ca2bd0f89306c=
ec16d43d907889945bc5d6687f2f13c7&quot;<br>
+SRC_URI[hashbrown-0.16.1.sha256sum] =3D &quot;841d1cc9bed7f9236f321df97703=
0373f4a4163ae1a7dbfe1a51a2c1a51d9100&quot;<br>
+SRC_URI[heck-0.5.0.sha256sum] =3D &quot;2304e00983f87ffb38b55b444b5e3b60a8=
84b5d30c0fca7d82fe33449bbe55ea&quot;<br>
+SRC_URI[hermit-abi-0.5.2.sha256sum] =3D &quot;fc0fef456e4baa96da950455cd02=
c081ca953b141298e41db3fc7e36b1da849c&quot;<br>
+SRC_URI[hex-0.4.3.sha256sum] =3D &quot;7f24254aa9a54b5c858eaee2f5bccdb46aa=
f0e486a595ed5fd8f86ba55232a70&quot;<br>
+SRC_URI[icu_collections-2.1.1.sha256sum] =3D &quot;4c6b649701667bbe825c3b7=
e6388cb521c23d88644678e83c0c4d0a621a34b43&quot;<br>
+SRC_URI[icu_locale_core-2.1.1.sha256sum] =3D &quot;edba7861004dd3714265b4d=
b54a3c390e880ab658fec5f7db895fae2046b5bb6&quot;<br>
+SRC_URI[icu_normalizer-2.1.1.sha256sum] =3D &quot;5f6c8828b67bf8908d82127b=
2054ea1b4427ff0230ee9141c54251934ab1b599&quot;<br>
+SRC_URI[icu_normalizer_data-2.1.1.sha256sum] =3D &quot;7aedcccd01fc5fe81e6=
b489c15b247b8b0690feb23304303a9e560f37efc560a&quot;<br>
+SRC_URI[icu_properties-2.1.2.sha256sum] =3D &quot;020bfc02fe870ec3a66d93e6=
77ccca0562506e5872c650f893269e08615d74ec&quot;<br>
+SRC_URI[icu_properties_data-2.1.2.sha256sum] =3D &quot;616c294cf8d725c6afc=
d8f55abc17c56464ef6211f9ed59cccffe534129c77af&quot;<br>
+SRC_URI[icu_provider-2.1.1.sha256sum] =3D &quot;85962cf0ce02e1e0a629cc34e7=
ca3e373ce20dda4c4d7294bbd0bf1fdb59e614&quot;<br>
+SRC_URI[idna-1.1.0.sha256sum] =3D &quot;3b0875f23caa03898994f6ddc501886a45=
c7d3d62d04d2d90788d47be1b1e4de&quot;<br>
+SRC_URI[idna_adapter-1.2.1.sha256sum] =3D &quot;3acae9609540aa318d1bc58845=
5225fb2085b9ed0c4f6bd0d9d5bcd86f1a0344&quot;<br>
+SRC_URI[indenter-0.3.4.sha256sum] =3D &quot;964de6e86d545b246d84badc0fef52=
7924ace5134f30641c203ef52ba83f58d5&quot;<br>
+SRC_URI[indexmap-2.13.0.sha256sum] =3D &quot;7714e70437a7dc3ac8eb7e6f8df75=
fd8eb422675fc7678aff7364301092b1017&quot;<br>
+SRC_URI[ipnet-2.11.0.sha256sum] =3D &quot;469fb0b9cefa57e3ef31275ee7cacb78=
f2fdca44e4765491884a2b119d4eb130&quot;<br>
+SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] =3D &quot;a6cb138bb79a146c1=
bd460005623e142ef0181e3d0219cb493e02f7d08a35695&quot;<br>
+SRC_URI[itoa-1.0.17.sha256sum] =3D &quot;92ecc6618181def0457392ccd0ee51198=
e065e016d1d527a7ac1b6dc7c1f09d2&quot;<br>
+SRC_URI[jiff-0.2.18.sha256sum] =3D &quot;e67e8da4c49d6d9909fe03361f9b620f5=
8898859f5c7aded68351e85e71ecf50&quot;<br>
+SRC_URI[jiff-static-0.2.18.sha256sum] =3D &quot;e0c84ee7f197eca9a86c6fd6cb=
771e55eb991632f15f2bc3ca6ec838929e6e78&quot;<br>
+SRC_URI[js-sys-0.3.85.sha256sum] =3D &quot;8c942ebf8e95485ca0d52d97da7c5a2=
c387d0e7f0ba4c35e93bfcaee045955b3&quot;<br>
+SRC_URI[k8s-openapi-0.27.0.sha256sum] =3D &quot;05a6d6f3611ad1d21732adbd7a=
2e921f598af6c92d71ae6e2620da4b67ee1f0d&quot;<br>
+SRC_URI[lazy_static-1.5.0.sha256sum] =3D &quot;bbd2bcb4c963f2ddae06a2efc7e=
9f3591312473c50c6685e1f298068316e66fe&quot;<br>
+SRC_URI[libc-0.2.180.sha256sum] =3D &quot;bcc35a38544a891a5f7c865aca548a98=
2ccb3b8650a5b06d0fd33a10283c56fc&quot;<br>
+SRC_URI[linux-raw-sys-0.11.0.sha256sum] =3D &quot;df1d3c3b53da64cf57604822=
73a98e575c651a67eec7f77df96b5b642de8f039&quot;<br>
+SRC_URI[litemap-0.8.1.sha256sum] =3D &quot;6373607a59f0be73a39b6fe456b8192=
fcc3585f602af20751600e974dd455e77&quot;<br>
+SRC_URI[memchr-2.7.6.sha256sum] =3D &quot;f52b00d39961fc5b2736ea853c9cc862=
38e165017a493d1d5c8eac6bdc4cc273&quot;<br>
+SRC_URI[memoffset-0.9.1.sha256sum] =3D &quot;488016bfae457b036d996092f6cb4=
48677611ce4449e970ceaf42695203f218a&quot;<br>
+SRC_URI[miniz_oxide-0.8.9.sha256sum] =3D &quot;1fa76a2c86f704bdb222d66965f=
b3d63269ce38518b83cb0575fca855ebb6316&quot;<br>
+SRC_URI[object-0.37.3.sha256sum] =3D &quot;ff76201f031d8863c38aa7f905eca4f=
53abbfa15f609db4277d44cd8938f33fe&quot;<br>
+SRC_URI[once_cell-1.21.3.sha256sum] =3D &quot;42f5e15c9953c5e4ccceeb2e7382=
a716482c34515315f7b03532b8b4e8393d2d&quot;<br>
+SRC_URI[once_cell_polyfill-1.70.2.sha256sum] =3D &quot;384b8ab6d37215f3c53=
01a95a4accb5d64aa607f1fcb26a11b5303878451b4fe&quot;<br>
+SRC_URI[ordered-stream-0.2.0.sha256sum] =3D &quot;9aa2b01e1d916879f73a53d0=
1d1d6cee68adbb31d6d9177a8cfce093cced1d50&quot;<br>
+SRC_URI[owo-colors-4.2.3.sha256sum] =3D &quot;9c6901729fa79e91a0913333229e=
9ca5dc725089d1c363b2f4b4760709dc4a52&quot;<br>
+SRC_URI[parking-2.2.1.sha256sum] =3D &quot;f38d5652c16fde515bb1ecef450ab0f=
6a219d619a7274976324d5e377f7dceba&quot;<br>
+SRC_URI[path-clean-1.0.1.sha256sum] =3D &quot;17359afc20d7ab31fdb42bb844c8=
b3bb1dabd7dcf7e68428492da7f16966fcef&quot;<br>
+SRC_URI[percent-encoding-2.3.2.sha256sum] =3D &quot;9b4f627cb1b25917193a25=
9e49bdad08f671f8d9708acfd5fe0a8c1455d87220&quot;<br>
+SRC_URI[pin-project-lite-0.2.16.sha256sum] =3D &quot;3b3cff922bd51709b605d=
9ead9aa71031d81447142d828eb4a6eba76fe619f9b&quot;<br>
+SRC_URI[piper-0.2.4.sha256sum] =3D &quot;96c8c490f422ef9a4efd2cb5b42b76c86=
13d7e7dfc1caf667b8a3350a5acc066&quot;<br>
+SRC_URI[polling-3.11.0.sha256sum] =3D &quot;5d0e4f59085d47d8241c88ead0f274=
e8a0cb551f3625263c05eb8dd897c34218&quot;<br>
+SRC_URI[portable-atomic-1.13.0.sha256sum] =3D &quot;f89776e4d69bb58bc6993e=
99ffa1d11f228b839984854c7daeb5d37f87cbe950&quot;<br>
+SRC_URI[portable-atomic-util-0.2.4.sha256sum] =3D &quot;d8a2f0d8d040d7848a=
709caf78912debcc3f33ee4b3cac47d73d1e1069e83507&quot;<br>
+SRC_URI[potential_utf-0.1.4.sha256sum] =3D &quot;b73949432f5e2a09657003c25=
bca5e19a0e9c84f8058ca374f49e0ebe605af77&quot;<br>
+SRC_URI[proc-macro-crate-3.4.0.sha256sum] =3D &quot;219cb19e96be00ab2e37d6=
e299658a0cfa83e52429179969b0f0121b4ac46983&quot;<br>
+SRC_URI[proc-macro2-1.0.106.sha256sum] =3D &quot;8fd00f0bb2e90d81d1044c2b3=
2617f68fcb9fa3bb7640c23e9c748e53fb30934&quot;<br>
+SRC_URI[quote-1.0.44.sha256sum] =3D &quot;21b2ebcf727b7760c461f091f9f0f539=
b77b8e87f2fd88131e7f1b433b3cece4&quot;<br>
+SRC_URI[r-efi-5.3.0.sha256sum] =3D &quot;69cdb34c158ceb288df11e18b4bd39de9=
94f6657d83847bdffdbd7f346754b0f&quot;<br>
+SRC_URI[rustc-demangle-0.1.27.sha256sum] =3D &quot;b50b8869d9fc858ce7266cc=
e0194bd74df58b9d0e3f6df3a9fc8eb470d95c09d&quot;<br>
+SRC_URI[rustix-1.1.3.sha256sum] =3D &quot;146c9e247ccc180c1f61615433868c99=
f3de3ae256a30a43b49f67c2d9171f34&quot;<br>
+SRC_URI[rustversion-1.0.22.sha256sum] =3D &quot;b39cdef0fa800fc44525c84ccb=
54a029961a8215f9619753635a9c0d2538d46d&quot;<br>
+SRC_URI[ryu-1.0.22.sha256sum] =3D &quot;a50f4cf475b65d88e057964e0e9bb1f0aa=
9bbb2036dc65c64596b42932536984&quot;<br>
+SRC_URI[serde-1.0.228.sha256sum] =3D &quot;9a8e94ea7f378bd32cbbd37198a4a91=
436180c5bb472411e48b5ec2e2124ae9e&quot;<br>
+SRC_URI[serde_core-1.0.228.sha256sum] =3D &quot;41d385c7d4ca58e59fc732af25=
c3983b67ac852c1a25000afe1175de458b67ad&quot;<br>
+SRC_URI[serde_derive-1.0.228.sha256sum] =3D &quot;d540f220d3187173da220f88=
5ab66608367b6574e925011a9353e4badda91d79&quot;<br>
+SRC_URI[serde_json-1.0.149.sha256sum] =3D &quot;83fc039473c5595ace860d8c4f=
afa220ff474b3fc6bfdb4293327f1a37e94d86&quot;<br>
+SRC_URI[serde_repr-0.1.20.sha256sum] =3D &quot;175ee3e80ae9982737ca543e961=
33087cbd9a485eecc3bc4de9c1a37b47ea59c&quot;<br>
+SRC_URI[serde_yaml-0.9.34+deprecated.sha256sum] =3D &quot;6a8b1a1a2ebf6740=
15cc02edccce75287f1a0130d394307b36743c2f5d504b47&quot;<br>
+SRC_URI[sharded-slab-0.1.7.sha256sum] =3D &quot;f40ca3c46823713e0d4209592e=
8d6e826aa57e928f09752619fc696c499637f6&quot;<br>
+SRC_URI[shlex-1.3.0.sha256sum] =3D &quot;0fda2ff0d084019ba4d7c6f371c95d8fd=
75ce3524c3cb8fb653a3023f6323e64&quot;<br>
+SRC_URI[signal-hook-registry-1.4.8.sha256sum] =3D &quot;c4db69cba1110affc0=
e9f7bcd48bbf87b3f4fc7c61fc9155afd4c469eb3d6c1b&quot;<br>
+SRC_URI[slab-0.4.11.sha256sum] =3D &quot;7a2ae44ef20feb57a68b23d846850f861=
394c2e02dc425a50098ae8c90267589&quot;<br>
+SRC_URI[smallvec-1.15.1.sha256sum] =3D &quot;67b1b7a3b5fe4f1376887184045fc=
f45c69e92af734b7aaddc05fb777b6fbd03&quot;<br>
+SRC_URI[smart-default-0.7.1.sha256sum] =3D &quot;0eb01866308440fc64d6c44d9=
e86c5cc17adfe33c4d6eed55da9145044d0ffc1&quot;<br>
+SRC_URI[stable_deref_trait-1.2.1.sha256sum] =3D &quot;6ce2be8dc25455e1f91d=
f71bfa12ad37d7af1092ae736f3a6cd0e37bc7810596&quot;<br>
+SRC_URI[strsim-0.11.1.sha256sum] =3D &quot;7da8b5736845d9f2fcb837ea5d9e262=
8564b3b043a70948a3f0b778838c5fb4f&quot;<br>
+SRC_URI[syn-2.0.114.sha256sum] =3D &quot;d4d107df263a3013ef9b1879b0df87d70=
6ff80f65a86ea879bd9c31f9b307c2a&quot;<br>
+SRC_URI[synstructure-0.13.2.sha256sum] =3D &quot;728a70f3dbaf5bab7f0c4b1ac=
8d7ae5ea60a4b5549c8a5914361c99147a709d2&quot;<br>
+SRC_URI[tempfile-3.24.0.sha256sum] =3D &quot;655da9c7eb6305c55742045d5a8d2=
037996d61d8de95806335c7c86ce0f82e9c&quot;<br>
+SRC_URI[terminal_size-0.4.3.sha256sum] =3D &quot;60b8cb979cb11c32ce1603f81=
37b22262a9d131aaa5c37b5678025f22b8becd0&quot;<br>
+SRC_URI[thiserror-1.0.69.sha256sum] =3D &quot;b6aaf5339b578ea85b50e080feb2=
50a3e8ae8cfcdff9a461c9ec2904bc923f52&quot;<br>
+SRC_URI[thiserror-impl-1.0.69.sha256sum] =3D &quot;4fee6c4efc90059e10f81e6=
d42c60a18f76588c3d74cb83a0b242a2b6c7504c1&quot;<br>
+SRC_URI[thread_local-1.1.9.sha256sum] =3D &quot;f60246a4944f24f6e018aa17cd=
effb7818b76356965d03b07d6a9886e8962185&quot;<br>
+SRC_URI[tinystr-0.8.2.sha256sum] =3D &quot;42d3e9c45c09de15d06dd8acf5f4e0e=
399e85927b7f00711024eb7ae10fa4869&quot;<br>
+SRC_URI[toml_datetime-0.7.5+spec-1.1.0.sha256sum] =3D &quot;92e1cfed4a3038=
bc5a127e35a2d360f145e1f4b971b551a2ba5fd7aedf7e1347&quot;<br>
+SRC_URI[toml_edit-0.23.10+spec-1.0.0.sha256sum] =3D &quot;84c8b9f757e028ce=
e9fa244aea147aab2a9ec09d5325a9b01e0a49730c2b5269&quot;<br>
+SRC_URI[toml_parser-1.0.6+spec-1.1.0.sha256sum] =3D &quot;a3198b4b0a8e11f0=
9dd03e133c0280504d0801269e9afa46362ffde1cbeebf44&quot;<br>
+SRC_URI[tracing-0.1.44.sha256sum] =3D &quot;63e71662fa4b2a2c3a26f570f037eb=
95bb1f85397f3cd8076caed2f026a6d100&quot;<br>
+SRC_URI[tracing-attributes-0.1.31.sha256sum] =3D &quot;7490cfa5ec963746568=
740651ac6781f701c9c5ea257c58e057f3ba8cf69e8da&quot;<br>
+SRC_URI[tracing-core-0.1.36.sha256sum] =3D &quot;db97caf9d906fbde555dd62fa=
95ddba9eecfd14cb388e4f491a66d74cd5fb79a&quot;<br>
+SRC_URI[tracing-error-0.2.1.sha256sum] =3D &quot;8b1581020d7a273442f5b4507=
4a6a57d5757ad0a47dac0e9f0bd57b81936f3db&quot;<br>
+SRC_URI[tracing-subscriber-0.3.22.sha256sum] =3D &quot;2f30143827ddab0d256=
fd843b7a66d164e9f271cfa0dde49142c5ca0ca291f1e&quot;<br>
+SRC_URI[uds_windows-1.1.0.sha256sum] =3D &quot;89daebc3e6fd160ac4aa9fc8b3b=
f71e1f74fbf92367ae71fb83a037e8bf164b9&quot;<br>
+SRC_URI[umask-2.1.0.sha256sum] =3D &quot;ec9a46c2549e35c054e0ffe281a3a6ec0=
007793db4df106604d37ed3f4d73d1c&quot;<br>
+SRC_URI[unicode-ident-1.0.22.sha256sum] =3D &quot;9312f7c4f6ff9069b1654982=
34ce8be658059c6728633667c526e27dc2cf1df5&quot;<br>
+SRC_URI[unsafe-libyaml-0.2.11.sha256sum] =3D &quot;673aac59facbab8a9007c7f=
6108d11f63b603f7cabff99fabf650fea5c32b861&quot;<br>
+SRC_URI[url-2.5.8.sha256sum] =3D &quot;ff67a8a4397373c3ef660812acab3268222=
035010ab8680ec4215f38ba3d0eed&quot;<br>
+SRC_URI[utf8_iter-1.0.4.sha256sum] =3D &quot;b6c140620e7ffbb22c2dee59cafe6=
084a59b5ffc27a8859a5f0d494b5d52b6be&quot;<br>
+SRC_URI[utf8parse-0.2.2.sha256sum] =3D &quot;06abde3611657adf66d383f00b093=
d7faecc7fa57071cce2578660c9f1010821&quot;<br>
+SRC_URI[uuid-1.20.0.sha256sum] =3D &quot;ee48d38b119b0cd71fe4141b30f5ba9c7=
c5d9f4e7a3a8b4a674e4b6ef789976f&quot;<br>
+SRC_URI[valuable-0.1.1.sha256sum] =3D &quot;ba73ea9cf16a25df0c8caa16c51acb=
937d5712a8429db78a3ee29d5dcacd3a65&quot;<br>
+SRC_URI[wasip2-1.0.1+wasi-0.2.4.sha256sum] =3D &quot;0562428422c63773dad2c=
345a1882263bbf4d65cf3f42e90921f787ef5ad58e7&quot;<br>
+SRC_URI[wasm-bindgen-0.2.108.sha256sum] =3D &quot;64024a30ec1e37399cf85a7f=
fefebdb72205ca1c972291c51512360d90bd8566&quot;<br>
+SRC_URI[wasm-bindgen-macro-0.2.108.sha256sum] =3D &quot;008b239d9c740232e7=
1bd39e8ef6429d27097518b6b30bdf9086833bd5b6d608&quot;<br>
+SRC_URI[wasm-bindgen-macro-support-0.2.108.sha256sum] =3D &quot;5256bae2d5=
8f54820e6490f9839c49780dff84c65aeab9e772f15d5f0e913a55&quot;<br>
+SRC_URI[wasm-bindgen-shared-0.2.108.sha256sum] =3D &quot;1f01b580c9ac74c8d=
8f0c0e4afb04eeef2acf145458e52c03845ee9cd23e3d12&quot;<br>
+SRC_URI[winapi-0.3.9.sha256sum] =3D &quot;5c839a674fcd7a98952e593242ea400a=
be93992746761e38641405d28b00f419&quot;<br>
+SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] =3D &quot;ac3b87c63620=
426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6&quot;<br>
+SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] =3D &quot;712e227841=
d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f&quot;<br>
+SRC_URI[windows-link-0.2.1.sha256sum] =3D &quot;f0805222e57f7521d6a62e36fa=
9163bc891acd422f971defe97d64e70d0a4fe5&quot;<br>
+SRC_URI[windows-sys-0.60.2.sha256sum] =3D &quot;f2f500e4d28234f72040990ec9=
d39e3a6b950f9f22d3dba18416c35882612bcb&quot;<br>
+SRC_URI[windows-sys-0.61.2.sha256sum] =3D &quot;ae137229bcbd6cdf0f7b80a31d=
f61766145077ddf49416a728b02cb3921ff3fc&quot;<br>
+SRC_URI[windows-targets-0.53.5.sha256sum] =3D &quot;4945f9f551b88e0d65f3db=
0bc25c33b8acea4d9e41163edf90dcd0b19f9069f3&quot;<br>
+SRC_URI[windows_aarch64_gnullvm-0.53.1.sha256sum] =3D &quot;a9d8416fa8b42f=
5c947f8482c43e7d89e73a173cead56d044f6a56104a6d1b53&quot;<br>
+SRC_URI[windows_aarch64_msvc-0.53.1.sha256sum] =3D &quot;b9d782e804c2f632e=
395708e99a94275910eb9100b2114651e04744e9b125006&quot;<br>
+SRC_URI[windows_i686_gnu-0.53.1.sha256sum] =3D &quot;960e6da069d81e09becb0=
ca57a65220ddff016ff2d6af6a223cf372a506593a3&quot;<br>
+SRC_URI[windows_i686_gnullvm-0.53.1.sha256sum] =3D &quot;fa7359d10048f68ab=
8b09fa71c3daccfb0e9b559aed648a8f95469c27057180c&quot;<br>
+SRC_URI[windows_i686_msvc-0.53.1.sha256sum] =3D &quot;1e7ac75179f18232fe9c=
285163565a57ef8d3c89254a30685b57d83a38d326c2&quot;<br>
+SRC_URI[windows_x86_64_gnu-0.53.1.sha256sum] =3D &quot;9c3842cdd74a865a806=
6ab39c8a7a473c0778a3f29370b5fd6b4b9aa7df4a499&quot;<br>
+SRC_URI[windows_x86_64_gnullvm-0.53.1.sha256sum] =3D &quot;0ffa179e2d07eee=
8ad8f57493436566c7cc30ac536a3379fdf008f47f6bb7ae1&quot;<br>
+SRC_URI[windows_x86_64_msvc-0.53.1.sha256sum] =3D &quot;d6bbff5f0aada427a1=
e5a6da5f1f98158182f26556f345ac9e04d36d0ebed650&quot;<br>
+SRC_URI[winnow-0.7.14.sha256sum] =3D &quot;5a5364e9d77fcdeeaa6062ced926ee3=
381faa2ee02d3eb83a5c27a8825540829&quot;<br>
+SRC_URI[wit-bindgen-0.46.0.sha256sum] =3D &quot;f17a85883d4e6d00e8a97c586d=
e764dabcc06133f7f1d55dce5cdc070ad7fe59&quot;<br>
+SRC_URI[writeable-0.6.2.sha256sum] =3D &quot;9edde0db4769d2dc68579893f2306=
b26c6ecfbe0ef499b013d731b7b9247e0b9&quot;<br>
+SRC_URI[yoke-0.8.1.sha256sum] =3D &quot;72d6e5c6afb84d73944e5cedb052c4680d=
5657337201555f9f2a16b7406d4954&quot;<br>
+SRC_URI[yoke-derive-0.8.1.sha256sum] =3D &quot;b659052874eb698efe5b9e8cf38=
2204678a0086ebf46982b79d6ca3182927e5d&quot;<br>
+SRC_URI[zbus-5.13.2.sha256sum] =3D &quot;1bfeff997a0aaa3eb20c4652baf788d2d=
fa6d2839a0ead0b3ff69ce2f9c4bdd1&quot;<br>
+SRC_URI[zbus_macros-5.13.2.sha256sum] =3D &quot;0bbd5a90dbe8feee5b13def448=
427ae314ccd26a49cac47905cafefb9ff846f1&quot;<br>
+SRC_URI[zbus_names-4.3.1.sha256sum] =3D &quot;ffd8af6d5b78619bab301ff3c560=
a5bd22426150253db278f164d6cf3b72c50f&quot;<br>
+SRC_URI[zerofrom-0.1.6.sha256sum] =3D &quot;50cc42e0333e05660c3587f3bf9d04=
78688e15d870fab3346451ce7f8c9fbea5&quot;<br>
+SRC_URI[zerofrom-derive-0.1.6.sha256sum] =3D &quot;d71e5d6e06ab090c67b5e44=
993ec16b72dcbaabc526db883a360057678b48502&quot;<br>
+SRC_URI[zerotrie-0.2.3.sha256sum] =3D &quot;2a59c17a5562d507e4b54960e8569e=
bee33bee890c70aa3fe7b97e85a9fd7851&quot;<br>
+SRC_URI[zerovec-0.11.5.sha256sum] =3D &quot;6c28719294829477f525be0186d13e=
fa9a3c602f7ec202ca9e353d310fb9a002&quot;<br>
+SRC_URI[zerovec-derive-0.11.2.sha256sum] =3D &quot;eadce39539ca5cb39855901=
02671f2567e659fca9666581ad3411d59207951f3&quot;<br>
+SRC_URI[zmij-1.0.17.sha256sum] =3D &quot;02aae0f83f69aafc94776e879363e9771=
d7ecbffe2c7fbb6c14c5e00dfe88439&quot;<br>
+SRC_URI[zvariant-5.9.2.sha256sum] =3D &quot;68b64ef4f40c7951337ddc7023dd03=
528a57a3ce3408ee9da5e948bd29b232c4&quot;<br>
+SRC_URI[zvariant_derive-5.9.2.sha256sum] =3D &quot;484d5d975eb7afb52cc6b92=
9c13d3719a20ad650fea4120e6310de3fc55e415c&quot;<br>
+SRC_URI[zvariant_utils-3.3.0.sha256sum] =3D &quot;f75c23a64ef8f40f13a69899=
91e643554d9bef1d682a281160cf0c1bc389c5e9&quot;<br>
diff --git a/recipes-containers/podlet/<a href=3D"http://podlet_git.bb" rel=
=3D"noreferrer" target=3D"_blank">podlet_git.bb</a> b/recipes-containers/po=
dlet/<a href=3D"http://podlet_git.bb" rel=3D"noreferrer" target=3D"_blank">=
podlet_git.bb</a><br>
new file mode 100644<br>
index 00000000..4977bf0d<br>
--- /dev/null<br>
+++ b/recipes-containers/podlet/<a href=3D"http://podlet_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">podlet_git.bb</a><br>
@@ -0,0 +1,14 @@<br>
+SUMMARY =3D &quot;Generator for quadlet files&quot;<br>
+DESCRIPTION =3D &quot;Podlet generates Podman Quadlet files from a Podman =
command, compose file, or existing object.&quot;<br>
+LICENSE =3D &quot;MPL-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Df75d2927d3c1ed2414ef72048f=
5ad640&quot;<br>
+<br>
+inherit cargo cargo-update-recipe-crates<br>
+<br>
+PV =3D &quot;0.3.16&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/containers/podlet.git=
;protocol=3Dhttps;branch=3Dmain" rel=3D"noreferrer" target=3D"_blank">githu=
b.com/containers/podlet.git;protocol=3Dhttps;branch=3Dmain</a>&quot;<br>
+SRCREV =3D &quot;ca463af859931a9a43688d869eae5fe3a95e7143&quot;<br>
+<br>
+require ${BPN}-crates.inc<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
---<br>
base-commit: b9b7e17eae46c6e3e561f3675870be94eea69332<br>
change-id: 20260430-add_podlet-5c691a09b7ff<br>
<br>
Best regards,<br>
--=C2=A0 <br>
Patrick Vogelaar &lt;<a href=3D"mailto:patrick.vogelaar@belden.com" target=
=3D"_blank">patrick.vogelaar@belden.com</a>&gt;<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9783): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9783" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9783</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/119077829/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/119077829/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div>

--0000000000002e408506513ffcb7--

