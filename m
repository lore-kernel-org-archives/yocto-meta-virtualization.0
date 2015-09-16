Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0692BE00E2B; Wed, 16 Sep 2015 13:10:59 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6AD20E00BF9
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Sep 2015 13:10:56 -0700 (PDT)
Received: by ykdg206 with SMTP id g206so230718702ykd.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Sep 2015 13:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=oT91PmK0ZlKrci+EYp4SmJTS0Pnm3isFBehg5DeFPOQ=;
	b=S9+PN6g2JwgpyRltBLEAeyW2CdXlykiXsCQ8SkxS0Uw1+1OSnNcVhyzd5yYfcpLoq5
	b4pZXwwWBtldhda1GBYcun6wfg/PcDRwmN8FQ6iMYE1/tvvR2C9r7kVdi5ZNe0bd8cT6
	S5x1WjJBVWe9vPUDgnYy/JgO9Qxy5UfOuSM865mZGdGH5jqEk4DOZ1pL4YmfhWaN/VGx
	/43TBxwHNurJTUAFQQVwWzhE5uVQZBUacvD/yuGfUJcL8lUOx1VRjl5D6rlYAKw+XzTM
	png2Ov0rz3Cxm66A/8V7EmNBLkKZ/GKCWH8T+9CWWp4MKHaNGgVH9mVl2/kx7qyTeqmQ
	faWA==
MIME-Version: 1.0
X-Received: by 10.129.75.3 with SMTP id y3mr30587022ywa.92.1442434255993; Wed,
	16 Sep 2015 13:10:55 -0700 (PDT)
Received: by 10.129.34.212 with HTTP; Wed, 16 Sep 2015 13:10:55 -0700 (PDT)
In-Reply-To: <20150916041550.GA27159@windriver.com>
References: <20150916041550.GA27159@windriver.com>
Date: Wed, 16 Sep 2015 16:10:55 -0400
Message-ID: <CADkTA4NqyviC+f2ytrwi8dNLZ6Kq3mZV6gU=L4N_Sge4kaJQkg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Amy Fong <amy.fong@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] docker: update SRC_URI
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
X-List-Received-Date: Wed, 16 Sep 2015 20:10:59 -0000
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Wed, Sep 16, 2015 at 12:15 AM, Amy Fong <amy.fong@windriver.com> wrote:
> Author: Amy Fong <amy.fong@windriver.com>
> Date:   Wed Sep 16 00:12:10 2015 -0400
>
>     docker: update SRC_URI
>
>     branch=release is no longer valid in the git tree,
>     updating the branch to v1.6.2
>
>     Signed-off-by: Amy Fong <amy.fong@windriver.com>
>
> diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
> index aa125a3..46714fe 100644
> --- a/recipes-containers/docker/docker_git.bb
> +++ b/recipes-containers/docker/docker_git.bb
> @@ -19,8 +19,9 @@ DESCRIPTION = "Linux container runtime \
>   "
>
>  SRCREV = "7c8fca2ddb58c8d2c4fb4df31c242886df7dd257"
> +SRCBRANCH = "v1.6.2"
>  SRC_URI = "\
> -       git://github.com/docker/docker.git;branch=release \
> +       git://github.com/docker/docker.git;branch=${SRCBRANCH};nobranch=1 \
>         file://docker.service \
>         file://docker.init \
>         file://hi.Dockerfile \
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

