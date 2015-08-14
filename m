Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 02DF9E00A54; Thu, 13 Aug 2015 20:43:10 -0700 (PDT)
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
	*      [209.85.160.175 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f175.google.com (mail-yk0-f175.google.com
	[209.85.160.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 548F1E00767
	for <meta-virtualization@yoctoproject.org>;
	Thu, 13 Aug 2015 20:43:07 -0700 (PDT)
Received: by ykaz130 with SMTP id z130so59236868yka.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 13 Aug 2015 20:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=OBG+sNW77FSaKL0kv8OdgsnbSABbJ2WqEGIYpLVza+U=;
	b=bAIbd0QtP5t9CuFbOOdRlnNCeQDQ9lEE9XjcyRmbzbmAnKNYsWFg1P4gNMb6hWlWc/
	eFB6gFo6YgRDgk8CO0xk+phr+nErLxUsKdRJadYCILvy5TmpLErzQcN6+4pBRwd1D+tR
	b4ZBvAmfYTK5GsBB2TBFVfDb1xgMbR/I6AVUDr+XOtgVXgCenTYd59KCVkzXBjBETLT+
	hMGInRirKjfrBCRBnAYrwAP3cKgJ7ijEtxwij68Q25Md5I2PuDVD8DatbasbWNYkd/dF
	/EAmG1j+5qEb1z1das/ggf5zaLGoNHN+TZR22iwX3q3tAgUhNaXFdy5nM6XYPFTYvw3v
	6r/g==
MIME-Version: 1.0
X-Received: by 10.170.121.9 with SMTP id n9mr32131540ykb.54.1439523787322;
	Thu, 13 Aug 2015 20:43:07 -0700 (PDT)
Received: by 10.13.216.216 with HTTP; Thu, 13 Aug 2015 20:43:07 -0700 (PDT)
In-Reply-To: <20150813205137.GA1707@windriver.com>
References: <20150813205137.GA1707@windriver.com>
Date: Thu, 13 Aug 2015 23:43:07 -0400
Message-ID: <CADkTA4Nq_jfubuHGhy-8ba+UCUOME8QhNjxDv6kU38zPyiAnHg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Amy Fong <amy.fong@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] docker-registry dependency update
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
X-List-Received-Date: Fri, 14 Aug 2015 03:43:10 -0000
Content-Type: text/plain; charset=UTF-8

merged

Bruce

On Thu, Aug 13, 2015 at 4:51 PM, Amy Fong <amy.fong@windriver.com> wrote:
> From f0c34c20d253412d8e43e58cb4141c5028101bde Mon Sep 17 00:00:00 2001
> From: Amy Fong <amy.fong@windriver.com>
> Date: Thu, 13 Aug 2015 16:47:23 -0400
> Subject: [PATCH] docker-registry dependency update
>
> With the recent python-simplejson:upgrade 3.6.2->3.7.3, docker-registry
> was broken due to unsatisfied dependencies. The docker-registry builds and
> passes basic testing with 3.7.3 (verified by jason.wessel@windriver.com),
> updating the dependency requirement to >= 3.6.2
>
> Signed-off-by: Amy Fong <amy.fong@windriver.com>
> ---
>  recipes-containers/docker-registry/docker-registry_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/docker-registry/docker-registry_git.bb b/recipes-containers/docker-registry/docker-registry_git.bb
> index fe766d2..3d8d74b 100644
> --- a/recipes-containers/docker-registry/docker-registry_git.bb
> +++ b/recipes-containers/docker-registry/docker-registry_git.bb
> @@ -42,7 +42,7 @@ RDEPENDS_${PN} += "\
>    python-itsdangerous (>= 0.21) \
>    python-jinja2 (>= 2.4) \
>    python-werkzeug (>= 0.7) \
> -  python-simplejson (= 3.6.2) \
> +  python-simplejson (>= 3.6.2) \
>    python-redis (= 2.10.3) \
>    python-boto (= 2.34.0) \
>    python-webob \
> --
> 2.4.6
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

