Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.2907.1578518541412592774
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Jan 2020 13:22:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=B0H/kVVn;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 477E6E01406; Wed,  8 Jan 2020 13:22:21 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FAKE_REPLY_C,FREEMAIL_FROM,FSL_HELO_FAKE,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.222.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 FSL_HELO_FAKE FSL_HELO_FAKE
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  1.5 FAKE_REPLY_C FAKE_REPLY_C
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3650BE01402
	for <meta-virtualization@yoctoproject.org>; Wed,  8 Jan 2020 13:22:20 -0800 (PST)
Received: by mail-qk1-f196.google.com with SMTP id j9so4093544qkk.1
        for <meta-virtualization@yoctoproject.org>; Wed, 08 Jan 2020 13:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=So8/Q8G3bz1VQ5hcpAY/j81znm3Y0YSZ53KJjezHolA=;
        b=B0H/kVVn5fwKvrd2gmWNJ+zEHgfoJMFwalZCi4O/9Hu1MO2FBTuC9AlfA5+Lej2KPS
         HDavW+dT0i3NfR/ACD8BPSB8NniUcYaz4+UVoZS47wo49FiJ6qCphIMltw9cA6NAkgRC
         xlM1iHSlgn8i1q68kVPUpjOEaAgRaRPiBbFPVErXivmWYwO9tWLnS0ZWEEd/E7wlD5xk
         rplKZ6qr1wDTP8zg7SJTgkMxlI90G4e6cG9ndCI6EdIqHMldYFtcS7Lr6a83Ek/QneEe
         z/oEyzODdF1xvsa5G5zF2TmTE8Tu9zm+ClenkqwxgTTxs+rVEYXiphsvnVirwS0p6vQi
         WusQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=So8/Q8G3bz1VQ5hcpAY/j81znm3Y0YSZ53KJjezHolA=;
        b=i92tylL0Kx97TraeePa1epx4IVdMCGgbQEka9OZP0AXTPRQIi78H7948zbvbeVzRwt
         uUEzvI7htpscxO+W/5jN9CmNlNLW0uuN3LCYoz5tTGd1AjhtrbJgSRpRKip5tZmI4Tpg
         bHRXOI1arm3TVVOuMn5uqs1AU1yOqiXfwhgCjBSRlkmOtnb5BU1QbrLDOSLkmaUY3lqh
         eFSnP8Q8XTzmOvOfiJ+xj7xGMNadstDESQ2x3LbyrKMCBZYcO8irYGJgMK1K81lLtQ/7
         slZAQDk1ZObTG98BtDb23KvqKYnWvfL2l6tl0L+XPh70FzEZo0jhYCEGflGXeQaJoCjh
         kB/Q==
X-Gm-Message-State: APjAAAV0+Q2NBhezOKX3+IAzNlInXlsXKszx/VK8iImhq1+gFIIWXTZH
	mu8plPJT9zAuMu9lDLhab+8jQjxw8hI=
X-Google-Smtp-Source: APXvYqxI9LkwEiLshqGWHidfT3jepTQt9bOc9e83+ftPuRY/y+VvjfL1WmAWiCPr8My30G84Z5Oz+Q==
X-Received: by 2002:a37:4a8b:: with SMTP id x133mr5908193qka.181.1578518539594;
        Wed, 08 Jan 2020 13:22:19 -0800 (PST)
Received: from gmail.com (CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com. [174.113.11.95])
        by smtp.gmail.com with ESMTPSA id w25sm2217145qts.91.2020.01.08.13.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 13:22:19 -0800 (PST)
Date: Wed, 8 Jan 2020 16:22:17 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH]python-pyyaml: Remove the recipe
Message-ID: <20200108212216.GC12328@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1578031693-88286-1-git-send-email-wangmy@cn.fujitsu.com>
 <1578056439-94495-1-git-send-email-wangmy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I don't know of any version dependencies on these, so I've gone ahead and
merged the patches.

Bruce

In message: [meta-virtualization] [PATCH]python-pyyaml: Remove the recipe
on 03/01/2020 Wang Mingyu wrote:

> Because they already exist in meta-openembedded, remove the recipe.
> 
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../python/python-pyyaml_5.1.2.bb             | 32 -------------------
>  1 file changed, 32 deletions(-)
>  delete mode 100644 recipes-devtools/python/python-pyyaml_5.1.2.bb
> 
> diff --git a/recipes-devtools/python/python-pyyaml_5.1.2.bb b/recipes-devtools/python/python-pyyaml_5.1.2.bb
> deleted file mode 100644
> index 711675b..0000000
> --- a/recipes-devtools/python/python-pyyaml_5.1.2.bb
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -HOMEPAGE = "http://www.pyyaml.org"
> -SUMMARY = "Python support for YAML"
> -DESCRIPTION = "\
> -  YAML is a data serialization format designed for human readability \
> -  and interaction with scripting languages.  PyYAML is a YAML parser \
> -  and emitter for Python. \
> -  .       \
> -  PyYAML features a complete YAML 1.1 parser, Unicode support, pickle \
> -  support, capable extension API, and sensible error messages.  PyYAML \
> -  supports standard YAML tags and provides Python-specific tags that \
> -  allow to represent an arbitrary Python object. \
> -  .       \
> -  PyYAML is applicable for a broad range of tasks from complex \
> -  configuration files to object serialization and persistance. \
> -  "
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=a76b4c69bfcf82313bbdc0393b04438a"
> -
> -SRCNAME = "PyYAML"
> -SRC_URI = "http://pyyaml.org/download/pyyaml/${SRCNAME}-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "20f87ab421b0271dbf371dc5c1cddb5c"
> -SRC_URI[sha256sum] = "01adf0b6c6f61bd11af6e10ca52b7d4057dd0be0343eb9283c878cf3af56aee4"
> -
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -DEFAULT_PREFERENCE = "-1"
> -
> -inherit setuptools
> -
> -DEPENDS += "libyaml python-cython-native"
> -- 
> 2.17.1
> 
> 
> 

> 


