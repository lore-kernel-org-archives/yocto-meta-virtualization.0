Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0D858E01496
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Apr 2013 08:46:01 -0700 (PDT)
Received: by mail-lb0-f171.google.com with SMTP id v10so2822643lbd.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Apr 2013 08:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=dGEGle336VnNQP+aFn29gIY3sD46ViOgv86agPMSsfE=;
	b=L6i8rQ62PRuEjOH0w+0yn74Xj2SAp/vPYwuqT9DU2aE8bdJMZLBmKNhr2/psRlpON1
	tsA95EQHJtNn/8OqJrDxqXeNpEWM+QGoskxD+fpJF9oRH9I9WLA79j/L4TxQNRMX1mtj
	ENUwd6hqktx5op6DU3NpAWqvvtVE5M1cAipmqVglACnLnD38fNrbnofup1iCOgxAIgmF
	KVnU3iPuQN6+vHgktx6w6dUsDEet1M2d8pd3L4cjHmSoMy7GJohSQwo5Ktq3sWTnlgWc
	frFq3bRwRnPHMOOf05bWmpLsC2crnfL54Al0nv3oEV987v4+x86VpjvnbSxktU1zZycE
	2Jdg==
MIME-Version: 1.0
X-Received: by 10.112.145.230 with SMTP id sx6mr6133582lbb.49.1366299960596;
	Thu, 18 Apr 2013 08:46:00 -0700 (PDT)
Received: by 10.112.75.161 with HTTP; Thu, 18 Apr 2013 08:46:00 -0700 (PDT)
In-Reply-To: <1366297842-10846-1-git-send-email-mihai.prica@intel.com>
References: <1366297842-10846-1-git-send-email-mihai.prica@intel.com>
Date: Thu, 18 Apr 2013 11:46:00 -0400
Message-ID: <CADkTA4P=3zxnhhKZgHZDHKRRMZ9TusKUBTDFya_KMegc54awpQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mihai Prica <mihai.prica@intel.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/2] iasl: Fixed broken URL
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
X-List-Received-Date: Thu, 18 Apr 2013 15:46:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Apr 18, 2013 at 11:10 AM, Mihai Prica <mihai.prica@intel.com> wrote:
> Signed-off-by: Mihai Prica <mihai.prica@intel.com>

Simple enough. Makes sense to me. I have other changes staged and under test,
I can grab this and put it on that queue.

Bruce

> ---
>  recipes-extended/iasl/iasl_20120215.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/iasl/iasl_20120215.bb b/recipes-extended/iasl/iasl_20120215.bb
> index b48e380..e9c5fbe 100644
> --- a/recipes-extended/iasl/iasl_20120215.bb
> +++ b/recipes-extended/iasl/iasl_20120215.bb
> @@ -7,7 +7,7 @@ PR="r1"
>
>  DEPENDS="flex bison"
>
> -SRC_URI="http://www.acpica.org/download/acpica-unix-${PV}.tar.gz"
> +SRC_URI="https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
>
>  SRC_URI[md5sum] = "324c89e5bb9002e2711e0494290ceacc"
>  SRC_URI[sha256sum] = "b2b497415f29ddbefe7be8b9429b62c1f1f6e1ec11456928e4e7da86578e5b8d"
> --
> 1.7.9.5
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

