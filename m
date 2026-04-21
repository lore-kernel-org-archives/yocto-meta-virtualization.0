Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA2FDF5A8D5
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 02:34:44 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4793.1776738876724638651
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Apr 2026 19:34:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eqUaatB6;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8cb20bcff5aso350736385a.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Apr 2026 19:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776738876; x=1777343676; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7CXd5zS1W8PSgDrUcRtuF95AwQHiiKOfJ5nZgBC+fg=;
        b=eqUaatB6pbg0+R1rEz3LOtUns8a6AqtD7qjfkhdrbv83ht9ndCflkzF2Y9PBqPrLEK
         zoqVuIgYspckgQuhNx7Mx7TIy0fQEIo0fFc4Vshly3qoYYBpHf3XNq3pdFENvLWFfu4Z
         GW0V5rMtKu7GxBOtaR0ihgyGxSGqkSz7g8oIVlEmmApVruI++KKjRyy+0vW30ajAQ8Eq
         9TPvyPD7CADFW9cd5i+BDEZFTkQf2AMC8DsqcYCpCkssL97e0fpI7ncvFyfWUR9PpqTG
         oFH1XP+jD7UpzxfSTdzGC9vB5olnle+gO9S7LFkBBG7MI/7jPAOJwW2QMMLfF3O+9Lnc
         gSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776738876; x=1777343676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z7CXd5zS1W8PSgDrUcRtuF95AwQHiiKOfJ5nZgBC+fg=;
        b=mH1q8l/IGvkmeI/+kLyijFtUSILp2l47V0D5OsXNjXeAUSr1kVOnc6KfkwzuKaAQy3
         7cK2kg5EbHQtaQY60aKJrfYSwDArU0LcZ5nDuUUDEyxQ5B2FMZpubBMiyIDTWPAtk9x8
         Y9cmN8fe4cO4khWWj7+YPj7W7UF6KZ75Am9byk0YVzGjTF3C4C+/9wMppUpcU4KjGHFE
         F/tdVCTZxC3JrsIkzAcVVWOb87PHLdEVFSe2pELy4sHt+0odlugGJ2TbPT5H/A6D6c8r
         /gHYbv1u0LufeMdL0JG45N16OQBJ2e8ZV7bmOiMrF8l6ww6fnlIpQhUDCIx3r1md3CgU
         iegg==
X-Gm-Message-State: AOJu0YyZerWVTeaZwXGNOhsw07hqSce9emLVOSaDScRKKcsMOY01sCii
	6A+lCvjEZQvLhajq53hFeluDSJbPf6f2jWa+4DQCnnnNV3B1Wbm2Gd14z15aRtUQ
X-Gm-Gg: AeBDiesU9ptoQJloffxv61O45yDu5PDNoF1qcYrVFMZqxRMPecA9yIdtxEr1HTxHiY3
	fPALFXRyP23WxZh4m2nofN+uX5xXlhViUDkC4Tu850/q0NZS7AKDS1kqda+9I8g1h4ZM1XnPxyH
	Mlz//+hegLLb3bUiMZ/Lx9RF1V4y0JRCBfunwRPQC46pJevnaZS+hoMEsg9saVkZmMaa/DQ5IBi
	zD8JTfJvh01WuvobcP5tvso62+LrAWZVtWx9F16blRbZKlM9r1Q1mAJ5LWrI8SJK6Ja6R/TT/N/
	EUZn1xWQ49w7greqHR2FIy473d8nyDdBj9Dn3HS1ny/nWA531HS1r/KvZ2KptvFbiK8xIapEQkU
	U6tFep4K28LtGeYQrp55OH6LJO4ozhVwVa8Xal1dJncscd/nf4Yy8qet8x+LUll8cxgUtKZRjLS
	aA3BDNWXkX0WLlk9uTzdkWN9obT4BHlJxApB4RlnxbJ7oNt96byXw8vsxs0mqKIalmNiyItc02m
	Gc6ZBIJrYWWF3kwIvPI2LnJdERPmG8Msx4rVOH+yasPBlo=
X-Received: by 2002:a05:620a:d88:b0:8cf:d516:8451 with SMTP id af79cd13be357-8e792568459mr2501396685a.62.1776738875404;
        Mon, 20 Apr 2026 19:34:35 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d5fe90afsm1078517185a.3.2026.04.20.19.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 19:34:34 -0700 (PDT)
Date: Tue, 21 Apr 2026 02:34:33 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: koen.kooi@oss.qualcomm.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH v3] cdi: add
 container-device-interface commandline utility
Message-ID: <aebiOTkm-7Cz98Br@gmail.com>
References: <20260417073134.926832-1-koen.kooi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417073134.926832-1-koen.kooi@oss.qualcomm.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Apr 2026 02:34:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9713

v3 built for me.

This is now merged.

Bruce

In message: [meta-virtualization][PATCH v3] cdi: add container-device-interface commandline utility
on 17/04/2026 Koen Kooi via lists.yoctoproject.org wrote:

