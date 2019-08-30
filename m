Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4E6BAE00C78; Thu, 29 Aug 2019 21:22:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.208.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 91129E00E01
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 21:22:21 -0700 (PDT)
Received: by mail-lj1-f194.google.com with SMTP id z17so5188071ljz.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 21:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+K+NSVcBz434zuvGEfZFsjsFlcI2Peh++YaqjunUTbU=;
	b=u3B9sbHqfy5ZJcpeMgzBAB7Eac9/kAsh6UrKAIezRMDnCNUokUsjETE6Y3dYnsIIkZ
	SWTnsjfCHJToF5kRfJit0MN3kIOBISr+QwpOs/RfLziNstue11NP5AKkmXQuFyGh+Inu
	Nk5RssePdErtaQUoctDNqn0NrrFo7XzFxqsiLDpcy9cziAIez/3nNPuJNIturVQU53yr
	IpcW0VE6pAdPVwrEdN7MgRZlUU7nSlUaTEJYj/wwt8KJXkY7AW3qE/7HSngGuIpOgjHA
	Vl2JIqCdaHy94rUXUv5kc11vs7CKFpHZXxyaOV+ZFIABZxHjuYIilhsB9JiNp+w+iSIQ
	7UJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+K+NSVcBz434zuvGEfZFsjsFlcI2Peh++YaqjunUTbU=;
	b=CbLzAau5FBhOXJAfg/KywQYOqtd61bq21Ia7CTefuvRHr7WCIoYKRCXXV8sHKxCuXg
	Ein888fZCeIgpeoQOxExspOF9JNNQRlYWxsLZlrMDTVEi9tMd/xu1AIeTGu3OcnH8su0
	c0RHZXc8du/xQ9Nar2UJRvWL8dxPALb7gtA20ViLcDWVkZelQPb6v014bDASrYdvY/Mx
	g34R1aSptms1xODfYqzZhvkQlyuMyvk5wMeLq0OrTAGAiJ2w2FMNJ1nkkncqCKfJbZn8
	UVss7eDU8LMlShydGX+1Teues9or02rSXlMRdHYHBTVaOgurZsKuEdQbl0JTiF8HFkdW
	9ERA==
X-Gm-Message-State: APjAAAUbBOIKvSBJYu3lKD7HR1pxL8MyZuBtWuHSt3S61XF9xQtAazUP
	Ans96Je0aUWz5q0lDr22qd1YgqoxUncYyCn6rJV5X9mD
X-Google-Smtp-Source: APXvYqyPGGJGsVrRZ7o4N9dUzplVhQczOyTiJequdd2emtVK5dYnIms8/ki+ceFyhV6mHwQoqEZNeE8SF/ZT8W6E3uM=
X-Received: by 2002:a05:651c:1036:: with SMTP id
	w22mr7232052ljm.79.1567138940546; 
	Thu, 29 Aug 2019 21:22:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190828015916.19200-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190828015916.19200-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 30 Aug 2019 00:22:09 -0400
Message-ID: <CADkTA4PND8=ifF5fbTH3cQ56rYzVJeeO1atx1ry9fWsHC7dQxg@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-waitress: upgrade 1.3.0 -> 1.3.1
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
X-List-Received-Date: Fri, 30 Aug 2019 04:22:28 -0000
Content-Type: text/plain; charset="UTF-8"

merged

bruce

On Tue, Aug 27, 2019 at 9:59 PM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-waitress_1.3.0.bb => python-waitress_1.3.1.bb}     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-waitress_1.3.0.bb => python-waitress_1.3.1.bb} (62%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-waitress_1.3.0.bb b/meta-openstack/recipes-devtools/python/python-waitress_1.3.1.bb
> similarity index 62%
> rename from meta-openstack/recipes-devtools/python/python-waitress_1.3.0.bb
> rename to meta-openstack/recipes-devtools/python/python-waitress_1.3.1.bb
> index fc227d6..78af225 100644
> --- a/meta-openstack/recipes-devtools/python/python-waitress_1.3.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-waitress_1.3.1.bb
> @@ -4,7 +4,7 @@ SECTION = "devel/python"
>  LICENSE = "ZPL-2.1"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
>
> -SRC_URI[md5sum] = "884dbea5d7348f7db1b8ab76ef3a3a71"
> -SRC_URI[sha256sum] = "4e2a6e6fca56d6d3c279f68a2b2cc9b4798d834ea3c3a9db3e2b76b6d66f4526"
> +SRC_URI[md5sum] = "d9132d313de0c5e0fec34ef9ede5442e"
> +SRC_URI[sha256sum] = "278e09d6849acc1365404bbf7d790d0423b159802e850c726e8cd0a126a2dac7"
>
>  inherit setuptools pypi
> --
> 2.7.4
>
>
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

