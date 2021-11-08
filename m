Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web12.45211.1636381217332613971
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 08 Nov 2021 06:20:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jpZDARIg;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id bq14so15576567qkb.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 08 Nov 2021 06:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HLAd5ux1nJ5b2gFyFhTry1ve/eqlwJW+jpt5MeXovt8=;
        b=jpZDARIgWRce8aX+tBB+C7Ayu92oW5/8G0U96DkyyEaLSA5tu2EjYRkrdpcBJu8wru
         iQau/UVfvy/lbHWBJ2/Zc/5nX5wEfxdbo1rbunFEWQ1xqvc3G9/FzqKO1YCtwnvzU57u
         ukUX0grH5R4m768G1LLk2gyy8pL3YNBkFTY10MKie5OcJ24BtlXrIw9uWcNCRR84j2Js
         LmWjstchUzEMY/FryJQTLzZTU+60BQZky6g4QFLGu+r1MoRUAtJfqEG9hFEIXralOvPy
         kYRcb+WAuiOY0OEW9qp9vBmVfTUSK2O4kiqqHzxKAnsmHQrwIXD3Q+XARipXOPGhbYaR
         4GKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HLAd5ux1nJ5b2gFyFhTry1ve/eqlwJW+jpt5MeXovt8=;
        b=H+mPMCfcjvaDtsFkdnPGDfjNdjGrzu4/Eg5o5poP2TXAWiR97279417Dbf5vEdcd8L
         cLdsVfp53503rJKva6jypTaL2CE8WLGMjEgpzUthAAc/Mh1NUhWWs9CLO/9cMpMGltS6
         rZamHmWRGpcmYNurbiM9Hl9f+Itc8bPluh1ataL/he/q1ISkz99QihOyzb3nb4grwSHy
         qW8QO3yGkh0nboV48gIVENZMbfWgbjtSQTvQngKcqvozm4230MHLTiN6XXFU8fGKSqNF
         1xVm6WsEbTnl9Aqeo08CFexy81LK1sb1R5/r98NMPLszzlcUjLxuj+Lv7301gNuWFOGb
         y7Cg==
X-Gm-Message-State: AOAM530PWrMGMN9Hi/tyr86g3kr/XXpvRA/vA0OpP4cDbDoJT27EnNW6
	NLq2HuFOQVS47UAUpTsT9pbn1Dm77FpA6g==
X-Google-Smtp-Source: ABdhPJy+oC4HGSNezWD7FtfLkDkLtufgLvVjlnUdPDQoc3QWa3BfYSj+YH0e8h0wJlbXLozgxv290Q==
X-Received: by 2002:a05:620a:2686:: with SMTP id c6mr65510282qkp.223.1636381216457;
        Mon, 08 Nov 2021 06:20:16 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id y8sm10208458qko.36.2021.11.08.06.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 06:20:15 -0800 (PST)
Date: Mon, 8 Nov 2021 09:20:14 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 2/2] yq: convert github SRC_URI to use https protocol
Message-ID: <20211108142013.GB18783@gmail.com>
References: <20211107173723.700787-1-Martin.Jansa@gmail.com>
 <20211107173723.700787-2-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20211107173723.700787-2-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ha! I managed to miss the main repoistory (with the GO_IMPORT indirection).

I've merged this to master and honister.

Bruce

In message: [meta-virtualization][PATCH 2/2] yq: convert github SRC_URI to use https protocol
on 07/11/2021 Martin Jansa wrote:

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-devtools/yq/yq_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/yq_git.bb
> index 3e48fee..1fccb12 100644
> --- a/recipes-devtools/yq/yq_git.bb
> +++ b/recipes-devtools/yq/yq_git.bb
> @@ -15,7 +15,7 @@ SRCREV_logging = "b2cb9fa56473e98db8caba80237377e83fe44db5"
>  SRCREV_yaml = "eeeca48fe7764f320e4870d231902bf9c1be2c08"
>  
>  SRCREV_FORMAT = "yq_color"
> -SRC_URI = "git://${GO_IMPORT};name=yq;branch=master \
> +SRC_URI = "git://${GO_IMPORT};name=yq;branch=master;protocol=https \
>             git://github.com/fatih/color;name=color;destsuffix=build/vendor/src/github.com/fatih/color;branch=master;protocol=https \
>             git://github.com/goccy/go-yaml;name=lexer;destsuffix=build/vendor/src/github.com/goccy/go-yaml/;branch=master;protocol=https \
>             git://github.com/kylelemons/godebug;name=debug;destsuffix=build/vendor/src/github.com/kylelemons/godebug/;branch=master;protocol=https \
> -- 
> 2.32.0
> 

> 
> 
> 

