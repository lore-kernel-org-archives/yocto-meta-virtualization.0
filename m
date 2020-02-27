Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.1527.1582841876829741609
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 27 Feb 2020 14:17:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U19yYJdE;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id z12so1071296qkg.12
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 27 Feb 2020 14:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=lBSkGR3SDAE5HDzlKCydBOZNsHvMhpAlB6ROSbV6hdQ=;
        b=U19yYJdEahgoZ69B6N/I2BnJVYy5BuZKtXHES3sV6x7IqvHNxUSwvgQP3b1GaDR6Bh
         YAmJhdka2SXdJb7HA+EXvbrX4lELzOOMQgAtsUlcxk1zQgad/lnB/nn2rxtBPlqESlml
         KUvfmVq+b8dt5zD3CAFG4+MeSqx9H8yArwUv7bynKrOSAJY3iVxS4bLd5BkNDcaq7/wF
         EJQGt9vJBUrR1mfGhYX3Jyd1qCkPH1GTlR4qUdKuWCanAoLHQdLkXjG1HyGVaU3hKMe2
         XXMSM6bfWjpOwpWSdVKs7y8tTmf3Hg0+H7Ff0dqDnj/yKUPdtkWhavyLLS6HJqzUohNV
         U4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=lBSkGR3SDAE5HDzlKCydBOZNsHvMhpAlB6ROSbV6hdQ=;
        b=IuuQEIlCuX6IeWEv6gm7DzU4XBdqs6cmQqvtbO69mvXudhzFNWIAwwhzvrr/PdUYhq
         oQieIwjvbJmf74cQIknDJt+f4Yx/YTqtzyU/hIOeOspB8WHbn6gGPxPw9/UpzwFd3RZC
         PiQoFHoqIH0L/NMAZeinb1eC0LoL8wO29DYja938erzS7STB6pZxJ9oV5ncYtQSJvCnc
         OohCr6wSKqdeKQtt/5yyPPRE92q0RT+XN/OFpCdLCLhsE6n5xC1HBc1ziwdUOTnCIH9w
         w1QRtvul1p9/PYMpafi28n8zijjjQZKU5T3Dv0lS7xBafVj+VTBJFTUmti7HB8R7NYN0
         TXhw==
X-Gm-Message-State: APjAAAUrUhqV2p08/F4lzFknM/PktBH32Mj8WqC3vQtNC75WKxW674Ck
	PpNs9jat/Bjic89l9MIXx4z3zKWCF6hw0g==
X-Google-Smtp-Source: APXvYqw+OjJZf+2ZOntcmpjm4qxJYr2gCmAnKaM6W1DSzyaTrgAIwYoLaxRyCZqPhIW0MgZb4gZAVg==
X-Received: by 2002:ae9:f205:: with SMTP id m5mr1818818qkg.152.1582841875900;
        Thu, 27 Feb 2020 14:17:55 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE98dac44fc29f-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.255.134])
        by smtp.gmail.com with ESMTPSA id y190sm3873224qkb.130.2020.02.27.14.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 14:17:55 -0800 (PST)
Date: Thu, 27 Feb 2020 17:17:53 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: hnathan918@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][m-c-s][PATCH 0/8] Added Fluentd and dependencies
Message-ID: <20200227221753.GB37799@gmail.com>
References: <20200220195806.173460-1-hnathan918@gmail.com>
 <CAFZcBMHKsD-LzbTA3R4Y53T+3wb5Ze3wyaacwx+QoaG5Fjgw=g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFZcBMHKsD-LzbTA3R4Y53T+3wb5Ze3wyaacwx+QoaG5Fjgw=g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

In message: Re: [meta-virtualization][m-c-s][PATCH 0/8] Added Fluentd and dependencies
on 20/02/2020 Nathan Hartman via Lists.Yoctoproject.Org wrote:

> This series adds recipes for Fluentd and it's Ruby dependencies. Fluentd is a
> data collector and log shipper employed by several cloud services. I'm
> submitting the Ruby dependencies to m-c-s as the original meta-ruby layer from
> meta-openembedded was removed.

Thanks Nathan,

Some of the commits didn't have a proper subsystem in the shortlogs,
but I went ahead and merged things regardless.

Also, I'm not sure how these were sent, but they came through with
an Author that the yocto git server rejected. I amended them with
your name .. and was able to push them.

Cheers,

Bruce

