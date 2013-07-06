Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 96B5AE0155E
	for <meta-virtualization@yoctoproject.org>;
	Fri,  5 Jul 2013 20:40:22 -0700 (PDT)
Received: by mail-la0-f46.google.com with SMTP id eg20so2534947lab.19
	for <meta-virtualization@yoctoproject.org>;
	Fri, 05 Jul 2013 20:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=3fFYwczTeg/YkScem5bHIL6wjOmCubZl+nVB9bpKt4Y=;
	b=zihDodkD0YtJjPkr5Y3/G7MHQUFU7ax4Fk6WYOEQh6tp4kdmOo1mMQ8wK/EsX4m1o+
	B+H9duB6A4H85BXW4f3jS75EhXe5+stQekmCGLIg4H4GO3IFmPNB3VKcGCeG2ab72T2U
	CqSmLfk6XVhky4PS6dG3QgqRYEhZS4HGEiIb5c1VCffL0xSgndprT5qUiEBANNMIVk2C
	C4sMbJB/V1xWS0pC4bU7L7mTW9HI53rYRYPxJoInTANRN+VjDIgR6ChwIOjLMP1wY/bl
	2CtKEDmclR+CJgu7EhNuCZi7hHJAj5rxo742wFgc68t/mq5vt8PHUT5PKXHhtcrubEsv
	qjyg==
MIME-Version: 1.0
X-Received: by 10.152.27.40 with SMTP id q8mr6145896lag.75.1373082021087; Fri,
	05 Jul 2013 20:40:21 -0700 (PDT)
Received: by 10.112.133.234 with HTTP; Fri, 5 Jul 2013 20:40:21 -0700 (PDT)
In-Reply-To: <1373077224-8733-1-git-send-email-b28495@freescale.com>
References: <1373077224-8733-1-git-send-email-b28495@freescale.com>
Date: Fri, 5 Jul 2013 23:40:21 -0400
Message-ID: <CADkTA4NAR=TfqoD9VLw7nspt=kaakLUFUtXo5tMMSA14XzhhnA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Liu Ting-B28495 <b28495@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	Luo Zhenhua-B19537 <b19537@freescale.com>
Subject: Re: [PATCH 1/2] iptables: Follow OE-Core update to 1.4.19.1 version
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
X-List-Received-Date: Sat, 06 Jul 2013 03:40:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jul 5, 2013 at 10:20 PM,  <b28495@freescale.com> wrote:
> From: Ting Liu <b28495@freescale.com>

Both patches in the series are fine. I grabbed them and will push them
out over the weekend.

Bruce

>
> Signed-off-by: Ting Liu <b28495@freescale.com>
> ---
>  ..._1.4.18.bbappend => iptables_1.4.19.1.bbappend} |    0
>  1 files changed, 0 insertions(+), 0 deletions(-)
>  rename recipes-extended/iptables/{iptables_1.4.18.bbappend => iptables_1.4.19.1.bbappend} (100%)
>
> diff --git a/recipes-extended/iptables/iptables_1.4.18.bbappend b/recipes-extended/iptables/iptables_1.4.19.1.bbappend
> similarity index 100%
> rename from recipes-extended/iptables/iptables_1.4.18.bbappend
> rename to recipes-extended/iptables/iptables_1.4.19.1.bbappend
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

