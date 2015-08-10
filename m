Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6C9C8E00A7D; Mon, 10 Aug 2015 06:53:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,URIBL_BLACK
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	*  1.7 URIBL_BLACK Contains an URL listed in the URIBL blacklist
	*      [URIs: cardoe.com]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.181 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f181.google.com (mail-yk0-f181.google.com
	[209.85.160.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 329EAE007B1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Aug 2015 06:53:31 -0700 (PDT)
Received: by ykaz130 with SMTP id z130so32209695yka.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Aug 2015 06:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=TTixiuz1Fk/z4uGXveilNTNVaBMlZFeMFlFfwpVjfKk=;
	b=t8y6j5uXm+bmH49iEhD66MrJxpxmmnzVc544Tu+dVekDr3jVs8ENcBwLmffFmK6t3m
	7dmXGV7yaB5pKQP5ds8B+IAKLDaxmfsJfVkT9XhzYl18iKDXDcPO+a7NH//U/8Powyz8
	jxOPqZeO7fPQPZdCXqdTLWLKywIuGo2kLQbMj5aHxypgvmVzAW2oDyZzgXc2g+kwh1jf
	Y79LxklZ/+bWieMyyE/7Ip0PLsrXHaJeIpvqc2aBUypKoFf9a49bSLcFRFfCPGAH9+Kl
	S3Zra6ZFkLboH4okhiZXHyV2UTs3UR8vMy7DLwtUpES7xH8jkG+f+o5MSeZEbGFsUXni
	0CXg==
MIME-Version: 1.0
X-Received: by 10.170.180.65 with SMTP id w62mr1544940ykd.60.1439214811252;
	Mon, 10 Aug 2015 06:53:31 -0700 (PDT)
Received: by 10.13.226.203 with HTTP; Mon, 10 Aug 2015 06:53:31 -0700 (PDT)
In-Reply-To: <1438952077-9400-1-git-send-email-cardoe@cardoe.com>
References: <1438952077-9400-1-git-send-email-cardoe@cardoe.com>
Date: Mon, 10 Aug 2015 09:53:31 -0400
Message-ID: <CADkTA4PZ3rpoQ4PAwsLkKm9mZ5WCVgkeimXfX6Oanv4Hr8TRTg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] README: don't advertise obsolete layer URLs
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
X-List-Received-Date: Mon, 10 Aug 2015 13:53:35 -0000
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Fri, Aug 7, 2015 at 8:54 AM, Doug Goldstein <cardoe@cardoe.com> wrote:
> This layer depends on openembedded-core and meta-openembedded so
> recommend the actual URLs and not the obsolete ones.
>
> Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
> ---
>  README | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/README b/README
> index beb3760..652d98f 100644
> --- a/README
> +++ b/README
> @@ -8,12 +8,12 @@ Dependencies
>  ------------
>  This layer depends on:
>
> -URI: git://github.com/openembedded/oe-core.git
> +URI: git://github.com/openembedded/openembedded-core.git
>  branch: master
>  revision: HEAD
>  prio: default
>
> -URI: git://github.com/openembedded/meta-oe.git
> +URI: git://github.com/openembedded/meta-openembedded.git
>  branch: master
>  revision: HEAD
>  layers: meta-oe
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

