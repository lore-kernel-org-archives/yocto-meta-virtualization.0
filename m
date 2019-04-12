Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6FDE0E00A84; Fri, 12 Apr 2019 07:52:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.193 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 116F6E00994
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Apr 2019 07:52:29 -0700 (PDT)
Received: by mail-lj1-f193.google.com with SMTP id v22so9125374lje.9
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Apr 2019 07:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=73SmAeng89GxXFNzti3fnkaTHTpvuOzDzW2/g7OyBBI=;
	b=f5z+ClAAzFLRQZAUtqVGls/6cBbcJmxiuz0+pjikQwmDqGQ+nQa4ewqSjTFY6H8UhD
	3tpkUgniUuuIUn/S03VcXTyma8U9GVuPKQ51pynyfukZ2BaMjg0RcVWhsaZohEiJ9XSV
	6e3dBmeU8umH2Ss4PbfhDSOtbZuC6+6YM5MDWmEva7b/W4OyZt3Gtn1uqPDXozI5EgJq
	RplD0HXYoVVKWsoQ6ATIlIU1Jq7mq9dl7vh0RY1FRC0sthFqF9y8+Tn3wnM2wDMUrnR7
	E3IjNSs4s778CzF0v5Tmj8Yruwz4mEN59iqQubAM38aqkDTAR0UgAwVZE/Ag0EkCdq5w
	vXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=73SmAeng89GxXFNzti3fnkaTHTpvuOzDzW2/g7OyBBI=;
	b=BGZ9qSXi+2FFSL1kAQGslOJkX86XZwTZPKEBP6FSoEsAw7z3lF4T0zqFUvspHu6FKQ
	3DFeH7+hN3b+rDwnIxRMWd6gXqy8EaQCTCt35jM3MNAvaG6ExUI6Jo1Au67KhofG4fYz
	uufVtA3MS2dUvcouQNcxxQNpuVHPWMOVU0saIx4zlotTq0Ibns/gk62OsN7t1DKD69WA
	pZcrtjZ9SatCE7Gvbjf6iHzxzVRvFYhv/qwgn6+pn+YXnouUkY9Q1yghj1DcH/bU+H3/
	80PN6zvMKfK0/1ex2noLXf/0W6Zp2d6yBo9P/9cZtJINoiGWufXmIAqd7LvThiBq58U6
	thBw==
X-Gm-Message-State: APjAAAXyFKIZoL6BAq8K6ZY00dJ+qGcmWfdDfBLfKWR0voddBKScdHsT
	TKFHp++eKorMbEzp0RC7mCH0Bik473ishaSnNEQ=
X-Google-Smtp-Source: APXvYqyC796yzm/7Qou7sqIjh/XWWMQUU8KjRsWYdqxbjH+twNVKv1GYG/VvxJK5tAf4k0RrcopfhWWuitKTXOho//Y=
X-Received: by 2002:a2e:1311:: with SMTP id 17mr19508020ljt.75.1555080748859; 
	Fri, 12 Apr 2019 07:52:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190408212312.86791-1-joe.slater@windriver.com>
In-Reply-To: <20190408212312.86791-1-joe.slater@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 12 Apr 2019 10:52:17 -0400
Message-ID: <CADkTA4Mdw2ii0mMm1fJnTSwXT8pHN0e7wCv4W_XeicofxegiWg@mail.gmail.com>
To: Joe Slater <joe.slater@windriver.com>
Cc: meta-virtualization@yoctoproject.org,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-virt][m-c-s][v2][PATCH 1/1] libibverbs: do not try to build for arm 32 bit or any mips
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
X-List-Received-Date: Fri, 12 Apr 2019 14:52:31 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks Joe.

v2 is now merged.

Bruce

On Mon, Apr 8, 2019 at 5:23 PM Joe Slater <joe.slater@windriver.com> wrote:
>
> arch.h does not contain macros for 32 bit arm or any mips arch.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  recipes-extended/libibverbs/libibverbs_1.2.1.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/recipes-extended/libibverbs/libibverbs_1.2.1.bb b/recipes-extended/libibverbs/libibverbs_1.2.1.bb
> index dd74522..fa7eee6 100644
> --- a/recipes-extended/libibverbs/libibverbs_1.2.1.bb
> +++ b/recipes-extended/libibverbs/libibverbs_1.2.1.bb
> @@ -29,3 +29,6 @@ do_install_append() {
>
>  PROVIDES = "virtual/libibverbs"
>  RPROVIDES_${PN} = "virtual/libibverbs"
> +
> +COMPATIBLE_HOST_mipsarch = "none"
> +COMPATIBLE_HOST_arm = "none"
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

