Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.4751.1617136989198549500
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 30 Mar 2021 13:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FldYv+LR;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id s2so12905767qtx.10
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 30 Mar 2021 13:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=S+IjNomtInNM6GXGq412sGRCXsdRFv16IaWBV5HBCw4=;
        b=FldYv+LRfB8/vH7lpk3rPXQ08Ws3c8lKGe+f+DAT2isCNHE6SnihddZPRS6OcTrfTo
         jk8HwmhLiEAJX3xUvplAGItMe+L/CGWL00yFG/JpeYOLuVKxL5GugK+S7t1/6WIcmbEA
         534rQ1WEAMXKsPcf2IZqx5vTq+hTn3nkHiPqW5wmX8LOn6WcpEDI9hHhkoVOdCtug4fv
         hqeJxu4OI0lLYttlD8a+OdgdRhNldikeOWB/BuvmtkMQVn4Uw3q9M/EJl/OqkxsrNdXD
         KvKw1j131tmBWZzjXDd12WFNiyCCe1FgI8vxU3pXo43giJWD7ihyrVsuutUXekgiZXhM
         u0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=S+IjNomtInNM6GXGq412sGRCXsdRFv16IaWBV5HBCw4=;
        b=Z9ha9SEnwbeHUJ+zYASpOf462KLkGtihnlcmhgVLHyN3Plgpyvxuj90LvyOpYnWipf
         0O/bcMC0zZDh3gdYxuQDWOXNY82xYw7FrRKtF60DCZP0cNy8UTp5OKCG+WPbwaWkKE05
         SRQLQgRnf8DWYA5ANUCEffo23rDSykKqvtAIFRWmza5Cr2PIagVQ0t+oZXlYSsTcpaya
         TTN8G4P1BNl9NvfFBsAkV+zhCrsLQnNZTjF2fG6MvCMfXnOcbOT3NYX7+TBPBInIkoH+
         RhdtSGHfSqZFZIlYtn4GFrPSTfQUfYbRg4TFiGI7xQd++bt8Ioqh0Ww1XamPrmgGSWNi
         H3tQ==
X-Gm-Message-State: AOAM530KyvwZxvEGrmiSc0FVxvDNclVSzZ37rC1GoyBWM2pB1SS5W9nP
	XYmfRxfaSwOa0EnzYL9L3js=
X-Google-Smtp-Source: ABdhPJz0VyYy7Xvt+E8YjkeOlXoPAg1UptFCqMrqeZfhzfgNS20GQdxMxyClQuv9S3osYTVN0Wty7Q==
X-Received: by 2002:ac8:5a51:: with SMTP id o17mr28889777qta.116.1617136988362;
        Tue, 30 Mar 2021 13:43:08 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id 77sm16985574qko.48.2021.03.30.13.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 13:43:08 -0700 (PDT)
Date: Tue, 30 Mar 2021 16:43:06 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: qiang.zhang@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] ceph: uprev from 15.2.8 to 15.2.9
Message-ID: <20210330204305.GB12428@gmail.com>
References: <20210326063158.4015-1-qiang.zhang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20210326063158.4015-1-qiang.zhang@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] ceph: uprev from 15.2.8 to 15.2.9
on 26/03/2021 qiang.zhang@windriver.com wrote:

> From: Zqiang <qiang.zhang@windriver.com>
> 
> Notable Changes:
> 1. progress module can now be turned on/off, using the
> commands: ceph progress on and ceph progress off.
> 2. PG removal has been optimized in this release.
> 
> Signed-off-by: Zqiang <qiang.zhang@windriver.com>
> ---
>  .../ceph/{ceph_15.2.8.bb => ceph_15.2.9.bb}            | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>  rename recipes-extended/ceph/{ceph_15.2.8.bb => ceph_15.2.9.bb} (91%)
> 
> diff --git a/recipes-extended/ceph/ceph_15.2.8.bb b/recipes-extended/ceph/ceph_15.2.9.bb
> similarity index 91%
> rename from recipes-extended/ceph/ceph_15.2.8.bb
> rename to recipes-extended/ceph/ceph_15.2.9.bb
> index f771baa2..0d821f0b 100644
> --- a/recipes-extended/ceph/ceph_15.2.8.bb
> +++ b/recipes-extended/ceph/ceph_15.2.9.bb
> @@ -16,11 +16,11 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
>             file://0001-cmake-add-support-for-python3.9.patch \
>  "
>  
> -SRC_URI[md5sum] = "cab93dadfe38888561d390fd58b8c947"
> -SRC_URI[sha256sum] = "64c5eaf8c1e4092e59bc538e9241b6d5cf4ffca92563031abbea8b37b4cab9da"
> -SRC_URI[sha1sum] = "77b60c3775cd6e38f2d07870aee550368105c74b"
> -SRC_URI[sha384sum] = "2173c5176e9ff3745e4bc493585a8cf14e9e7737cf575551a010b7b84cd6b88b378dc93e6509b3a696732c51f530fa60"
> -SRC_URI[sha512sum] = "66c7322575165b4747955ac9de34f9f9e2d4361c8cd8498819383883045601b92f786c4336c79369d6f019db1c4524c492faa40cdceed7fc1b2b373ca6ab5065"
> +SRC_URI[md5sum] = "5a949b91199efe130bfe2e57f200eacd"
> +SRC_URI[sha256sum] = "ea7fa2be68b3570c5c3aa02774dca27de20b6f20a8498f65e5c4ef375a209ace"
> +SRC_URI[sha1sum] = "0503649d7c7d9268cb61b03bbe839106988f87d7"
> +SRC_URI[sha384sum] = "57208c126ea8e640c3979073fd64ce58606f17b4b7ed2e005b0792bdfd51b13391af325658d0f68f961f94175d93e891"
> +SRC_URI[sha512sum] = "1f55b0a13bf06df782831d0c9d5f8617c22442ab97fb186e6ccb08183e02bf1756caf8633fa6b1cf156c3fb7b1bdff90a60a1249adfad0b9450036e2329bf8ff"
>  
>  DEPENDS = "boost bzip2 curl expat gperf-native \
>             keyutils libaio libibverbs lz4 \
> -- 
> 2.17.1
> 
