Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.577.1620323754784858680
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 06 May 2021 10:55:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OSkB2d+/;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id g65so3851419wmg.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 06 May 2021 10:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CbAXDCivYx04VKu7zdToihu3e3kHy5LnHran8i0LwI8=;
        b=OSkB2d+/ymTHeTQxSjnqmwa+VooMZIiT4WDQfgWx5/8QxeQhohu9rRBOb7dYkiv8YQ
         4U0DqhU8UDaaKmfp+yOmmC0Q37JNkVSje/iI51nHNdPdBKXKV81i1qLnlwhovSJOTIux
         bvlE7ST+R54KNvCpah4kRUyZ1eZEHJ0gekQq6iGOWe+ZzCmQ1xaSZf5ReVOny2GUHoG9
         811yBedMC0N7EgD/uuf1ZBDcK14KXxV4yQy4U4uwbYL66rYOqcBtUTyUVgz4Z+njeKAN
         i57eH4EKlk8kaSE3VRHv1Yu8j0PCWcSi/ceOD/aqWIEOUtAchUeSoLhhLWujnOscR3ek
         Z/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CbAXDCivYx04VKu7zdToihu3e3kHy5LnHran8i0LwI8=;
        b=HwGGdeeXH2zuWLTXS1MvxvfadaoghDnsE5px+iyZCN9kzLd7i8UNLYj+MJWcBWr7Sv
         CCoG1s2Ixq+aVb0OWIQ4/Clfr9zz2J0M7t4MVNndAdT0IyKHtTwBRogH2r6qJtxd+sQJ
         rc/zxY46U6nzBgcrIFMn2jxOZr9JlI39NmPDrbpZldZdLZosiDp2Fi6vwZGm6tUoBIFi
         mTSSN9LZ1Y4VZkRF6koRr6hTVmAt0ASVvSM5i0Zaa2QoLy/tqI0q/m7O6cpdFOqtqVx2
         xbED0J9Hsgee/9DTYOjAxw1sv+VLG91KE2oM4+09o7O0acFzM9z9mfUcFmaFescdZKcf
         D2CA==
X-Gm-Message-State: AOAM530B+gbtYUw16x1pDxztGLpCDAIHwu9be3nU8Ia/c+WdcX8TWcXx
	TDJOomKRUJWk3gDs2K8wrHA=
X-Google-Smtp-Source: ABdhPJz2C+mU/l20wBLmba3e8aIlAtbnR6kLt0hPOwuCLctS7d7kRgFwmdzZQ1opqnWrvrbN3qvgsQ==
X-Received: by 2002:a05:600c:2f08:: with SMTP id r8mr16950972wmn.129.1620323753203;
        Thu, 06 May 2021 10:55:53 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id z66sm12321788wmc.4.2021.05.06.10.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 10:55:52 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 6 May 2021 19:55:51 +0200
To: Khem Raj <raj.khem@gmail.com>,
	meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] runc-opencontainers: use bfd even with ld-is-gold
Message-ID: <20210506175551.i2fe4melaqd6yzrk@jama>
References: <20210503134041.2962422-1-Martin.Jansa@gmail.com>
 <f58ef464-89ce-755a-988b-5ebc6fc28fbe@gmail.com>
 <167B98ADE3C05EB1.24705@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <167B98ADE3C05EB1.24705@lists.yoctoproject.org>
X-Groupsio-MsgNum: 6492
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2fyfyhtne4wtdj3y"
Content-Disposition: inline

--2fyfyhtne4wtdj3y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 03, 2021 at 05:39:10PM +0200, Martin Jansa via lists.yoctoproject.org wrote:
> runc-opencontainers is the only recipe currently failing like this for me
> with gold, so instead of switching system linker I would prefer to force
> bfd only here.

In my world builds with ld-is-gold I've found only 2 more recipes which
trigger this internal error.

> But there is also one more issue which is probably introduced by gcc-11 (I
> had older version of your patches with 11.0.1 in my branches, so waiting
> for build to confirm if it's reproducible with 11.1.0 as well):
>
> NOTE: > Executing update_font_cache intercept ...
> NOTE: Exit code 132. Output:
> + '[' True = False -a qemuwrapper-cross '!=' nativesdk-qemuwrapper-cross ']'
> + qemu-i386 -r 3.2.0 -E
> LD_LIBRARY_PATH=/jenkins/mjansa/build/ose/honister/BUILD/work/qemux86-webos-linux/webos-image-ros-world/1.0-r3/rootfs/usr/lib:/jenkins/mjansa/build/ose/honister/BUILD/work/qemux86-webos-linux/webos-image-ros-world/1.0-r3/rootfs/lib
> -L
> /jenkins/mjansa/build/ose/honister/BUILD/work/qemux86-webos-linux/webos-image-ros-world/1.0-r3/rootfs
> -E FC_DEBUG=16
> /jenkins/mjansa/build/ose/honister/BUILD/work/qemux86-webos-linux/webos-image-ros-world/1.0-r3/rootfs/usr/libexec/fc-cache
> --sysroot=/jenkins/mjansa/build/ose/honister/BUILD/work/qemux86-webos-linux/webos-image-ros-world/1.0-r3/rootfs
> --system-only -v
> qemu: uncaught target signal 4 (Illegal instruction) - core dumped

In case someone sees this Illegal instruction as well, then in my case
it was caused by missing "-cpu n270" in qemuwrapper-cross script,
because of how webOS sets PACKAGE_ARCH to be MACHINE_ARCH by default
QEMU_OPTIONS didn't include QEMU_EXTRAOPTIONS_core2-32.

It used to work with default cpu in qemu-i386 until now, I think it
stopped working when fontconfig was rebuilt with gcc-11, but not 100%
sure.

--2fyfyhtne4wtdj3y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYJQtpQAKCRA3VSO3ZXaA
HFOtAJ97fgkTVvocYXuUcK9mOPGCaTDcjwCdHIU9dLOWSQLh0Fb6LYSBLJwDpcw=
=Muqe
-----END PGP SIGNATURE-----

--2fyfyhtne4wtdj3y--
