Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E1D83E00872; Mon,  1 Dec 2014 07:49:43 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.182 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vc0-f182.google.com (mail-vc0-f182.google.com
	[209.85.220.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 66FEEE00521
	for <meta-virtualization@yoctoproject.org>;
	Mon,  1 Dec 2014 07:49:40 -0800 (PST)
Received: by mail-vc0-f182.google.com with SMTP id hq12so4820071vcb.27
	for <meta-virtualization@yoctoproject.org>;
	Mon, 01 Dec 2014 07:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=9UV7UlUkA3orxiGrJgC3VJAVuLW4INoMd5N1gnX1dws=;
	b=ZQpAS/FBMv9LdDRy0hqfSERxQIvIVulf1F76oMkQj56HwMZQxa8DqPEtZ74BMFxC2U
	oGF7wPRb/99FjNHpZBMKLOcwHLF5l7npOs8DvjsLnQYDT/uYFzfRoNTyRT9JsAEi6eTG
	AbZ1IdMjNLdNyItprpT2LT8NRw+S7nFXg81Yo68XPhe/XOQvPZkqIZE8BcMIZFSjp8fl
	lwQf4/eIiFce/MldkDbeB93vwJQrPIvV76EVt+LSIJg2fVGo8RdBXhFi8ABXRNUJPbTr
	Ey4VUympR0lF8np+eiJOYJWgHeM8smCYWLQ7XFSYdUf33ppxuEDH3LUCliMsrTRZTB5F
	ElaA==
MIME-Version: 1.0
X-Received: by 10.220.82.199 with SMTP id c7mr29418817vcl.61.1417448980458;
	Mon, 01 Dec 2014 07:49:40 -0800 (PST)
Received: by 10.52.114.225 with HTTP; Mon, 1 Dec 2014 07:49:40 -0800 (PST)
In-Reply-To: <1417163898-4587-1-git-send-email-david.c.nystrom@gmail.com>
References: <CADkTA4MVJkRUeLW-1tdxF03YjbNh-h0CBhh7X0WX7ooqA3EmLg@mail.gmail.com>
	<1417163898-4587-1-git-send-email-david.c.nystrom@gmail.com>
Date: Mon, 1 Dec 2014 10:49:40 -0500
Message-ID: <CADkTA4O5ykDEi4UxQFMqYRkeZxks4BU5pqCABcQUNq3-dRFwUw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: =?UTF-8?Q?David_Nystr=C3=B6m?= <david.c.nystrom@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [all][PATCH] Remove david.nystrom from MAINTAINERS
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
X-List-Received-Date: Mon, 01 Dec 2014 15:49:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thanks David. Merged!

Bruce

On Fri, Nov 28, 2014 at 3:38 AM, David Nystr=C3=B6m
<david.c.nystrom@gmail.com> wrote:
> I've been a ghost on the list for ages, I think its long overdue to
> remove me from the maintainers list.
>
> Signed-off-by: David Nystr=C3=B6m <david.c.nystrom@gmail.com>
> Signed-off-by: David Nystr=C3=B6m <david.nystrom@enea.com>
> ---
>  README | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/README b/README
> index 6a1f2d1..1531ac0 100644
> --- a/README
> +++ b/README
> @@ -34,7 +34,6 @@ Maintenance
>  Send pull requests, patches, comments or questions to meta-virtualizatio=
n@yoctoproject.org
>
>  Maintainers: Raymond Danks <ray.danks@se-eng.com>
> -             David Nystr=C3=B6m <david.nystrom@enea.com>
>               Bruce Ashfield <bruce.ashfield@gmail.com>
>
>  When sending single patches, please using something like:
> --
> 2.1.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

