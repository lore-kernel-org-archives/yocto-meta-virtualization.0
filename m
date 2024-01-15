Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6252FC3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 21:58:24 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.96709.1705355896119528954
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 15 Jan 2024 13:58:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MMcDdkRd;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7831e87ba13so852664685a.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Jan 2024 13:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705355895; x=1705960695; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B+KuGo6anV49waIzQUVTgfU8AziIC7HTOaPo0kN47V0=;
        b=MMcDdkRdqwrteUKhiln0MrR5ytyc5+hOIIo5NHGDhykOFGlAuHxtZvpyJXoZZvQZgm
         nxTJQFxthxZ5t4+9uxv+Xi6pn+iUlLy0iaB04r3cdNLbFcBbx7LOltuAAipfrvuLwdaS
         D/dHKRKgxQOtdR1eS6gpqFvELTpjRAyN2JTcWBN0dyYhSFL8YgbxSwlcI4kpZJ0CnGkv
         mu6mfZsm3CKWFuPOJ2eASQyOhv5hLIfXS1AKzBfKNYyzIaESnMIVjbhdnh0uGSh4Q2RX
         joTV5b86cHdJznx+jucz9Zrc/Hg5M/dQIv4+qA4a6Tbcq062ueZLDCFZUfxszup+vX4I
         pXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705355895; x=1705960695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+KuGo6anV49waIzQUVTgfU8AziIC7HTOaPo0kN47V0=;
        b=dw4jHRbZ8x/jRYEg1LTXH4jfdQBcjg0t3MUFNFz1xXrp1xKYC7jDU2yru5+snh64dL
         BVtxLbBUnYl1UR/+e7rh1KdQw12ce7s30c3g4VWm9Eji7gyF248BLRmhmVdVwIYGbYro
         JSfwMaFQCrkQtHBqbFN6WXcd09AWGxtrsuzA1+b8sK/6nJrENTZ0sZcPfI21llS5zWiz
         OkYUZ5NNVKpog40Y8k50L83yP5IWyVDUPfMavMzgfXQpJW1yvlwTUE3wIimSo/aF1See
         VjxBhTEn6jnxi+CHsXazGOMFVWrdwJUeRGELk6YXUwpA4a95vtSHe+027vYvnDG1A5fH
         Yurw==
X-Gm-Message-State: AOJu0YzeieEFh0Ht6/EvXice5kU8pDgHBlYPFueK4utTbLe0OkfmMxzQ
	he1LAwT4BSGd76RPia+E36tcPj7N/vmLVg==
X-Google-Smtp-Source: AGHT+IH6c8cilGcXdkCVyNxo1tofts8xTE59EGXoJ00+q4xRTu9eLrcRQMd1lwn4NOG9/lQMkV4DWQ==
X-Received: by 2002:a05:620a:4f1:b0:783:476d:7994 with SMTP id b17-20020a05620a04f100b00783476d7994mr6995004qkh.67.1705355895061;
        Mon, 15 Jan 2024 13:58:15 -0800 (PST)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id l1-20020ae9f001000000b0077d8622ee6csm3180186qkg.81.2024.01.15.13.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 13:58:14 -0800 (PST)
Date: Mon, 15 Jan 2024 21:58:13 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Hitendra Prajapati <hprajapati@mvista.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH] Remove tag values from SRC_URI to
 build recipe
Message-ID: <ZaWqdaZxcBwzzkCH@gmail.com>
References: <20240112055043.74453-1-hprajapati@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240112055043.74453-1-hprajapati@mvista.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 15 Jan 2024 21:58:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8542

Thanks for the cleanup!

It has been on my list to go through the entire layer and
upgrade / clean the recipes. So any patches with this in nind
are gladly accepted.

Bruce

In message: [meta-cloud-services][PATCH] Remove tag values from SRC_URI to build recipe
on 12/01/2024 Hitendra Prajapati wrote:

