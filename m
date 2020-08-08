Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.3395.1596852702526065937
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 07 Aug 2020 19:11:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=B12IQFVE;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 64F86E01FB0; Fri,  7 Aug 2020 19:11:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FAKE_REPLY_C,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	URIBL_RED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	*  0.0 URIBL_RED Contains an URL listed in the URIBL redlist
	*      [URIs: yoctoproject.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.222.178 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  1.5 FAKE_REPLY_C FAKE_REPLY_C
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CE335E01FAE
	for <meta-virtualization@yoctoproject.org>; Fri,  7 Aug 2020 19:11:40 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id l6so3481265qkc.6
        for <meta-virtualization@yoctoproject.org>; Fri, 07 Aug 2020 19:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=6ulV7xTrI6XbCIQTO9mkTaaJKrBnmexDeGetY81gdL0=;
        b=B12IQFVEeZNOWkwN/e/XmqX9D3nKiwuILkkp2nu85KUgbpZYmDa7RuOYjoYhRLl/gw
         Efp+G5mYrUTXT9wz5z1C5C54SfgFGQ1w2YioAZG5QWjuiePqXnx1+C4q77yLi+cTncCr
         tq4IisuP71h+qp86n9F/6cIBDsEob0ULG04NhVEG6p4ownmhXwvFx9+2Cmdmq6XNcpVs
         7lBAofV5Rfo51BUcEcJXCNgaCa25cMdhspS6eiQgFx1GfTzJ8mtbcytI2Dz7iJfN1J3L
         LBoZfXboSUiR06z3m+jdDrespnfoYVFHHwtFQX1onWLMXUqqf9tqDeZJjngwoy8r6Djv
         fp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6ulV7xTrI6XbCIQTO9mkTaaJKrBnmexDeGetY81gdL0=;
        b=Zft9kQF69vaLMRS7vuh1gUjrHYmFJvNhBILbI0AgyEeJd7L1SZXuSwbUxTYhORFYib
         2fImd+rpY98sp/PkKJsra7etxNPN98IOczh5nU6IIUlMv3TqWH3zRuW1J+aNv/WG+H2w
         i0STAKtJaNIyA/pbJsTVYLjgnIIfVtkA3wNhDRL8tboQ59HV5G0O8e5GR3/dBykgoRa3
         J5h8gElfWRoZo0pLvhqtXPDvTHWdnkfZIPl7OQtMObYsFNiV2M+XsePzFJ1aHNHunv30
         08G0vHhQdth5dIva14ziEy7FAuM8YYFSjyOk2xTrkjlkwZGjZQ8A/lvxsDPgSudVNgq0
         zaIg==
X-Gm-Message-State: AOAM530ZIE0aJxR8R2IfJK2d19tKdUFBHPDwUTDINY7b905KennzeaeK
	wA6+mutX3L40j9EwPtPwahn67U6JWtKEBA==
X-Google-Smtp-Source: ABdhPJwpSvptu0LyLIMjNkcxKFiUUMgaM3G7cVO2kC4kodL3Z7uBHjSekfhaW5cp/KVvq52BtzZtnQ==
X-Received: by 2002:a37:48c7:: with SMTP id v190mr15906711qka.153.1596852699789;
        Fri, 07 Aug 2020 19:11:39 -0700 (PDT)
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id u37sm9648548qtj.47.2020.08.07.19.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 19:11:39 -0700 (PDT)
Date: Fri, 7 Aug 2020 22:11:37 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python3-xstatic-term.js: Change to python3
Message-ID: <20200808021136.GB1371@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1596560983-7709-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1596561046-7768-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1596561067-7808-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1596561141-7862-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1596561155-7900-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1596561176-7938-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] python3-xstatic-term.js: Change to python3
on 05/08/2020 zhengruoqin wrote:

> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>/
> ---
>  ...atic-term.js_0.0.7.0.bb => python3-xstatic-term.js_0.0.7.0.bb} | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-xstatic-term.js_0.0.7.0.bb => python3-xstatic-term.js_0.0.7.0.bb} (100%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-term.js_0.0.7.0.bb b/meta-openstack/recipes-devtools/python/python3-xstatic-term.js_0.0.7.0.bb
> similarity index 100%
> rename from meta-openstack/recipes-devtools/python/python-xstatic-term.js_0.0.7.0.bb
> rename to meta-openstack/recipes-devtools/python/python3-xstatic-term.js_0.0.7.0.bb
> -- 
> 2.25.1
> 
> 
> 

> 


