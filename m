Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CB625E008F2; Sat, 11 Mar 2017 15:03:09 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.196 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.196 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 48CA9E0077F
	for <meta-virtualization@yoctoproject.org>;
	Sat, 11 Mar 2017 15:03:07 -0800 (PST)
Received: by mail-yw0-f196.google.com with SMTP id 2so6617975ywn.3
	for <meta-virtualization@yoctoproject.org>;
	Sat, 11 Mar 2017 15:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WErMcszK8f4H0AS+jxrcBoYpzDCaEni+opcDL4tguT4=;
	b=Ff7kJmuqrXY19R/QmOl2rspv4Bi4QyqbrwmJK3XUsE4S39bsPpTD3zshdi/iwejnw8
	EFK1PXia08914jDchlLnKPy1mW6V4jPRo2z2qXF5IP4Kf91ye5lOAahvqifcDbkMGHVM
	HnRauOn2K10ZLWZ6sGI2/f7x9WFgZ8ZwtmrhxqXMla9716/l9aBSj7B2ORX1CHAbeV0P
	WLBitMQvF27rGfY8oGZU8Io/77GSanpSY4hgpimGefE6AO7nfvQr9RJZraxr+PPeqBk3
	+laGFPH71v4JcAWhDng6TCjesQoCMECriV0dGptmZHy1x3MQaPLk9ECKbKEC7S6fsom/
	9C7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=WErMcszK8f4H0AS+jxrcBoYpzDCaEni+opcDL4tguT4=;
	b=DOvgNA+VQta2TzjVTKFyMc5szt/TJOboxKAzgHgaIIuulm1ldt9lhZ6N2ILy1oZ4Dq
	yosXIIzSPtjQGqq9jMEtdU7CVPTGK9+x/rn+bBFQP34C6xTm8e7YYLPkea1FvHWN59kP
	rsMZNcpOTbOCBunlhrx1FhRw6Psih9vFzN4wndmcdjuShC1qox51UdBsHpl67Ne0CJ6u
	kcQLrlkl2tdd+HmtUc8j1Dh1VPe5MfGMI86NKX7sTUAEkDH2538RSLIKGEg+QRRxJ18J
	rqt2TsePELwX6dbqCNPXbNza7vh7TjTnXET7RfF2Pm6zbUuUvuoQRkwNkJ9GZuQxgzIm
	yaKw==
X-Gm-Message-State: AMke39kFZlFmtxYdgr4pE/Ji75occc/Yecsaa6fmCIZW+8cjMtR7vzilW23RSWvWuSmeu2IM9dwWma09TzKT2A==
X-Received: by 10.37.44.22 with SMTP id s22mr12785092ybs.115.1489273387073;
	Sat, 11 Mar 2017 15:03:07 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.174.25 with HTTP; Sat, 11 Mar 2017 15:03:06 -0800 (PST)
In-Reply-To: <1489271489-5903-1-git-send-email-mark.asselstine@windriver.com>
References: <1489271489-5903-1-git-send-email-mark.asselstine@windriver.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Sat, 11 Mar 2017 18:03:06 -0500
X-Google-Sender-Auth: Z3u0XGYeMgLcUUVEEwZ8s9Fkt_4
Message-ID: <CAPuovEJmJKJOQy=vo15YFjPfPRZ-Yd8nXrKugzV47Zj+1FGXNg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] openvswitch: add missing depends on coreutils-native
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sat, 11 Mar 2017 23:03:09 -0000
Content-Type: text/plain; charset=UTF-8

Additional information

Note that this seems to be related to the following (subject: State of
bitbake world, Failed tasks 2017-03-11)
https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg52129.html

Since cksum was already installed on my build host I believe this
patch is still required. I just wanted to follow up as the information
in the linked email might be of interest with this recent round of
build failures.

Mark

On Sat, Mar 11, 2017 at 5:31 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> I was getting the following error when building the latest master:
>
>   ../git/build-aux/calculate-schema-cksum: cksum: not found
>   ../git/build-aux/calculate-schema-cksum: cksum: not found
>
> Adding coreutils-native which supplies 'cksum' resolved this.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-networking/openvswitch/openvswitch.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-networking/openvswitch/openvswitch.inc b/recipes-networking/openvswitch/openvswitch.inc
> index 71c746f..1f0b52b 100644
> --- a/recipes-networking/openvswitch/openvswitch.inc
> +++ b/recipes-networking/openvswitch/openvswitch.inc
> @@ -11,7 +11,7 @@ HOMEPAGE = "http://openvswitch.org/"
>  SECTION = "networking"
>  LICENSE = "Apache-2"
>
> -DEPENDS += "bridge-utils openssl python perl python-six-native"
> +DEPENDS += "bridge-utils openssl python perl python-six-native coreutils-native"
>
>  RDEPENDS_${PN} += "util-linux-uuidgen util-linux-libuuid coreutils \
>         python perl perl-module-strict ${PN}-switch \
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

