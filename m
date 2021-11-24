Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.4734.1637791382379875172
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 24 Nov 2021 14:03:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k8t2ZqQs;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id d2so5418459qki.12
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Nov 2021 14:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PVaiKm+P6iTBAkjxxt8ExGBa4IE5dfAHYcGiNLpudCI=;
        b=k8t2ZqQsVcZ6SzsSSSkGV+BS2iQTi3J49suVBBysuBg8gyA1yZ1SimUU65HJXUryCE
         EULZTDllD5S5OHegnVPZcpbty5T9Owv73d/XcpOKEM9NDvrcJO2LZzgnQzuxuEDnIelw
         je438RrySL9bJiDDFv9THpMv//FJ6UtVdDjDTCi/Q4id015G1sPGcxjuqdhb5lDM4pPu
         ZmIZFIYRn/RCefh9VLeKNwDwW3egFrN2OdKWy/1PPP5D611zihtlrKrdsbw3e0Ke4IXa
         KHlMVhpoTe+Ulr8JFBuXNYm/5KFjjAgsbZpRyOlg2qqP2hKejFYkjO8uWPavoDu9fpgK
         foFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PVaiKm+P6iTBAkjxxt8ExGBa4IE5dfAHYcGiNLpudCI=;
        b=Jr4FrozA6yqNQ/Djouanwfl4gdGnbro1uzpo5BXX3YZKgNZpGfqesVrtA2EMDAv3RK
         XFKQ2tYik3h089XagFWJVJ1hhByG8g7UIZblmecESB6ApyQXdzTiJcgB6topgEuVrClO
         tARUvW/7zx8FoWr80RHOivDbQimOopWDLe9xXVuntaMBiKhulj4IIIez8XJ8i8gVhk7Z
         AWja/9KVj2ztxUMj0bAWhQw3qTAUk5EkOyExre+BCHXqMkWwYEOwFeAgOebfY8HutzGx
         9PxIuE6tQGJwQ5vpFxcMjlMFMsFS72/lzFUsTfpzQIU4dXuCI3Fkni+ij1YFweF5ff2n
         ZCOw==
X-Gm-Message-State: AOAM5310QrXS6PAejKX0pU8Gpc+WySwo6BDnSfgG/xP4eHqoGpkX8osH
	vph5occlIGZHDAN4lpVFeo0=
X-Google-Smtp-Source: ABdhPJzNtT8LMurBKYBzB4BrLnqttq5mrxBzRuLOF3rduXsWJ3h6Q246dImG0fJqRigYkyt4ctzMRQ==
X-Received: by 2002:a05:620a:4547:: with SMTP id u7mr1802971qkp.643.1637791381492;
        Wed, 24 Nov 2021 14:03:01 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id y73sm467277qkb.113.2021.11.24.14.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 14:03:01 -0800 (PST)
Date: Wed, 24 Nov 2021 17:02:59 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: kai <kai.kang@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][m-c-s][PATCH] concurrent-ruby: 1.1.6 -> 1.1.9
Message-ID: <20211124220256.GA41710@gmail.com>
References: <20211122151051.9683-1-kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20211122151051.9683-1-kai.kang@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization][m-c-s][PATCH] concurrent-ruby: 1.1.6 -> 1.1.9
on 22/11/2021 kai wrote:

> From: Kai Kang <kai.kang@windriver.com>
> 
> Upgrade concurrent-ruby from 1.1.6 to 1.1.9:
> 
> * it changed license file to txt, so the license file name and checksum changed
> * remove 'tag=' from SRC_URI and use SRCREV instead
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  ...urrent-ruby_1.1.6.bb => concurrent-ruby_1.1.9.bb} | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>  rename meta-openstack/recipes-devtools/ruby/{concurrent-ruby_1.1.6.bb => concurrent-ruby_1.1.9.bb} (50%)
> 
> diff --git a/meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.6.bb b/meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.9.bb
> similarity index 50%
> rename from meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.6.bb
> rename to meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.9.bb
> index a328203e..e2c99d7d 100644
> --- a/meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.6.bb
> +++ b/meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.9.bb
> @@ -2,11 +2,17 @@ SUMMARY = "Modern concurrency tools including agents, futures, promises, thread
>  HOMEPAGE = "http://www.concurrent-ruby.com"
>  
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fde65ae93d18826f70c6fe125aa04297"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e319104fe1435b64fc0a67032db44f02"
>  
> -SRC_URI = "git://github.com/ruby-concurrency/concurrent-ruby.git;protocol=https;tag=v1.1.6\
> -	   file://0001-Removed-check-for-concurrent_ruby.jar.patch"
> +SRC_URI = "git://github.com/ruby-concurrency/concurrent-ruby.git;protocol=https;branch=master \
> +           file://0001-Removed-check-for-concurrent_ruby.jar.patch \
> +           "
> +SRCREV = "52c08fca13cc3811673ea2f6fdb244a0e42e0ebe"
>  
>  S = "${WORKDIR}/git"
>  
> +do_install:append () {
> +    rmdir --ignore-fail-on-non-empty ${D}${libdir}/ruby/gems/${RUBY_GEM_VERSION}/plugins
> +}
> +
>  inherit ruby
> -- 
> 2.17.1
> 

> 
> 
> 

