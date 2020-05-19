Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.415.1589923480814846701
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 May 2020 14:24:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tMrzef4p;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id o19so883431qtr.10
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 19 May 2020 14:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DGhCkxsVqRpbQwvrFdleYQ97nsa4GawcG0MGSCmviSk=;
        b=tMrzef4p8URH/QUBlrtBYfKthLkC/LJ6IwZHi6rG7niOaF0TP3VTUPFL7Ay1ZmFuFM
         jB2SF3lfdNeZLDjHuKn07gHgNPpQAvWlwfHjDJYHz4P8GzaHPp3JNtI3nciNTEq2LKGB
         ra7bx8c4bZgFtEnEd/1EnVE1z7EkfXk6Uu8gvP39DPbzoHmXjYDxw9UMDviYR5m2TSmy
         9i2PCNuktfHo/TMDvRryYB3j7nvsVpD4e4jtUIimj9TnN7eRGlDUbHATpfMP2MqkAnSz
         UxfPzgdLMrjTosMGtESKimX66qisY1L8/Qm4VIxsc6VgUl/8u074GvhpaIPtjzfc5i8g
         QYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DGhCkxsVqRpbQwvrFdleYQ97nsa4GawcG0MGSCmviSk=;
        b=ZYFsBYqhTTOhzV5Cs/nwyZ9zcY2FL/sMSeH65ndt1Ky5O3c2Mn62HzlNM8Xkh/mnP9
         c9IVNVEllss/0GZILdEvnWwx0spwAbVo10tp/f83K5IYOsD3rE+Djid5jfysrW1BDjOW
         NrThdlniTBn/DpC2Pq6JukjDtafj5jehSpyoVMsJZ54PwSiCB+NV25wvi6V2k0e8Xjwk
         p/Vy4pMNL8TPL6VcFhpTePmW24nOLMeisMrR+Bw9tq4zNo8GahsH01aip0+pE3ZyJ6GJ
         fH/qM/97971JZzODNkysK9zBLbE0Cd2TMAFAUShy4YbfT8ae+QdixAnyTPqLjHsd1crp
         kCGw==
X-Gm-Message-State: AOAM531OEXJpqvQgOUOd8hxtlH+9RG0a877fA7m7NPl2zf8a6jp4ahlp
	ItADYjgfry1u0YdCexaiRys=
X-Google-Smtp-Source: ABdhPJySeQvEbft5JvMQYfSou6fBsoAAZf2MaJoYNmkh2yHEMO3+ChIN7e+Sa9/Uli4uo+mmDCL0vw==
X-Received: by 2002:ac8:fb5:: with SMTP id b50mr2044766qtk.164.1589923479914;
        Tue, 19 May 2020 14:24:39 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id h12sm840669qtb.19.2020.05.19.14.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 14:24:39 -0700 (PDT)
Date: Tue, 19 May 2020 17:24:37 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: sakib.sajal@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH v2] libvirt: uprev v6.1.0 -> v6.3.0
Message-ID: <20200519212436.GC22460@gmail.com>
References: <20200519152301.40812-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20200519152301.40812-1-sakib.sajal@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: [meta-virtualization][PATCH v2] libvirt: uprev v6.1.0 -> v6.3.0
on 19/05/2020 sakib.sajal@windriver.com wrote:

> Minor update bringing in new features, improvements
> and bug fixes.
> Most notable changes:
> - vbox: removed support for version 5.0 and 5.1 APIs
> - vbox: added support for version 6.0 and 6.1 APIs
> - qemu: Various embed driver fixes
> - qemu: Add virtiofs support
> - qemu: support disabling hotplug/unplug of PCIe devices
> - xen: Add support for 'passthrough' hypervisor feature
> 
> Straightforward uprev, requiring patch refreshes to
> remove fuzz.
> 
> Build and runtime behaviour is identical to older
> version v6.1.0.
> 
> ptest summary:
> ===================================
> Testsuite summary for libvirt 6.3.0
> ===================================
> - TOTAL: 129
> - PASS:  123
> - SKIP:  1
> - XFAIL: 0
> - FAIL:  5
> - XPASS: 0
> - ERROR: 0
> 
> Failed test:
> - virschematest
> - domaincapstest
> - qemuxml2argvtest
> - qemuhotplugtest
> - virsh-auth
> 
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
> V2 changes:
> - include test summary
> - update commit log to include notable changes

Looks great. Thanks for the updated v2.

This is now merged.

Bruce

> 
>  recipes-extended/libvirt/libvirt-python.inc                   | 4 ++--
>  .../libvirt/{libvirt_6.1.0.bb => libvirt_6.3.0.bb}            | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>  rename recipes-extended/libvirt/{libvirt_6.1.0.bb => libvirt_6.3.0.bb} (99%)
> 
> diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
> index c5b0fbd..7b87d5e 100644
> --- a/recipes-extended/libvirt/libvirt-python.inc
> +++ b/recipes-extended/libvirt/libvirt-python.inc
> @@ -17,8 +17,8 @@ FILES_${PN}-python = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
>  
>  SRC_URI += "http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python"
>  
> -SRC_URI[libvirt_python.md5sum] = "2834626b07da6ac4ca1559abfd55c118"
> -SRC_URI[libvirt_python.sha256sum] = "be644f4809c0e1d368e3ac065df3c66a26dcfe61ecb607ee9706e1799f22c35a"
> +SRC_URI[libvirt_python.md5sum] = "4cf898350ee9a47f94986d402c153bdb"
> +SRC_URI[libvirt_python.sha256sum] = "c772421ecc144f098f4ab15db700c62db9b9e6e76b876217edcfd62e9ce02750"
>  
>  export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
>  export LIBVIRT_CFLAGS = "-I${S}/include"
> diff --git a/recipes-extended/libvirt/libvirt_6.1.0.bb b/recipes-extended/libvirt/libvirt_6.3.0.bb
> similarity index 99%
> rename from recipes-extended/libvirt/libvirt_6.1.0.bb
> rename to recipes-extended/libvirt/libvirt_6.3.0.bb
> index 9aa78b7..229c56e 100644
> --- a/recipes-extended/libvirt/libvirt_6.1.0.bb
> +++ b/recipes-extended/libvirt/libvirt_6.3.0.bb
> @@ -42,8 +42,8 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
>             file://gnutls-helper.py \
>            "
>  
> -SRC_URI[libvirt.md5sum] = "a870e63f20fac2ccf98e716d05256145"
> -SRC_URI[libvirt.sha256sum] = "167c185be45560e73dd3e14ed375778b555c01455192de2dafc4d0f74fabebc0"
> +SRC_URI[libvirt.md5sum] = "1bd4435f77924f5ec9928b538daf4a02"
> +SRC_URI[libvirt.sha256sum] = "74069438d34082336e99a88146349e21130552b96efc3b7c562f6878127996f5"
>  
>  inherit autotools gettext update-rc.d pkgconfig ptest systemd useradd perlnative
>  USERADD_PACKAGES = "${PN}"
> -- 
> 2.24.0
> 

> 

