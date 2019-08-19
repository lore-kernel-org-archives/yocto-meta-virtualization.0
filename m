Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B8A56E009E6; Sun, 18 Aug 2019 19:27:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.41 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
	[209.85.167.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 46051E00DCE
	for <meta-virtualization@yoctoproject.org>;
	Sun, 18 Aug 2019 19:27:56 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id b29so222061lfq.1
	for <meta-virtualization@yoctoproject.org>;
	Sun, 18 Aug 2019 19:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ofBaZ+urpa+8O9q7AeYLRWRkzEuNkhVd6uuLPG9ORyk=;
	b=Oa0ZeD1WgFdTLst183pgvIAN5n9BzK9XMaj8+koPhCPJKOhIprrFuYPFqMdCVUk8yR
	NRL/D1Gop55s1RXW4QbjSyx6DEHVozGuSGwsuiMDyyuTpatsmnD7iEaP7Qr0QjzZVikN
	Y1c+pnytw2Hivny5abucho9WHfQ6Kga+5zrE7tFQrhbP6iRrwmd9eP7+OpAuTAK2czPU
	3tA1s+i8aBO6wn9HT7Ccv16XLjwAysiBLooRZ/C69O1xCPicacvzl/JXau2wWqoaPak3
	llN36bkJDVUmU2N3IkEhvhewYfu9AEYXH5hanOXuk1VPvsVOWFa4OSNHiDAQJ8URwIgo
	qfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ofBaZ+urpa+8O9q7AeYLRWRkzEuNkhVd6uuLPG9ORyk=;
	b=SALAqWNulJzxYiDRHdObclT2TnfHVgXhvT/Kc2vCLEEfCLsFRZz2eVIBfA1NzPT+6L
	wTiZ+X7R9BycF43MHELEDmj5t3aNqXMM8DJB26WFBdpD/VyBVfbgRQGXmn/MzS2ZzWaj
	9zNzKwmMXV7lt3P27L/PH2KJnXCTW3RpFX2uaT6fsZEO9dke8nSt+9GcrNmP+k1Haq5H
	/g5Bxo+Sky4c9T+qe1ekUWfsUS+ENggziqW3+sLaUbcbEoRvsT50neT6s54fx6JDmx72
	gMe59qavq6mDY9iiwSvRWZWP+Y0eSfAEbJaq7qg+lGigjo1rk4CxhUurWli1qSikW/6R
	zr3g==
X-Gm-Message-State: APjAAAX9+87le3+bAIHknJ32E7w50geKMVAdwPXUEMFrdSyixTnnvdDD
	tQhzQyBMEKy921h+uA/lZzNMbXzJyNOglr3VAcI=
X-Google-Smtp-Source: APXvYqzMrvkCQKSDhEv5oK44tQPDaW53IznI3UozxxjMPmC28VJx/Aket/VU29rvG8CF085q1o4vENbhDwk01y2doIg=
X-Received: by 2002:a19:4aca:: with SMTP id
	x193mr10645986lfa.146.1566181675075; 
	Sun, 18 Aug 2019 19:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190813075033.7866-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190813075033.7866-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 18 Aug 2019 22:27:44 -0400
Message-ID: <CADkTA4OjpQoNtzHq7C4cSiPJLo5Nzctvdd+T4cHNNHp96T4PNA@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-zaqarclient: upgrade 0.7.0 -> 1.11.0
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
X-List-Received-Date: Mon, 19 Aug 2019 02:27:58 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Tue, Aug 13, 2019 at 3:51 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
>
> Unable to find version 1.11.0 in branch stable/pike.
> Change branch to master.
>
> Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-zaqarclient_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-zaqarclient_git.bb b/meta-openstack/recipes-devtools/python/python-zaqarclient_git.bb
> index d3d24ea..e6f92f7 100644
> --- a/meta-openstack/recipes-devtools/python/python-zaqarclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-zaqarclient_git.bb
> @@ -28,10 +28,10 @@ RDEPENDS_${PN} +=" \
>         "
>
>  SRCNAME = "zaqarclient"
> -SRC_URI = "git://github.com/openstack/${BPN}.git;branch=stable/pike"
> +SRC_URI = "git://github.com/openstack/${BPN}.git"
>
> -PV = "0.7.0+git${SRCPV}"
> -SRCREV = "a1c2de74c56c6ddb11dc6aec78e8c438629ca8e8"
> +PV = "1.11.0+git${SRCPV}"
> +SRCREV = "13e90a0ab5e296fb8cf21d09c666c06ed47a84c0"
>  S = "${WORKDIR}/git"
>
>  inherit setuptools
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

