Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BA380E0071E; Sun, 25 Dec 2016 10:05:48 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 867D8E00655
	for <meta-virtualization@yoctoproject.org>;
	Sun, 25 Dec 2016 10:05:45 -0800 (PST)
Received: by mail-yw0-f194.google.com with SMTP id r204so19698459ywb.3
	for <meta-virtualization@yoctoproject.org>;
	Sun, 25 Dec 2016 10:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mM8+dOHITgH2VWJDkvnaoDhbjdWRPBWS4hoiqvvUvKA=;
	b=G3BjQLamGwMwvqiNVHbtrh7br624nfjTYztsazRf1tUavzPIjzgao0qHYAfbDc9VzU
	VzO7p3mCvuwdmnD/VmUY158X8Aghr8vHUWO4iwZ+PPjTrVVe/topMVIpWnEAqbuIbSYc
	GHgtY5VUa359evfgyUo/18NNBKtMcH4pGpqjec090K29gOvVAdYNTGCZAIeO1UVUjKTd
	J2qp4E0rQvKZNAA3NtiEYjq/EeB8dPrcpks4mKo4HyKGq+j7CBieQzuf6qE+BUPz4adv
	TLMOJMcqGGpxqSXrGf939ZjHG2runrTB5cLluddxBcyMKj1p+/mW37kaLfy5+smnnO7/
	DHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=mM8+dOHITgH2VWJDkvnaoDhbjdWRPBWS4hoiqvvUvKA=;
	b=sLRAqyzNtkQocj8dyyC2usqD8cQDY6Tx0mJ7BHWX2727SF39TyoKOr2F0+oI0xO4fZ
	L4E7u0t8yyOzprBQDIIh+zF9Phgtk3qxB3ELIMqZY61FDwB0X3SxaX9/WCWgpPYDxgBu
	BgFVFs1hPc72x9x7ebFjAALY1boV7uueWk3g//HOKB47tCAQDxC3zaIoH2MtV15l/wrd
	G928Z6zoW9XqttuIEO3lvqiHFeei/KCF2QCjVzf7yKQATOiOXfWmqLEK+kqX1IFUlQFe
	UW6f7h6YYA4zaITdIKBEJH51ChrtGDgUq2TolETNz4z7s1CM2uWBe3A7ZiptZ1g1KzD3
	7g3Q==
X-Gm-Message-State: AIkVDXLaUyTcER6b2yKJep4qTxkJrk/5hNGNTu1QpyJBUBwjvxZGtK35+U12KzI8oBxP0iCIjbeA5hWT9u1v/A==
X-Received: by 10.13.197.68 with SMTP id h65mr18369756ywd.84.1482689144519;
	Sun, 25 Dec 2016 10:05:44 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.171.82 with HTTP; Sun, 25 Dec 2016 10:05:44 -0800 (PST)
In-Reply-To: <1401414421-25902-1-git-send-email-akuster@mvista.com>
References: <1401414421-25902-1-git-send-email-akuster@mvista.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Sun, 25 Dec 2016 13:05:44 -0500
X-Google-Sender-Auth: X7HxbzsMBvOfQ0g4eGanyBuqAfI
Message-ID: <CAPuovELsykZqBXJ1tYz-w6tJjtqi+0w8HLcFXxS8P4zFj-rXvg@mail.gmail.com>
To: Armin Kuster <akuster@mvista.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, akuster808@gmail.com
Subject: Re: [PATCH] python-barbican fix fetch error.
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sun, 25 Dec 2016 18:05:48 -0000
Content-Type: text/plain; charset=UTF-8

Be sure to include [mcs] in your subject to ensure Bruce doesn't have
to search to determine which repo to apply the change to.


On Thu, May 29, 2014 at 9:47 PM, Armin Kuster <akuster@mvista.com> wrote:
> It appears the that git repo has moved. This is causing a do_fetch error.
>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  meta-openstack/recipes-devtools/python/python-barbican_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-barbican_git.bb b/meta-openstack/recipes-devtools/python/python-barbican_git.bb
> index bc12fcd..8ae0b21 100644
> --- a/meta-openstack/recipes-devtools/python/python-barbican_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-barbican_git.bb
> @@ -4,10 +4,10 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=fc8be9e7dffe97390d1216b01fd0be01"
>
> -PR = "r0"
> +PR = "r1"

You can drop the PR, since the advent of the PR server assigning a PR
number is not necessary and is actually unwanted.


>  SRCNAME = "barbican"
>
> -SRC_URI = "git://github.com/stackforge/barbican.git;branch=master \
> +SRC_URI = "git://github.com/cloudkeep/barbican.git;branch=master \
>             file://barbican.init \
>            "
>

This is step backwards as this repo even declares:
Barbican moved to openstack/barbican. https://github.com/openstack/barbican

Additionally the current recipe doesn't use 'branch=master' so this
patch will not apply, do you have local changes?

I am in the process of resurrecting meta-cloud-services so you might
get this fetching issue fixed for free in the coming days if you want
to wait for me, otherwise feel free to send out a V2 with the above
corrected.

Mark

> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

