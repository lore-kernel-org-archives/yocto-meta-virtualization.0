Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web09.2412.1625686987224562482
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Jul 2021 12:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Tp0CYuu2;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id g4so3231470qkl.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 07 Jul 2021 12:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UZYzdYMyRXvrNAlsodXQmwjgBtiUqY9fd/rEKqZdj5M=;
        b=Tp0CYuu2T8RXsIqlWQDEDHAtjAQ/Kr/tn5vYpCeGFt8eaG/rf0gPx3mSRccYZfYIYN
         a9ZbzU41TfIBuvSwBVu3iO9gtIOA8HX9HN8vGx98/B+e84SeAktrYVKlJDj/C1e1Yhrc
         W1wmqPThKuOXYNI+J8a6XCXTSbgTsflcI/SVXJBEdbT7wtvC7mweI8SNVFOnVJiB4OGM
         xYspJlBafFhgSySr1icrIVwfXFJBna+wkR02aMtH7Br7y4IR4CVCL82GAKvr/0cob7Uu
         89kWzGiLMyuWoDFk8iJWm6CpLW78tJ9WwcbCVelGYfycYwKgorZXXXIPegQq9ZAWZVl/
         SsMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UZYzdYMyRXvrNAlsodXQmwjgBtiUqY9fd/rEKqZdj5M=;
        b=V5cRz7RcLahO4tsbyKEuxKm6Srfa2Y45+InIM33Kumn8utDODouRhpxmecEJdPDO0z
         6BREruD9hKITZMPNfeP7FMI8lQvldvIy3Gw4vxDb18PaGXHlWjZiH364gv17hyECfQyU
         99CYQSRWheadBMTotUb9mGO/KKUDOV6DL0STTHDF4FEFEIwhRtaoh1sR8g5no1qTbV0d
         Sg9QCniJo7pCHMMqB4bs0reX9Bykm2bLm/xx2nHG6OVZ+jzAGV06nlbK6qSSLFr2OoUt
         kruWGKVDgzN0GHhacj/Y/PG9FKvClP2EaroX5CgSiI6hINZg5mL2vH6V3WlnA2z30oIp
         fSmw==
X-Gm-Message-State: AOAM532Bga7XK3O+6QEXvqFxrwr0eIlmycrzmdGrQOjVDpDAF4Ja3yqO
	ZOdaFlujeIPh9/J7UYKDmOM=
X-Google-Smtp-Source: ABdhPJyRyJFD+/bNfFGhKKSynI1zNAxVQJ4gtwC6VYW+RyrWxC7qoTv5hJ3dPOLumzmhTrYIcLBLew==
X-Received: by 2002:a05:620a:1e5:: with SMTP id x5mr8643303qkn.125.1625686986334;
        Wed, 07 Jul 2021 12:43:06 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id y4sm5316974qkc.27.2021.07.07.12.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 12:43:06 -0700 (PDT)
Date: Wed, 7 Jul 2021 15:43:04 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: hongxu <hongxu.jia@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] skopeo: fix native skopeo failed if no libdevmapper.so.1.02 on host
Message-ID: <20210707194303.GB55535@gmail.com>
References: <20210705093008.10889-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20210705093008.10889-1-hongxu.jia@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization][PATCH] skopeo: fix native skopeo failed if no libdevmapper.so.1.02 on host
on 05/07/2021 hongxu wrote:

> If host does not install libdevmapper.so.1.02, run native skopeo failed:
> ...
> $ tmp-glibc/sysroots/x86_64/usr/sbin/skopeo -h
> |tmp-glibc/sysroots/x86_64/usr/sbin/skopeo.real: error while loading
> shared libraries: libdevmapper.so.1.02: cannot open shared object file: No such file or directory
> ...
> 
> Create wrapper to set LD_LIBRARY_PATH which using native
> libdevmapper.so.1.02
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  recipes-containers/skopeo/skopeo_git.bb | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
> index 6c95bf3e..19ac938b 100644
> --- a/recipes-containers/skopeo/skopeo_git.bb
> +++ b/recipes-containers/skopeo/skopeo_git.bb
> @@ -84,6 +84,9 @@ do_install() {
>  do_install_append_class-native() {
>      create_cmdline_wrapper ${D}/${sbindir}/skopeo \
>          --policy ${sysconfdir}/containers/policy.json
> +
> +    create_wrapper ${D}/${sbindir}/skopeo.real \
> +        LD_LIBRARY_PATH=${STAGING_LIBDIR_NATIVE}
>  }
>  
>  do_install_append_class-nativesdk() {
> -- 
> 2.27.0
> 

> 
> 
> 

