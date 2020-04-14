Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web12.1917.1586898382562852142
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 14 Apr 2020 14:06:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Jcg16DnH;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id c16so5786975qtv.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 14 Apr 2020 14:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=jYp91CCA7ecgzzjRN9bImtopWLUd1hbcKHCGYqLejb8=;
        b=Jcg16DnH3rNN56U0eBi6Pfe2EajsxQmP7Iu9s92DcNhPDSP7gMsOSqKuf31o7a9qWb
         CJNytjOt4Nbo+Fl09RIyjw3GQK4zf+z+evT3PRdc24IcYrg7sOpjDaHXn9uZGF0QzVYW
         ngPTZMDEO3n4VERHavRgrhk7lbxri5wbyV/+neQuqzbeed3PIJ4wn2k3fC3h80z9jvod
         AL9EJaC6uKgHYGD7MHDOsGFbCO+XF8HQpCZqiqokjSGBsBcnWV4+oYLE8O49yv4is+a0
         ga/MGGW+0xy0PrwRM2LEutrIwo0HssTxPNsqhe20l5yBManfO9BuYaCCbrqQpjC4SoT3
         NdpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jYp91CCA7ecgzzjRN9bImtopWLUd1hbcKHCGYqLejb8=;
        b=NUkUwHNNzZf91i9LMovH2YBJui7OoZ3z9QvngeEvRFaTAARWwQEQRtez3ZYQdF5jd2
         YvqfClbvlEn8mt7PcZyg50WSRgl1bWa63PecJOs7dnUwbrn69WRv6EalHQ5w+n4esX2w
         J9vJF9Y2v4WyfeYVZAXBNgI2FvDT1WTef7j8APM26HXTt1sxsqYR4/UE2ZidY5/ZXoJT
         I1oNRP2q7/MLbfoxQVmPmE5PuBCqhvrmemFPxcpD1RJvFkJn37vX65pgtLMZRFzTuCJV
         tXaP+r7VwAV67qBHqsnAkh5YD1p8qjCI/4H7/BXJARwedhoZ1zcI3bF8676FETFRyp56
         Zsvg==
X-Gm-Message-State: AGi0PuY+sTGj41qU+nBMsI1ciwwt+DeWoF36ssumpMKwRvvTK4CC19I4
	tadtvvQbYFOqjluPNiQACLc=
X-Google-Smtp-Source: APiQypKpZazcaYkIqIs53e7exUl3Z4aBH2Abmcdux9WphRqKwW+JXU49/lMV4HvTiNXAh/788s2UcQ==
X-Received: by 2002:ac8:4757:: with SMTP id k23mr17903725qtp.206.1586898380137;
        Tue, 14 Apr 2020 14:06:20 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id n63sm11299642qka.80.2020.04.14.14.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 14:06:19 -0700 (PDT)
Date: Tue, 14 Apr 2020 17:06:17 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: hongxu <hongxu.jia@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 1/2] ceph: fix installed-vs-shipped QA issue
Message-ID: <20200414210615.GA4489@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200414065254.64863-2-hongxu.jia@windriver.com>
 <20200414065254.64863-1-hongxu.jia@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization][PATCH 1/2] ceph: fix installed-vs-shipped QA issue
on 13/04/2020 hongxu wrote:

> ...
> |ERROR: ceph-15.2.0-r0 do_package: QA Issue: ceph: Files/directories
> were installed but not shipped in any package:
> |  /lib/systemd/system/ceph-immutable-object-cache@.service
> |  /lib/systemd/system/ceph-immutable-object-cache.target
> ...
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  recipes-extended/ceph/ceph_15.2.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/recipes-extended/ceph/ceph_15.2.0.bb b/recipes-extended/ceph/ceph_15.2.0.bb
> index 2b7b2c1..1893086 100644
> --- a/recipes-extended/ceph/ceph_15.2.0.bb
> +++ b/recipes-extended/ceph/ceph_15.2.0.bb
> @@ -43,6 +43,8 @@ SYSTEMD_SERVICE_${PN} = " \
>          ceph-mgr.target \
>          ceph-crash.service \
>          rbdmap.service \
> +        ceph-immutable-object-cache@.service \
> +        ceph-immutable-object-cache.target \
>  "
>  OECMAKE_GENERATOR = "Unix Makefiles"
>  
> -- 
> 2.21.0
> 

> 


