Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 36C24E00D31; Mon, 31 Aug 2015 06:08:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.169 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AB8B8E00A7D
	for <meta-virtualization@yoctoproject.org>;
	Mon, 31 Aug 2015 06:08:09 -0700 (PDT)
Received: by ykfj9 with SMTP id j9so1023939ykf.2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 31 Aug 2015 06:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=mcmKeuSUDFUw51CvIr0iN+6kJWYIqrJCBdcD3wkZVLA=;
	b=NKqj/Fo2ZtSQgokWgRoL9o0MDRzGk/bW+IN65hRl9SB9uvBs3OJ1pbw5P9/wpY67NQ
	SACEoiiT7QCd22wyAyVOarJrGfTAhqJlyAyMx4OOFrGiBxtlIyt3NPl9BPr31xJOZGr0
	KT+5thj4uJJelAdCrAG+6fK6Ty5agvCF3COqhzhYYKIc+eiTmU8PEg3y8qEWwVCugVvz
	lRKaqeVDKJZEkUoAc8psOg629jJVYDOhCUAZdsOJcwphm4V/ufBHcJTymyKuVOmjhUYj
	ffh12jxvTSi8yMKIcoJX8otX4qoUeRqdG4C1qh0PNgvn71U61G0xVLTD5PMx5Y4bkjTC
	PNfw==
MIME-Version: 1.0
X-Received: by 10.13.215.66 with SMTP id z63mr20711899ywd.123.1441026488677;
	Mon, 31 Aug 2015 06:08:08 -0700 (PDT)
Received: by 10.129.34.212 with HTTP; Mon, 31 Aug 2015 06:08:08 -0700 (PDT)
In-Reply-To: <1440448008-9189-2-git-send-email-cardoe@cardoe.com>
References: <1440448008-9189-1-git-send-email-cardoe@cardoe.com>
	<1440448008-9189-2-git-send-email-cardoe@cardoe.com>
Date: Mon, 31 Aug 2015 09:08:08 -0400
Message-ID: <CADkTA4Mjg_+g+4oak_nApGcCKe_Or-NrrPu0ofWpQ_-3KP6ynw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/4] xen: drop incorrectly broken out package
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
X-List-Received-Date: Mon, 31 Aug 2015 13:08:15 -0000
Content-Type: text/plain; charset=UTF-8

I've merged patches 2/3/4 of the series, and dropped patch #1 as discussed
on the list.

Cheers,

Bruce

On Mon, Aug 24, 2015 at 4:26 PM, Doug Goldstein <cardoe@cardoe.com> wrote:
> The xen-mfndump utility was broken out into xen-xen-mfndump which is
> clearly a typo for xen-mfndump but the xen.inc file which is also used
> for 4.5.0 places this binary into xen-misc so remove these lines and let
> it go into xen-misc.
> ---
>  recipes-extended/xen/xen_git.bb | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git.bb
> index f333157..88145a3 100644
> --- a/recipes-extended/xen/xen_git.bb
> +++ b/recipes-extended/xen/xen_git.bb
> @@ -11,8 +11,3 @@ SRC_URI = " \
>      "
>
>  DEFAULT_PREFERENCE = "-1"
> -
> -PACKAGES += "${PN}-xen-mfndump"
> -
> -FILES_${PN}-xen-mfndump = "${sbindir}/xen-mfndump"
> -
> --
> 2.1.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

