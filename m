Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4CA36E00D4E; Mon,  9 Sep 2019 10:29:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, FSL_HELO_FAKE,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000] *  1.7 FSL_HELO_FAKE FSL_HELO_FAKE
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.166.54 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
	[209.85.166.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 830ACE00972
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Sep 2019 10:29:25 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id j4so30589423iog.11
	for <meta-virtualization@yoctoproject.org>;
	Mon, 09 Sep 2019 10:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=MvKW9qxD0q8tGz0QsIN0Mt1OJb3piAN+Qq2vn7Q2STc=;
	b=fDHZm4R6elE9hEfJTkzHqURzlGyTTxUydHyI3xAX2407pVDX6JbI0l+W4Pe6MLSZn2
	nRzMrQ2PQYMEYm86zMeiN31IN780f+5RashN4vqkDHSO8+Xe6l6Jj47AAragviizVaEW
	gJou6J8aH7fT5+Bwt+ZJL/iD7jT1FQwvc6i3ZYKc0o1PU1mFkAbtvuWT1gDEJgjg2naV
	HFCalbCmduYj9/DGDD7BRUdtylqFH0CmUjY/41MQDe62q7OmuD9TNir9UejSsiA25sTQ
	K5e2rST90hJNTlOsjmxXjVDCvdlH242GKw4YHN9iLHBolUxOI6mfpFdzazxPo9qD45PH
	ghPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=MvKW9qxD0q8tGz0QsIN0Mt1OJb3piAN+Qq2vn7Q2STc=;
	b=ljqwuwm//E0AB3+c9w5B8d1rV5hTZnku9iMEnY17ZxV3fe0fZl5as1EFpH6FoS+YXF
	dRq0ahf0brr8jyFHw6lot+yktOkVSjRyR6OPHrkc6HgL1DuUnALSey1M+cAjk0EOmu4r
	UJkBZS5S0uIFIvAZ4l3c4/xqsy40D5DX/V8nruaf5o+o/JHX8jxJdcC4pilbiCfKDRyv
	AnVBhjwko/aT6SWGRAlKo9sCZefISDJgc9m2TZbCyR9GVV0f1f0HzG+MY3jl/QqItGL8
	Q7pXX+spVSegPZPGDc6Ut6DtHhT3O3qBTz8+XqClZiCgMlLH9YMPgHFVDT+oTuCrCTcE
	qqJw==
X-Gm-Message-State: APjAAAUk9+yhUUwuLPAA1IHKro+thpmbGZgx75fVJRGMuSLnd49Nb5z5
	ReaTW02CKZf4VBtU/gV4EdU=
X-Google-Smtp-Source: APXvYqz8vLDy4/JDZQaBWn4s2sZyspnhihV0BULUA+9RGLMj564eC/FI62pSd+HzKVA+5K2CkN4E7A==
X-Received: by 2002:a6b:254:: with SMTP id 81mr1807600ioc.17.1568050164839;
	Mon, 09 Sep 2019 10:29:24 -0700 (PDT)
Received: from gmail.com
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	y19sm13319129ioq.69.2019.09.09.10.29.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Sep 2019 10:29:24 -0700 (PDT)
Date: Mon, 9 Sep 2019 13:29:22 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: liu.ming50@gmail.com
Message-ID: <20190909172921.GC26811@gmail.com>
References: <1567739673-25907-1-git-send-email-liu.ming50@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1567739673-25907-1-git-send-email-liu.ming50@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: meta-virtualization@yoctoproject.org, stefan.agner@toradex.com
Subject: Re: [PATCH] cri-o: RDEPENDS on libdevmapper
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
X-List-Received-Date: Mon, 09 Sep 2019 17:29:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged

Bruce

In message: [meta-virtualization] [PATCH] cri-o: RDEPENDS on libdevmapper
on 06/09/2019 liu.ming50@gmail.com wrote:

> From: Ming Liu <liu.ming50@gmail.com>
> 
> Since comit 3f64779e in meta-oe:
> [ libdevmapper/lvm2: force recipe libdevmapper to populate sysroot only ]
> 
> libdevmapper recipe does not provide package any more, we need RDEPENDS
> on libdevmapper which is being provided by lvm2 recipe.
> 
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  recipes-containers/cri-o/cri-o_git.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
> index b0c0ce4..c2b5f5c 100644
> --- a/recipes-containers/cri-o/cri-o_git.bb
> +++ b/recipes-containers/cri-o/cri-o_git.bb
> @@ -40,6 +40,7 @@ DEPENDS = " \
>      "
>  RDEPENDS_${PN} = " \
>      cni \
> +    libdevmapper \
>      "
>  
>  python __anonymous() {
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

