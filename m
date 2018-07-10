Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6DEBCE01064; Tue, 10 Jul 2018 06:50:35 -0700 (PDT)
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
	*      [209.85.208.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C95E8E00ED3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Jul 2018 06:50:33 -0700 (PDT)
Received: by mail-lj1-f196.google.com with SMTP id p6-v6so16796121ljc.5
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Jul 2018 06:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AA9xVguVM6CQY7jV1rQtCmVxzfql65F+aU6d4Hpd8Yw=;
	b=EKH2hAhJSgL3ZfkY5DwdnJezMLAwM+MsK88do6FPfJY94bivAMhliopA7qJdMZmB0l
	WhVXonf3UMC3O8JTUw1DmIQNyKNp4wM80V7UtHySqbAwF+ZKZd2vuXec9aZeKHXYejVf
	A/CLHjuHXhSYkUobnLN1gh+oKHtscYtx5actHyYydlXhxcbprUoENZrW9XmmUmpRzH4q
	Dnw12k9GpydBGq7WGnF/SRdePRBfc2iFYdL2NmFBpEWN4urAEKSOR36C+Zf7UkgheLzm
	aYGqUh4sA3p8PUQSrkv2ByB+iX5zxV8qBfKMzbYI1QJIOxTxjoQ0GHampeXeFvsSpKYA
	EFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AA9xVguVM6CQY7jV1rQtCmVxzfql65F+aU6d4Hpd8Yw=;
	b=cq13epYK+cgcAG+LBL3PbTxjpG2VJl4B/fxxHRmIIiu2SCkhDGh4/vfxfTSokWPNvC
	x/wn/rH6B3ah5mgQQUW2MslD7cjYYbOKiKMjZUob8DzkKapzCYgwyDbJsmqEqUuXq+WE
	6JXde1umpwC1gDB7u2fXNH75XPAtEVRfBCK2XUrvRRcQCLOq0uzgUysxlDXGrSWKD2O8
	NFYjZWgXoPVKQQSjBn9RJknss8oitn9XCGqyCXPGD08KKGKBFEhh8KNgtu+8GMqpWePd
	Swjz2HnRZNbdALvnMmHTCWGFFKdqqu0opiZB88vcMqIrpbXxyc3lWEflFp2DFBEhM0A4
	GyZA==
X-Gm-Message-State: APt69E1ZjiwI8NoiM1y2QJzQU3p9ZOUIoR8TY32uq6ROAJHe6DfnVsxT
	VJTqgqNTFyabMs+dRgv5K20PuyccgpdFGo05N0g=
X-Google-Smtp-Source: AAOMgpeMfq0q/IXMFYF7lNTyhrsS3SGYUZ8IP6RqVgM4mqiFg+4bYf8/Hc0tnc8ZsQUiQtNZ27QtwEAmmv7AvxrI0CU=
X-Received: by 2002:a2e:458b:: with SMTP id
	s133-v6mr13714314lja.151.1531230632450; 
	Tue, 10 Jul 2018 06:50:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP; Tue, 10 Jul 2018 06:50:31
	-0700 (PDT)
In-Reply-To: <20180706105124.3171-1-ueba.takuma@jp.fujitsu.com>
References: <20180706105124.3171-1-ueba.takuma@jp.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 10 Jul 2018 09:50:31 -0400
Message-ID: <CADkTA4OARbzTeDbV-ZDyYGJ4BLkyo1+pDRL14b+q44KtaJgfzw@mail.gmail.com>
To: Takuma Ueba <ueba.takuma@jp.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-waitress: fix license from Apache-2.0 to ZPL-2.1
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
X-List-Received-Date: Tue, 10 Jul 2018 13:50:35 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Fri, Jul 6, 2018 at 6:51 AM, Takuma Ueba <ueba.takuma@jp.fujitsu.com> wrote:
> Signed-off-by: Takuma Ueba <ueba.takuma@jp.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-waitress_1.1.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-waitress_1.1.0.bb b/meta-openstack/recipes-devtools/python/python-waitress_1.1.0.bb
> index f85f3a4..5636420 100644
> --- a/meta-openstack/recipes-devtools/python/python-waitress_1.1.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-waitress_1.1.0.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "Waitress WSGI server"
>  HOMEPAGE = "https://pypi.python.org/pypi/waitress/"
>  SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> +LICENSE = "ZPL-2.1"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
>
>  SRC_URI[md5sum] = "0f1eb7fdfdbf2e6d18decbda1733045c"
> --
> 2.17.1
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

