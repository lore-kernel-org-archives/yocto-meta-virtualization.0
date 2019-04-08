Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 31F3AE00C44; Sun,  7 Apr 2019 20:10:51 -0700 (PDT)
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
	*      [209.85.208.194 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7DD78E00AB0
	for <meta-virtualization@yoctoproject.org>;
	Sun,  7 Apr 2019 20:10:50 -0700 (PDT)
Received: by mail-lj1-f194.google.com with SMTP id p14so9795156ljg.5
	for <meta-virtualization@yoctoproject.org>;
	Sun, 07 Apr 2019 20:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NLEuFRznj/uVePMGoGp/03cvMSBoSeumjHhRxCq5Wu0=;
	b=V1mzojpcFMVAib3hZ2i2H44gU8y8YsJBXkDuu+bgi2fyOjdeYWiwVL6tDtu7V8Kwwg
	dxTMJBaFddW74kLhNFO4GJ7ACQYgNCWnv2bHckN3+lt3j9WJFXQ5M6OWjT9l21IA6B6k
	ydRpcYD3DHEa/6OdmUPQ+3WAmbbWEQsc1/kWCn/Nqv2vOmxZtho/c0bv6jkQ0HYeMBR9
	iv9t8ZPMsn7VWp9AY14J90i4lILthbrQZV/jcMXUnWkIzUIAJ+qD6+wxowdAprnlFstJ
	3rGMTSCtB6JLUFRQkMMpSQFUoZhMhHfc38Kv/xrlLOp3T7kta1fbvHmI44KVCFaxXQs3
	AdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NLEuFRznj/uVePMGoGp/03cvMSBoSeumjHhRxCq5Wu0=;
	b=rJQC9iP24XLf48WpLAMFiUyoWVRkbtl8Fy2HoA8Kx0NU7k4jaXtBwJwzMKQjVgr/hQ
	T/knyegbXaofziXdP3D5NFk3sNyLjQ5oUdoqTwQnXD+Ewg3EjfHZRVyRzqnO3zsfZC2Y
	ZoTxncS+Lxa07ZjAuEppfnMtisvCzV+3fXenxDwiAtK6lQb69C98IW+6H+PphV/jdJ0a
	86vXX6Ks0U6KJzkE7HB9OzhRoO9LU7sLZmHNSj0eYoXWHb1LCE9CuBxtEUZzm2kCqILg
	nLO8mxEV/JV4vHJBkP5J5YCNoVQ7g0i9rI2YLBiMTj3Fb2qwC+NdeJ6H2FEEioUqYicP
	l2VQ==
X-Gm-Message-State: APjAAAXk7nhvRfXoiFG/pMwlAHNUdBlox7etillFVtcVBHlacPrVjrJV
	/02YoP76AXr3eJ0Ac6andpmICRk6cYYclc3p8Zw=
X-Google-Smtp-Source: APXvYqwuofcDjmPWwSMh+CST48jgCRGt9upMRix1+TMyGsKuGsjEnA4y2P2lzz2FFJISPT00llR3AyumUj0F5jvYAN0=
X-Received: by 2002:a2e:3c0a:: with SMTP id j10mr14004752lja.164.1554693049300;
	Sun, 07 Apr 2019 20:10:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190404151415.73617-1-jason.wessel@windriver.com>
In-Reply-To: <20190404151415.73617-1-jason.wessel@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 7 Apr 2019 23:10:38 -0400
Message-ID: <CADkTA4OVAKi6UjviYCdX8ZhvDiD7engvZjuMfAcF-SZgHrPd=A@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] container-base: Allow building with a specific kernel binding
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
X-List-Received-Date: Mon, 08 Apr 2019 03:10:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 4, 2019 at 11:14 AM Jason Wessel <jason.wessel@windriver.com> wrote:
>
> The oe-core layer sets a variable which intends that linux-dummy is
> set for container building.  This commit would allow you to have a
> specific kernel and board setup as well as generate multiple
> containers by turrning off the linux-dummy check found in:

Makes sense to me as well.

Merged

Bruce

>
>    oe-core/meta/classes/image-container.bbclass
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  recipes-extended/images/container-base.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/recipes-extended/images/container-base.bb b/recipes-extended/images/container-base.bb
> index 3e636ca..434239a 100644
> --- a/recipes-extended/images/container-base.bb
> +++ b/recipes-extended/images/container-base.bb
> @@ -20,6 +20,9 @@ IMAGE_INSTALL = " \
>         netbase \
>  "
>
> +# Allow build with or without a specific kernel
> +IMAGE_CONTAINER_NO_DUMMY = "1"
> +
>  # Workaround /var/volatile for now
>  ROOTFS_POSTPROCESS_COMMAND += "rootfs_fixup_var_volatile ; "
>  rootfs_fixup_var_volatile () {
> --
> 2.18.1
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

