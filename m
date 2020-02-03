Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web10.5659.1580767737106624697
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 03 Feb 2020 14:08:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=brsfd7YZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id s7so7606931qvn.8
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 03 Feb 2020 14:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NaLkMRXCdVnB8ekNLPx6cDXGrj7Co/iSLY5l8sSRTRQ=;
        b=brsfd7YZHy0WAbIzPsAc1E/7kI9QOWp16gwVvF4PBuP3a9bEVclBJqLU7NvgbJxoL2
         2IN7FCeWiOA3d1aCVVAiS7rNDHr4r/v5IbvKGoApOHvwa0R2tH3tsguhJBu6dNSd3S3j
         PwZWHu16hfzp+MXOn+IGZ+JuN0RswuJp76brG5zR88SOlr2nQ+g7d9/Dz1Se4f0+1V5I
         4/rSxKO3jtu+fVw1qaDHEoAGtDlYnbxjF7vN0EbqvaDqcq33VMHQZcMOl2L4JktuXL7b
         sAj1/PD/hJk0N4dCT3f8Qw3t7yh8fOUe5YGyUhaG6GANMv15fBv4o1ctnqZsIMBsweU9
         +p4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NaLkMRXCdVnB8ekNLPx6cDXGrj7Co/iSLY5l8sSRTRQ=;
        b=eofA8N1+nUAYj0XXuukjb4LJL/HLtbCC4OfatmhbsEmPn8lAw67Iln41mPXN16B+qM
         F11TCTk4QEhXfNUVNg23Nb3mUy7CMMmQSqe0EZ44YyrBDc99zhoJc+tJ+F28wLXe8J7Z
         700mV/ZbQpH6U2LZ9uollEUEfAIzOmybpHCfE1q+tO8V7L+FylgvR+Gip69+6QDm7OZQ
         9ApXImV8BM28UySIe493hb2/jK1vKcPfsJWYDJcb25+d3BRDmcNQ7mas2bWYEBE00ZlB
         3VdTKwQLz9ixXCsws1cd8EnlGuZYEPYv+idXu66fIERVlqcIvCIveaAXxDpg2gq0f/oC
         nuxA==
X-Gm-Message-State: APjAAAVtu6kjjkzjcDh+xe90cEbsJaeA6s6vHV4pF0kiAHjREhET3HvR
	KhBc+CYSYUlZBCNaTMzbbqI=
X-Google-Smtp-Source: APXvYqzuiuWI1D8oP4z1gjijVyMhJnIDjqkv3YNWTDqXn5URceGJBixbw5bS/YGJcfmZGeeICk17Ag==
X-Received: by 2002:a0c:c250:: with SMTP id w16mr23994699qvh.24.1580767736068;
        Mon, 03 Feb 2020 14:08:56 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com. [174.113.11.95])
        by smtp.gmail.com with ESMTPSA id x19sm10705213qtm.47.2020.02.03.14.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 14:08:55 -0800 (PST)
Date: Mon, 3 Feb 2020 17:08:53 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] libvirt: Use python3-native for python install
Message-ID: <20200203220850.GA58444@gmail.com>
References: <20200129222009.2719-1-jpuhlman@mvista.com>
MIME-Version: 1.0
In-Reply-To: <20200129222009.2719-1-jpuhlman@mvista.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization][PATCH] libvirt: Use python3-native for python install
on 29/01/2020 Jeremy Puhlman wrote:

> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
> ---
>  recipes-extended/libvirt/libvirt-python.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
> index 02fca54..d15500e 100644
> --- a/recipes-extended/libvirt/libvirt-python.inc
> +++ b/recipes-extended/libvirt/libvirt-python.inc
> @@ -42,14 +42,14 @@ python __anonymous () {
>  do_compile_append() {
>  	if [ "${LIBVIRT_PYTHON_ENABLE}" = "1" ]; then
>  		cd ${WORKDIR}/${BPN}-python-${PV} && \
> -		  ${STAGING_BINDIR_NATIVE}/python-native/python setup.py build
> +		  ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py build
>  	fi
>  }
>  
>  do_install_append() {
>  	if [ "${LIBVIRT_PYTHON_ENABLE}" = "1" ]; then
>  		cd ${WORKDIR}/${BPN}-python-${PV} && \
> -		  ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install \
> +		  ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py install \
>                         --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${LIBVIRT_INSTALL_ARGS}
>  	fi
>  }
> -- 
> 2.20.1
> 

> 

