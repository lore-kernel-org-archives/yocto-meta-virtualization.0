Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web11.16685.1581455544583322542
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 11 Feb 2020 13:12:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AzJs+L8U;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id d11so11636235qko.8
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 11 Feb 2020 13:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1vuDqXQAT3O6zlOWLp0IE6TCq7nJlQvIqdQhGhO3q5g=;
        b=AzJs+L8UhEhk6uVwbvvc6aJdHx22ZQZHZyHpi+YAzN++/qMXIvqOclaLU7lRz7/Ebj
         m+Ohzitm9lBbBzxloUPyCuY8Xl9RSTs56Y20O7Y3N2pSPjteLaX4JhHWWwbS2V2lvUMS
         kHXCY1HubwAAaIDwSCsiNE65oEar8k2Iu95SsS6/DZnv0oUJO4E6Gp+VQ6xtwI7ur1of
         MEE5FuSiUPJfcc73ZLbeY2XVUf8Ie8bDysKk/2IFAexmdqU9362pW9iIM0ahQ0e9KgdT
         QFaFS7nv/hVeGBYxWB9eg7ivtlLm71yjFuSj4BQF2mAn5lD3QYbVCfLPMwzY4vqvPyfa
         afmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1vuDqXQAT3O6zlOWLp0IE6TCq7nJlQvIqdQhGhO3q5g=;
        b=BT3jP3v+MhlwXb8ggUntCluDf1cttY3f5kQwVXVaEXloj5tOnx8ShFevf4IcETzgSO
         /C5PyjtPVehTjNOLhrNGqz/Of3LWAxW2L2Nh2XZ8NjMp7pmi4dGvzZmhR9Wyzqjkg6Oj
         UJZDT+x/iDtVwTs3ICEpACaeiXcOZRp9UTWCVyO0iuih6R689W4NTUXlr9rzOm69V1Yj
         MUFzFJ6WDrRqc8wrwEpsTE8EfLFmTsIOePp4ZAqKkLmsKJkbcvsTXpqbpoyL0NPI8IqL
         EAGunmBvD7JEI5D0ipqLcskh+iLYxBNY6VB5Gg6gL1WsRBWMnITp81akDzLa+58JeApK
         +U5g==
X-Gm-Message-State: APjAAAVHtp8X9+zKPVzBdKBv4cwclLgDiRec9zb4THEbwDILrq9DR0JX
	GwTDg1KfMNrKXo+ZccwTrV0=
X-Google-Smtp-Source: APXvYqzBI6fiTqcK0PxfRBWMGamEELlRVrMarNRNTsxCAN+NvIZqtBRg8jTzKpkIg9dxuyGpZfjzqQ==
X-Received: by 2002:a05:620a:535:: with SMTP id h21mr1409627qkh.184.1581455543707;
        Tue, 11 Feb 2020 13:12:23 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com. [174.113.11.95])
        by smtp.gmail.com with ESMTPSA id z6sm2696121qto.86.2020.02.11.13.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 13:12:23 -0800 (PST)
Date: Tue, 11 Feb 2020 16:12:21 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][m-c-s][PATCH] glusterfs: change pythnon2 dependencies to python3 ones
Message-ID: <20200211211217.GA37360@gmail.com>
References: <20200204023832.59416-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20200204023832.59416-1-Qi.Chen@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce


In message: [meta-virtualization][m-c-s][PATCH] glusterfs: change pythnon2 dependencies to python3 ones
on 03/02/2020 Chen Qi wrote:

> Change python2 deps to python3 ones.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-extended/glusterfs/glusterfs.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/glusterfs/glusterfs.inc
> index 4eb325f1..a5677840 100644
> --- a/recipes-extended/glusterfs/glusterfs.inc
> +++ b/recipes-extended/glusterfs/glusterfs.inc
> @@ -119,7 +119,7 @@ INSANE_SKIP_${PN}-server += "dev-so"
>  PACKAGES += "${PN}-rdma ${PN}-geo-replication ${PN}-fuse ${PN}-server \
>               ${PN}-api ${PN}-ocf"
>  
> -RDEPENDS_${PN} += "python3-core python-json python-ctypes bash"
> +RDEPENDS_${PN} += "python3-core python3-json python3-ctypes bash"
>  RDEPENDS_${PN}-ocf += "bash"
>  RDEPENDS_${PN}-server += "bash"
>  RDEPENDS_${PN}-geo-replication += "python3-core bash"
> -- 
> 2.21.0
> 

> 

