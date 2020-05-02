Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web10.6755.1588432093010799796
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 02 May 2020 08:08:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qsHf/jHU;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id f83so4773565qke.13
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 02 May 2020 08:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pWpWpJpOnNL5FXU3uO41Mugy1SnV+3ag6gOoXMnnnSw=;
        b=qsHf/jHUlcDKA0WGhjSWO8oJvNlRIHWmVv2AtF5CKUPLrTTfbCiHxoNB6ICWKNwrCJ
         GKgmV75ZqXJ5Vc4a51HucxtxiwVuTlugQqFjstsUvIs/JosiUEr5XNA3NyI605/WOt9C
         kaDG91utTUN68F5eWwJeXmOzXYrOV29aJ1yGLYVa5/30LY4WC2QYw4odQz8qcCaIBAav
         P0+alq0Ke8G8pUFlgGNbXVKreq7sOMwg/1PIh5bPOJb/UjRL33d5cIcaxxy+sLMlysvz
         7bPXP+a4ogg/5sDvpQNFNIYDJ1qWAjGJZtw+XqbTvxCENZGPlT1Koh/4/yIbNjza0c/8
         6qHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pWpWpJpOnNL5FXU3uO41Mugy1SnV+3ag6gOoXMnnnSw=;
        b=RSzsgZ+hn9wk3vcIg/qvKbOIQDH787JIvk5takdDGp0U/aBxOVDKh9THlTE8MWmkc9
         UyWqQlXXV7uEXtA0QvAfQr9asmv++jL4GUdwVomi8ycFVc0feCuLUv0iD7KRbIp6WVrW
         V/o0pbeu+yT3j5h7m8S27clrCP2YmOLWDExLgC65Z6ZJj9PDAqIY8wbBgzH+L7vQxjgv
         c3Wm7OqH5LR7EsSC0G8bxDbj84ByionNsJkg+ddTkFpyAY6j9NbmXvuI7HgFsy+tLt2h
         Yv38yi5eiWCkVKB3vhaul8eto2ht33o8wq/2n7ZDCeWNhtyZOjL9r6rTeA7pZFay6p8b
         zwnw==
X-Gm-Message-State: AGi0PuZIH9rZHgQm4TPPoVC6MRiVRqfb6arxGjtMc/PGm5tLdotkM85u
	984PQyoGkHuQlDBx2zuD5ZgccoCWJcM=
X-Google-Smtp-Source: APiQypKGpAFUvK0brQYhks6mTgkpSPrrIeidlQFbjP8hHlz7oDf1aM7b0dYm0TYItAntZ11oQh2fXQ==
X-Received: by 2002:a37:ec7:: with SMTP id 190mr8788750qko.51.1588432091772;
        Sat, 02 May 2020 08:08:11 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id q6sm5524127qte.72.2020.05.02.08.08.10
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2020 08:08:11 -0700 (PDT)
Date: Sat, 2 May 2020 11:08:09 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] nagios-nrpe: Fix CVE-2020-6581
Message-ID: <20200502150808.GB9724@gmail.com>
References: <20200430234815.133152-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20200430234815.133152-1-sakib.sajal@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged

(repeat comment about dunfell and uprevs in master).

Bruce

In message: [meta-virtualization][PATCH] nagios-nrpe: Fix CVE-2020-6581
on 30/04/2020 sakib.sajal@windriver.com wrote:

> Backport fix for CVE-2020-6581
> 
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  ...asty_metachars-was-not-being-returne.patch | 30 +++++++++++++++++++
>  recipes-extended/nagios/nagios-nrpe_4.0.2.bb  |  1 +
>  2 files changed, 31 insertions(+)
>  create mode 100644 recipes-extended/nagios/nagios-nrpe/0001-Should-fix-235-nasty_metachars-was-not-being-returne.patch
> 
> diff --git a/recipes-extended/nagios/nagios-nrpe/0001-Should-fix-235-nasty_metachars-was-not-being-returne.patch b/recipes-extended/nagios/nagios-nrpe/0001-Should-fix-235-nasty_metachars-was-not-being-returne.patch
> new file mode 100644
> index 0000000..7a12e73
> --- /dev/null
> +++ b/recipes-extended/nagios/nagios-nrpe/0001-Should-fix-235-nasty_metachars-was-not-being-returne.patch
> @@ -0,0 +1,30 @@
> +From 4f7dd1199f1f3f72f9197e8565da339a4a2490b7 Mon Sep 17 00:00:00 2001
> +From: madlohe <swolf@nagios.com>
> +Date: Thu, 23 Apr 2020 15:33:18 -0500
> +Subject: [PATCH] Should fix #235 (nasty_metachars was not being returned when
> + specified in cfg file
> +
> +CVE: CVE-2020-6581
> +Upstream Status: Backport [4f7dd1199f1f3f72f9197e8565da339a4a2490b7]
> +
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + src/nrpe.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/nrpe.c b/src/nrpe.c
> +index 01fbd1d..bf64963 100644
> +--- a/src/nrpe.c
> ++++ b/src/nrpe.c
> +@@ -823,6 +823,8 @@ char* process_metachars(const char* input)
> + 		}
> + 	}
> + 	copy[j] = '\0';
> ++
> ++	return copy;
> + }
> + 
> + /* read in the configuration file */
> +-- 
> +2.20.1
> +
> diff --git a/recipes-extended/nagios/nagios-nrpe_4.0.2.bb b/recipes-extended/nagios/nagios-nrpe_4.0.2.bb
> index c8875fc..d9c7b15 100644
> --- a/recipes-extended/nagios/nagios-nrpe_4.0.2.bb
> +++ b/recipes-extended/nagios/nagios-nrpe_4.0.2.bb
> @@ -13,6 +13,7 @@ SRCNAME = "nrpe"
>  SRC_URI = "https://github.com/NagiosEnterprises/nrpe/releases/download/${SRCNAME}-${PV}/${SRCNAME}-${PV}.tar.gz \
>             file://check_nrpe.cfg \
>             file://nagios-nrpe.service \
> +           file://0001-Should-fix-235-nasty_metachars-was-not-being-returne.patch \
>  "
>  
>  SRC_URI[md5sum] = "37b9e23b3e8d75308f8b31f3b61ee8a4"
> -- 
> 2.24.1
> 

> 

