Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web12.1939.1586898452654019636
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 14 Apr 2020 14:07:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=totJZ121;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id du18so672642qvb.4
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 14 Apr 2020 14:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IFp/tzz13UMgIzZAKXaDW6rANsEofJHJN/K9nZI1pbA=;
        b=totJZ121ALfjb3ykn4I+gPvuk/Br/34wx1m0GHlnTiNImSPJghPLVa+ogQtalcmEZW
         OMHGuVDfpf2/JsKEi0LdhFlqopS0lKddaMGdeEO/FDBVOQK44lyLGxzdn1oUdnf7Bmkm
         LVB3mmYLOXq2dO/WxqTt/n3WBW1qxWijKFAjdsbYzrlLcp/OmOyeRUN7pN+87L8nXsZy
         FMR2daKiwNeA6+fndVyw7ZE/129dX4BRyLT6yHcLPKL0QSxC8Xl9E62lYFbqCY6Xp7Ah
         HAUTSPbYrmNiZofpy1XTTtoRPW637a4u2l42DluX0EluwXqrxSk+pYY5qloU9ElClze7
         PO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IFp/tzz13UMgIzZAKXaDW6rANsEofJHJN/K9nZI1pbA=;
        b=jq29yfLa2CznfYO/R5nQZycFTavdp7JvsywhJQsfoSz/cfLTRYWOYZm2ZddKjD0XQd
         VthIf20p7Jhyw4aoNYt9KRFEigvBuhXV0xgGMG1YwLgOpfx9pcxwfRppOYJ85tCaxtya
         lEoGNc51OGyUrtGbvBjnNxYHqVyhDJPqEctFJ369OHhtGQXcYGUGuEsYPNWHhXEG9CxU
         2E5xwGauf/53KHQe/51r2NL8/2OMr3QJWsaxvw6rLCkDuIZU9oKI26kqeiH+g8KzpvU2
         ou6taJafxDk7W9XDIyhavmZh6NQlTixKSt/yOj2arCThuZIkvvW+2z/kxj/JhcuDqozg
         eyAw==
X-Gm-Message-State: AGi0PuZhAtD9PNqBMsuOahIJjUTYPj/3r6z8afNEG2FZcZ4jDciODLZx
	wCP3yf2pWusSHMwBkxjx7uU=
X-Google-Smtp-Source: APiQypI3XZCWmdAqMyRsh5O+rMhhmCJBJmbICb7CIkQrmu5a+J4rFZ1IFXln6Aas34mnLO2jlySM9g==
X-Received: by 2002:ad4:54c3:: with SMTP id j3mr1972606qvx.241.1586898451606;
        Tue, 14 Apr 2020 14:07:31 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id s188sm11516174qkh.67.2020.04.14.14.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 14:07:31 -0700 (PDT)
Date: Tue, 14 Apr 2020 17:07:29 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: "Xu, Yanfei" <yanfei.xu@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 0/1] correct the LIC_FILES_CHKSUM and LICENSE fields
Message-ID: <20200414210728.GB4489@gmail.com>
References: <20200414111353.8404-1-yanfei.xu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20200414111353.8404-1-yanfei.xu@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce


In message: [meta-virtualization][PATCH 0/1] correct the LIC_FILES_CHKSUM and LICENSE fields
on 14/04/2020 Xu, Yanfei wrote:

> From: Yanfei Xu <yanfei.xu@windriver.com>
> 
> Hi maintainer,
> 
>    There is a mistake about "LICENSE_" field in the last patch 
> which is "[PATCH] lxc: uprev from 3.2.1 to 4.0.1". Now fix it.
>    BTW, with a md5 checksum comes from bitbake messages for 
> an non-existent lisence file specified in LIC_FILES_CHKSUM, the 
> target lxc can still be compiled successfully. And I have reported 
> this issue to Robert Yang.
> 
> Thanks,
> Yanfei
> 
> *** BLURB HERE ***
> 
> Yanfei Xu (1):
>   lxc: correct the LIC_FILES_CHKSUM and LICENSE fields
> 
>  recipes-containers/lxc/lxc_4.0.1.bb | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> -- 
> 2.18.2
> 

> 

