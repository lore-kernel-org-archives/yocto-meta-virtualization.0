Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C438AE00A21; Wed, 24 Jun 2015 11:42:15 -0700 (PDT)
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
	*      [209.85.213.53 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yh0-f53.google.com (mail-yh0-f53.google.com
	[209.85.213.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9A00CE009D2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 24 Jun 2015 11:42:10 -0700 (PDT)
Received: by yhfk64 with SMTP id k64so2847091yhf.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 24 Jun 2015 11:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=mgf61FvBfwdCYOOE/zuIbN5K2SKDnIWIBPnx5YHhLV0=;
	b=eLRn3tlGL8JkQ5ZIP9vVHq9nZMXJZY5DHm8cyGjyIQceGYszJ3TtYp+LFi+F2Vlrpp
	yCxdnrvAaj0UKXirWQKcEKSizs503oSH2nbszpvNR4PuWuV3RZA4wXNXdLIE0Q/ajs4T
	oL9S7fasMS+w03Mr61GvDrRpnpFo8gfYLxdVMYWCnBdXoEz2qxEGsUUr21TFj7YULvoL
	tkH0eX3BjFukIhAgTrMQnbN3qjuQ0VgNxxNYK6Mlhd/eAtq9AfLEVsqrLWdZqlVYdCCf
	9PXObbbn/8X0GCh/7tmfSXBdjrtKUguc6PEwNiWFgL4r+WG2eTAUqPtQiXyLziYGsFz4
	mFkw==
MIME-Version: 1.0
X-Received: by 10.170.56.83 with SMTP id 80mr46068306yky.16.1435171329227;
	Wed, 24 Jun 2015 11:42:09 -0700 (PDT)
Received: by 10.129.128.2 with HTTP; Wed, 24 Jun 2015 11:42:09 -0700 (PDT)
In-Reply-To: <CAOorjZTJZKp7oNbdwtAO3bqurNLT3ppwxs_EfjX3Qn22UStPsA@mail.gmail.com>
References: <CAOorjZTJZKp7oNbdwtAO3bqurNLT3ppwxs_EfjX3Qn22UStPsA@mail.gmail.com>
Date: Wed, 24 Jun 2015 14:42:09 -0400
Message-ID: <CADkTA4P3bs88r2EgSVgXzz+zW7meuGAUoz3K7X_ZiSfUYu2L1Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "SIVA SUBRAMANIAN.P" <psiva87@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Submitting change
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
X-List-Received-Date: Wed, 24 Jun 2015 18:42:15 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 24, 2015 at 2:33 PM, SIVA SUBRAMANIAN.P <psiva87@gmail.com> wrote:
> Hi,
> Can anyone tell me how to submit a change to github?

Everything should be in the README:

http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/README

Cheers,

Bruce

>
> Regards,
> Sivasubramanian
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

