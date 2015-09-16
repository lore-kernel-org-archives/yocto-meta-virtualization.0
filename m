Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 24A51E00E28; Wed, 16 Sep 2015 13:05:47 -0700 (PDT)
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
	*      [209.85.160.170 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 24EC9E00E24
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Sep 2015 13:05:41 -0700 (PDT)
Received: by ykdu9 with SMTP id u9so231625926ykd.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Sep 2015 13:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=S105ITAoZO7L7DgVbSt+aMfijBBpnJkZbVsAjo/gSwI=;
	b=YKbEn7Ml1iseofyLF4KQFfmJxVfW0+lT8Nk3eiRaLpEXt1DsH3DhLhjARVHwVwqf3N
	FNCSDGLH6Bvk5+YbMyqpKGbR5Um0xwl2G7h8vZCbjEpmtssIfQ1/WmQ4AwmSq/qBnuLx
	1EIC7UPT7nipNUu2ClthzxqDKqun/Maa0wZgNPl2Q3ZXGvCgs9VX6Jx055XlkhGWLYpq
	/HTeiXdL5AFOPHfxSDHRdqnSdhBd6Vw6ILFKHWkVuNgBfewmiECchg0ZLbLNfxcKU9DV
	x22d3M04rq8G+XoRlj+/VEvcZ0iyICVhs63ZZW6nALABiUpzOzs2KHNYidam1WrQJLrk
	SWIw==
MIME-Version: 1.0
X-Received: by 10.13.245.135 with SMTP id e129mr28905812ywf.13.1442433941208; 
	Wed, 16 Sep 2015 13:05:41 -0700 (PDT)
Received: by 10.129.34.212 with HTTP; Wed, 16 Sep 2015 13:05:41 -0700 (PDT)
In-Reply-To: <1442308618-33594-1-git-send-email-josep.puigdemont@enea.com>
References: <1442308618-33594-1-git-send-email-josep.puigdemont@enea.com>
Date: Wed, 16 Sep 2015 16:05:41 -0400
Message-ID: <CADkTA4MG-L+X7RJoHuE_mccwGo++hv0YCnvLvMs532HGM-1P-g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Josep Puigdemont <josep.puigdemont@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][all][PATCH] celt051: use https protocol in git fetcher
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
X-List-Received-Date: Wed, 16 Sep 2015 20:05:47 -0000
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Tue, Sep 15, 2015 at 5:16 AM, Josep Puigdemont
<josep.puigdemont@enea.com> wrote:
> Only the https protocol is available when cloning from
> git.xiph.org currently.
>
> Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
> ---
>  recipes-support/celt051/celt051_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-support/celt051/celt051_git.bb b/recipes-support/celt051/celt051_git.bb
> index 686c962..ee38821 100644
> --- a/recipes-support/celt051/celt051_git.bb
> +++ b/recipes-support/celt051/celt051_git.bb
> @@ -17,7 +17,7 @@ PR = "r0"
>
>  SRCREV = "5555aae843f57241d005e330b9cb65602d56db0f"
>
> -SRC_URI = "git://git.xiph.org/celt.git;branch=compat-v0.5.1"
> +SRC_URI = "git://git.xiph.org/celt.git;branch=compat-v0.5.1;protocol=https"
>
>  S = "${WORKDIR}/git"
>
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

