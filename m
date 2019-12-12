Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web09.9670.1576171670549700442
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 12 Dec 2019 09:27:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tZu0OJOI;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id c16so2259495qko.6
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Dec 2019 09:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aVH8WNAZS9EOMn7f7kjYmP4cytL6C/x8Rw0YpMoLaKA=;
        b=tZu0OJOI8P/HumOCfExyDyfN1Vb+5MdGIE6ohOQ+kr3MxuScl1sK65XWVqbDzMOqoP
         m3UcYTnbYdjZPeb3Lyvbi5H1T9oobQF8QtegOekiwXq/B9WwAFQ1m0ucOHAYjtkRIGtR
         0CRKy6Nixh3CAzqo5MffKhwSYaODYoTDWVRwMsr63jup4MS6ieyTzWqzl9r8dXvbrJHJ
         yNZBxXPOfU8RTZ/okczFQpIt6Bj/QAQuFGBG5seTgPtElikOOZ0HOzo0ShSAukmWhIpD
         jNynSBP297a0GPcRl4rSY95IoaUf0gsT+8z9pItAYO/t7n/mXI3KzWEJ/ayuHXFr8S4N
         yYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aVH8WNAZS9EOMn7f7kjYmP4cytL6C/x8Rw0YpMoLaKA=;
        b=ah2VSftrpAZ6GmpRrEUlzk64fv4g1lmxgTBM3/M2XRmWcnDDR1Vivp6KCr7uUIgagT
         pl6KkAORwjaQCCaCX6XsLXQJZL8ZSWu8K7JrHjPg8q1sjlLRqmY0g0NGelSNuO1NEiam
         YObYxulhnVGGBhEUA4as/0fvFDU6pUVX88koGU5zSoOHX9RQ0noAQp2yODoPbuTgbDXa
         7nVHyzQm304wF/FsaOwzQrq2NIFMjP/B+QHkF4er+t/4xwNFzSBRzafHwp1vfvBmjm74
         AQAqMDZOe1GtI6e0RzbzhHihc5jg0JAlDsGAckBpaqkQUp32y2emcak3THeqt83JM/nd
         io+g==
X-Gm-Message-State: APjAAAV8T4Zm04E8eXMLuQCCZ2+t43I641WqlWdMVmPQn5O1clLAq/dq
	9OGXo1f8/O+subHqyjHScznEHlGNp4wU+A==
X-Google-Smtp-Source: APXvYqw/Eezy9KNsW91gG5+/FU9sRvsp1UYWE2jpsnsOFeywJhQfVnSkecKfpzqicO765fir7odNsQ==
X-Received: by 2002:a05:620a:8cc:: with SMTP id z12mr8558418qkz.48.1576171669271;
        Thu, 12 Dec 2019 09:27:49 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com. [174.113.11.95])
        by smtp.gmail.com with ESMTPSA id k62sm1935710qkc.95.2019.12.12.09.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 09:27:48 -0800 (PST)
Date: Thu, 12 Dec 2019 12:27:46 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][m-c-s][PATCH] hashicorp-serf: add recipe for 0.8.5
Message-ID: <20191212172743.GA29298@gmail.com>
References: <20191211214202.19210-1-timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20191211214202.19210-1-timothy.t.orling@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: [meta-virtualization][m-c-s][PATCH] hashicorp-serf: add recipe for 0.8.5
on 11/12/2019 Tim Orling wrote:

> Serf is a decentralized solution for service discovery and orchestration that
> is lightweight, highly available, and fault tolerant.
> 
> Vendor licenses are included in serf-vendor-licenses.inc, to make
> the main recipe shorter/easier to read.

Thanks Tim,

This is most appreciated .. and I'll use it as a reminder to start going
through the other vedored packages and adding more license info.

merged.

Bruce

