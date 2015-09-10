Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B22E2E00DA3; Thu, 10 Sep 2015 11:46:17 -0700 (PDT)
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
	*      [209.85.160.174 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 89D7CE00BB9
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 Sep 2015 11:46:14 -0700 (PDT)
Received: by ykei199 with SMTP id i199so67633647yke.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 Sep 2015 11:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=BOUYgWQ/V5mmUY13aSy6PJU5Vt/3BDp5CStAU248mMw=;
	b=tUCQyJJyBqJBQJSraWG+gElyxYFmwkG5YiGgsXgh7wLx8KbJsG8KM4zqe4ri5DwX8p
	n+3xn4nBmfvEIGHlsDUDYHKZuEVWj/c3Vu1aq+csn3N4WsS7up6MGOceNOkTf4R08AJV
	sIv6cMrhgdVMpyFKHJP20AqoSiY8Pkd4jgg9DUX/b59aklKknkMXkdSGxEoSS7HCat+p
	xrmCENWBJFj1MlGBVkkPZsyKTkcHrmAe5y4IJ4YJYKEAEvVm9uqm1di+JLrqrLjbIcfW
	gugti/0FbFr8GZDAKfPkFPB1gBRAGjDzufIfjgm4+jb0hsgiXBMOZX3Sd79t+IJA9AqD
	zTOw==
MIME-Version: 1.0
X-Received: by 10.129.75.3 with SMTP id y3mr48830185ywa.92.1441910773226; Thu,
	10 Sep 2015 11:46:13 -0700 (PDT)
Received: by 10.129.34.212 with HTTP; Thu, 10 Sep 2015 11:46:13 -0700 (PDT)
In-Reply-To: <1441758637-25576-1-git-send-email-jslater@windriver.com>
References: <1441758637-25576-1-git-send-email-jslater@windriver.com>
Date: Thu, 10 Sep 2015 14:46:13 -0400
Message-ID: <CADkTA4MntBVsj52FRfDnGRcCWsPSYdwPE-PPaWh3mkyR_AG9sw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, "Slater,
	Joseph" <joe.slater@windriver.com>
Subject: Re: [PATCH 1/1] spice: add SRCREV_FORMAT to recipe
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
X-List-Received-Date: Thu, 10 Sep 2015 18:46:17 -0000
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Tue, Sep 8, 2015 at 8:30 PM, Joe Slater <jslater@windriver.com> wrote:
> Create a composite source revision.  Failure to do so
> can cause parsing errors.
>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  recipes-support/spice/spice_git.bb |    2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-support/spice/spice_git.bb b/recipes-support/spice/spice_git.bb
> index 8340787..95f7156 100644
> --- a/recipes-support/spice/spice_git.bb
> +++ b/recipes-support/spice/spice_git.bb
> @@ -24,6 +24,8 @@ SRCREV_spice = "b270fb010a3ddb432dfe6b15e4bdffa6ac086cd0"
>  SRCREV_spice-common = "fe93908238196bd632287fc9875e6f2e11105d04"
>  SRCREV_spice-protocol = "784407f248e7f99d2bfcc9368f9acd1efb2b9617"
>
> +SRCREV_FORMAT = "spice_spice-common_spice-protocol"
> +
>  SRC_URI = "git://anongit.freedesktop.org/spice/spice;name=spice \
>             git://anongit.freedesktop.org/spice/spice-common;destsuffix=git/spice-common;name=spice-common \
>             git://anongit.freedesktop.org/spice/spice-protocol;destsuffix=git/spice-common/spice-protocol;name=spice-protocol \
> --
> 1.7.9.5
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

