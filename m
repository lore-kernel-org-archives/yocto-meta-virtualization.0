Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CF7B3E00E27; Thu,  8 Mar 2018 13:20:28 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.68 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1236FE00DFB
	for <meta-virtualization@yoctoproject.org>;
	Thu,  8 Mar 2018 13:20:27 -0800 (PST)
Received: by mail-lf0-f68.google.com with SMTP id h127-v6so10324914lfg.12
	for <meta-virtualization@yoctoproject.org>;
	Thu, 08 Mar 2018 13:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=omW/gmcKgvaP2emaXIi4LNA8jFUepkwQDqCxoiKEzi0=;
	b=JVWiAsgYdkZYT2uTAmeHh0KjsP67qnsy3vvvJcFnvZesZTMgENbErwgjoggteom1iS
	7n9+cSnppHbyOeXxcZaX1EcO7UUQGrcFAUaYS/ZEZQEvsgeXKfuMqTS6uLWefI7K3Tp+
	fnAXWyoyY4D1XWJ8dRkpE5D4BMZ+EfiaIRlBBSUj3n7lxjGDjfq/adaZzB/fEUOuvK3l
	fdBflgdsSlsBezc+naZjF+dFCXsYfQJ5hgt1dw2G0wA867KNVAXeOQH5ZTrmUFaETi5X
	Ls6xB6h03VzmbA+vaG2iXcXpaVEiCQC+IiiEce4QrVIStIW1U0G+SpJ/e4wowrNvHglG
	H53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=omW/gmcKgvaP2emaXIi4LNA8jFUepkwQDqCxoiKEzi0=;
	b=OTQ4bG6FbFSKGWDiiGmj0pArth7iTjY37u/VjA55hh0x3lF5yYRvximrSYlgLfuvQr
	AXDs1bFqv9sOD1eT745Iryqjsujxifn4Dxre3txXODDBgSebcQhg0Okz8WwHB36Vo0xE
	u/wHs58uxsACXLb9Aur5EzzW/KXxSg2VFyt+ksjXiqSAat9YmuXQ8UBf6y+P29eKj0N7
	DFKGqp4glI7OCKIP8SgLrqqTM+LIxkLe1tBqTKkYv9EFxfQp9N76AESb0IJHVPPOOVOl
	paTxDDvqkrHJqpKzJOaXriowzOmK50VhH5inH1XMdpvoKwe9+dtbsQiATmzbUYdcReU8
	/2Qg==
X-Gm-Message-State: AElRT7ES/H06Pp/1umJPiYAizW16syYei+qf06FyOuNM5bu1HB6K0hLS
	CxIdZh82cJPC2x1h/BTpAJTonTfBQpFl+CjcMiE=
X-Google-Smtp-Source: AG47ELtElNlrrBGBtTsSnARIU82DNxJSiBOk5n1POSkyFpctLpiwCXsauAR6u4IHbOBfS4Dnd0jF/LCdWIgBUex2U/4=
X-Received: by 10.25.215.197 with SMTP id q66mr18306689lfi.89.1520544026806;
	Thu, 08 Mar 2018 13:20:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.48.4 with HTTP; Thu, 8 Mar 2018 13:20:26 -0800 (PST)
In-Reply-To: <20180307170243.8155-1-jkrishnanjanappa@mvista.com>
References: <20180307170243.8155-1-jkrishnanjanappa@mvista.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 8 Mar 2018 16:20:26 -0500
Message-ID: <CADkTA4NdiJDcki72Y6QKfdtPZ7Gx8Mo-pgT7GoZBdfF6tjQO3g@mail.gmail.com>
To: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [master][rocko][PATCH 1/2] vgabios: replace PN with BPN, to solve fetch failure while building for multilib
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
X-List-Received-Date: Thu, 08 Mar 2018 21:20:28 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Wed, Mar 7, 2018 at 12:02 PM, Jagadeesh Krishnanjanappa
<jkrishnanjanappa@mvista.com> wrote:
> The multilib vgabios (for example lib32-vgabios) fetch fails with
> below error:
> -- snip --
> Location: http://nongnu.askapache.com/vgabios/lib32-vgabios-0.7a.tgz [following]
> --2018-03-07 16:45:22-- http://nongnu.askapache.com/vgabios/lib32-vgabios-0.7a.tgz
> Resolving nongnu.askapache.com... 192.185.42.228
> Connecting to nongnu.askapache.com|192.185.42.228|:80... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2018-03-07 16:45:22 ERROR 404: Not Found.
> -- snip --
>
> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> ---
>  recipes-extended/vgabios/vgabios_0.7a.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/vgabios/vgabios_0.7a.bb b/recipes-extended/vgabios/vgabios_0.7a.bb
> index 8c89041..3394173 100644
> --- a/recipes-extended/vgabios/vgabios_0.7a.bb
> +++ b/recipes-extended/vgabios/vgabios_0.7a.bb
> @@ -7,7 +7,7 @@ DEPENDS = "dev86-native biossums-native"
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=dcf3c825659e82539645da41a7908589"
>
> -SRC_URI =  "http://savannah.gnu.org/download/vgabios/${PN}-${PV}.tgz"
> +SRC_URI =  "http://savannah.gnu.org/download/vgabios/${BPN}-${PV}.tgz"
>
>  SRC_URI[md5sum] = "2c0fe5c0ca08082a9293e3a7b23dc900"
>  SRC_URI[sha256sum] = "9d24c33d4bfb7831e2069cf3644936a53ef3de21d467872b54ce2ea30881b865"
> --
> 2.11.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

