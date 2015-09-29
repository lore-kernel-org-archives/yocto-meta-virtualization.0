Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CD21CE00B23; Tue, 29 Sep 2015 08:04:23 -0700 (PDT)
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
	*      [209.85.160.176 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8D508E0076A
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Sep 2015 08:04:17 -0700 (PDT)
Received: by ykdt18 with SMTP id t18so9497124ykd.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Sep 2015 08:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=sQS/J2sMfZLG9/dS4Y+ZDYkvA0X8a3+M/r5Jw0kX3GQ=;
	b=kvX9SqyZEHhaj86rocEO3kSC2TfPGHqW4GLhsqA5pgjzavKLqBg/c8VDTpzntIcpvo
	ki52ajzKLhbqEIkQhwgxE94//0BR0COSGhu+2EUCJt2PGM7dYLzdQdjRrjRs7pryql49
	TvOx0TEOfzo/zRhyrNxbgk83pCnjo1S3iIwd1oj0c1rKlJba6iGV80li3Y/3SKGJ+eSU
	XxQ8mrBmlWZ60hATXwCJj72Gsy/G5xh7pUhc1kceEcBcsZRxZtQcAQ9S4Ad5HLx1nXsu
	8mOqqzMymMuTh3I7ORGTruYh4ONNDYxs3GTB0I5WAr+/INTU5KnDR4/3LmUukJW157zP
	yzbA==
MIME-Version: 1.0
X-Received: by 10.129.96.9 with SMTP id u9mr13076473ywb.13.1443539057082; Tue,
	29 Sep 2015 08:04:17 -0700 (PDT)
Received: by 10.13.217.201 with HTTP; Tue, 29 Sep 2015 08:04:17 -0700 (PDT)
In-Reply-To: <1443026751-57424-1-git-send-email-josep.puigdemont@enea.com>
References: <1443026751-57424-1-git-send-email-josep.puigdemont@enea.com>
Date: Tue, 29 Sep 2015 11:04:17 -0400
Message-ID: <CADkTA4NGOn6Rt5RxztM+f1OWGFsgm8iCGnEFgu5YfjGOgiZosQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Josep Puigdemont <josep.puigdemont@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][fido-kilo][PATCH] python-glancestore: requires python module enum
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
X-List-Received-Date: Tue, 29 Sep 2015 15:04:23 -0000
Content-Type: text/plain; charset=UTF-8

merged!

Bruce

On Wed, Sep 23, 2015 at 12:45 PM, Josep Puigdemont
<josep.puigdemont@enea.com> wrote:
> In capabilities, glance store imports enum, which is available
> since python 3.4. For earlier versions of python we can use
> the backported package python-enum34 from meta-python.
>
> Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
> ---
>  meta-openstack/recipes-devtools/python/python-glancestore_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-glancestore_git.bb b/meta-openstack/recipes-devtools/python/python-glancestore_git.bb
> index b3aa2f3..43707ee 100644
> --- a/meta-openstack/recipes-devtools/python/python-glancestore_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-glancestore_git.bb
> @@ -22,6 +22,7 @@ DEPENDS += " \
>          "
>
>  RDEPENDS_${PN} = " \
> +   python-enum34 \
>     python-eventlet \
>     python-iso8601 \
>     python-six \
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

