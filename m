Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 49324E00E01; Thu, 24 Oct 2019 10:30:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, FSL_HELO_FAKE,
	RCVD_IN_DNSWL_NONE, 
	T_FILL_THIS_FORM_SHORT autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000] *  1.8 FSL_HELO_FAKE FSL_HELO_FAKE
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.160.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
	*      information
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 51E25E00839
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Oct 2019 10:30:04 -0700 (PDT)
Received: by mail-qt1-f196.google.com with SMTP id r5so39092399qtd.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Oct 2019 10:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ULYlC41EXT0pISVOzOKui8DRS1bJ0gHvly81EU7lUmM=;
	b=D2GhmTlmy2Y8V5HLtICORc+Q6KbunWw7hGY3hxbbvZSueC6JZlgvyD2JvRzkDZnVBC
	zj+ms0IUuPgDJ8Aq4UB0T4sciyn5LhAEmQ76mcOXSZNHjsjoi8ZojM6zKeI8+hS/4DPT
	JeXDI2dKco/bR8+vq8XTd3+VmC5lhHWPauoXRoIbRupghQxT1s7iAdo4ZlRcI3OXpCCq
	pPPAVIPyTXJ35a1wXi+ZKTusStrAzDdlO3ug5VmEMR1WXPBmkS+/i2jN9FdlnCbu/ygG
	qIYbWJ7yyL+etqLw9KBf7QiTsoihmnhh5EhejWAiuuNGzMh/xv1du/aRgVszESngkb79
	Z2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ULYlC41EXT0pISVOzOKui8DRS1bJ0gHvly81EU7lUmM=;
	b=FQLn3Rc149dqvH1Ag02abGPISFik5ure3uH7SoJc+w7tFju/xDh2cJcbzbc29eUOcf
	rFvJNCIMcINUXHdoZGSllZMIQSgyOeEfVNaATacylUbcJ0ZUHOWsFDePme6lyI57HemE
	ofJcLpFGOQPFX8QVsOdOcQm7U+gTis8eKxUwcrgZDiuV1usdWvT2rj2owmyaIcTsWUTL
	zQZ0J5MoSr+Ffn0FuZS3FTy2+SO9Z19Kg6iokOfL4uRxO/p+3tOHnsWDz+jpIj6WdD7j
	lMY1lFCvDZ3/394QW0///vfHVQhDE94vUrQC6bYG+8gQVBd+zRVTpyVZpPiCyOubxPkq
	cQ9A==
X-Gm-Message-State: APjAAAXXaJAjA+pFduyp1M8t8clT6My57CkdfspUyGTEaNRF8Lf9X9kL
	R3BSVLPqLvpIofCEt7UF8SE=
X-Google-Smtp-Source: APXvYqzS4NqCbvdXynZ6PyZAcsb/Z/m8L7H3HiOVAL23jrFKBKFIO1DKIp+2HeC1KRAScmzwKCoabA==
X-Received: by 2002:aed:3c24:: with SMTP id t33mr3150320qte.186.1571938203156; 
	Thu, 24 Oct 2019 10:30:03 -0700 (PDT)
Received: from gmail.com
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	d205sm14890941qke.96.2019.10.24.10.30.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 24 Oct 2019 10:30:01 -0700 (PDT)
Date: Thu, 24 Oct 2019 13:29:59 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Joakim Roubert <joakim.roubert@axis.com>
Message-ID: <20191024172956.GA44557@gmail.com>
References: <20191023102439.16346-1-joakimr@axis.com>
MIME-Version: 1.0
In-Reply-To: <20191023102439.16346-1-joakimr@axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: meta-virtualization@yoctoproject.org, Joakim Roubert <joakimr@axis.com>
Subject: Re: [PATCH] kubernetes: Set correct PV release number
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
X-List-Received-Date: Thu, 24 Oct 2019 17:30:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: [meta-virtualization] [PATCH] kubernetes: Set correct PV release number
on 23/10/2019 Joakim Roubert wrote:

> Commit c97fe5036ef3df2967d086711e6c0c405941e14b is Kubernetes v1.16.2
> (see https://github.com/kubernetes/kubernetes/releases for verification)
> and building with the current recipe generates v1.16.2 binaies although
> the package names state v1.16.1.

oops. I missed that when I was uprev'ing it to the release.

merged.

Bruce

> 
> Change-Id: I5701c18cc3ce205ad906eda2595d9ad7f5748b17
> ---
>  recipes-containers/kubernetes/kubernetes_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
> index 6cc05ea..fae554d 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -5,7 +5,7 @@ applications across multiple hosts, providing basic mechanisms for deployment, \
>  maintenance, and scaling of applications. \
>  "
>  
> -PV = "v1.16.1+git${SRCREV_kubernetes}"
> +PV = "v1.16.2+git${SRCREV_kubernetes}"
>  SRCREV_kubernetes = "c97fe5036ef3df2967d086711e6c0c405941e14b"
>  
>  SRC_URI = "git://github.com/kubernetes/kubernetes.git;branch=release-1.16;name=kubernetes \
> -- 
> 2.20.1
> 
> -- 
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

