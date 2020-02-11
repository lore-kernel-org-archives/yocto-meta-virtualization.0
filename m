Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web10.16548.1581455218594476458
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 11 Feb 2020 13:06:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=P/Qf2YpZ;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id a2so11133115qko.12
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 11 Feb 2020 13:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eom4wD0m7l+yh5kpIqUTACWilUI0m0859FTyD52VVY0=;
        b=P/Qf2YpZBqyyo9BiV2f7p5ka2FdU+j2xp4ZsEhrybtpnIYhgoDEwbbHUJayOHZ6yPV
         Ucp0uGfA+/DBmR/z6rbJRgE+A24gtPKpJfTVBpfWJe48wLK1yyzxIPFhHSxNjW5xtRot
         MIKeHQU3FFV8r60cUjGOn3st5uGoxLdirwlBz4qAIc4ioIDKgop1j8Dl5SMQcp76+hDB
         8hzGsFfR0Y+Lh0ur/7P+KvhdRDKZHTEqRloFgC3oxHa6qgEAvL82/6foMlxOUw9on/Ng
         M/EHtznpIpqIYEOFOUnjXRdiq92ejz9GUZkdGzeBqBGy5+consOGDJkUmEnlKQtuJTne
         MSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eom4wD0m7l+yh5kpIqUTACWilUI0m0859FTyD52VVY0=;
        b=sJMnycc/dQUy4R8mPDIKPgMpZkEOsHNYtzSdc+vIz0h+7tZogiCL/JFJ9N1+bs+VEN
         cvfWh6nyOUDxbsHMmjrokx9c4txNGJzox42bDlKYbciqnehWrDpgmTk400zo4lR3Okc7
         3g1a9e2QU05fpWt8PEvI1yZMnsaIxbgq0AK1S6ULWlwO1/JdXOUn3tMoFz8pejzIJDjv
         7UFHF6nQKzTsBxmpNm2bSNSuse3KqNkoezU8RzC0MTTifvgxrAr2JRZNfmsak6i/N0zv
         /EnOVUYWh9ZU2rUW9qI4m+/EK6qmzmMh2Q39xSRKBBH8Ht56aaYnIhPhMoJMpYcIWRa9
         evAQ==
X-Gm-Message-State: APjAAAWJZ+JqlvSfQFqa2V5aJMqcSP6i9OFPo4F2xmN/OCtcdT8VhfeT
	17oj+d8H1MZ1HHX+GTaDmVNwhiL+zic=
X-Google-Smtp-Source: APXvYqyLxDtTXnVRRN9IFt8nQhzpypurDJrEnisLEgjLv8VHuuev579COCP8KTitrxNxPtdpZhULUw==
X-Received: by 2002:a37:27d3:: with SMTP id n202mr871185qkn.106.1581455217671;
        Tue, 11 Feb 2020 13:06:57 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com. [174.113.11.95])
        by smtp.gmail.com with ESMTPSA id a13sm1983205qkh.123.2020.02.11.13.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 13:06:57 -0800 (PST)
Date: Tue, 11 Feb 2020 16:06:55 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Ricardo Salveti <ricardo@foundries.io>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python3-docker-compose: update to 1.25.4
Message-ID: <20200211210640.GB36395@gmail.com>
References: <20200204221947.25946-1-ricardo@foundries.io>
MIME-Version: 1.0
In-Reply-To: <20200204221947.25946-1-ricardo@foundries.io>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Is this fixing a known issue ? Adding some features ? both ? ..
or just to grab the latest. All are good reasons!

Just asking, since for next time we can capture a short summary
in the commit log about why we are doing the version bump.

This is now merged.

Bruce

In message: [meta-virtualization] [PATCH] python3-docker-compose: update to 1.25.4
on 04/02/2020 Ricardo Salveti wrote:

> Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
> ---
>  ...001-setup.py-remove-maximum-version-requirements.patch | 8 ++++----
>  ...compose_1.25.0.bb => python3-docker-compose_1.25.4.bb} | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)
>  rename recipes-containers/docker-compose/{python3-docker-compose_1.25.0.bb => python3-docker-compose_1.25.4.bb} (87%)
> 
> diff --git a/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch b/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch
> index 8d204a7..6e5ca3d 100644
> --- a/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch
> +++ b/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch
> @@ -1,4 +1,4 @@
> -From 2685716409c560cdf94aee6262ed8c32ad137133 Mon Sep 17 00:00:00 2001
> +From 1d358acd46c9ca71d848fca8c2d677414257f247 Mon Sep 17 00:00:00 2001
>  From: Chen Qi <Qi.Chen@windriver.com>
>  Date: Fri, 22 Nov 2019 09:24:58 +0800
>  Subject: [PATCH] setup.py: remove maximum version requirements
> @@ -15,7 +15,7 @@ Signed-off-by: Ming Liu <liu.ming50@gmail.com>
>   1 file changed, 11 insertions(+), 11 deletions(-)
>  
>  diff --git a/setup.py b/setup.py
> -index 23ae08a..eef2825 100644
> +index 110441dc..eef28254 100644
>  --- a/setup.py
>  +++ b/setup.py
>  @@ -30,16 +30,16 @@ def find_version(*file_paths):
> @@ -24,7 +24,7 @@ index 23ae08a..eef2825 100644
>   install_requires = [
>  -    'cached-property >= 1.2.0, < 2',
>  -    'docopt >= 0.6.1, < 1',
> --    'PyYAML >= 3.10, < 5',
> +-    'PyYAML >= 3.10, < 6',
>  -    'requests >= 2.20.0, < 3',
>  -    'texttable >= 0.9.0, < 2',
>  -    'websocket-client >= 0.32.0, < 1',
> @@ -55,5 +55,5 @@ index 23ae08a..eef2825 100644
>   
>   
>  -- 
> -2.7.4
> +2.25.0
>  
> diff --git a/recipes-containers/docker-compose/python3-docker-compose_1.25.0.bb b/recipes-containers/docker-compose/python3-docker-compose_1.25.4.bb
> similarity index 87%
> rename from recipes-containers/docker-compose/python3-docker-compose_1.25.0.bb
> rename to recipes-containers/docker-compose/python3-docker-compose_1.25.4.bb
> index ba35c49..2dcad1e 100644
> --- a/recipes-containers/docker-compose/python3-docker-compose_1.25.0.bb
> +++ b/recipes-containers/docker-compose/python3-docker-compose_1.25.4.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
>  
>  inherit pypi setuptools3
>  
> -SRC_URI[md5sum] = "275b32cffdad6b9816dc8b4c7e55600a"
> -SRC_URI[sha256sum] = "2c5fcbfd3ff445b6f3eebb549cb167ef1d8f70c5806aab8f309fc8fa74cd977e"
> +SRC_URI[md5sum] = "893fbb804a9057d6c470b5312407e0d1"
> +SRC_URI[sha256sum] = "fabae2bee4abfa7bdd09125b6bbdcdda81f946c7b16e3ccc6bb2d821ef6488f3"
>  
>  SRC_URI += "file://0001-setup.py-remove-maximum-version-requirements.patch \
>              file://0001-setup.py-import-fastentrypoints.patch \
> -- 
> 2.25.0
> 

> 

