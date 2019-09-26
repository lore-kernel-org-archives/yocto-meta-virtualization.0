Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 291B1E00C9B; Thu, 26 Sep 2019 07:36:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, FSL_HELO_FAKE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000] *  0.0 FSL_HELO_FAKE FSL_HELO_FAKE
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.166.66 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 67801E00E1A
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Sep 2019 07:36:05 -0700 (PDT)
Received: by mail-io1-f66.google.com with SMTP id a1so7138891ioc.6
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Sep 2019 07:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=3i3q7uV/eus9Bagnhd0UCt7yP4lN9b3FrHE4VPSDucc=;
	b=TwXIol9/0CWr/5n0CEqnbwL3utGvb2fhYHUIShr+JmBnYcNJkAMVFLFTPCQvTDH5Hj
	d/K3FYigtOMdEy7vG1NQxO7m8KpQrh44wnj0IFFqb2nFxINvILgIHnbZ/MFku3cEtQHm
	DoaJw4YL7VAtxepapNTuB0J/y8hXNMkpbv+N6HptwewdFzTXSEIoqpJBzZwfTGxqFqib
	HTfn+FojRQRQp0ffqB8zXpPDclZx1LMgiEAIUAR/ckW0hsYITtmEDHXlDznbgPW9zxdX
	Hy8qZgpE8TNsDVKSrifiOUa1CqlGzJ+MosRULV2m9UDkJdonCqik3h42u1XAwZBGz9rj
	m/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=3i3q7uV/eus9Bagnhd0UCt7yP4lN9b3FrHE4VPSDucc=;
	b=gJ7AGzH5cNYemdJmkzlOyAazE7CLxZIsSZS9KCH52NFfnNReE7PC2emHW3WM3rufPg
	odEeV0sFchbIpNGNpOZxVLB9IlNL1tjC/7c/wsueIDsIZrqIllPn6EmIZnAKaA0F1Xin
	lprQfy0B+DtkUSBmae0bjU5F1/Qd3Vb9TjGDVZ0ptiwQGBlHHYrGKN/8gKj3beLEDH3q
	I4tS/JcB75ICl6J2l+l2M5aibcdy9/Ne+6ZimrathMVER2yWldQ/VkuBnwtGWj0LPF5H
	Ywc77BxBU3KI0hDJEHu+XRCOGKqEcIAWJDDz/tJJzxTGuVesulQZorvsoaAWjBrD64LN
	dNHg==
X-Gm-Message-State: APjAAAXubh/9rz+BoEXgc4ZtM9GVpCNyf5taea+VQFc6PAEbkZ5ZOSt5
	t8vNME5lJbfSWeVSPC5wnKLb+EBAQ3k=
X-Google-Smtp-Source: APXvYqzlWHFtXjqr9oD9EtkhZKkMFZ7op+GU3rl1+FBo1PIVBzqwxtZsM5xCOn2bRM9xYQjT6NJhjw==
X-Received: by 2002:a92:502:: with SMTP id q2mr2770155ile.141.1569508564664;
	Thu, 26 Sep 2019 07:36:04 -0700 (PDT)
Received: from gmail.com
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95])
	by smtp.gmail.com with ESMTPSA id a24sm574777iok.37.2019.09.26.07.36.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 26 Sep 2019 07:36:04 -0700 (PDT)
Date: Thu, 26 Sep 2019 10:36:02 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Paul Barker <paul@betafive.co.uk>
Message-ID: <20190926143601.GB9611@gmail.com>
References: <20190924093737.265426-1-paul@betafive.co.uk>
	<20190924093737.265426-2-paul@betafive.co.uk>
MIME-Version: 1.0
In-Reply-To: <20190924093737.265426-2-paul@betafive.co.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 2/2] netns: Fix build on qemux86-64
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
X-List-Received-Date: Thu, 26 Sep 2019 14:36:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH 2/2] netns: Fix build on qemux86-64
on 24/09/2019 Paul Barker wrote:

> The build has broken again on master, even for non-static builds of
> netns. The simplest fix is to extend our existing patch to cover this
> case as well.
> 
> Signed-off-by: Paul Barker <paul@betafive.co.uk>
> ---
>  ...ce-rebuilding-all-packages-to-avoid-cgo.patch | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/recipes-networking/netns/files/Makefile-force-rebuilding-all-packages-to-avoid-cgo.patch b/recipes-networking/netns/files/Makefile-force-rebuilding-all-packages-to-avoid-cgo.patch
> index 3ed4c21..e4967d2 100644
> --- a/recipes-networking/netns/files/Makefile-force-rebuilding-all-packages-to-avoid-cgo.patch
> +++ b/recipes-networking/netns/files/Makefile-force-rebuilding-all-packages-to-avoid-cgo.patch
> @@ -37,14 +37,20 @@ Forward-ported to v0.5.3.
>  
>  Signed-off-by: Paul Barker <paul@betafive.co.uk>
>  ---
> - basic.mk | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> + basic.mk | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
>  
>  diff --git a/basic.mk b/basic.mk
> -index 187dff3..fb080b7 100644
> +index 187dff3..76a8d93 100644
>  --- a/src/import/basic.mk
>  +++ b/src/import/basic.mk
> -@@ -50,7 +50,7 @@ $(NAME): $(wildcard *.go) $(wildcard */*.go) VERSION.txt
> +@@ -45,12 +45,12 @@ build: prebuild $(NAME) ## Builds a dynamic executable or package.
> + 
> + $(NAME): $(wildcard *.go) $(wildcard */*.go) VERSION.txt
> + 	@echo "+ $@"
> +-	$(GO) build -tags "$(BUILDTAGS)" ${GO_LDFLAGS} -o $(NAME) .
> ++	$(GO) build -a -pkgdir dontusecurrentpkgs -tags "$(BUILDTAGS)" ${GO_LDFLAGS} -o $(NAME) .
> + 
>   .PHONY: static
>   static: prebuild ## Builds a static executable.
>   	@echo "+ $@"
> @@ -54,5 +60,5 @@ index 187dff3..fb080b7 100644
>   				${GO_LDFLAGS_STATIC} -o $(NAME) .
>   
>  -- 
> -2.17.1
> +2.23.0
>  
> -- 
> 2.23.0
> 
> -- 
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

