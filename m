Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6DFE3E00D98; Tue, 24 Sep 2019 14:56:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.166.67 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E2D1EE00D89
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Sep 2019 14:56:04 -0700 (PDT)
Received: by mail-io1-f67.google.com with SMTP id j4so8246999iog.11
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Sep 2019 14:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=+cry72vEVcPM9LPjtOTU5hsPGo1qQeYZuv3DShGppzQ=;
	b=RfLzl9zeBCed1tknsHGKr5HZcHXXvLGP1b0cjvYW/UfH9LZFnbybs2WjOegsQ+Gktm
	eXhGu25rj1gNDJavkGDLU8fX6ewqgKS7+pBE32LCuiA4lmGgr/ExZbQhnysFi9J2amwE
	aEY76VfcuSj2sPenszcS5I5q2CcxV8WqS1DfWlhAhX0cjZMAjsAT8O2Jj3auyJ8YozNn
	sRwSRdCgIbV/X+WvGe3bxJ1exD529aRzF4G6mHrdy5oCGhaulyObTM/rNYGbYpqhuztn
	fJ0RSlO3VMF4XHoYODDyV4/zciduz+rZUjmblWGoO0YQb3dmUEHyaaYF/cPJk7TQsg/D
	jcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=+cry72vEVcPM9LPjtOTU5hsPGo1qQeYZuv3DShGppzQ=;
	b=DnE2Ny4DHupC3FUBdI+Kk4OH2BYdGui9f/HbFTMzDT/nU3+XGTWikFwG/pyEUb6A8f
	aQfRAPbDjnJjx/MMFcnGLqAiik6JhLZAJRaIEcKzS4o9MychBixuPjZuHATlHpw5qFrb
	6ktQt3LJqNsjOZAdbFafQAaMHhsBbGrY0dv262Ywh93f3Fp/blg8Yo1TCNYLNfC4mOmt
	cVEMgR3V+YCL7k7Lh+o0dd24jV+9wPYApBe8De2ZD4mDmf37mHiSWapRLtFKIoi9aoio
	M/QPzZOM7sz3BMqEPuOR7wEzpw2l2sguR5N5o5llfydqFqcV7wuBhqWmTNQ9ZSiKBPZO
	4CKw==
X-Gm-Message-State: APjAAAX09nGMmuE5ZCl0ly2INmQJCuwiS2oVr4tFRpYDFh0M9PQOck8a
	7MD3CXORQ26hkLJNwNwP378=
X-Google-Smtp-Source: APXvYqzO3WnqDr/KZ42gKq/1ifMVePmJ1orvy514l8vVzYDZwd2bMhO6sMd4LPewieY+0l5tG5YXMA==
X-Received: by 2002:a6b:c409:: with SMTP id y9mr2664603ioa.155.1569362164385; 
	Tue, 24 Sep 2019 14:56:04 -0700 (PDT)
Received: from gmail.com
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	u11sm4083168iof.22.2019.09.24.14.56.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 24 Sep 2019 14:56:03 -0700 (PDT)
Date: Tue, 24 Sep 2019 17:56:01 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Message-ID: <20190924215559.GF54158@gmail.com>
References: <20190924072955.8513-1-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20190924072955.8513-1-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-arrow: upgrade 0.12.0 -> 0.15.2
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Sep 2019 21:56:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] python-arrow: upgrade 0.12.0 -> 0.15.2
on 24/09/2019 Zang Ruochen wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-arrow_0.12.0.bb => python-arrow_0.15.2.bb}         | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-arrow_0.12.0.bb => python-arrow_0.15.2.bb} (71%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-arrow_0.12.0.bb b/meta-openstack/recipes-devtools/python/python-arrow_0.15.2.bb
> similarity index 71%
> rename from meta-openstack/recipes-devtools/python/python-arrow_0.12.0.bb
> rename to meta-openstack/recipes-devtools/python/python-arrow_0.15.2.bb
> index 46a4021..d2d0616 100644
> --- a/meta-openstack/recipes-devtools/python/python-arrow_0.12.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-arrow_0.15.2.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=458d41a4064e4dc109666cfd941a29e4"
>  
> -SRC_URI[md5sum] = "fafb41dadf2134688797bf1102eebeb6"
> -SRC_URI[sha256sum] = "a15ecfddf334316e3ac8695e48c15d1be0d6038603b33043930dcf0e675c86ee"
> +SRC_URI[md5sum] = "554f18b0e23182ee0e8cb2a882d2f607"
> +SRC_URI[sha256sum] = "10257c5daba1a88db34afa284823382f4963feca7733b9107956bed041aff24f"
>  
>  inherit setuptools pypi
>  
> -- 
> 2.7.4
> 
> 
> 
> -- 
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

