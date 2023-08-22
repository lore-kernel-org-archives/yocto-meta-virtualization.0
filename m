Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C03EE4996
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 03:45:25 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.970.1692675923674451047
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 21 Aug 2023 20:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=LYMOwXEf;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4103c24a989so26232541cf.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 21 Aug 2023 20:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692675923; x=1693280723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ghCog+9OAfm+hwo2QcF+c+C6jku88iIezjhugDUBiko=;
        b=LYMOwXEffJRtRFGMlHMqhmHLizwHg8yhHcm9l7As7FOGDlMthBNii8kmPLNA/Ouqau
         +IxLwj6GpQwD93Provqxudlb4FUJMaA18GSYJHY8znBC3urm5lK1bQKrEIKqvB7zl+X8
         e+2eGbYSrULqrmodDXUJERZOEo/A5Y3s1FFLc/rjNTWtky3ws204nyjsX23QL4f1/NLQ
         olcpw7M9kUPt10ShJwyuvSyd1BYTR3xI2skpgH4xFXRdFG3y+uxItFj36q7RJbsF9q+h
         VLXAW3eRLYPWb/RXB3dMb+Mbr6lIUTSJdUyNkhpko8VqJ4qFvjqM7S8DgIeoUnz/NkFy
         JWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692675923; x=1693280723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghCog+9OAfm+hwo2QcF+c+C6jku88iIezjhugDUBiko=;
        b=a9b7EmMwqeBNRUTjtgOaESkTsYz9uj2iVukm/nlDzrf4UNiHO5kEeurHA6nTRx83Gf
         9brZs4aaMYNokJ8XHTCKsKzto0/D8MhbmMfRmLwCB9DBJ/9v1KpB5LsK2LW6ZzrO9oRN
         pW6N+A5cAwsi4z+HTLiPRttJujW8zXYi3OtQeJiQ0hTNZqMsSIDtJtFCwtQRXAIAAkwD
         vlv6wowFQ/ocX4lj7lP0+4e0dhgeaqUb2+pRPrJMK/JTeaEreexmYubQNvA+QY+c108Z
         ko7BfLXDCJq+I5klmWtnbtvnUan+6V4YEGG0MVISHIHKd7t8N7OuDhtatUWZa3gJ5R+U
         TDEQ==
X-Gm-Message-State: AOJu0YxONDh1ppNFuZO4TIovJoKX1xonTFVNhl+beJx1beNGh/PzDmo2
	OFt2e5GpT1gBlWYv5NKnlQw=
X-Google-Smtp-Source: AGHT+IEF7Wusztyff/tgrmCC78Zfd0UqANM509fnjLNxxMTJGaDvfUXu0mkf9eKdQkUXLCGglJhztA==
X-Received: by 2002:a05:622a:309:b0:3ff:42df:7bfd with SMTP id q9-20020a05622a030900b003ff42df7bfdmr10097498qtw.63.1692675922538;
        Mon, 21 Aug 2023 20:45:22 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id f14-20020ac86ece000000b003ef2db16e72sm2765084qtv.94.2023.08.21.20.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 20:45:22 -0700 (PDT)
Date: Tue, 22 Aug 2023 03:45:20 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Erik Schilling <erik.schilling@linaro.org>
Cc: meta-virtualization <meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization][PATCH] virtiofsd: add recipe
Message-ID: <ZOQvUN+4mwbmPYZK@gmail.com>
References: <20230817-virtiofsd-v1-1-85fc942973b8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817-virtiofsd-v1-1-85fc942973b8@linaro.org>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 22 Aug 2023 03:45:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8216

merged to master-next.

I'm on holidays for the next week and a half, so it will take
longer for me to test and get this merged.

Bruce

In message: [meta-virtualization][PATCH] virtiofsd: add recipe
on 17/08/2023 Erik Schilling wrote:

