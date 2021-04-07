Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web12.497.1617755805117452998
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Apr 2021 17:36:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sHuTQgMC;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id x11so17001322qkp.11
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Apr 2021 17:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=09fGjjm+UsXfQcmUSeGgJj5eDLM8NxqmAjtbNv8b/dY=;
        b=sHuTQgMCabM+INCEgqWhI4pWiZ1TmV1WR8uYth3mlwEQRlmUDCdNX4VVt6ef8twPkt
         /Bw0LCyxclSUg2ZduIV4/kxI+TtqBAuYQ637agVgyZdv2TvirN+seHnT4TRaRrUzhWG+
         vhOzag8/d1TpmyNSTCH+TQBnU1yfCnK1M4q01QIcHRInjjm2nQqzXybuZX5tGZL1L1cl
         czk7CesiVChWwz7+00MkvaDhpWqVFSEdzT/trvupl/VoThjRjkjeoF3C8xGAtRZLB6NY
         SI2PZ72dyMKom2EzMfCJQy6GkBLeB+GEZWEyhFcjMisRmY6LbL8e6UpzoULMPnv0n/1i
         YW8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=09fGjjm+UsXfQcmUSeGgJj5eDLM8NxqmAjtbNv8b/dY=;
        b=jBtwmaBRIWrQx4zuy3oKVJWAaXZuZ18ddINGJiM1OOqVFchddFlpluEhwNlLm8Qr5O
         r6fq/2GjtQLu5o26Pm3fDfPElhwlSJ+blP+9OgnOyByfVDItmYpXi6GEC5Y1mqLYv++5
         usS6gytk1tvycTdpiBrLsnwYij5xt9zfFv9AS9ypX1IHJjcwXPMSOYWFNHT8bcYw97dO
         DUYc50pX9jtno4qtJTeINgiTmY232LMn9HGE8ZS3Ll4Qp3333iCN4yVA3HJv6Gd+aF7r
         5bkH4WePZY3OtU5qWM6PeQZeXz6nZGtw6YN3XtlCz6s9jhdCCrczVCkTcVXP/j8UhgHF
         +hNQ==
X-Gm-Message-State: AOAM5308L+H7C98sDOvPbbP2YatWITiCkxsutOmK+bcEiFAQxjyPtJcS
	YLGP5k078fmvaqvlX3x1upE=
X-Google-Smtp-Source: ABdhPJxNcYEkHtRiUzQqZy1Ucu4bBlY68JOh4jHiVyeHIzxMRvZt5J0djA12rmOIfzYU9SMv8KSw1w==
X-Received: by 2002:a37:9a07:: with SMTP id c7mr637379qke.352.1617755804281;
        Tue, 06 Apr 2021 17:36:44 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id n140sm16861968qka.124.2021.04.06.17.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 17:36:43 -0700 (PDT)
Date: Tue, 6 Apr 2021 20:36:42 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 1/2] dev86: upgrade to 0.16.21 and fix SRC_URI
Message-ID: <20210407003641.GC25009@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210404092558.2059318-2-Martin.Jansa@gmail.com>
 <20210404092558.2059318-1-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged

Bruce

In message: [meta-virtualization][PATCH 1/2] dev86: upgrade to 0.16.21 and fix SRC_URI
on 04/04/2021 Martin Jansa wrote:

> * don't use github archives
> * upgrade to fix build with security-flags.inc enabled, fixed upstream in:
>   https://github.com/lkundrak/dev86/commit/537e806f8c62b26c5d5fa912f383f4a7d558574d
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../dev86/{dev86_0.16.20.bb => dev86_0.16.21.bb}         | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>  rename recipes-extended/dev86/{dev86_0.16.20.bb => dev86_0.16.21.bb} (76%)
> 
> diff --git a/recipes-extended/dev86/dev86_0.16.20.bb b/recipes-extended/dev86/dev86_0.16.21.bb
> similarity index 76%
> rename from recipes-extended/dev86/dev86_0.16.20.bb
> rename to recipes-extended/dev86/dev86_0.16.21.bb
> index d93e487..d38f7bd 100644
> --- a/recipes-extended/dev86/dev86_0.16.20.bb
> +++ b/recipes-extended/dev86/dev86_0.16.21.bb
> @@ -3,14 +3,11 @@ HOMEPAGE = "http://www.debath.co.uk/dev86/"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
>  SECTION = "console/tools"
> -PR="r0"
>  
> -SRC_URI="https://github.com/lkundrak/dev86/archive/v${PV}.tar.gz"
> +SRCREV = "c6f36cbafa979710b809f117562773dbd6825918"
> +SRC_URI = "git://github.com/lkundrak/${BPN}.git;protocol=https"
>  
> -SRC_URI[md5sum] = "288af53f256300777efc91d97c082fda"
> -SRC_URI[sha256sum] = "533f2a0d2ed61223040f27e5cd007a11d969aaf34f6b709ece122b1e6fc50580"
> -
> -S = "${WORKDIR}/dev86-${PV}"
> +S = "${WORKDIR}/git"
>  
>  BBCLASSEXTEND = "native"
>  EXTRA_OEMAKE = "VERSION=${PV} PREFIX=${prefix} DIST=${D}"
> -- 
> 2.30.2
> 

> 
> 
> 


