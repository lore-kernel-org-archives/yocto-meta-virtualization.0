Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.10192.1619456370213241305
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Apr 2021 09:59:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KJE0iGPB;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id u17so85585016ejk.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Apr 2021 09:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rUcjwG8a8JqKmvMMPW3Incu8Yu4m/F4jFx9OD9gCrqc=;
        b=KJE0iGPBtnhdHVGXwuKwF3WhJ1JpZNVsTp58Sgi63lZGheZhpgD9wV8hRU6tCbEpAf
         GYVHJVSnxN/KjrBGGRI7MLEkjxaNetyakrF+6+0h2ZdyxaYNVaYkCmXi4764K8AOPd7e
         lPbV9TL4ElO50uZY10/ID3QHvHaGzOb1gtJ2u+3++fKG5w2RzKbz9mMYdOHih5+kKEci
         3anO0oQcUUyH1QoCcrDks/ko7sMSkD1OHLXmAM0yjrxWkkZaSLq+MMiyvDplNa97R/2g
         jWeDtm3AY6z4vUYmZfsJuDDoccHMvLsJApbG3pHRoViO0Kbj2a1agQ+CLzBzl3/+lYRn
         X2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rUcjwG8a8JqKmvMMPW3Incu8Yu4m/F4jFx9OD9gCrqc=;
        b=mjkX55YcEC9/ixzWty+OGL6Ozs5q2JvxS039aakLMqOH4zEK4aWSSOh7v5KA0AH/Zj
         JS7Hov6DuIpz/TLnoilnxQPtjBh5WjTluVch+hjrouuqVNFkGHFFDRArVD1ICDz4d5wm
         Di1kR4ZDqlyNSZi9KBbcZ2s55qY3ZYmsLyd0WI0kdVDNleV2YbVYPMWrVSzgdtLdTCVN
         VRg0OUjfU0Xp6cxNovi1M3ZXK1P8730OEDDTes7q2j7ddYim5bh5C6UXb7fIXUS6ccWC
         Z27eUPCAyGvCOmykONl+atINZADQmw/Z184Aca9O0zhW/iwnH+21DvGR7cm/ezGBdPog
         xInA==
X-Gm-Message-State: AOAM533vWF+y8KKvwXDXzBk+pPa5ZWDPXan/3W0ifq/JEAOgXCSJTva2
	JSUC8hauzyKnOMtxEbefWY8=
X-Google-Smtp-Source: ABdhPJzn3O5P1WgQrnAN7+ittIHOxkd9aGV5aaOncxS5ld/EH1ArX9S2xwjevMhR9nYa4+Vwn5F/5g==
X-Received: by 2002:a17:906:3190:: with SMTP id 16mr19717205ejy.355.1619456368652;
        Mon, 26 Apr 2021 09:59:28 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id q10sm309518eds.36.2021.04.26.09.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 09:59:27 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 26 Apr 2021 18:59:27 +0200
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][hardknott][PATCH] containerd: fix fuzz for CVE-2021-3121 patch
Message-ID: <20210426165927.eztmetd5blpr6kk7@jama>
References: <20210426152419.2684694-1-trevor.gamblin@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20210426152419.2684694-1-trevor.gamblin@windriver.com>
X-Groupsio-MsgNum: 6460
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ea2e4p2him3chkgz"
Content-Disposition: inline

--ea2e4p2him3chkgz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 26, 2021 at 11:24:19AM -0400, Trevor Gamblin wrote:
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>  .../containerd/files/CVE-2021-3121.patch      | 849 +++++++++---------
>  1 file changed, 423 insertions(+), 426 deletions(-)

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

Thanks!

--ea2e4p2him3chkgz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYIbxbQAKCRA3VSO3ZXaA
HDUqAJ9+TbMmvlkoDV9J2m+5tYl9Vohp/wCdEINfK2ZJhqWYqy1J3ScmHnYZ334=
=EoyW
-----END PGP SIGNATURE-----

--ea2e4p2him3chkgz--
