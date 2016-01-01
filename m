Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6BFA3E00BB5; Fri,  1 Jan 2016 07:41:17 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.172 listed in list.dnswl.org]
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 30FF4E0033E
	for <meta-virtualization@yoctoproject.org>;
	Fri,  1 Jan 2016 07:41:13 -0800 (PST)
Received: by mail-ig0-f172.google.com with SMTP id to4so209085162igc.0
	for <meta-virtualization@yoctoproject.org>;
	Fri, 01 Jan 2016 07:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=VmRvs3PpKGPrrVDkm8QhwKqx36l+aHguNhaQJzQ/GCw=;
	b=lQ5OFaDj/CsAMam7/ZCWbqQ65mG8HSWIZsMsNKobJ5d3BcUOVBpvgw1pLNRJjRfOpb
	+ulBgBVNSz2/rp2vN35yn1rXla2BTI7oQ9z0KI2vDAiqVKTavVKE+JFpKW3n30DMkr6B
	V4xzUFcehZH80nBGf6IIWhoYwmq9O/VEQjYETU6AVHmAknGFMWiaGIZMggIyhAvUTZt+
	kUiMT+fALeQ6tLSKSG5MCTLJNOygWIWrgFJAhuChvNGR1wflsbN/FrS0MLdSRp7TPfqW
	yPF5DaVr1J30UGrC0tk5ZIEutWXmskofN+00V0WKcArsJ3B7BkTGieODk452MZI9FpYl
	DYHw==
MIME-Version: 1.0
X-Received: by 10.50.66.243 with SMTP id i19mr17150989igt.18.1451662873096;
	Fri, 01 Jan 2016 07:41:13 -0800 (PST)
Received: by 10.79.112.213 with HTTP; Fri, 1 Jan 2016 07:41:13 -0800 (PST)
In-Reply-To: <5679D809.1010503@cardoe.com>
References: <1450810948-17131-1-git-send-email-cjp256@gmail.com>
	<5679D809.1010503@cardoe.com>
Date: Fri, 1 Jan 2016 10:41:13 -0500
Message-ID: <CABZSBQeQaPukMhDdp5c6nHmLtCkeDLiV6KDOPaMHnqahKHRREQ@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2 1/5] seabios: uprev to 1.9.0
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
X-List-Received-Date: Fri, 01 Jan 2016 15:41:17 -0000
Content-Type: text/plain; charset=UTF-8

>
> Only question would be did something need to change in defconfig with
> 1.9.0 for Xen?

Sorry about the delay, I have been away on vacation.  :)

Yes, there should be some defconfig changes.  I will submit a patch
shortly to remove the included defconfig and instead build using 'make
defconfig' (it's the approach upstream Xen has used since 4.5, so it
appears to be the ideal route).

Thanks!