> 
> Regards,
> Nathan.
> 
> 
>  meta-openstack/recipes-devtools/ruby/concurrent-ruby/
> 0001-Removed-check-for-concurrent_ruby.jar.patch | 26
> ++++++++++++++++++++++++++
>  meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.6.bb
>                                          | 12 ++++++++++++
>  meta-openstack/recipes-devtools/ruby/cool.io_1.6.0.bb
>                                                  | 12 ++++++++++++
>  meta-openstack/recipes-devtools/ruby/fluentd_1.9.2.bb
>                                                  | 19 +++++++++++++++++++
>  meta-openstack/recipes-devtools/ruby/http-parser.rb_0.6.0.bb
>                                           | 22 ++++++++++++++++++++++
>  meta-openstack/recipes-devtools/ruby/msgpack_1.3.3.bb
>                                                  | 12 ++++++++++++
>  meta-openstack/recipes-devtools/ruby/serverengine_2.2.1.bb
>                                             | 13 +++++++++++++
>  meta-openstack/recipes-devtools/ruby/sigdump_0.2.4.bb
>                                                  | 11 +++++++++++
>  meta-openstack/recipes-devtools/ruby/strptime_0.2.3.bb
>                                                 | 13 +++++++++++++
>  meta-openstack/recipes-devtools/ruby/tzinfo-data_1.2019.3.bb
>                                           | 11 +++++++++++
>  meta-openstack/recipes-devtools/ruby/tzinfo_2.0.1.bb
>                                                   | 13 +++++++++++++
>  meta-openstack/recipes-devtools/ruby/yajl-ruby_1.4.0.bb
>                                                | 11 +++++++++++
>  meta-openstack/recipes-devtools/ruby/yajl-ruby_git.bb
>                                                  | 26
> --------------------------
>  13 files changed, 175 insertions(+), 26 deletions(-)
> 
> 
> 
> 
> On Thu, 20 Feb 2020 at 14:58, Nathan Hartman <hnathan918@gmail.com> wrote:
> 
>     Signed-off-by: Nathan Hartman <hnathan918@gmail.com>
>     ---
>      .../recipes-devtools/ruby/yajl-ruby_1.4.0.bb  | 11 ++++++++
>      .../recipes-devtools/ruby/yajl-ruby_git.bb    | 26 -------------------
>      2 files changed, 11 insertions(+), 26 deletions(-)
>      create mode 100644 meta-openstack/recipes-devtools/ruby/yajl-ruby_1.4.0.bb
>      delete mode 100644 meta-openstack/recipes-devtools/ruby/yajl-ruby_git.bb
> 
>     diff --git a/meta-openstack/recipes-devtools/ruby/yajl-ruby_1.4.0.bb b/
>     meta-openstack/recipes-devtools/ruby/yajl-ruby_1.4.0.bb
>     new file mode 100644
>     index 0000000..4393476
>     --- /dev/null
>     +++ b/meta-openstack/recipes-devtools/ruby/yajl-ruby_1.4.0.bb
>     @@ -0,0 +1,11 @@
>     +SUMMARY = "A streaming JSON parsing and encoding library for Ruby (C
>     bindings to yajl)"
>     +HOMEPAGE = "http://rdoc.info/projects/brianmario/yajl-ruby"
>     +
>     +LICENSE = "MIT"
>     +LIC_FILES_CHKSUM = "file://LICENSE;md5=7dbd3a9f471247a243db5b62fe091587"
>     +
>     +SRC_URI = "git://github.com/brianmario/yajl-ruby.git;protocol=https;tag=
>     1.4.0"
>     +
>     +S = "${WORKDIR}/git"
>     +
>     +inherit ruby
>     diff --git a/meta-openstack/recipes-devtools/ruby/yajl-ruby_git.bb b/
>     meta-openstack/recipes-devtools/ruby/yajl-ruby_git.bb
>     deleted file mode 100644
>     index 9d8ba54..0000000
>     --- a/meta-openstack/recipes-devtools/ruby/yajl-ruby_git.bb
>     +++ /dev/null
>     @@ -1,26 +0,0 @@
>     -#
>     -# Copyright (C) 2014 Wind River Systems, Inc.
>     -#
>     -SUMMARY = "C binding to the excellent YAJL JSON parsing and generation
>     library."
>     -DESCRIPTION = "This gem is a C binding to the excellent YAJL JSON \
>     -parsing and generation library."
>     -
>     -LICENSE = "MIT"
>     -LIC_FILES_CHKSUM = "file://MIT-LICENSE;md5=
>     7edc7ac9885163399dacc69a54b1dc3a"
>     -
>     -PR = "r0"
>     -
>     -BPV = "1.2.1"
>     -PV = "${BPV}"
>     -SRCREV = "d8a0b8d5c879b0810b43eaab241fb87b68c93453"
>     -
>     -S = "${WORKDIR}/git"
>     -
>     -SRC_URI = " \
>     -    git://github.com/brianmario/yajl-ruby.git \
>     -    file://0001-Don-t-compile-extensions.patch \
>     -    "
>     -
>     -inherit ruby
>     -
>     -BBCLASSEXTEND = "native"
>     --
>     2.17.1
> 
> 

> 