> virtiofsd allows sharing host directories with VMs over virtio-fs.
> 
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
> Another virtio-fs daemon. Also Rust based and built with the same
> libraries as the vhost-device-* ones.
> ---
>  recipes-extended/virtiofsd/README.md            |  14 +++
>  recipes-extended/virtiofsd/virtiofsd-crates.inc | 142 ++++++++++++++++++++++++
>  recipes-extended/virtiofsd/virtiofsd_1.7.0.bb   |  18 +++
>  3 files changed, 174 insertions(+)
> 
> diff --git a/recipes-extended/virtiofsd/README.md b/recipes-extended/virtiofsd/README.md
> new file mode 100644
> index 0000000..4bd96a0
> --- /dev/null
> +++ b/recipes-extended/virtiofsd/README.md
> @@ -0,0 +1,14 @@
> +# virtiofsd: A virtio-fs vhost-user daemon
> +
> +[virtiofsd](https://gitlab.com/virtio-fs/virtiofsd) implements the
> +[vhost-user protocol](https://qemu-project.gitlab.io/qemu/interop/vhost-user.html)
> +and provides a virtio-fs virtio device that can share host directories with
> +guests.
> +
> +## Updating the recipe
> +
> +1. Bump the version number to the newly published version listed on crates.io
> +2. Regenerate the .inc file that lists the dependencies:
> +   `bitbake -c update_crates virtiofsd`
> +3. Review, build and test the changes
> +
> diff --git a/recipes-extended/virtiofsd/virtiofsd-crates.inc b/recipes-extended/virtiofsd/virtiofsd-crates.inc
> new file mode 100644
> index 0000000..c33e9a5
> --- /dev/null
> +++ b/recipes-extended/virtiofsd/virtiofsd-crates.inc
> @@ -0,0 +1,142 @@
> +# Autogenerated with 'bitbake -c update_crates virtiofsd'
> +
> +# from Cargo.lock
> +SRC_URI += " \
> +    crate://crates.io/aho-corasick/0.7.18 \
> +    crate://crates.io/ansi_term/0.12.1 \
> +    crate://crates.io/arc-swap/1.5.0 \
> +    crate://crates.io/atty/0.2.14 \
> +    crate://crates.io/autocfg/1.1.0 \
> +    crate://crates.io/bitflags/1.3.2 \
> +    crate://crates.io/capng/0.2.2 \
> +    crate://crates.io/cfg-if/1.0.0 \
> +    crate://crates.io/clap/2.34.0 \
> +    crate://crates.io/env_logger/0.8.4 \
> +    crate://crates.io/error-chain/0.12.4 \
> +    crate://crates.io/futures/0.3.21 \
> +    crate://crates.io/futures-channel/0.3.21 \
> +    crate://crates.io/futures-core/0.3.21 \
> +    crate://crates.io/futures-executor/0.3.21 \
> +    crate://crates.io/futures-io/0.3.21 \
> +    crate://crates.io/futures-macro/0.3.21 \
> +    crate://crates.io/futures-sink/0.3.21 \
> +    crate://crates.io/futures-task/0.3.21 \
> +    crate://crates.io/futures-util/0.3.21 \
> +    crate://crates.io/heck/0.3.3 \
> +    crate://crates.io/hermit-abi/0.1.19 \
> +    crate://crates.io/hostname/0.3.1 \
> +    crate://crates.io/humantime/2.1.0 \
> +    crate://crates.io/itoa/1.0.2 \
> +    crate://crates.io/lazy_static/1.4.0 \
> +    crate://crates.io/libc/0.2.139 \
> +    crate://crates.io/libseccomp-sys/0.2.1 \
> +    crate://crates.io/log/0.4.17 \
> +    crate://crates.io/match_cfg/0.1.0 \
> +    crate://crates.io/memchr/2.5.0 \
> +    crate://crates.io/num_cpus/1.13.1 \
> +    crate://crates.io/num_threads/0.1.6 \
> +    crate://crates.io/pin-project-lite/0.2.9 \
> +    crate://crates.io/pin-utils/0.1.0 \
> +    crate://crates.io/proc-macro-error/1.0.4 \
> +    crate://crates.io/proc-macro-error-attr/1.0.4 \
> +    crate://crates.io/proc-macro2/1.0.63 \
> +    crate://crates.io/quote/1.0.29 \
> +    crate://crates.io/regex/1.6.0 \
> +    crate://crates.io/regex-syntax/0.6.27 \
> +    crate://crates.io/slab/0.4.7 \
> +    crate://crates.io/strsim/0.8.0 \
> +    crate://crates.io/structopt/0.3.26 \
> +    crate://crates.io/structopt-derive/0.4.18 \
> +    crate://crates.io/syn/1.0.98 \
> +    crate://crates.io/syn/2.0.23 \
> +    crate://crates.io/syslog/6.0.1 \
> +    crate://crates.io/termcolor/1.1.3 \
> +    crate://crates.io/textwrap/0.11.0 \
> +    crate://crates.io/thiserror/1.0.41 \
> +    crate://crates.io/thiserror-impl/1.0.41 \
> +    crate://crates.io/time/0.3.11 \
> +    crate://crates.io/unicode-ident/1.0.2 \
> +    crate://crates.io/unicode-segmentation/1.9.0 \
> +    crate://crates.io/unicode-width/0.1.9 \
> +    crate://crates.io/vec_map/0.8.2 \
> +    crate://crates.io/version_check/0.9.4 \
> +    crate://crates.io/vhost/0.8.1 \
> +    crate://crates.io/vhost-user-backend/0.10.0 \
> +    crate://crates.io/virtio-bindings/0.2.1 \
> +    crate://crates.io/virtio-queue/0.9.0 \
> +    crate://crates.io/vm-memory/0.12.0 \
> +    crate://crates.io/vmm-sys-util/0.11.1 \
> +    crate://crates.io/winapi/0.3.9 \
> +    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
> +    crate://crates.io/winapi-util/0.1.5 \
> +    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
> +"
> +
> +SRC_URI[aho-corasick-0.7.18.sha256sum] = "1e37cfd5e7657ada45f742d6e99ca5788580b5c529dc78faf11ece6dc702656f"
> +SRC_URI[ansi_term-0.12.1.sha256sum] = "d52a9bb7ec0cf484c551830a7ce27bd20d67eac647e1befb56b0be4ee39a55d2"
> +SRC_URI[arc-swap-1.5.0.sha256sum] = "c5d78ce20460b82d3fa150275ed9d55e21064fc7951177baacf86a145c4a4b1f"
> +SRC_URI[atty-0.2.14.sha256sum] = "d9b39be18770d11421cdb1b9947a45dd3f37e93092cbf377614828a319d5fee8"
> +SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
> +SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
> +SRC_URI[capng-0.2.2.sha256sum] = "f6f8e9448233603643e42606121d95f5f8d4e015b3e7619a51593864dd902575"
> +SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
> +SRC_URI[clap-2.34.0.sha256sum] = "a0610544180c38b88101fecf2dd634b174a62eef6946f84dfc6a7127512b381c"
> +SRC_URI[env_logger-0.8.4.sha256sum] = "a19187fea3ac7e84da7dacf48de0c45d63c6a76f9490dae389aead16c243fce3"
> +SRC_URI[error-chain-0.12.4.sha256sum] = "2d2f06b9cac1506ece98fe3231e3cc9c4410ec3d5b1f24ae1c8946f0742cdefc"
> +SRC_URI[futures-0.3.21.sha256sum] = "f73fe65f54d1e12b726f517d3e2135ca3125a437b6d998caf1962961f7172d9e"
> +SRC_URI[futures-channel-0.3.21.sha256sum] = "c3083ce4b914124575708913bca19bfe887522d6e2e6d0952943f5eac4a74010"
> +SRC_URI[futures-core-0.3.21.sha256sum] = "0c09fd04b7e4073ac7156a9539b57a484a8ea920f79c7c675d05d289ab6110d3"
> +SRC_URI[futures-executor-0.3.21.sha256sum] = "9420b90cfa29e327d0429f19be13e7ddb68fa1cccb09d65e5706b8c7a749b8a6"
> +SRC_URI[futures-io-0.3.21.sha256sum] = "fc4045962a5a5e935ee2fdedaa4e08284547402885ab326734432bed5d12966b"
> +SRC_URI[futures-macro-0.3.21.sha256sum] = "33c1e13800337f4d4d7a316bf45a567dbcb6ffe087f16424852d97e97a91f512"
> +SRC_URI[futures-sink-0.3.21.sha256sum] = "21163e139fa306126e6eedaf49ecdb4588f939600f0b1e770f4205ee4b7fa868"
> +SRC_URI[futures-task-0.3.21.sha256sum] = "57c66a976bf5909d801bbef33416c41372779507e7a6b3a5e25e4749c58f776a"
> +SRC_URI[futures-util-0.3.21.sha256sum] = "d8b7abd5d659d9b90c8cba917f6ec750a74e2dc23902ef9cd4cc8c8b22e6036a"
> +SRC_URI[heck-0.3.3.sha256sum] = "6d621efb26863f0e9924c6ac577e8275e5e6b77455db64ffa6c65c904e9e132c"
> +SRC_URI[hermit-abi-0.1.19.sha256sum] = "62b467343b94ba476dcb2500d242dadbb39557df889310ac77c5d99100aaac33"
> +SRC_URI[hostname-0.3.1.sha256sum] = "3c731c3e10504cc8ed35cfe2f1db4c9274c3d35fa486e3b31df46f068ef3e867"
> +SRC_URI[humantime-2.1.0.sha256sum] = "9a3a5bfb195931eeb336b2a7b4d761daec841b97f947d34394601737a7bba5e4"
> +SRC_URI[itoa-1.0.2.sha256sum] = "112c678d4050afce233f4f2852bb2eb519230b3cf12f33585275537d7e41578d"
> +SRC_URI[lazy_static-1.4.0.sha256sum] = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646"
> +SRC_URI[libc-0.2.139.sha256sum] = "201de327520df007757c1f0adce6e827fe8562fbc28bfd9c15571c66ca1f5f79"
> +SRC_URI[libseccomp-sys-0.2.1.sha256sum] = "9a7cbbd4ad467251987c6e5b47d53b11a5a05add08f2447a9e2d70aef1e0d138"
> +SRC_URI[log-0.4.17.sha256sum] = "abb12e687cfb44aa40f41fc3978ef76448f9b6038cad6aef4259d3c095a2382e"
> +SRC_URI[match_cfg-0.1.0.sha256sum] = "ffbee8634e0d45d258acb448e7eaab3fce7a0a467395d4d9f228e3c1f01fb2e4"
> +SRC_URI[memchr-2.5.0.sha256sum] = "2dffe52ecf27772e601905b7522cb4ef790d2cc203488bbd0e2fe85fcb74566d"
> +SRC_URI[num_cpus-1.13.1.sha256sum] = "19e64526ebdee182341572e50e9ad03965aa510cd94427a4549448f285e957a1"
> +SRC_URI[num_threads-0.1.6.sha256sum] = "2819ce041d2ee131036f4fc9d6ae7ae125a3a40e97ba64d04fe799ad9dabbb44"
> +SRC_URI[pin-project-lite-0.2.9.sha256sum] = "e0a7ae3ac2f1173085d398531c705756c94a4c56843785df85a60c1a0afac116"
> +SRC_URI[pin-utils-0.1.0.sha256sum] = "8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184"
> +SRC_URI[proc-macro-error-1.0.4.sha256sum] = "da25490ff9892aab3fcf7c36f08cfb902dd3e71ca0f9f9517bea02a73a5ce38c"
> +SRC_URI[proc-macro-error-attr-1.0.4.sha256sum] = "a1be40180e52ecc98ad80b184934baf3d0d29f979574e439af5a55274b35f869"
> +SRC_URI[proc-macro2-1.0.63.sha256sum] = "7b368fba921b0dce7e60f5e04ec15e565b3303972b42bcfde1d0713b881959eb"
> +SRC_URI[quote-1.0.29.sha256sum] = "573015e8ab27661678357f27dc26460738fd2b6c86e46f386fde94cb5d913105"
> +SRC_URI[regex-1.6.0.sha256sum] = "4c4eb3267174b8c6c2f654116623910a0fef09c4753f8dd83db29c48a0df988b"
> +SRC_URI[regex-syntax-0.6.27.sha256sum] = "a3f87b73ce11b1619a3c6332f45341e0047173771e8b8b73f87bfeefb7b56244"
> +SRC_URI[slab-0.4.7.sha256sum] = "4614a76b2a8be0058caa9dbbaf66d988527d86d003c11a94fbd335d7661edcef"
> +SRC_URI[strsim-0.8.0.sha256sum] = "8ea5119cdb4c55b55d432abb513a0429384878c15dde60cc77b1c99de1a95a6a"
> +SRC_URI[structopt-0.3.26.sha256sum] = "0c6b5c64445ba8094a6ab0c3cd2ad323e07171012d9c98b0b15651daf1787a10"
> +SRC_URI[structopt-derive-0.4.18.sha256sum] = "dcb5ae327f9cc13b68763b5749770cb9e048a99bd9dfdfa58d0cf05d5f64afe0"
> +SRC_URI[syn-1.0.98.sha256sum] = "c50aef8a904de4c23c788f104b7dddc7d6f79c647c7c8ce4cc8f73eb0ca773dd"
> +SRC_URI[syn-2.0.23.sha256sum] = "59fb7d6d8281a51045d62b8eb3a7d1ce347b76f312af50cd3dc0af39c87c1737"
> +SRC_URI[syslog-6.0.1.sha256sum] = "978044cc68150ad5e40083c9f6a725e6fd02d7ba1bcf691ec2ff0d66c0b41acc"
> +SRC_URI[termcolor-1.1.3.sha256sum] = "bab24d30b911b2376f3a13cc2cd443142f0c81dda04c118693e35b3835757755"
> +SRC_URI[textwrap-0.11.0.sha256sum] = "d326610f408c7a4eb6f51c37c330e496b08506c9457c9d34287ecc38809fb060"
> +SRC_URI[thiserror-1.0.41.sha256sum] = "c16a64ba9387ef3fdae4f9c1a7f07a0997fce91985c0336f1ddc1822b3b37802"
> +SRC_URI[thiserror-impl-1.0.41.sha256sum] = "d14928354b01c4d6a4f0e549069adef399a284e7995c7ccca94e8a07a5346c59"
> +SRC_URI[time-0.3.11.sha256sum] = "72c91f41dcb2f096c05f0873d667dceec1087ce5bcf984ec8ffb19acddbb3217"
> +SRC_URI[unicode-ident-1.0.2.sha256sum] = "15c61ba63f9235225a22310255a29b806b907c9b8c964bcbd0a2c70f3f2deea7"
> +SRC_URI[unicode-segmentation-1.9.0.sha256sum] = "7e8820f5d777f6224dc4be3632222971ac30164d4a258d595640799554ebfd99"
> +SRC_URI[unicode-width-0.1.9.sha256sum] = "3ed742d4ea2bd1176e236172c8429aaf54486e7ac098db29ffe6529e0ce50973"
> +SRC_URI[vec_map-0.8.2.sha256sum] = "f1bddf1187be692e79c5ffeab891132dfb0f236ed36a43c7ed39f1165ee20191"
> +SRC_URI[version_check-0.9.4.sha256sum] = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
> +SRC_URI[vhost-0.8.1.sha256sum] = "61957aeb36daf0b00b87fff9c10dd28a161bd35ab157553d340d183b3d8756e6"
> +SRC_URI[vhost-user-backend-0.10.0.sha256sum] = "e3ea9d5e8ec847cde4df1c04e586698a479706fd6beca37323f9d425b24b4c2f"
> +SRC_URI[virtio-bindings-0.2.1.sha256sum] = "c18d7b74098a946470ea265b5bacbbf877abc3373021388454de0d47735a5b98"
> +SRC_URI[virtio-queue-0.9.0.sha256sum] = "35aca00da06841bd99162c381ec65893cace23ca0fb89254302cfe4bec4c300f"
> +SRC_URI[vm-memory-0.12.0.sha256sum] = "a77c7a0891cbac53618f5f6eec650ed1dc4f7e506bbe14877aff49d94b8408b0"
> +SRC_URI[vmm-sys-util-0.11.1.sha256sum] = "dd64fe09d8e880e600c324e7d664760a17f56e9672b7495a86381b49e4f72f46"
> +SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
> +SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
> +SRC_URI[winapi-util-0.1.5.sha256sum] = "70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178"
> +SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
> diff --git a/recipes-extended/virtiofsd/virtiofsd_1.7.0.bb b/recipes-extended/virtiofsd/virtiofsd_1.7.0.bb
> new file mode 100644
> index 0000000..7224888
> --- /dev/null
> +++ b/recipes-extended/virtiofsd/virtiofsd_1.7.0.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "virtio-fs vhost-user daemon"
> +DESCRIPTION = "A daemon that allows sharing of folders with a VM via virtio-fs"
> +HOMEPAGE = "https://gitlab.com/virtio-fs/virtiofsd"
> +LICENSE = "Apache-2.0 | BSD-3-Clause"
> +LIC_FILES_CHKSUM = " \
> +    file://LICENSE-APACHE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
> +    file://LICENSE-BSD-3-Clause;md5=b1ed361f9fc790c1054d81a7ef041a34 \
> +"
> +DEPENDS += "libseccomp"
> +DEPENDS += "libcap-ng"
> +
> +SRC_URI += "crate://crates.io/virtiofsd/1.7.0"
> +SRC_URI[virtiofsd-1.7.0.sha256sum] = "6f043afa23aedbb18f36084b9df831796a9e4c62e73a16fe557de0cf30d7708d"
> +
> +inherit cargo
> +inherit cargo-update-recipe-crates
> +
> +include virtiofsd-crates.inc
> 
> ---
> base-commit: 28205358690f79e13c1970ea7d61bce0131da027
> change-id: 20230817-virtiofsd-3d136356f06f
> 
> Best regards,
> -- 
> Erik Schilling <erik.schilling@linaro.org>
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8208): https://lists.yoctoproject.org/g/meta-virtualization/message/8208
> Mute This Topic: https://lists.yoctoproject.org/mt/100798468/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


