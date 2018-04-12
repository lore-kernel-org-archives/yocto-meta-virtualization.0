Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A325AE00C1B; Thu, 12 Apr 2018 13:03:44 -0700 (PDT)
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
	*      [209.85.215.67 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CF8B7E00873
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Apr 2018 13:03:43 -0700 (PDT)
Received: by mail-lf0-f67.google.com with SMTP id b189-v6so9488058lfe.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Apr 2018 13:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=enmzKfhz/MmVSiHJi5FcAq8SUtrvWiOBA3Nb0UDZCxk=;
	b=LDQyrA2JTIvC1zObrYM01P7QnSfwoppjDAf5G9eSc9Otq+3jqbKz1DtOu1aPAn3PAx
	wzgEeop1kgTJMj2GfNgU4hTGrO+IBd4S1t93pljDYpDsLcuWrkUBRh5es4NH85xaEeIi
	iDFnTPQIYiR91qMSi0uxgwgKYEGAY36kQkDrkTOhYNEjH1GsBNm3E8MkfNcxoYfs4oDx
	HSQwhsW690C9K22VuKkWk0PD5oT/FxtXpQ3VJVbYdDcwN84XTFXYGwAJvZ2vtg54Bt+x
	JOG/6mHBhHpoTrEN15GHumJn3dAjXpdgPqa3zjH+QnUqwtY2lSlS1A29L1pi0g6GnAaf
	kF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=enmzKfhz/MmVSiHJi5FcAq8SUtrvWiOBA3Nb0UDZCxk=;
	b=gz14PfB5UmIyk5uukhtazVTQeY8hJJ30Q5D3KBidW8Vi5VOq2q0FZFzCMyV/XjYFtX
	EPerk/yEHodWLj+hmZ+8+FQRRPNb90Wjl4Xp90SSxQAzhGYBa2E9ub7GCA/yBUlhLN/m
	s6MFsE/n489ijxZT6e15dqWAqsS9CgKXEMVv4H3vnq5sV5Ra6wwY+iVEas7WlCe2f2uR
	Snf/+jHSmyrRfYVwU+tlUb7VLQxv2d1V+SrXphCNb61IjxF2WCrmkeadKJJIV4ddpELY
	UJWfjAQlb0bpUQuKHw/IRjXT/75swL/bLmGCwrdaejJAzADjGkmwBh26BiAgy7iEsqVD
	abEA==
X-Gm-Message-State: ALQs6tAMfzx7uPRZLhFhBO5TXc1VSXtifuvB4w3Vvzx2BncNlgnRSqcc
	50pLqbeDfYh81Ju0KL2B2lfFHgEalolj39y3MsM=
X-Google-Smtp-Source: AIpwx4/UCk49SXdJrrcpCpGZM/l/8BEsyXMsIOwi8nM8VYA3mtIzGciWeLJ7FslZwxLETZPlAY3n15ORJl+PS6jbtMg=
X-Received: by 2002:a19:1b02:: with SMTP id b2-v6mr6096317lfb.3.1523563422486; 
	Thu, 12 Apr 2018 13:03:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Thu, 12 Apr 2018 13:03:42 -0700 (PDT)
In-Reply-To: <1523298703-17734-1-git-send-email-mark.asselstine@windriver.com>
References: <1523298703-17734-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 12 Apr 2018 16:03:42 -0400
Message-ID: <CADkTA4MWzPOwh2b2SJX9Ro5WDSByBpsAVJZk+5rSnr3vaVRJow@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH] README: update code submission line to include "m-c-s" and '-M'
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
X-List-Received-Date: Thu, 12 Apr 2018 20:03:44 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Mon, Apr 9, 2018 at 2:31 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> The READMEs were lacking the "[m-c-s]" which we normally expect on the
> mailing list as well as the use of the "-M" option which makes
> reviewing patches, which include a move as seen when we uprev a
> recipe, easier to review.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  README                | 2 +-
>  meta-openstack/README | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/README b/README
> index a66168c..ece05b2 100644
> --- a/README
> +++ b/README
> @@ -41,7 +41,7 @@ Maintenance
>  Send pull requests, patches, comments or questions to meta-virtualization@yoctoproject.org
>
>  When sending single patches, please using something like:
> -'git send-email -1 --to meta-virtualization@yoctoproject.org --subject-prefix=meta-virtualization][PATCH'
> +'git send-email -1 -M --to meta-virtualization@yoctoproject.org --subject-prefix=meta-virtualization][m-c-s][PATCH'
>
>  Maintainers: Bruce Ashfield <bruce.ashfield@windriver.com>
>
> diff --git a/meta-openstack/README b/meta-openstack/README
> index 9d240e4..81b843b 100644
> --- a/meta-openstack/README
> +++ b/meta-openstack/README
> @@ -33,7 +33,7 @@ Maintenance
>  Send pull requests, patches, comments or questions to meta-virtualization@yoctoproject.org
>
>  When sending single patches, please using something like:
> -'git send-email -1 --to meta-virtualization@yoctoproject.org --subject-prefix=meta-virtualization][PATCH'
> +'git send-email -1 -M --to meta-virtualization@yoctoproject.org --subject-prefix=meta-virtualization][m-c-s][PATCH'
>
>  Maintainers: Bruce Ashfield <bruce.ashfield@windriver.com>
>
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

