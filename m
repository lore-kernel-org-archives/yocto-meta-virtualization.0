Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AD3DCE00BEA; Mon, 25 Jan 2016 14:20:26 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.196 listed in list.dnswl.org]
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8BADAE00BE3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Jan 2016 14:20:25 -0800 (PST)
Received: by mail-io0-f196.google.com with SMTP id 77so14234933ioc.2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Jan 2016 14:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=gYvMxshhNr94K8ag49Mp6DF5m8GsItLY2TSqFAaz8KU=;
	b=h9IEI+MnQW5T0H99r6i17jnrmHV/Fe1cnsfKoIbPGJRdXMsCaCJn2SVPduVL+ZKoo2
	iaE82I0ZCzYYjAIQVghYBALrIlw23phUNu7XcdtTMofKt3HMM2Ct4zJSxF2yT9O2HJR1
	xvA6mgw1CZGidr5/0m0aeSeVZhRikl7E1BiAS/lhcp1ldWsyLmnH2DMKDInBdzHQFjes
	P0FhSsnLodI7Hfc4AlRfw+uLlVC05ynqSfa4SEJ9QiELKwXa2nN9z2trooDsTefNoEuG
	oqmWH/06KWQb1mqdzHJt+WWZPEPeKBg6sx4GqoufVWScxX9l8bpFYKTQEKLMVHY8fFEr
	rCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=gYvMxshhNr94K8ag49Mp6DF5m8GsItLY2TSqFAaz8KU=;
	b=QKN/01QWBJEtivYpKbAUTdxDtzLdpcJL0hnmYLq/wyS1ZBVF7a94BUPB7sZ9lrEskr
	I4gdzfTf2KtutUlEUqimYtT/oDVNFxJ5GI74Phtm310/+xqnNFFzv/Fc8CKD4AmuC6CR
	toibaRVRduqK6k9NyGO0VzBKb/8wdaCnek+cvCOvzVc/oFstaeMJObuc5xG2ZbqLcSVU
	RzmnhYNnqJMXdWp1xT66a1PW5SSh87UaTdnZ6Nu5+o2OZU/nVpauTmG9sTVLyO5rrciw
	W0vzBoDSQ71Q8oKpeTkC0pAxgbYmUpvPt40g1ivOj13X/WixVIKx1uthlIj5yzpsa+tV
	fydg==
X-Gm-Message-State: AG10YOStBzxXhr//xJRGkrihB2Mc5UBBkayG9wd3YSwOvKwtN8syryBbxO8FDEqyGqAn3rvBxJ9gOncKQhj/Og==
MIME-Version: 1.0
X-Received: by 10.107.33.14 with SMTP id h14mr4457795ioh.108.1453760424562;
	Mon, 25 Jan 2016 14:20:24 -0800 (PST)
Received: by 10.79.125.142 with HTTP; Mon, 25 Jan 2016 14:20:24 -0800 (PST)
In-Reply-To: <1453735752-966-1-git-send-email-cardoe@cardoe.com>
References: <1453735752-966-1-git-send-email-cardoe@cardoe.com>
Date: Mon, 25 Jan 2016 17:20:24 -0500
Message-ID: <CABZSBQetDdKXWDjGjdiKcKXYtKWPOcAWCehCDKzE4-gRFC=8MQ@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/5] xen: update git version to 4.6.x
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
X-List-Received-Date: Mon, 25 Jan 2016 22:20:26 -0000
Content-Type: text/plain; charset=UTF-8

I gave series a spin.  Xen 4.6 built and ran nicely.  On the git
version, I received: "Fetcher failure: Unable to find revision
1fd615aa0108490ffc558d27627f509183cbfdaf in branch master even from
upstream"

Had to set branch=staging-4.6 to get it to fetch OK.  With the rest of
this patch series applied, I also needed to move more of the common
bits into xen.inc to get it to build for x86_64.  Any thoughts on
moving the EXTRA_OEMAKE,
xen-x86-Fix-up-rules-when-forcing-mno-sse.patch, and
do_install_append() to the .inc as well?

Cheers for the cleanup :)

On Mon, Jan 25, 2016 at 10:29 AM, Doug Goldstein <cardoe@cardoe.com> wrote:
> Since xen.inc has been updated to support only Xen 4.6.x, the xen_git.bb
> should be updated to a revision in the 4.6.x stable series.
>
> Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
> ---
>  recipes-extended/xen/xen_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git.bb
> index 88145a3..9e74d7a 100644
> --- a/recipes-extended/xen/xen_git.bb
> +++ b/recipes-extended/xen/xen_git.bb
> @@ -1,8 +1,8 @@
>  require xen.inc
>
> -SRCREV = "68bd172e6fa565899c846eb72755c8ffd8562c8a"
> +SRCREV = "1fd615aa0108490ffc558d27627f509183cbfdaf"
>
> -PV = "4.4.0+git${SRCPV}"
> +PV = "4.6.0+git${SRCPV}"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.4.10
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

