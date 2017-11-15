Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 85511E00CD4; Wed, 15 Nov 2017 13:00:50 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.216.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 03AE7E00C11
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 Nov 2017 13:00:49 -0800 (PST)
Received: by mail-qt0-f195.google.com with SMTP id v41so37558995qtv.12
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 Nov 2017 13:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vaKJ5/81IGgtkFAFwFfzvL2foQHOXajs1bjfOBU/EQM=;
	b=mNfDs1M6Nj7Nx9n24zZ1DzTDoDIzvgW7i87n24l/ezrwzT7yQXenBc9usIY05uTYBi
	LLpOh1j4JtYddCKJUTqeCQxK4wzEnclZcAjr831Fq2n0pHLnleMzArcWvAoRrlatdsXi
	1Uhrp76mRx5pB9a9SBOJvKsZ1JbIlFQ4tQ1WU132xcZqUq1buUbtquUEnNkMuvCZWtx5
	cGHBDhJLc0JuWihoS3F/VOOphHLcuy3ACbc2UHSfpoMqsYBjnuoOZWCqABOmVZND+kZZ
	UERanSYWuCfkqDQcaqvt7cM1bN8D2ds0kRtkA0/Xa4Z8t0QFXKbvgN3y6nYXO5Mm2G3l
	Qj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vaKJ5/81IGgtkFAFwFfzvL2foQHOXajs1bjfOBU/EQM=;
	b=nV9z5qF8cj0H31pOBItUZLDZMWsfRhzzHypKl72BOPwt0tC+JaVeaQRUJ11r2EY1M0
	LtXanUPv0QIFSwBA+m4DmFeIui8/YI7By+hxiV1cDsHURWYnj1fqKJ/C7cd3FzQ4yhfS
	jApsc52e/gW0ULvbva5XlyVMxl42ACf/rgl09d8/Dj2e3vkVMomEAvhnDinDzdZ4pG53
	MNg/1QW620xoUQrTb2ItYfZqAazwaPSAvu0jg/FppPw2oDRJp7lHX1vjx5UneP92ih7H
	Dy7Mx0ZsoIrpJiih3r3e2HGB0K/PNg3auSyBcje6HtCJRSULryiuSUV8f5f6kad59PNy
	WGgA==
X-Gm-Message-State: AJaThX7QF3FE2nrPqVtaEWppUn3Y55MZ6X/RIyAAfWq8vuzCdWugwIEw
	x5HP+6v/kJwkLOxXX/8vEbnngqHXHZANz35T/g0=
X-Google-Smtp-Source: AGs4zMa4E4uNeJifVKrj24Nno8LThX0m6HpFtUhjCTcIOqgBLlh9u115y/4agrYNVZZRWKWCKVDjXyWnwgawLp5FRcI=
X-Received: by 10.200.4.44 with SMTP id v44mr3157417qtg.80.1510779648963; Wed,
	15 Nov 2017 13:00:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.80 with HTTP; Wed, 15 Nov 2017 13:00:48 -0800 (PST)
In-Reply-To: <1510764281-37527-1-git-send-email-abdur_rehman@mentor.com>
References: <1510764281-37527-1-git-send-email-abdur_rehman@mentor.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 15 Nov 2017 16:00:48 -0500
Message-ID: <CADkTA4O+PVpJ+QkMPUxBB-rpMZUWx6wCGOh-2=UvANr6R2HqcQ@mail.gmail.com>
To: Abdur Rehman <abdur_rehman@mentor.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python3-dockerpty: fix license-checksum qa issue
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
X-List-Received-Date: Wed, 15 Nov 2017 21:00:50 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Wed, Nov 15, 2017 at 11:44 AM, Abdur Rehman <abdur_rehman@mentor.com> wrote:
> Fix license path and checksum for python3-dockerpty.
>
> Signed-off-by: Abdur Rehman <abdur_rehman@mentor.com>
> ---
>  recipes-devtools/python/python3-dockerpty_0.4.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-devtools/python/python3-dockerpty_0.4.1.bb b/recipes-devtools/python/python3-dockerpty_0.4.1.bb
> index a40f2a3..31a864a 100644
> --- a/recipes-devtools/python/python3-dockerpty_0.4.1.bb
> +++ b/recipes-devtools/python/python3-dockerpty_0.4.1.bb
> @@ -1,7 +1,7 @@
>  SUMMARY = "Python library to use the pseudo-tty of a docker container"
>  HOMEPAGE = "https://github.com/d11wtq/dockerpty"
>  LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=afaf767baa20ac524dc12f1071ca493a"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
>
>  inherit pypi setuptools3
>
> --
> 2.8.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

