Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C5FF0E01486
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 May 2013 05:57:54 -0700 (PDT)
Received: by mail-lb0-f179.google.com with SMTP id d10so1830501lbj.38
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 May 2013 05:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=OpTaTas27jg/0i83AQcQOMchYObmsNcP805zmnKYZB0=;
	b=tysY3h4xLWcCUAo2XDjzGVRjb+lgLdGG5REGwZ1pDBK9z2X0WbLXuZ5OSrt8Qh68n1
	xihXrse/3k/ytMGJzAhLGZF0teHGjAr4ZpEzirUGTV8TsntxzESIgRdDFW9T+AZHR1nq
	8QnRTCbhhMm29zVkm8SGWFQV98dq3RRA85UwlogyifYiD2LNyFvAaMcoLlD6qmh43pu+
	ZQKpFNPTg6LqQJ/JSZLBIdSXXU2GYlbCVFxQyBwBCF8kzk1dmX3xjcVzYL0qNbCnTV88
	fsZxCmXANhAaRjSsoucnwPIf7NOXJXu6OpDU0phSg4uNVaK8Z1EEZmM4TgiDFnqW9jSq
	iMqA==
MIME-Version: 1.0
X-Received: by 10.112.128.231 with SMTP id nr7mr17391296lbb.26.1368622673502; 
	Wed, 15 May 2013 05:57:53 -0700 (PDT)
Received: by 10.112.234.166 with HTTP; Wed, 15 May 2013 05:57:53 -0700 (PDT)
In-Reply-To: <1368607316-17468-1-git-send-email-b28495@freescale.com>
References: <1368607316-17468-1-git-send-email-b28495@freescale.com>
Date: Wed, 15 May 2013 08:57:53 -0400
Message-ID: <CADkTA4NZR6spKaTAkdkLcR5+BJu2EgrrNiCA5gQa_AQgRCGoMg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: b28495@freescale.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, b19537@freescale.com
Subject: Re: [PATCH] iptables: update bbappend to match oe-core
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
X-List-Received-Date: Wed, 15 May 2013 12:57:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, May 15, 2013 at 4:41 AM,  <b28495@freescale.com> wrote:
> From: Ting Liu <b28495@freescale.com>
>

Queued. This will be pushed shortly.

Bruce

> Signed-off-by: Ting Liu <b28495@freescale.com>
> ---
>  ...es_1.4.17.bbappend => iptables_1.4.18.bbappend} |    0
>  1 files changed, 0 insertions(+), 0 deletions(-)
>  rename recipes-extended/iptables/{iptables_1.4.17.bbappend => iptables_1.4.18.bbappend} (100%)
>
> diff --git a/recipes-extended/iptables/iptables_1.4.17.bbappend b/recipes-extended/iptables/iptables_1.4.18.bbappend
> similarity index 100%
> rename from recipes-extended/iptables/iptables_1.4.17.bbappend
> rename to recipes-extended/iptables/iptables_1.4.18.bbappend
> --
> 1.7.3.4
>
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

