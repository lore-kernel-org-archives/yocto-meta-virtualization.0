Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.1790.1621966429862250719
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 25 May 2021 11:13:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Eiw3ZTOp;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id m13so23739473qtk.13
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 25 May 2021 11:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JHkpEg1HuABMCZ6wsn3w+FNCN2fSJsvUAl7akQIFMrU=;
        b=Eiw3ZTOpoMqsGldi5AKiyGwlfHOWS4BGv9dp0afGV8ukMn/ftB8MGxFRexWsNgFkKG
         HiLg3org7pSEnF6CRyJjGj8SGgXuFYQ1CsJLF8jlzEQeMEAT4JQWzzXzSkvM2evShwgE
         6O5EJUc7kMdu81VAYcBtGReZXOaHxm4dGvEg5C0PobqPnKEIGSydMsrvmaM/CfX/d76D
         Tlq2O9U2Tb1wx1SAtJ0bgFVymUJp3Hzt9uN5RXl/OVzm4hcUso1D0L2/gWtIhFO10L0D
         MErogiLYIKeoFmrg8u61bw3BdLFmdSY5pAOdYJk7dlU9/zCReSQ/u22Hy/hHSWUsUy0/
         MfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JHkpEg1HuABMCZ6wsn3w+FNCN2fSJsvUAl7akQIFMrU=;
        b=mcmPwMA/MmSAZO2KvtIphr/LbTs7QotIDCU4zWY+TO6oZ2glzhivhL7eIDhUdL7BXD
         R/F9iXjZIvrYG2JOPFNhMAKS10YJYbg0McWdIXyIPiwAWpZ5JUQF2jl3p3PXSCFH+MDJ
         z7G1ezAf+X0fFbUOZ94x0LT0BF4mXnv4PKwgRF4bcbG/8t2hfRNna6xoE016HTjiMUUe
         LPUnua2hLBYsoeRuLszCKpi85Fwx36vfrYsPgd1ywsPWwzk6Daw7On3oiCXPSt1/DDFE
         I6FSBa650aizPhdMCU/DAaWn2gGmtAYQ3ggI3Mu4eINGq+aN7qD0vPZLsrEdnByI2gfw
         rZBg==
X-Gm-Message-State: AOAM533f/wjWRl0holp/ZwakhOYATjRbfoyKr3mJX598Dy5MaWdjsFvd
	URGzYY3wb7TTtn+ikB1h5C4VtO1Hf0+mBcTW
X-Google-Smtp-Source: ABdhPJy55pS11tBKeDXDVbii15sUEA80dBcSAcRVSyarrCdD8ebh0hqO8RHotxbZYZZc+6JkHFQYZg==
X-Received: by 2002:ac8:4459:: with SMTP id m25mr10628845qtn.344.1621966428914;
        Tue, 25 May 2021 11:13:48 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id d11sm14031825qkk.110.2021.05.25.11.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 11:13:48 -0700 (PDT)
Date: Tue, 25 May 2021 14:13:46 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Saul Wold <saul.wold@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [hardknott] ceph: update to 15.2.12 to address CVEs
Message-ID: <20210525181344.GA4340@gmail.com>
References: <20210524152316.3296558-1-saul.wold@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20210524152316.3296558-1-saul.wold@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged to hardknott.

Bruce

In message: [hardknott] ceph: update to 15.2.12 to address CVEs
on 24/05/2021 Saul Wold wrote:

> From: Saul Wold <Saul.Wold@windriver.com>
> 
> Updated sha*
> 
> Fixes: CVE-2021-3509
> Fixes: CVE-2021-3524
> Fixes: CVE-2021-3531
> 
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  .../ceph/{ceph_15.2.9.bb => ceph_15.2.12.bb}             | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>  rename recipes-extended/ceph/{ceph_15.2.9.bb => ceph_15.2.12.bb} (91%)
> 
> diff --git a/recipes-extended/ceph/ceph_15.2.9.bb b/recipes-extended/ceph/ceph_15.2.12.bb
> similarity index 91%
> rename from recipes-extended/ceph/ceph_15.2.9.bb
> rename to recipes-extended/ceph/ceph_15.2.12.bb
> index 0d821f0..9ba72b4 100644
> --- a/recipes-extended/ceph/ceph_15.2.9.bb
> +++ b/recipes-extended/ceph/ceph_15.2.12.bb
> @@ -16,11 +16,10 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
>             file://0001-cmake-add-support-for-python3.9.patch \
>  "
>  
> -SRC_URI[md5sum] = "5a949b91199efe130bfe2e57f200eacd"
> -SRC_URI[sha256sum] = "ea7fa2be68b3570c5c3aa02774dca27de20b6f20a8498f65e5c4ef375a209ace"
> -SRC_URI[sha1sum] = "0503649d7c7d9268cb61b03bbe839106988f87d7"
> -SRC_URI[sha384sum] = "57208c126ea8e640c3979073fd64ce58606f17b4b7ed2e005b0792bdfd51b13391af325658d0f68f961f94175d93e891"
> -SRC_URI[sha512sum] = "1f55b0a13bf06df782831d0c9d5f8617c22442ab97fb186e6ccb08183e02bf1756caf8633fa6b1cf156c3fb7b1bdff90a60a1249adfad0b9450036e2329bf8ff"
> +SRC_URI[sha1sum] = "9c76b298e1e659b9c5501003ac77fb28aab7823d"
> +SRC_URI[sha256sum] = "8710f6700de83765138df8eb4fc7a5e7c66104dd838033e0827a1850f250ac85"
> +SRC_URI[sha384sum] = "2a2f177e5b68f6f5d13b253a8d4daba9e956b4a79a40a4775aee288b60c612fe13b417d6baf77944c32b1181b2136f68"
> +SRC_URI[sha512sum] = "08266a2e9a7ca5a37e03f340873571fd012c630dd898a87241cd97c29760b2bf41fe64c8883e7b08e0f83c26245072cd26e69ecb1db02378d1ec38335ba1cd0f"
>  
>  DEPENDS = "boost bzip2 curl expat gperf-native \
>             keyutils libaio libibverbs lz4 \
> -- 
> 2.25.1
> 
