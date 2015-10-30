Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5FD5DE00AE9; Thu, 29 Oct 2015 19:56:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BFE8BE00AD1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Oct 2015 19:56:42 -0700 (PDT)
Received: by wmff134 with SMTP id f134so2184766wmf.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Oct 2015 19:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=UZ5jV3+VvtPhVp9E3SzRQ0n3YZwCFgaamcD5kUAbTlE=;
	b=DSUiG3IEs8/dYGxIcrIiyXCPu2nPrW+6UaI0HdNMTFjQU/XbciJlb0xuihE3CHa7n3
	maZlBGaJmLPVghIImbQpCZv7Wy8snJXm87E7xL36j0elV6pQgMj0pS+W/INAWSWrrO7G
	EDWmmDJVxUOUCTK2a4/7nUJw962Ki1xcT8iY78CZcfeENx1Mf4A0kXsOia/UKJW9zUfw
	UMGHWx1/EQQoS1vl3nGEpdmvDBWfd/XEqIQkbaZGy/gr+IorDyCgojpINGbwwGj7C4to
	UfuXZJut137qBeIl/ryPevaFJU74iAHnGjvY6fPPXv0l7OBmuUxYqiyINfuZi9dBAnLZ
	P7Ag==
MIME-Version: 1.0
X-Received: by 10.28.11.205 with SMTP id 196mr546113wml.83.1446173800974; Thu,
	29 Oct 2015 19:56:40 -0700 (PDT)
Sender: asselsm@gmail.com
Received: by 10.194.94.101 with HTTP; Thu, 29 Oct 2015 19:56:40 -0700 (PDT)
In-Reply-To: <1446173696-15191-2-git-send-email-mark.asselstine@windriver.com>
References: <1446173696-15191-1-git-send-email-mark.asselstine@windriver.com>
	<1446173696-15191-2-git-send-email-mark.asselstine@windriver.com>
Date: Thu, 29 Oct 2015 22:56:40 -0400
X-Google-Sender-Auth: 1tNlc8mwNOs7Mz33PM030UfkmH8
Message-ID: <CAPuovEJZ=+aDApCVeSRbdL9DPj7Cb+Mkt4d6CyCmi6A3NFQw3A@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>, 
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-overc][PATCH] local.conf.sample: set DISTRO
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
X-List-Received-Date: Fri, 30 Oct 2015 02:56:46 -0000
Content-Type: text/plain; charset=UTF-8

Please ignore this one, accidentally got picked up in my send-email expression.

Mark

On Thu, Oct 29, 2015 at 10:54 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> My builds kept on producing images with sysvinit as the init system
> despite being told that systemd was the expected default throughout
> meta-overc. After poking around I found that the DISTRO in the
> local.conf.sample still had the default DISTRO set to 'poky' so
> changing this to be the expected 'pod'.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  meta-pod/conf/local.conf.sample | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-pod/conf/local.conf.sample b/meta-pod/conf/local.conf.sample
> index a5f9bfd..dbab304 100644
> --- a/meta-pod/conf/local.conf.sample
> +++ b/meta-pod/conf/local.conf.sample
> @@ -115,7 +115,7 @@ KMACHINE_genericx86-64 ?= "common-pc-64"
>  # Ultimately when creating custom policy, people will likely end up subclassing
>  # these defaults.
>  #
> -DISTRO ?= "poky"
> +DISTRO ?= "pod"
>  # As an example of a subclass there is a "bleeding" edge policy configuration
>  # where many versions are set to the absolute latest code from the upstream
>  # source control systems. This is just mentioned here as an example, its not
> --
> 2.1.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

