Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 89357E00848; Tue,  8 Mar 2016 13:07:10 -0800 (PST)
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
	*      [209.85.223.175 listed in list.dnswl.org]
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 30CBCE007F2
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Mar 2016 13:07:06 -0800 (PST)
Received: by mail-io0-f175.google.com with SMTP id n190so42262368iof.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 08 Mar 2016 13:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rvipJpjl07Rnj45Zq5ATmaVDkz6etOhWHpNZF+bVvhk=;
	b=L1/ifRvv4hjx0QH619dVT80vW48wXvinMKrEMXKwWwQ2V9wwOjmgCqpEDtjcigQOgu
	IIbozpgChKmn17sJh6Rftr694Ez22ju3Z/kxk46SXPvZ6wm8Jl7oye3dI7ZTEW2gK7wL
	1kQyBB51/0VvNBjQwcv9TeoikXHS3BKhdRlEacef/KJklfC2EDDZzuQkCBy4LvOxzlBB
	p5vthp9ybVItljQ3FfO+ZSpmXSedzPfccPfwo44IYAEBRcRKXKcYrwhVIyDxxeZ7GBtM
	Qz9TLWHDQgN2iqr07QfCtgeTkng1bRtjPPEjH+Qndqdb2wswxUZrJWGwPlGPbmDi7ILd
	5M/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rvipJpjl07Rnj45Zq5ATmaVDkz6etOhWHpNZF+bVvhk=;
	b=NEyN7JV1fWJh8ZeYvxCX1s+FFM1o6mQYo7aYr0VjIdfHztaoEYuqgRPIZiqMNY+/WV
	O6nHL+/vdJfAo33A6EZ2x4lvBaUUtLeOTRp8XBO5oSVljGdodJfaujtmS5dfLCz0Zk/T
	Oad4Qikxn4L+s/5+DuYUVnY/JffbpOdBW35VYzFUXW3153v+XU7owh3PoeYF2xSm2MBo
	svRd/jNydExLKxrNrwXFlX4yStW6Qp/IxShjhj9Qor2JSffnYtbKtkTjYZ6eXCF0tBf5
	PpbM3Gk/Ojc0bkE5QmDeTp8uVGlzT2YJt35pjRUaSJfN4Rz8YcTiOO6wdZFkqrjn256h
	nplg==
X-Gm-Message-State: AD7BkJLm+OG2CKISKf71u7EFgOrMBieitM6ImH3koh1+zOpinu5JwyKqwiC2Dezpvcfkt7iE5rmZ50phmPRmgA==
X-Received: by 10.107.34.139 with SMTP id i133mr26990849ioi.108.1457471225777; 
	Tue, 08 Mar 2016 13:07:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.98.7 with HTTP; Tue, 8 Mar 2016 13:06:46 -0800 (PST)
In-Reply-To: <1457127016-16947-1-git-send-email-mbgrego@tycho.nsa.gov>
References: <1457127016-16947-1-git-send-email-mbgrego@tycho.nsa.gov>
From: Chris Patterson <cjp256@gmail.com>
Date: Tue, 8 Mar 2016 16:06:46 -0500
Message-ID: <CABZSBQcPvYtK7i03UMNNsbhioTpyuD26JoX8OK-TNa2TkU66nA@mail.gmail.com>
To: Machon Gregory <mbgrego@tycho.nsa.gov>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] Fix QA Issues when building for aarch64 machines
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
X-List-Received-Date: Tue, 08 Mar 2016 21:07:10 -0000
Content-Type: text/plain; charset=UTF-8

>
> +FILES_${PN}-efi = "\
> +    ${exec_prefix}/lib64 \


The prefix isn't necessary (or desired, imo) because as you stated
previously, it's hardcoded in the mk files (for arm64 and x86_64).
That path could be overridden by specifying EFI_DIR, but I don't know
what, if anything, would be more appropriate.

> +    ${exec_prefix}/lib64/xen* \

This path is wrong (missing /efi)?

I would just set FILES_${PN}-efi = "/usr/lib64/efi"

-Chris