> From the upstream description:
> 
> The `cdi` command-line tool is a utility for inspecting and interacting with the CDI (Container Device Interface) cache.
> It allows developers and system administrators to:
> 
> - List CDI Spec files: View all available CDI specification files in the configured directories
> - List vendors: Display registered device vendors in the CDI cache
> - List device classes: Show available device classes from CDI Specs
> - List devices: Enumerate all CDI devices available in the system
> - Validate specs: Verify CDI specification files against the JSON schema
> - Inject devices: Inject CDI device configurations into OCI runtime specifications
> - Monitor cache: Watch for changes in the CDI cache and Spec directories
> - Resolve devices: Resolve fully-qualified device names to their configurations
> 
> The CLI tool is particularly useful for debugging CDI configurations, validating spec files, and testing device assignments before deploying them in production environments.
> 
> Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
> ---
> 
> Changes since v2:
> 	* Fix quoting of GOBUILDFLAGS, passing it via EXTRA_OEMAKE causes issues with qemuarm64
> 	* remove debug 'pwd' in do_compile
> Changes since v1:
> 	* Buildflags patch went upstream: https://github.com/cncf-tags/container-device-interface/pull/313
> 
>  recipes-containers/cdi/cdi_git.bb             | 40 +++++++++++++++
>  recipes-containers/cdi/go-mod-cache.inc       | 50 +++++++++++++++++++
>  recipes-containers/cdi/go-mod-git.inc         | 42 ++++++++++++++++
>  .../cdi/go-mod-hybrid-cache.inc               | 10 ++++
>  recipes-containers/cdi/go-mod-hybrid-git.inc  |  7 +++
>  .../cdi/go-mod-hybrid-gomod.inc               | 45 +++++++++++++++++
>  6 files changed, 194 insertions(+)
>  create mode 100644 recipes-containers/cdi/cdi_git.bb
>  create mode 100644 recipes-containers/cdi/go-mod-cache.inc
>  create mode 100644 recipes-containers/cdi/go-mod-git.inc
>  create mode 100644 recipes-containers/cdi/go-mod-hybrid-cache.inc
>  create mode 100644 recipes-containers/cdi/go-mod-hybrid-git.inc
>  create mode 100644 recipes-containers/cdi/go-mod-hybrid-gomod.inc
> 
> diff --git a/recipes-containers/cdi/cdi_git.bb b/recipes-containers/cdi/cdi_git.bb
> new file mode 100644
> index 00000000..acdfb7ad
> --- /dev/null
> +++ b/recipes-containers/cdi/cdi_git.bb
> @@ -0,0 +1,40 @@
> +DESCRIPTION = "The cdi command-line tool is a utility for inspecting and interacting with the CDI (Container Device Interface) cache."
> +SUMMARY = "The cdi command-line tool."
> +HOMEPAGE = "https://github.com/cncf-tags/container-device-interface"
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
> +
> +PV = "1.1.0+git"
> +SRCREV_cdi = "35765bd41b50a86aa3919eb352bc90321e010e68"
> +SRCREV_FORMAT = "cdi"
> +SRC_URI = "git://github.com/cncf-tags/container-device-interface.git;protocol=https;name=cdi;branch=main;destsuffix=${GO_SRCURI_DESTSUFFIX} \
> +          "
> +SRCREV_FORMAT = "cdi"
> +
> +GO_IMPORT = "tags.cncf.io/container-device-interface/"
> +
> +inherit go goarch
> +
> +# GO_MOD_FETCH_MODE: "vcs" (all git://) or "hybrid" (gomod:// + git://)
> +GO_MOD_FETCH_MODE ?= "hybrid"
> +
> +# VCS mode: all modules via git://
> +include ${@ "go-mod-git.inc" if d.getVar("GO_MOD_FETCH_MODE") == "vcs" else ""}
> +include ${@ "go-mod-cache.inc" if d.getVar("GO_MOD_FETCH_MODE") == "vcs" else ""}
> +
> +# Hybrid mode: gomod:// for most, git:// for selected
> +include ${@ "go-mod-hybrid-gomod.inc" if d.getVar("GO_MOD_FETCH_MODE") == "hybrid" else ""}
> +include ${@ "go-mod-hybrid-git.inc" if d.getVar("GO_MOD_FETCH_MODE") == "hybrid" else ""}
> +include ${@ "go-mod-hybrid-cache.inc" if d.getVar("GO_MOD_FETCH_MODE") == "hybrid" else ""}
> +
> +do_compile() {
> +	cd ${S}/src/${GO_IMPORT}
> +	sed -i -e 's:GO_EXTRAFLAGS:GOBUILDFLAGS:g' Makefile
> +	oe_runmake
> +}
> +
> +do_install() {
> +        install -d "${D}${bindir}"
> +        install -m 755 ${S}/src/${GO_IMPORT}/bin/* "${D}${bindir}"
> +}
> diff --git a/recipes-containers/cdi/go-mod-cache.inc b/recipes-containers/cdi/go-mod-cache.inc
> new file mode 100644
> index 00000000..43703e1c
> --- /dev/null
> +++ b/recipes-containers/cdi/go-mod-cache.inc
> @@ -0,0 +1,50 @@
> +# Generated by oe-go-mod-fetcher.py v3.0.0
> +# Module cache data for Go dependencies
> +#
> +# This file contains recipe-specific module metadata.
> +# The task implementations are in go-mod-vcs.bbclass.
> +
> +inherit go-mod-vcs
> +
> +# Module metadata for cache building (one module per line)
> +GO_MODULE_CACHE_DATA = '[\
> +{"module":"tags.cncf.io/container-device-interface/specs-go","version":"v1.1.0","vcs_hash":"2a0706ee0554e66b341fabb5c09e62f00336b0a7e6faac981d973f30b4064622","timestamp":"2025-12-10T08:48:20Z","subdir":"specs-go","vcs_ref":"refs/tags/specs-go/v1.1.0"},\
> +{"module":"tags.cncf.io/container-device-interface","version":"v1.1.0","vcs_hash":"2a0706ee0554e66b341fabb5c09e62f00336b0a7e6faac981d973f30b4064622","timestamp":"2025-12-10T08:48:20Z","subdir":"","vcs_ref":"refs/tags/v1.1.0"},\
> +{"module":"sigs.k8s.io/yaml","version":"v1.4.0","vcs_hash":"1a5189a2f11994a0ed72dcd69d5046be49f0ac8890830fc52ddb333e63e84cd5","timestamp":"2023-10-24T17:13:34Z","subdir":"","vcs_ref":"refs/tags/v1.4.0"},\
> +{"module":"golang.org/x/sys","version":"v0.19.0","vcs_hash":"4c6d98cad0d2b72a8309948ddb246f7d1da1f67b85f99caad7634ffd5e574be0","timestamp":"2024-04-04T14:40:38Z","subdir":"","vcs_ref":"refs/tags/v0.19.0"},\
> +{"module":"golang.org/x/mod","version":"v0.19.0","vcs_hash":"8e48031d1725b73effc9fbf41ecad98f251385f856e11330aacdf52bbeb0ca77","timestamp":"2024-06-26T14:12:39Z","subdir":"","vcs_ref":"refs/tags/v0.19.0"},\
> +{"module":"github.com/moby/sys/capability","version":"v0.4.0","vcs_hash":"e67c1b1913863f71a44fb255bb4ceafcd322cbb0790a301c410f76acaf083f75","timestamp":"2024-11-11T19:02:25Z","subdir":"capability","vcs_ref":"refs/tags/capability/v0.4.0"},\
> +{"module":"github.com/spf13/cobra","version":"v1.6.0","vcs_hash":"75f09e2cb98d4d00ab0efbae6d89092470408d4c2ea5fa51f9863754705b1c36","timestamp":"2022-10-10T23:06:30Z","subdir":"","vcs_ref":"refs/tags/v1.6.0"},\
> +{"module":"github.com/opencontainers/runtime-tools","version":"v0.9.1-0.20251114084447-edf4cb3d2116","vcs_hash":"9120451d0089ff79de31a4292e8836bebf3ee5e2d7e8c4852764fee040cbfc1e","timestamp":"2025-11-14T08:44:47Z","subdir":"","vcs_ref":""},\
> +{"module":"github.com/opencontainers/runtime-spec","version":"v1.3.0","vcs_hash":"d9c05db6124626de7f86b5f7cf385d2a821699e74a3a1d784837399c70f4e1b9","timestamp":"2025-11-02T07:35:43Z","subdir":"","vcs_ref":"refs/tags/v1.3.0"},\
> +{"module":"github.com/inconshreveable/mousetrap","version":"v1.0.1","vcs_hash":"e2df627ef3b92dd51e6ba1089850ca40365e1dfdeaa6ebe778c845cdf17f4774","timestamp":"2022-08-07T15:49:23Z","subdir":"","vcs_ref":"refs/tags/v1.0.1"},\
> +{"module":"github.com/blang/semver/v4","version":"v4.0.0","vcs_hash":"592c6d9a3fd1b340b1d148a1229b29c0f07951f6a2324b4abdbe310d546bda36","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
> +{"module":"github.com/cpuguy83/go-md2man/v2","version":"v2.0.2","vcs_hash":"415015530da751018f21f20a17c97aa3e18912934f8beeda05ff608790a0ed83","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
> +{"module":"github.com/davecgh/go-spew","version":"v1.1.1","vcs_hash":"4c7d69cfe586f86079773ff48d94f76d327c2914d8dfeffca9e34fd1146e5d5e","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
> +{"module":"github.com/fsnotify/fsnotify","version":"v1.5.1","vcs_hash":"57dc92422ad78a4fa6b523031a09238c27e85f28f339c2cc92304f5c7cdb18a1","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
> +{"module":"github.com/google/go-cmp","version":"v0.5.9","vcs_hash":"fd14e45645e0977841a8f51fbe51cc4ca8444dbd2b4e5eddd91172a3805102fa","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
> +{"module":"github.com/google/uuid","version":"v1.3.0","vcs_hash":"baaff4147d4a04e5d30e5b64e58b5212e2563d7d6043a2edc09a3a5c217ad47f","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
> +{"module":"github.com/hashicorp/errwrap","version":"v1.0.0","vcs_hash":"65db17b2a8abd8c2bde5a919d17f7abc0e891ae4037aa21f7aa2482f560cf21f","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
> +{"module":"github.com/hashicorp/go-multierror","version":"v1.1.1","vcs_hash":"cec0f337a88725c16a86058204a5dd4ae667b8a92bbed995ab204ebcb62177a5","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
> +{"module":"github.com/mndrix/tap-go","version":"v0.0.0-20171203230836-629fa407e90b","vcs_hash":"8bb1ed2d8275bc2dbf722411dd9448c055174d4deabf466b5d13bd0b0d5d3e80","timestamp":"2017-12-03T23:08:36Z","subdir":"","vcs_ref":""},\
> +{"module":"github.com/moby/sys/mountinfo","version":"v0.7.2","vcs_hash":"239ddfa409797a858e0b084af9d021679c3bac379a7a5c619a113fc3b9872551","timestamp":"1970-01-01T00:00:00Z","subdir":"mountinfo","vcs_ref":""},\
> +{"module":"github.com/mrunalp/fileutils","version":"v0.5.0","vcs_hash":"80bd1af07a30fc2d094f02ec5b9871e476767c6ceb240dbc6ccf1015f5974a69","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
> +{"module":"github.com/opencontainers/selinux","version":"v1.10.0","vcs_hash":"b358f84d4337845146d844b82f67b9798d6218ab6af3086b00cde708bb0436eb","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
> +{"module":"github.com/pmezard/go-difflib","version":"v1.0.0","vcs_hash":"c04ad296d2e3203fda8b7ca96feaca21b20b3b7441e33c7d67cda029ea61ab4c","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
> +{"module":"github.com/russross/blackfriday/v2","version":"v2.1.0","vcs_hash":"6dd1604eceba1790dbf7f827f1e22a5866a5348a2ab616daed7363a6e16e081d","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
> +{"module":"github.com/sirupsen/logrus","version":"v1.8.1","vcs_hash":"1389673f985797078534cc41d2be170c341c9dc3ceff65dd417e2583d488159b","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
> +{"module":"github.com/spf13/pflag","version":"v1.0.5","vcs_hash":"dbfdd18a638b7c45a5c225a857127418838676706ffaf75f8739561cd3b235db","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
> +{"module":"github.com/stretchr/objx","version":"v0.1.0","vcs_hash":"39828321881a0709a36a2d1edde8fc9928ddd471ebd0bbdf7012076e7214bb02","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
> +{"module":"github.com/stretchr/testify","version":"v1.7.0","vcs_hash":"f87883f9ef1ad6bd6ecb844fe9108ae126c4dfab49080e5fb37bd27ca64417be","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
> +{"module":"github.com/urfave/cli","version":"v1.19.1","vcs_hash":"16abec32eeeacf78ac938b59d96d2b50aba6e642cc5617322f40d2aa3b51daa0","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
> +{"module":"github.com/xeipuuv/gojsonpointer","version":"v0.0.0-20180127040702-4e3ac2762d5f","vcs_hash":"f35df1afe406fbe96a9200b2fa5c736db1be1c70f292d9e69247d35fa318ec32","timestamp":"2018-01-27T04:07:02Z","subdir":"","vcs_ref":""},\
> +{"module":"github.com/xeipuuv/gojsonreference","version":"v0.0.0-20180127040603-bd5ef7bd5415","vcs_hash":"6cce19ebe3be9e8f13d8b3c5090971f010f3f3cda349fa51197c974450d133ee","timestamp":"2018-01-27T04:06:03Z","subdir":"","vcs_ref":""},\
> +{"module":"github.com/xeipuuv/gojsonschema","version":"v1.2.0","vcs_hash":"21478840c17d30281eb0f8b90406d132c72274e71f74dcbe3dfb4fa4236df77c","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
> +{"module":"golang.org/x/tools","version":"v0.13.0","vcs_hash":"113f573f2a2c2d878f629ffd220d2fb3cfeacb1a574a60b2ab9343fc01919103","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
> +{"module":"gopkg.in/check.v1","version":"v0.0.0-20161208181325-20d25e280405","vcs_hash":"f6f7125ac7ef086ca6395a14a9a28c8c11cd6f8790a8be7cfd6475d1acd0f40b","timestamp":"2016-12-08T18:13:25Z","subdir":"","vcs_ref":""},\
> +{"module":"gopkg.in/yaml.v2","version":"v2.4.0","vcs_hash":"84e688efadb8602ec1990d3cd251d5818e95c14682a169266ac9a1edadfe5424","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
> +{"module":"gopkg.in/yaml.v3","version":"v3.0.1","vcs_hash":"8d340fff421a1861f196061b40e49b2f9e802647204935d08e1062b8ecd90b0d","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":""},\
> +{"module":"github.com/davecgh/go-spew","version":"v1.1.0","vcs_hash":"5ce38ad71c2d3bc390b87154a89c53fd5ead19aed2bf005419db5c0b28ea9dfd","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":"refs/tags/v1.1.0"},\
> +{"module":"github.com/stretchr/testify","version":"v1.3.0","vcs_hash":"15f4be955793ecb9ef81031cf64191211271265868a72e4bf25c409e978a8ce8","timestamp":"1970-01-01T00:00:00Z","subdir":"","vcs_ref":"refs/tags/v1.3.0"},\
> +{"module":"golang.org/x/sys","version":"v0.0.0-20210630005230-0f9fa26af87c","vcs_hash":"a45f0085dd2c323e7107078c703b782801a1d64d6248bb87578d4c4f8330f8df","timestamp":"2021-06-30T00:52:30Z","subdir":"","vcs_ref":"refs/tags/v1.3.0"}\
> +]'
> diff --git a/recipes-containers/cdi/go-mod-git.inc b/recipes-containers/cdi/go-mod-git.inc
> new file mode 100644
> index 00000000..6491f79d
> --- /dev/null
> +++ b/recipes-containers/cdi/go-mod-git.inc
> @@ -0,0 +1,42 @@
> +# Generated by oe-go-mod-fetcher.py v3.0.0
> +# Git repositories for Go module dependencies
> +
> +SRC_URI += "git://github.com/cncf-tags/container-device-interface;protocol=https;nobranch=1;tag=v1.1.0;shallow=1;rev=98a7d735d9592c1ccca0130e06b0709f4b65ecbf;name=git_c2439148_0;destsuffix=vcs_cache/2a0706ee0554e66b341fabb5c09e62f00336b0a7e6faac981d973f30b4064622"
> +SRC_URI += "git://github.com/kubernetes-sigs/yaml;protocol=https;nobranch=1;tag=v1.4.0;shallow=1;rev=c3772b51db126345efe2dfe4ff8dac83b8141684;name=git_a731a2aa_0;destsuffix=vcs_cache/1a5189a2f11994a0ed72dcd69d5046be49f0ac8890830fc52ddb333e63e84cd5"
> +SRC_URI += "git://go.googlesource.com/sys;protocol=https;branch=master;rev=0f9fa26af87c481a6877a4ca1330699ba9a30673;name=git_da0444fc_0;destsuffix=vcs_cache/a45f0085dd2c323e7107078c703b782801a1d64d6248bb87578d4c4f8330f8df"
> +SRC_URI += "git://go.googlesource.com/sys;protocol=https;nobranch=1;tag=v0.19.0;shallow=1;rev=cabba82f75d7f55a0657810d02d534745dee5d59;name=git_da0444fc_1;destsuffix=vcs_cache/4c6d98cad0d2b72a8309948ddb246f7d1da1f67b85f99caad7634ffd5e574be0"
> +SRC_URI += "git://go.googlesource.com/mod;protocol=https;nobranch=1;tag=v0.19.0;shallow=1;rev=d58be1cb16e62a9821b6dbd0157b8c7ff0b667ec;name=git_13df7481_0;destsuffix=vcs_cache/8e48031d1725b73effc9fbf41ecad98f251385f856e11330aacdf52bbeb0ca77"
> +SRC_URI += "git://github.com/moby/sys;protocol=https;nobranch=1;tag=capability/v0.4.0;shallow=1;rev=50e999a770172a519119e1c4fd4b6153b7dac90d;name=git_66165bb7_0;destsuffix=vcs_cache/e67c1b1913863f71a44fb255bb4ceafcd322cbb0790a301c410f76acaf083f75"
> +SRC_URI += "git://github.com/moby/sys;protocol=https;branch=main;rev=9c4e3a8251666612cfcd2c102700e20755ed2e33;name=git_66165bb7_1;destsuffix=vcs_cache/239ddfa409797a858e0b084af9d021679c3bac379a7a5c619a113fc3b9872551"
> +SRC_URI += "git://github.com/spf13/cobra;protocol=https;nobranch=1;tag=v1.6.0;shallow=1;rev=860791844ed3a2e544a9b9bbbcb14144a948ad20;name=git_41456771_0;destsuffix=vcs_cache/75f09e2cb98d4d00ab0efbae6d89092470408d4c2ea5fa51f9863754705b1c36"
> +SRC_URI += "git://github.com/opencontainers/runtime-tools;protocol=https;branch=master;rev=edf4cb3d21162a17b02e19637f7d7f8c6bd8523f;name=git_b055e1ee_0;destsuffix=vcs_cache/9120451d0089ff79de31a4292e8836bebf3ee5e2d7e8c4852764fee040cbfc1e"
> +SRC_URI += "git://github.com/opencontainers/runtime-spec;protocol=https;nobranch=1;tag=v1.3.0;shallow=1;rev=92249139eea7161e13745abd4cb6d0ea02a3227a;name=git_502d0543_0;destsuffix=vcs_cache/d9c05db6124626de7f86b5f7cf385d2a821699e74a3a1d784837399c70f4e1b9"
> +SRC_URI += "git://github.com/inconshreveable/mousetrap;protocol=https;nobranch=1;tag=v1.0.1;shallow=1;rev=3a66f25f8779fad208598f21472174ef7b35c3ec;name=git_b31cc6ad_0;destsuffix=vcs_cache/e2df627ef3b92dd51e6ba1089850ca40365e1dfdeaa6ebe778c845cdf17f4774"
> +SRC_URI += "git://github.com/blang/semver;protocol=https;branch=master;rev=af3461a9cbcf1f3f5889d21b83f5ef63880c33a8;name=git_b6bc1865_0;destsuffix=vcs_cache/592c6d9a3fd1b340b1d148a1229b29c0f07951f6a2324b4abdbe310d546bda36"
> +SRC_URI += "git://github.com/cpuguy83/go-md2man;protocol=https;branch=master;rev=d97078115282836e16d0dca10b4b42ce60fc70e6;name=git_af686cb3_0;destsuffix=vcs_cache/415015530da751018f21f20a17c97aa3e18912934f8beeda05ff608790a0ed83"
> +SRC_URI += "git://github.com/davecgh/go-spew;protocol=https;nobranch=1;tag=v1.1.0;shallow=1;rev=346938d642f2ec3594ed81d874461961cd0faa76;name=git_d9a489aa_0;destsuffix=vcs_cache/5ce38ad71c2d3bc390b87154a89c53fd5ead19aed2bf005419db5c0b28ea9dfd"
> +SRC_URI += "git://github.com/davecgh/go-spew;protocol=https;branch=master;rev=8991bc29aa16c548c550c7ff78260e27b9ab7c73;name=git_d9a489aa_1;destsuffix=vcs_cache/4c7d69cfe586f86079773ff48d94f76d327c2914d8dfeffca9e34fd1146e5d5e"
> +SRC_URI += "git://github.com/fsnotify/fsnotify;protocol=https;branch=main;rev=466b39d216616549a37ee93c7c47775f6a010790;name=git_3fa8b61c_0;destsuffix=vcs_cache/57dc92422ad78a4fa6b523031a09238c27e85f28f339c2cc92304f5c7cdb18a1"
> +SRC_URI += "git://github.com/google/go-cmp;protocol=https;branch=master;rev=a97318bf6562f2ed2632c5f985db51b1bc5bdcd0;name=git_8726c33a_0;destsuffix=vcs_cache/fd14e45645e0977841a8f51fbe51cc4ca8444dbd2b4e5eddd91172a3805102fa"
> +SRC_URI += "git://github.com/google/uuid;protocol=https;branch=master;rev=44b5fee7c49cf3bcdf723f106b36d56ef13ccc88;name=git_c3a7687c_0;destsuffix=vcs_cache/baaff4147d4a04e5d30e5b64e58b5212e2563d7d6043a2edc09a3a5c217ad47f"
> +SRC_URI += "git://github.com/hashicorp/errwrap;protocol=https;branch=master;rev=8a6fb523712970c966eefc6b39ed2c5e74880354;name=git_28334120_0;destsuffix=vcs_cache/65db17b2a8abd8c2bde5a919d17f7abc0e891ae4037aa21f7aa2482f560cf21f"
> +SRC_URI += "git://github.com/hashicorp/go-multierror;protocol=https;branch=main;rev=9974e9ec57696378079ecc3accd3d6f29401b3a0;name=git_151ee577_0;destsuffix=vcs_cache/cec0f337a88725c16a86058204a5dd4ae667b8a92bbed995ab204ebcb62177a5"
> +SRC_URI += "git://github.com/mndrix/tap-go;protocol=https;branch=master;rev=629fa407e90bbf3781e448e8e9b8931523ec823c;name=git_e9509ffb_0;destsuffix=vcs_cache/8bb1ed2d8275bc2dbf722411dd9448c055174d4deabf466b5d13bd0b0d5d3e80"
> +SRC_URI += "git://github.com/mrunalp/fileutils;protocol=https;branch=master;rev=d7fdd64cc1cabe10bc154ee7d2318b07b7f296ef;name=git_98373e58_0;destsuffix=vcs_cache/80bd1af07a30fc2d094f02ec5b9871e476767c6ceb240dbc6ccf1015f5974a69"
> +SRC_URI += "git://github.com/opencontainers/selinux;protocol=https;branch=main;rev=036780110200290e6decd05ce62d7086bf0546f5;name=git_49bf5caa_0;destsuffix=vcs_cache/b358f84d4337845146d844b82f67b9798d6218ab6af3086b00cde708bb0436eb"
> +SRC_URI += "git://github.com/pmezard/go-difflib;protocol=https;branch=master;rev=792786c7400a136282c1664665ae0a8db921c6c2;name=git_b66720d7_0;destsuffix=vcs_cache/c04ad296d2e3203fda8b7ca96feaca21b20b3b7441e33c7d67cda029ea61ab4c"
> +SRC_URI += "git://github.com/russross/blackfriday;protocol=https;branch=v2;rev=4c9bf9512682b995722660a4196c0013228e2049;name=git_fb978822_0;destsuffix=vcs_cache/6dd1604eceba1790dbf7f827f1e22a5866a5348a2ab616daed7363a6e16e081d"
> +SRC_URI += "git://github.com/sirupsen/logrus;protocol=https;branch=master;rev=bdc0db8ead3853c56b7cd1ac2ba4e11b47d7da6b;name=git_02061634_0;destsuffix=vcs_cache/1389673f985797078534cc41d2be170c341c9dc3ceff65dd417e2583d488159b"
> +SRC_URI += "git://github.com/spf13/pflag;protocol=https;branch=master;rev=2e9d26c8c37aae03e3f9d4e90b7116f5accb7cab;name=git_66b7b8c8_0;destsuffix=vcs_cache/dbfdd18a638b7c45a5c225a857127418838676706ffaf75f8739561cd3b235db"
> +SRC_URI += "git://github.com/stretchr/objx;protocol=https;branch=master;rev=facf9a85c22f48d2f52f2380e4efce1768749a89;name=git_7987da5d_0;destsuffix=vcs_cache/39828321881a0709a36a2d1edde8fc9928ddd471ebd0bbdf7012076e7214bb02"
> +SRC_URI += "git://github.com/stretchr/testify;protocol=https;branch=master;rev=acba37e5db06f0093b465a7d47822bf13644b66c;name=git_aa93f7ee_0;destsuffix=vcs_cache/f87883f9ef1ad6bd6ecb844fe9108ae126c4dfab49080e5fb37bd27ca64417be"
> +SRC_URI += "git://github.com/stretchr/testify;protocol=https;nobranch=1;tag=v1.3.0;shallow=1;rev=ffdc059bfe9ce6a4e144ba849dbedead332c6053;name=git_aa93f7ee_1;destsuffix=vcs_cache/15f4be955793ecb9ef81031cf64191211271265868a72e4bf25c409e978a8ce8"
> +SRC_URI += "git://github.com/urfave/cli;protocol=https;branch=main;rev=0bdeddeeb0f650497d603c4ad7b20cfe685682f6;name=git_cd035cbf_0;destsuffix=vcs_cache/16abec32eeeacf78ac938b59d96d2b50aba6e642cc5617322f40d2aa3b51daa0"
> +SRC_URI += "git://github.com/xeipuuv/gojsonpointer;protocol=https;branch=master;rev=4e3ac2762d5f479393488629ee9370b50873b3a6;name=git_bd44e658_0;destsuffix=vcs_cache/f35df1afe406fbe96a9200b2fa5c736db1be1c70f292d9e69247d35fa318ec32"
> +SRC_URI += "git://github.com/xeipuuv/gojsonreference;protocol=https;branch=master;rev=bd5ef7bd5415a7ac448318e64f11a24cd21e594b;name=git_ca2a9119_0;destsuffix=vcs_cache/6cce19ebe3be9e8f13d8b3c5090971f010f3f3cda349fa51197c974450d133ee"
> +SRC_URI += "git://github.com/xeipuuv/gojsonschema;protocol=https;branch=master;rev=82fcdeb203eb6ab2a67d0a623d9c19e5e5a64927;name=git_6efae2af_0;destsuffix=vcs_cache/21478840c17d30281eb0f8b90406d132c72274e71f74dcbe3dfb4fa4236df77c"
> +SRC_URI += "git://go.googlesource.com/tools;protocol=https;branch=master;rev=b5e55d198461206bca9558e65cdd518f8e4f2735;name=git_7d9b3b49_0;destsuffix=vcs_cache/113f573f2a2c2d878f629ffd220d2fb3cfeacb1a574a60b2ab9343fc01919103"
> +SRC_URI += "git://github.com/go-check/check;protocol=https;branch=v1;rev=20d25e2804050c1cd24a7eea1e7a6447dd0e74ec;name=git_fc1e328f_0;destsuffix=vcs_cache/f6f7125ac7ef086ca6395a14a9a28c8c11cd6f8790a8be7cfd6475d1acd0f40b"
> +SRC_URI += "git://github.com/go-yaml/yaml;protocol=https;branch=v2;rev=7649d4548cb53a614db133b2a8ac1f31859dda8c;name=git_b0089ab1_0;destsuffix=vcs_cache/84e688efadb8602ec1990d3cd251d5818e95c14682a169266ac9a1edadfe5424"
> +SRC_URI += "git://github.com/go-yaml/yaml;protocol=https;branch=v3;rev=f6f7691b1fdeb513f56608cd2c32c51f8194bf51;name=git_b0089ab1_1;destsuffix=vcs_cache/8d340fff421a1861f196061b40e49b2f9e802647204935d08e1062b8ecd90b0d"
> +
> diff --git a/recipes-containers/cdi/go-mod-hybrid-cache.inc b/recipes-containers/cdi/go-mod-hybrid-cache.inc
> new file mode 100644
> index 00000000..7cbd74eb
> --- /dev/null
> +++ b/recipes-containers/cdi/go-mod-hybrid-cache.inc
> @@ -0,0 +1,10 @@
> +# Generated by oe-go-mod-fetcher-hybrid.py
> +# Metadata for git-fetched modules (VCS path)
> +# Used by go-mod-vcs.bbclass to build module cache from git checkouts
> +
> +inherit go-mod-vcs
> +
> +# Module metadata for cache building (one module per line)
> +GO_MODULE_CACHE_DATA = '[\
> +{"module":"tags.cncf.io/container-device-interface","version":"v1.1.0","vcs_hash":"2a0706ee0554e66b341fabb5c09e62f00336b0a7e6faac981d973f30b4064622","timestamp":"2025-12-10T08:48:20Z","subdir":"","vcs_ref":"refs/tags/v1.1.0"},\
> +{"module":"tags.cncf.io/container-device-interface/specs-go","version":"v1.1.0","vcs_hash":"2a0706ee0554e66b341fabb5c09e62f00336b0a7e6faac981d973f30b4064622","timestamp":"2025-12-10T08:48:20Z","subdir":"specs-go","vcs_ref":"refs/tags/specs-go/v1.1.0"}]'
> diff --git a/recipes-containers/cdi/go-mod-hybrid-git.inc b/recipes-containers/cdi/go-mod-hybrid-git.inc
> new file mode 100644
> index 00000000..43dc77ee
> --- /dev/null
> +++ b/recipes-containers/cdi/go-mod-hybrid-git.inc
> @@ -0,0 +1,7 @@
> +# Generated by oe-go-mod-fetcher-hybrid.py
> +# Go modules fetched from git repositories (VCS path)
> +#
> +# These modules are fetched directly from their git repositories.
> +# They provide full VCS provenance and allow easy SRCREV bumping.
> +
> +SRC_URI += "git://github.com/cncf-tags/container-device-interface;protocol=https;nobranch=1;tag=v1.1.0;shallow=1;rev=98a7d735d9592c1ccca0130e06b0709f4b65ecbf;name=git_c2439148_0;destsuffix=vcs_cache/2a0706ee0554e66b341fabb5c09e62f00336b0a7e6faac981d973f30b4064622"
> diff --git a/recipes-containers/cdi/go-mod-hybrid-gomod.inc b/recipes-containers/cdi/go-mod-hybrid-gomod.inc
> new file mode 100644
> index 00000000..79c10ca1
> --- /dev/null
> +++ b/recipes-containers/cdi/go-mod-hybrid-gomod.inc
> @@ -0,0 +1,45 @@
> +# Generated by oe-go-mod-fetcher-hybrid.py
> +# Go modules fetched from proxy.golang.org (fast path)
> +#
> +# These modules are fetched as pre-built zip files from the Go proxy.
> +# They do not provide VCS commit-level provenance but are much faster.
> +
> +inherit go-mod
> +
> +SRC_URI += "gomod://github.com/blang/semver/v4;version=v4.0.0;sha256sum=96a2bbe11960f3a3c16db0da822c69ce9ac4b738ee731a0476031bbb71987504"
> +SRC_URI += "gomod://github.com/cpuguy83/go-md2man/v2;version=v2.0.2;sha256sum=70a7e609809cf2a92c5535104db5eb82d75c54bfcfed2d224e87dd2fd9729f62"
> +SRC_URI += "gomod://github.com/davecgh/go-spew;version=v1.1.1;sha256sum=6b44a843951f371b7010c754ecc3cabefe815d5ced1c5b9409fb2d697e8a890d"
> +SRC_URI += "gomod://github.com/davecgh/go-spew;version=v1.1.0;sha256sum=0b5a691aeb8b6af31bd2bb640973ea7e8bf1ed9bc5889da220bf44dc06d9692c"
> +SRC_URI += "gomod://github.com/fsnotify/fsnotify;version=v1.5.1;sha256sum=f38d7e395bc45f08a34e9591c9c4900031f81c1ddc7d761a785cbbb9aaee0db0"
> +SRC_URI += "gomod://github.com/google/go-cmp;version=v0.5.9;sha256sum=32450874ac756ef5d47f6b819305105304b9819045a16e3f105289b7cf252c51"
> +SRC_URI += "gomod://github.com/google/uuid;version=v1.3.0;sha256sum=0a5fcc05ea492afeaca984a012485f6a15e2259b32f1206d6f36a88c88afc607"
> +SRC_URI += "gomod://github.com/hashicorp/errwrap;version=v1.0.0;sha256sum=ccdf4c90f894d8a5fde4e79d5828c5d27a13e9f7ce3006dd72ce76e6e17cdeb2"
> +SRC_URI += "gomod://github.com/hashicorp/go-multierror;version=v1.1.1;sha256sum=972cd841ee51fdeac69c5a301e57f8ea27aebf15fddd7f621d5c240f28c3000c"
> +SRC_URI += "gomod://github.com/inconshreveable/mousetrap;version=v1.0.1;sha256sum=af6f61a00f42d025f195ea272620bbddb045552a9badcf97d8a837980017dbfc"
> +SRC_URI += "gomod://github.com/mndrix/tap-go;version=v0.0.0-20171203230836-629fa407e90b;sha256sum=c6f65bd8d977e53fa083d9d0309cffb0dbfaaae69a5a64a352fb2f7d079ce73d"
> +SRC_URI += "gomod://github.com/moby/sys/capability;version=v0.4.0;sha256sum=3502bba106a402fd440d1d4e8eb5ca741da4d70a674e8313725838ec8e22b44c"
> +SRC_URI += "gomod://github.com/moby/sys/mountinfo;version=v0.7.2;sha256sum=94f79687bc3b72ca4cc60fafda851454fefc0ef04bdb4499e8c7c2b2e231b5d3"
> +SRC_URI += "gomod://github.com/mrunalp/fileutils;version=v0.5.0;sha256sum=202a6e33b519ddcbece708c3779845114bb7324d4c9ff9899f7c4f80f1e7b1bf"
> +SRC_URI += "gomod://github.com/opencontainers/runtime-spec;version=v1.3.0;sha256sum=09e58e616eb70f2972ed19ada447dd661b298b39777adb0bbd35c94886bdbdf8"
> +SRC_URI += "gomod://github.com/opencontainers/runtime-tools;version=v0.9.1-0.20251114084447-edf4cb3d2116;sha256sum=02a13b5731f9232d9c4c91d7d25348245dbe6a53a2ee43edcc0a4e036a3b8e8c"
> +SRC_URI += "gomod://github.com/opencontainers/selinux;version=v1.10.0;sha256sum=57bd7c4d8d9819b5c1bc40d0b57675f79182e41b4b1e66211fd1a8f1741cc977"
> +SRC_URI += "gomod://github.com/pmezard/go-difflib;version=v1.0.0;sha256sum=de04cecc1a4b8d53e4357051026794bcbc54f2e6a260cfac508ce69d5d6457a0"
> +SRC_URI += "gomod://github.com/russross/blackfriday/v2;version=v2.1.0;sha256sum=7852750d58a053ce38b01f2c203208817564f552ebf371b2b630081d7004c6ae"
> +SRC_URI += "gomod://github.com/sirupsen/logrus;version=v1.8.1;sha256sum=8caec32e0aba1b95effc69d645b50f937137f78f0d0534b149f017dc0164a354"
> +SRC_URI += "gomod://github.com/spf13/cobra;version=v1.6.0;sha256sum=61b6ba34cd34ac5f82f386bde90fc4531f84f0ace33ce82b9d5310d8e0101915"
> +SRC_URI += "gomod://github.com/spf13/pflag;version=v1.0.5;sha256sum=fc6e704f2f6a84ddcdce6de0404e5340fa20c8676181bf5d381b17888107ba84"
> +SRC_URI += "gomod://github.com/stretchr/objx;version=v0.1.0;sha256sum=1fa10dab404ed7fc8ed2a033f8784187d5df3513ced3841ce39e46d37850eb1d"
> +SRC_URI += "gomod://github.com/stretchr/testify;version=v1.7.0;sha256sum=5a46ccebeff510df3e2f6d3842ee79d3f68d0e7b1554cd6ee93390d68b6c6b34"
> +SRC_URI += "gomod://github.com/stretchr/testify;version=v1.3.0;sha256sum=8c935aed71cc334d5bfdf04b34909d9965cf28f80198dec13fb954dc292e6588"
> +SRC_URI += "gomod://github.com/urfave/cli;version=v1.19.1;sha256sum=da2593f17d06e88d73dbbfc6c0fdf97cb25d858a3d86f675411aa9ad7694a48e"
> +SRC_URI += "gomod://github.com/xeipuuv/gojsonpointer;version=v0.0.0-20180127040702-4e3ac2762d5f;sha256sum=5b1a4bcc8e003f214c92b3fa52959d9eb0e3af1c0c529efa55815db951146e48"
> +SRC_URI += "gomod://github.com/xeipuuv/gojsonreference;version=v0.0.0-20180127040603-bd5ef7bd5415;sha256sum=7ec98f4df894413f4dc58c8df330ca8b24ff425b05a8e1074c3028c99f7e45e7"
> +SRC_URI += "gomod://github.com/xeipuuv/gojsonschema;version=v1.2.0;sha256sum=55c8ce068257aa0d263aad7470113dafcd50f955ee754fc853c2fdcd31ad096f"
> +SRC_URI += "gomod://golang.org/x/mod;version=v0.19.0;sha256sum=f98b5d576225d13dac6945afc53bc79cb66ad3ebd9a4eacdefbf629f4d20ea44"
> +SRC_URI += "gomod://golang.org/x/sys;version=v0.19.0;sha256sum=f3e06adc66b840da7719fcf496d2916a38317706509fb5beed5932cd8ae5fb6b"
> +SRC_URI += "gomod://golang.org/x/sys;version=v0.0.0-20210630005230-0f9fa26af87c;sha256sum=e28dd0a068bd7e9257a9f194e4b00bef0a37b83d5b10333ee001515cbd0bec1d"
> +SRC_URI += "gomod://golang.org/x/tools;version=v0.13.0;sha256sum=6fd1e250112215709454468ead53c31c524b05cc90a62ed817d0d4780fdb6429"
> +SRC_URI += "gomod://gopkg.in/check.v1;version=v0.0.0-20161208181325-20d25e280405;sha256sum=4e1817f964ca34e545b81afda0325a5e89cf58de2e413d8207c0afddd0fdc15c"
> +SRC_URI += "gomod://gopkg.in/yaml.v2;version=v2.4.0;sha256sum=ede49e27c4cca6cdd2ec719aed8ea4d363710cceb3d411e7a786fbdec0d391fd"
> +SRC_URI += "gomod://gopkg.in/yaml.v3;version=v3.0.1;sha256sum=aab8fbc4e6300ea08e6afe1caea18a21c90c79f489f52c53e2f20431f1a9a015"
> +SRC_URI += "gomod://sigs.k8s.io/yaml;version=v1.4.0;sha256sum=ef031ff78ff9b7036e174eef49dfbd77468dc4f0afb73a639b61f8ab3a1cc425"
> -- 
> 2.47.3
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9709): https://lists.yoctoproject.org/g/meta-virtualization/message/9709
> Mute This Topic: https://lists.yoctoproject.org/mt/118872052/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


