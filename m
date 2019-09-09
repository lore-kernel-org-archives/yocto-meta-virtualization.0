Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1611CE00DB1; Mon,  9 Sep 2019 10:36:26 -0700 (PDT)
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
	*      [209.85.167.66 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3BE44E00DE2
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Sep 2019 10:36:19 -0700 (PDT)
Received: by mail-lf1-f66.google.com with SMTP id u29so11164567lfk.7
	for <meta-virtualization@yoctoproject.org>;
	Mon, 09 Sep 2019 10:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BJ5avKYBUUwsRegEMzD+V8AeoqbAzw5hXEjsB659wu0=;
	b=R/EbhBSKV5sMz1QIssmv/7KJU79Wge/qY9p92H0BlttY0WQ9Ys2GhYTTcnlcBb0BpU
	hLRW9THEGp1kuYcplVnMdQoF5kRWvumMMQxfGnphXYNzqo3tjjeiGTxtL75JOyGZRWWO
	3vDz/MB3xZhcdqx/Sq9Aucs4kPL0tKmU50+byrmSw9CPjVD5L8XZJKOcVS5BEhsV4D3D
	KCd3V8mQnwZnc8sn3La9YJOaZIBZQJGFW/n8EfG4ix9Bb3Ft8ZZAf8rm5kMBR9XzPsKp
	UaaTnADN6dqUY7hI4HqaKi8VV4csCSCDYevTP/zEv+UeiU4MY+VvcZcawAYzi/8HySQK
	jLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BJ5avKYBUUwsRegEMzD+V8AeoqbAzw5hXEjsB659wu0=;
	b=MDuGynDXZ3TJBEFY59oJ1x9SFvlllGarRgaQZD88CtB5yGCS3GHCqWBTlPIhnwygkn
	z9AbjIv0SItFdZYilcuThKg/pf1kGPZJCbnqAA8BhuxvcykLaFBgCIrsPaxmAZ50pfNF
	VjhcPEb2zazb6v/AICh36ohPo8RjXU7ZCEHn2duUhaja4NXm+SNGY8ZO4+wxdicpDIat
	qYH1c/HMmSb43ANaVImgpdnTgifMS4pGuHowkii5u+NFPppNTU/oaAGNAc3KaKc+BKhN
	mPwfAwt8wcuUpo/FGIRFwVNQFzZjO5glmsYwNmBeo1mjmQ72NuxB9kKwGfa3rpHMy+ys
	tvsg==
X-Gm-Message-State: APjAAAVyXZK6FXqWqTDKnBP2fjeDsNRDkDcdFm0p+7Jotd72y3V7oLlH
	40NeYQdSVNWeXyvr8HY400RiOa5iNwugRk5neNNmH6aq
X-Google-Smtp-Source: APXvYqw1SopRl0Z0xJrJymwfmb4FaDmXwlkq2SVaElLyiVNIyJ+PeeBoiEAXrQtG0u+c6+nKzvOv3bzFPlimlElfb8Y=
X-Received: by 2002:a19:c80b:: with SMTP id y11mr17990266lff.184.1568050578106;
	Mon, 09 Sep 2019 10:36:18 -0700 (PDT)
MIME-Version: 1.0
References: <1568011154-291249-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1568011154-291249-1-git-send-email-changqing.li@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 9 Sep 2019 13:36:07 -0400
Message-ID: <CADkTA4MgXLgrQt=KL-h16xJr--hWCMOoyVJf3iNBCWEVgwz9bg@mail.gmail.com>
To: changqing.li@windriver.com
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: [meta-openstack][PATCH 1/2] layer.conf: remove preferred version for python-futures
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
X-List-Received-Date: Mon, 09 Sep 2019 17:36:26 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Sep 9, 2019 at 2:39 AM <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> preferred version 3.0.3 is not aligned with current version
> under meta-openstack 3.3.0
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta-openstack/conf/layer.conf | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta-openstack/conf/layer.conf b/meta-openstack/conf/layer.conf
> index d8a4db8..903b408 100644
> --- a/meta-openstack/conf/layer.conf
> +++ b/meta-openstack/conf/layer.conf
> @@ -25,7 +25,6 @@ LAYERDEPENDS_openstack-layer = " \
>  PREFERRED_VERSION_python-greenlet = "0.4.5"
>  PREFERRED_VERSION_python-sqlalchemy = "1.0.8"
>  PREFERRED_VERSION_python-pexpect = "3.3"
> -PREFERRED_VERSION_python-futures = "3.0.3%"
>  PREFERRED_VERSION_python-django = "1.8.6"
>  PREFERRED_VERSION_python-netaddr = "0.7.19"
>  PREFERRED_VERSION_python-sqlalchemy = "1.0.16"
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

