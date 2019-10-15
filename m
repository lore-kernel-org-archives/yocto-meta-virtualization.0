Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 794EAE00C9B; Mon, 14 Oct 2019 18:56:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, FSL_HELO_FAKE,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000] *  1.8 FSL_HELO_FAKE FSL_HELO_FAKE
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.166.68 listed in list.dnswl.org]
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 93FD7E0096F
	for <meta-virtualization@yoctoproject.org>;
	Mon, 14 Oct 2019 18:56:48 -0700 (PDT)
Received: by mail-io1-f68.google.com with SMTP id q10so42431552iop.2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 14 Oct 2019 18:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=87qv5E9i9m3dqhSu8uUDy+qsj5F8uzf/nJMFJMibaM4=;
	b=QOa1ezTbMRo47SKGwVV00IN8tILBysebibiFIYr09ZwIuR58sYjnlHgD8899QdVYBe
	imxXH8twIuMZBvI06wH9dl1m6dyAneZDxqnMrtCbCekuE+IQd2sYRX4e2Seol3w/sqIJ
	ERW7DW1Af24VYzrKemGwfs4H38Tn+Qg5fhZcclfubtx7ltwktBTro3mw7XvHcJSq+tcX
	yRr5XNSc1B0vZXXitKXenHqqvVCAeb9oS+7bOTjeNwOCsCQaZW3vzD3MoY4Xuxei3g5h
	X0gn6F8AlBbT1v3Ei112S6e57Sl8/PU5HO4oCU3GDq+0zL9rdlW4hf+3t/GMnWC2dSjr
	MYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=87qv5E9i9m3dqhSu8uUDy+qsj5F8uzf/nJMFJMibaM4=;
	b=tcKYnB2wgnvBTWClYADES/xtbrJkXGsn90WJxBF+roCcQnl83q3jouLGop59IV7dVg
	CxN+dMg19YiEgOSYjCDLzIgJflIbtwOAUxnORfXifJ96i1ZjzXzAtcaZOwR9I8BfSYGI
	eiZQ8xDc/Qn5ls/kal4bBKe+YlMYFPsZSJQZIZsl1v1z6F1EpgtasSfNWzt3nKN2MrZL
	i8e0LkNOVq+h+iazhGN3VjXRh9/yoPgNXc+RNt58LxptfVqCuybFsxNPru4Dw0wCyTNj
	jYXnAMesjCsD4rBqh/2/iy9KP4nW/yNImQUYAQF90/pUWG3CwU2aavt888f5rkZ+qozb
	FPOw==
X-Gm-Message-State: APjAAAVB+zV15CP8+XGFdbCvGKmEl+3jrUdWYdVaFvfQDdsX+XGfDMwY
	a/tbHC0NZKI0Az2/148Ku4b/Sr6MQzGr3w==
X-Google-Smtp-Source: APXvYqwC0krxeNCT5mDC/mZ0FC7oMFmYMEjHRnHsqffoGEZxTnxA6+RGm8MoOERVvhGRD4RCCX0SoQ==
X-Received: by 2002:a92:5ac2:: with SMTP id b63mr3828554ilg.192.1571104607840; 
	Mon, 14 Oct 2019 18:56:47 -0700 (PDT)
Received: from gmail.com
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	k7sm15462525iob.80.2019.10.14.18.56.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 14 Oct 2019 18:56:47 -0700 (PDT)
Date: Mon, 14 Oct 2019 21:56:45 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20191015015641.GA48054@gmail.com>
References: <20191014205006.63611-1-stefan@agner.ch>
MIME-Version: 1.0
In-Reply-To: <20191014205006.63611-1-stefan@agner.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: meta-virtualization@yoctoproject.org,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH] podman-compose: move into subdirectory
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
X-List-Received-Date: Tue, 15 Oct 2019 01:56:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: [meta-virtualization] [PATCH] podman-compose: move into subdirectory
on 14/10/2019 Stefan Agner wrote:

> From: Stefan Agner <stefan.agner@toradex.com>
> 
> The layer does not expect recipes in the first subdir. Move the
> podman-compose recipe into a podman-compose subdirectory.

oops. I should have noticed this one myself.

merged.

Bruce

> 
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> ---
>  recipes-containers/{ => podman-compose}/podman-compose_0.1.5.bb | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename recipes-containers/{ => podman-compose}/podman-compose_0.1.5.bb (100%)
> 
> diff --git a/recipes-containers/podman-compose_0.1.5.bb b/recipes-containers/podman-compose/podman-compose_0.1.5.bb
> similarity index 100%
> rename from recipes-containers/podman-compose_0.1.5.bb
> rename to recipes-containers/podman-compose/podman-compose_0.1.5.bb
> -- 
> 2.20.1
> 
> -- 
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

