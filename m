Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 90749E00E08; Thu, 26 Sep 2019 07:35:53 -0700 (PDT)
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
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.166.65 listed in list.dnswl.org]
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 443D8E00C9B
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Sep 2019 07:35:52 -0700 (PDT)
Received: by mail-io1-f65.google.com with SMTP id n197so7071753iod.9
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Sep 2019 07:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Dn8KdbdSw700d5nBk4LqLucmYv73ueKgsTa7161AOyA=;
	b=oDGbK5oM4i5QSwOehD+BB6PfIl+7bTAa2oNPYNxP4ztgcwVP/O6biQ8l+vGu7ojUis
	S3YkJEQ9ZlHWBdxiootsww5iHRGVWWYEdBGy6JON5p1CxKgeUVyk6drnayBY9ghAs/Px
	o04ryOiT0kzowcid2p5zqi2fNZK23oztIsvYNazGpTmGk7eglMXouT5GXfWUHH1/ir5C
	3xHSTApP/OxNmUdJJfXUTPhq8UZ/f+INwpCOeZglp81m28zSdGlYvOPnKoRFW1q0eMZX
	IGbdKP8kFaVztsOkgPYBzTArsqOMkp+9RN77gHWtwxwhij/Lc2XZfsOlddEoU3sbEBd2
	1cGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Dn8KdbdSw700d5nBk4LqLucmYv73ueKgsTa7161AOyA=;
	b=BA8HnNyJ2AyBHyBtk4QXBHrmqXb5VzGYagBTHsjPYhxK9MEulO8uK/MtfUJV5150+s
	0FvqX2YJ2+AiA58Qx2X89U+CQ578ogg94obN9HoGzXiMlilTo7JFiwv15amaBZrpjxeV
	9GXcVT5LhLkD5AFmZdikpyFbHknWvwn1lrnwy9miCr7oyucqvvtfltzfpnuMeKHViY3q
	wxgHRrPcchrIjWQdW8RBcKf7LmFSR1J6SJBRGaKsFrU0rcgVCEwXLQD5cicQLnxLro3X
	6f1ZPrNSCEEiee9BYenqJ5TEqY1JMG5sQzH2o+YPX5HBOcFF9Xz9KDmX6Z/Uw7KGRhEN
	6NQw==
X-Gm-Message-State: APjAAAVH663LpGyVvdQTqDVMYTg2NsDuB68skyEW9T0sMzNcN3H6i7Qq
	gXceZVhKglj8f3Hi0Xanp2dKv5LIxAs=
X-Google-Smtp-Source: APXvYqwqjANudDazBwutARWtPwK6rKvo4LYdLC1074XCsJf4jv5j5zsXnl+hsb8HuWhgE+NzQgpjiw==
X-Received: by 2002:a05:6602:2185:: with SMTP id
	b5mr3600562iob.265.1569508551445; 
	Thu, 26 Sep 2019 07:35:51 -0700 (PDT)
Received: from gmail.com
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95])
	by smtp.gmail.com with ESMTPSA id a25sm969581iod.62.2019.09.26.07.35.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 26 Sep 2019 07:35:50 -0700 (PDT)
Date: Thu, 26 Sep 2019 10:35:48 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Paul Barker <paul@betafive.co.uk>
Message-ID: <20190926143545.GA9611@gmail.com>
References: <20190924093737.265426-1-paul@betafive.co.uk>
MIME-Version: 1.0
In-Reply-To: <20190924093737.265426-1-paul@betafive.co.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 1/2] layer.conf: Change dependency on meta-selinux to recommendation
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
X-List-Received-Date: Thu, 26 Sep 2019 14:35:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged

Bruce

In message: [meta-virtualization] [PATCH 1/2] layer.conf: Change dependency on meta-selinux to recommendation
on 24/09/2019 Paul Barker wrote:

> The recipe for cri-o already has an anonymous Python function in place
> to skip the recipe if dependencies are not found so there's no need to
> force inclusion of the meta-selinux layer.
> 
> Signed-off-by: Paul Barker <paul@betafive.co.uk>
> ---
>  conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 23efcb8..958efd6 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -21,12 +21,12 @@ LAYERDEPENDS_virtualization-layer = " \
>      networking-layer \
>      filesystems-layer \
>      meta-python \
> -    selinux \
>  "
>  
>  # webserver: naigos requires apache2
>  LAYERRECOMMENDS_virtualization-layer = " \
>      webserver \
> +    selinux \
>  "
>  
>  # Override security flags
> -- 
> 2.23.0
> 
> -- 
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