> 
> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> ---
>  .../serf/hashicorp-serf_0.8.5.bb              | 32 +++++++++++++++++++
>  .../serf/serf-vendor-licenses.inc             | 32 +++++++++++++++++++
>  2 files changed, 64 insertions(+)
>  create mode 100644 recipes-connectivity/serf/hashicorp-serf_0.8.5.bb
>  create mode 100644 recipes-connectivity/serf/serf-vendor-licenses.inc
> 
> diff --git a/recipes-connectivity/serf/hashicorp-serf_0.8.5.bb b/recipes-connectivity/serf/hashicorp-serf_0.8.5.bb
> new file mode 100644
> index 0000000..0b1517b
> --- /dev/null
> +++ b/recipes-connectivity/serf/hashicorp-serf_0.8.5.bb
> @@ -0,0 +1,32 @@
> +SUMMARY = "Decentralized Cluster Membership, Failure Detection, and Orchestration." 
> +DESCRIPTION = "Serf is a decentralized solution for service discovery and \
> +orchestration that is lightweight, highly available, and fault tolerant.\
> +\
> +Serf runs on Linux, Mac OS X, and Windows. An efficient and lightweight gossip \
> +protocol is used to communicate with other nodes. Serf can detect node failures \
> +and notify the rest of the cluster. An event system is built on top of Serf, \
> +letting you use Serf's gossip protocol to propagate events such as deploys, \
> +configuration changes, etc. Serf is completely masterless with no single point \
> +of failure."
> +HOMEPAGE = "https://www.serf.io/"
> +SECTION = "network"
> +
> +LICENSE = "Apache-2.0 & BSD-3-Clause & MIT & MPL-2.0"
> +LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=b278a92d2c1509760384428817710378"
> +
> +require serf-vendor-licenses.inc
> +
> +GO_IMPORT = "github.com/hashicorp/serf"
> +SRC_URI = "git://${GO_IMPORT}.git;protocol=https"
> +
> +PV = "0.8.5+git${SRCPV}"
> +SRCREV = "1d3fdf93bbe5002c5023da50402368a817488691"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit go
> +
> +RDEPENDS_${PN}-dev += "bash make"
> +
> +# Apache serf in oe-core is a completely different beast
> +RCONFLICTS_${PN} = "serf"
> diff --git a/recipes-connectivity/serf/serf-vendor-licenses.inc b/recipes-connectivity/serf/serf-vendor-licenses.inc
> new file mode 100644
> index 0000000..df8665a
> --- /dev/null
> +++ b/recipes-connectivity/serf/serf-vendor-licenses.inc
> @@ -0,0 +1,32 @@
> +LIC_FILES_CHKSUM += "\
> +    file://src/${GO_IMPORT}/vendor/golang.org/x/crypto/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707 \
> +    file://src/${GO_IMPORT}/vendor/golang.org/x/sys/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707 \
> +    file://src/${GO_IMPORT}/vendor/golang.org/x/net/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707 \
> +    file://src/${GO_IMPORT}/vendor/github.com/google/btree/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
> +    file://src/${GO_IMPORT}/vendor/github.com/mitchellh/cli/LICENSE;md5=b278a92d2c1509760384428817710378 \
> +    file://src/${GO_IMPORT}/vendor/github.com/mitchellh/mapstructure/LICENSE;md5=3f7765c3d4f58e1f84c4313cecf0f5bd \
> +    file://src/${GO_IMPORT}/vendor/github.com/sean-/seed/LICENSE;md5=ae6a5709472e0833798453b9fa793364 \
> +    file://src/${GO_IMPORT}/vendor/github.com/ryanuber/columnize/COPYING;md5=4b1989be3dc78e86f2c54cf3b03db7c9 \
> +    file://src/${GO_IMPORT}/vendor/github.com/fatih/color/LICENSE.md;md5=316e6d590bdcde7993fb175662c0dd5a \
> +    file://src/${GO_IMPORT}/vendor/github.com/posener/complete/LICENSE.txt;md5=6778be8533804ed9e25f746e2f0ba0ee \
> +    file://src/${GO_IMPORT}/vendor/github.com/mattn/go-colorable/LICENSE;md5=24ce168f90aec2456a73de1839037245 \
> +    file://src/${GO_IMPORT}/vendor/github.com/mattn/go-isatty/LICENSE;md5=f509beadd5a11227c27b5d2ad6c9f2c6 \
> +    file://src/${GO_IMPORT}/vendor/github.com/miekg/dns/LICENSE;md5=147353de6868a20caa562d26eab7b3c5 \
> +    file://src/${GO_IMPORT}/vendor/github.com/miekg/dns/COPYRIGHT;md5=2ba6b7bd91e16af46a856eca87db2504 \
> +    file://src/${GO_IMPORT}/vendor/github.com/hashicorp/golang-lru/LICENSE;md5=f27a50d2e878867827842f2c60e30bfc \
> +    file://src/${GO_IMPORT}/vendor/github.com/hashicorp/go-multierror/LICENSE;md5=d44fdeb607e2d2614db9464dbedd4094 \
> +    file://src/${GO_IMPORT}/vendor/github.com/hashicorp/go-sockaddr/LICENSE;md5=9741c346eef56131163e13b9db1241b3 \
> +    file://src/${GO_IMPORT}/vendor/github.com/hashicorp/errwrap/LICENSE;md5=b278a92d2c1509760384428817710378 \
> +    file://src/${GO_IMPORT}/vendor/github.com/hashicorp/go-immutable-radix/LICENSE;md5=65d26fcc2f35ea6a181ac777e42db1ea \
> +    file://src/${GO_IMPORT}/vendor/github.com/hashicorp/go-msgpack/LICENSE;md5=3f4c936a1236aa7f17ca2a0b0ce4bfdd \
> +    file://src/${GO_IMPORT}/vendor/github.com/hashicorp/go-syslog/LICENSE;md5=cb04212e101fbbd028f325e04ad45778 \
> +    file://src/${GO_IMPORT}/vendor/github.com/hashicorp/mdns/LICENSE;md5=cb04212e101fbbd028f325e04ad45778 \
> +    file://src/${GO_IMPORT}/vendor/github.com/hashicorp/go.net/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707 \
> +    file://src/${GO_IMPORT}/vendor/github.com/hashicorp/memberlist/LICENSE;md5=b278a92d2c1509760384428817710378 \
> +    file://src/${GO_IMPORT}/vendor/github.com/hashicorp/logutils/LICENSE;md5=b278a92d2c1509760384428817710378 \
> +    file://src/${GO_IMPORT}/vendor/github.com/armon/go-metrics/LICENSE;md5=d2d77030c0183e3d1e66d26dc1f243be \
> +    file://src/${GO_IMPORT}/vendor/github.com/armon/go-radix/LICENSE;md5=cb04212e101fbbd028f325e04ad45778 \
> +    file://src/${GO_IMPORT}/vendor/github.com/armon/circbuf/LICENSE;md5=d2d77030c0183e3d1e66d26dc1f243be \
> +    file://src/${GO_IMPORT}/vendor/github.com/bgentry/speakeasy/LICENSE;md5=adf5a740fe07eb2aa1ac54aafe2d41f2 \
> +    file://src/${GO_IMPORT}/vendor/github.com/bgentry/speakeasy/LICENSE_WINDOWS;md5=b563ae7163bca24b2c0ed1486f8c944c \
> +    "
> -- 
> 2.24.0
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4876): https://lists.yoctoproject.org/g/meta-virtualization/message/4876
> Mute This Topic: https://lists.yoctoproject.org/mt/68173737/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-