> To build the fluentd recipe, facing the
> Bitbake Fetcher Error: FetchError("Recipe uses a floating tag/branch 'v1.9.2'
> for repo 'github.com/fluent/fluentd.git' without a fixed SRCREV yet
> doesn't call bb.fetch2.get_srcrev() (use SRCPV in PV for OE).", None)
> 
> To fix this issue, Remove tag values from SRC_URI for recipe and its dependent
> recipe file.
> 
> Upgrade "cool.io", "http-parser.rb" and "strptime" recipe
> to resolve the runtime dependency issue.
> 
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../ruby/{cool.io_1.6.0.bb => cool.io_1.7.0.bb}             | 5 ++++-
>  meta-openstack/recipes-devtools/ruby/fluentd_1.9.2.bb       | 4 +++-
>  .../{http-parser.rb_0.6.0.bb => http-parser.rb_0.6.1.bb}    | 6 +++++-
>  meta-openstack/recipes-devtools/ruby/msgpack_1.3.3.bb       | 5 ++++-
>  meta-openstack/recipes-devtools/ruby/serverengine_2.2.1.bb  | 6 +++++-
>  meta-openstack/recipes-devtools/ruby/sigdump_0.2.4.bb       | 6 +++++-
>  .../ruby/{strptime_0.2.3.bb => strptime_0.2.5.bb}           | 6 +++++-
>  .../recipes-devtools/ruby/tzinfo-data_1.2019.3.bb           | 6 +++++-
>  meta-openstack/recipes-devtools/ruby/tzinfo_2.0.1.bb        | 6 +++++-
>  meta-openstack/recipes-devtools/ruby/yajl-ruby_1.4.0.bb     | 6 +++++-
>  10 files changed, 46 insertions(+), 10 deletions(-)
>  rename meta-openstack/recipes-devtools/ruby/{cool.io_1.6.0.bb => cool.io_1.7.0.bb} (76%)
>  rename meta-openstack/recipes-devtools/ruby/{http-parser.rb_0.6.0.bb => http-parser.rb_0.6.1.bb} (73%)
>  rename meta-openstack/recipes-devtools/ruby/{strptime_0.2.3.bb => strptime_0.2.5.bb} (60%)
> 
> diff --git a/meta-openstack/recipes-devtools/ruby/cool.io_1.6.0.bb b/meta-openstack/recipes-devtools/ruby/cool.io_1.7.0.bb
> similarity index 76%
> rename from meta-openstack/recipes-devtools/ruby/cool.io_1.6.0.bb
> rename to meta-openstack/recipes-devtools/ruby/cool.io_1.7.0.bb
> index baa63403..10e9a498 100644
> --- a/meta-openstack/recipes-devtools/ruby/cool.io_1.6.0.bb
> +++ b/meta-openstack/recipes-devtools/ruby/cool.io_1.7.0.bb
> @@ -4,9 +4,12 @@ HOMEPAGE = 'http://coolio.github.com'
>  LICENSE = 'MIT'
>  LIC_FILES_CHKSUM = 'file://LICENSE;md5=a5e7701a63eb0a961f98cd10475129b9'
>  
> -SRC_URI = 'git://github.com/tarcieri/cool.io.git;protocol=https;tag=v1.6.0'
> +SRCREV = 'd7ab8518c11d8fe1b9a679a1686f01a295690fa9'
> +
> +SRC_URI = 'git://github.com/tarcieri/cool.io.git;protocol=https;branch=master'
>  
>  S = '${WORKDIR}/git'
>  
>  inherit ruby
>  
> +FILES:${PN} += "${libdir}/*"
> diff --git a/meta-openstack/recipes-devtools/ruby/fluentd_1.9.2.bb b/meta-openstack/recipes-devtools/ruby/fluentd_1.9.2.bb
> index 94d1ec80..dc984d3a 100644
> --- a/meta-openstack/recipes-devtools/ruby/fluentd_1.9.2.bb
> +++ b/meta-openstack/recipes-devtools/ruby/fluentd_1.9.2.bb
> @@ -3,7 +3,9 @@ HOMEPAGE = "https://www.fluentd.org/"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=1ffc336af228834e68e0a4d38da165f7"
>  
> -SRC_URI = "git://github.com/fluent/fluentd.git;protocol=https;tag=v${PV};branch=master"
> +SRCREV = "9d113029d4550ce576d8825bfa9612aa3e55bff0"
> +
> +SRC_URI = "git://github.com/fluent/fluentd.git;protocol=https;branch=master"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/meta-openstack/recipes-devtools/ruby/http-parser.rb_0.6.0.bb b/meta-openstack/recipes-devtools/ruby/http-parser.rb_0.6.1.bb
> similarity index 73%
> rename from meta-openstack/recipes-devtools/ruby/http-parser.rb_0.6.0.bb
> rename to meta-openstack/recipes-devtools/ruby/http-parser.rb_0.6.1.bb
> index 296b8dda..5452c126 100644
> --- a/meta-openstack/recipes-devtools/ruby/http-parser.rb_0.6.0.bb
> +++ b/meta-openstack/recipes-devtools/ruby/http-parser.rb_0.6.1.bb
> @@ -4,7 +4,9 @@ HOMEPAGE = "https://rubygems.org/gems/http_parser.rb"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=157efc3766c6d07d3d857ebbab43351a"
>  
> -SRC_URI = "git://github.com/tmm1/http_parser.rb.git;protocol=https;tag=v0.6.0;branch=master"
> +SRCREV = "c8dae7c6c2c78a5016d082a7fbda7e362292c14a"
> +
> +SRC_URI = "gitsm://github.com/tmm1/http_parser.rb.git;protocol=https;branch=master"
>  
>  S = "${WORKDIR}/git"
>  
> @@ -20,3 +22,5 @@ do_configure:prepend() {
>  	cd ${WORKDIR}/git
>  	git submodule update --init --recursive
>  }
> +
> +FILES:${PN} += "${libdir}/*"
> diff --git a/meta-openstack/recipes-devtools/ruby/msgpack_1.3.3.bb b/meta-openstack/recipes-devtools/ruby/msgpack_1.3.3.bb
> index f40d6cfe..53826767 100644
> --- a/meta-openstack/recipes-devtools/ruby/msgpack_1.3.3.bb
> +++ b/meta-openstack/recipes-devtools/ruby/msgpack_1.3.3.bb
> @@ -4,9 +4,12 @@ HOMEPAGE = "http://msgpack.org/"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
>  
> -SRC_URI = "git://github.com/msgpack/msgpack-ruby.git;protocol=https;tag=v${PV};branch=master"
> +SRCREV = "64db1bac56359c9257d22f3ffb7506b578d76741"
> +
> +SRC_URI = "git://github.com/msgpack/msgpack-ruby.git;protocol=https;branch=master"
>  
>  S = "${WORKDIR}/git"
>  
>  inherit ruby
>  
> +FILES:${PN} += "${libdir}/*"
> diff --git a/meta-openstack/recipes-devtools/ruby/serverengine_2.2.1.bb b/meta-openstack/recipes-devtools/ruby/serverengine_2.2.1.bb
> index 516a72eb..553c5673 100644
> --- a/meta-openstack/recipes-devtools/ruby/serverengine_2.2.1.bb
> +++ b/meta-openstack/recipes-devtools/ruby/serverengine_2.2.1.bb
> @@ -4,10 +4,14 @@ HOMEPAGE = 'https://rubygems.org/gems/serverengine'
>  LICENSE = 'Apache-2.0'
>  LIC_FILES_CHKSUM = 'file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57'
>  
> -SRC_URI = 'git://github.com/treasure-data/serverengine.git;protocol=https;tag=v2.2.1'
> +SRCREV = '99d44a0989ab3e64e14ac0367aadf76aa13b3583'
> +
> +SRC_URI = 'git://github.com/treasure-data/serverengine.git;protocol=https;branch=master'
>  
>  S = '${WORKDIR}/git'
>  
>  RDEPENDS:${PN} = "sigdump"
>  
>  inherit ruby
> +
> +FILES:${PN} += "${libdir}/*"
> diff --git a/meta-openstack/recipes-devtools/ruby/sigdump_0.2.4.bb b/meta-openstack/recipes-devtools/ruby/sigdump_0.2.4.bb
> index 2f6b8d5a..fc5152e8 100644
> --- a/meta-openstack/recipes-devtools/ruby/sigdump_0.2.4.bb
> +++ b/meta-openstack/recipes-devtools/ruby/sigdump_0.2.4.bb
> @@ -4,8 +4,12 @@ HOMEPAGE = "https://github.com/frsyuki/sigdump"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=07d6218b18fb6826f04fd32b4918f085"
>  
> -SRC_URI = "git://github.com/frsyuki/sigdump.git;protocol=https;tag=v0.2.4;branch=master"
> +SRCREV = "57570f04456560512e4efc1c6fa695b76c17dc0d"
> +
> +SRC_URI = "git://github.com/frsyuki/sigdump.git;protocol=https;branch=master"
>  
>  S = "${WORKDIR}/git"
>  
>  inherit ruby
> +
> +FILES:${PN} += "${libdir}/*"
> diff --git a/meta-openstack/recipes-devtools/ruby/strptime_0.2.3.bb b/meta-openstack/recipes-devtools/ruby/strptime_0.2.5.bb
> similarity index 60%
> rename from meta-openstack/recipes-devtools/ruby/strptime_0.2.3.bb
> rename to meta-openstack/recipes-devtools/ruby/strptime_0.2.5.bb
> index 7167d9ab..d568272d 100644
> --- a/meta-openstack/recipes-devtools/ruby/strptime_0.2.3.bb
> +++ b/meta-openstack/recipes-devtools/ruby/strptime_0.2.5.bb
> @@ -4,10 +4,14 @@ HOMEPAGE = "https://github.com/nurse/strptime"
>  LICENSE = "BSD-2-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f19575067ffc5f1ddc02c74eeef9904f"
>  
> -SRC_URI = "git://github.com/nurse/strptime.git;protocol=https;tag=v0.2.3;branch=master"
> +SRCREV = "1583aaa510cae4660907b22c8262ab31b1eb1864"
> +
> +SRC_URI = "git://github.com/nurse/strptime.git;protocol=https;branch=master"
>  
>  S = "${WORKDIR}/git"
>  
>  RDEPENDS:${PN} = "bash"
>  
>  inherit ruby
> +
> +FILES:${PN} += "${libdir}/*"
> diff --git a/meta-openstack/recipes-devtools/ruby/tzinfo-data_1.2019.3.bb b/meta-openstack/recipes-devtools/ruby/tzinfo-data_1.2019.3.bb
> index 6b1d01ce..46407553 100644
> --- a/meta-openstack/recipes-devtools/ruby/tzinfo-data_1.2019.3.bb
> +++ b/meta-openstack/recipes-devtools/ruby/tzinfo-data_1.2019.3.bb
> @@ -4,8 +4,12 @@ HOMEPAGE = "https://tzinfo.github.io/"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=c326926e773a4e99e89820f5d8a0966f"
>  
> -SRC_URI = "git://github.com/tzinfo/tzinfo-data.git;protocol=https;tag=v1.2019.3;branch=master"
> +SRCREV = "74d5a2529d585e1d1ab47b6bbb2449cba29f6907"
> +
> +SRC_URI = "git://github.com/tzinfo/tzinfo-data.git;protocol=https;branch=master"
>  
>  S = "${WORKDIR}/git"
>  
>  inherit ruby
> +
> +FILES:${PN} += "${libdir}/*"
> diff --git a/meta-openstack/recipes-devtools/ruby/tzinfo_2.0.1.bb b/meta-openstack/recipes-devtools/ruby/tzinfo_2.0.1.bb
> index 07680d7d..504e3a89 100644
> --- a/meta-openstack/recipes-devtools/ruby/tzinfo_2.0.1.bb
> +++ b/meta-openstack/recipes-devtools/ruby/tzinfo_2.0.1.bb
> @@ -4,10 +4,14 @@ HOMEPAGE = "https://tzinfo.github.io/"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=c326926e773a4e99e89820f5d8a0966f"
>  
> -SRC_URI = "git://github.com/tzinfo/tzinfo.git;protocol=https;tag=v2.0.1;branch=master"
> +SRCREV = "16b0ff837923401da52325312c51baf9bec700e1"
> +
> +SRC_URI = "git://github.com/tzinfo/tzinfo.git;protocol=https;branch=master"
>  
>  S = "${WORKDIR}/git"
>  
>  RDEPENDS:${PN} = "concurrent-ruby"
>  
>  inherit ruby
> +
> +FILES:${PN} += "${libdir}/*"
> diff --git a/meta-openstack/recipes-devtools/ruby/yajl-ruby_1.4.0.bb b/meta-openstack/recipes-devtools/ruby/yajl-ruby_1.4.0.bb
> index a0635e3a..f91d414a 100644
> --- a/meta-openstack/recipes-devtools/ruby/yajl-ruby_1.4.0.bb
> +++ b/meta-openstack/recipes-devtools/ruby/yajl-ruby_1.4.0.bb
> @@ -4,8 +4,12 @@ HOMEPAGE = "http://rdoc.info/projects/brianmario/yajl-ruby"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=7dbd3a9f471247a243db5b62fe091587"
>  
> -SRC_URI = "git://github.com/brianmario/yajl-ruby.git;protocol=https;tag=1.4.0;branch=master"
> +SRCREV = "8830754ac1ca04a0c14f71f6e7c1d240934366fe"
> +
> +SRC_URI = "git://github.com/brianmario/yajl-ruby.git;protocol=https;branch=master"
>  
>  S = "${WORKDIR}/git"
>  
>  inherit ruby
> +
> +FILES:${PN} += "${libdir}/*"
> -- 
> 2.25.1
> 

