Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6974EE0095C; Thu,  6 Sep 2018 09:46:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E7C6AE0090C
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Sep 2018 09:46:15 -0700 (PDT)
Received: by mail-lj1-f195.google.com with SMTP id v26-v6so9910038ljj.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Sep 2018 09:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=C8h3VNNx7YgzULOlFGi6nKirYnReEWJiHnXudtFe1v0=;
	b=PE858xSZEwsX9MtfIRPdcYo+hYIDs0onwMo2vwqTSs0YgeOqjtqQmTOzASNmiNoGp7
	ZsjmGIv+niapkMO6IYPEeJdXl+K+g/iUtF4DjnEnUCWpHAEBx/z6X95dq+bkcgB8zpuh
	sBGwrQU02cRsmgA70orc88qdIy2Q/aP4T+BOP/8vMv6NGGW9P3u8ILu9F7ks1I/BvDkX
	9WyHmW11w9qAwHVkixvfcby8NtFLEPwkISgp3fDYeDcjPlflFEIo6DLfqXo7t/ZKMySE
	p0rjd/A3OXkibPCUM537ft6s0FXJB08q+6bibAZUFE71eIPTp1OzMQIMskZpTW9hSJwB
	qFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=C8h3VNNx7YgzULOlFGi6nKirYnReEWJiHnXudtFe1v0=;
	b=n2pnLGa7jEwy2xjr0bVNNM+jZHv9pE8fApS87VbYxYwF3sKZSvuhtZmQ1DqgEs2GvW
	W0VLx537AnXzcoFh+Xt2I8BEEeEKxcya12rsQz+12q8aCaI9CBk8Lpq9gXjfkljjRm0i
	o/oSvvXMBPiD3DZuEswMYM7q9jqFIx/ZuNyP1B9I1gqLfxBCIfosDsllvLqk69TlXrJr
	py2Ww6F9Ragpnl+8dP5AEYKOJRZ1E0qOl25CI98jcNSXUW4d8ME55kHe/bNszGhFUpqd
	EQWVzNg0S7TSWG7jLZZ4iYSZNg1xDGrtn4Iw/w1iY6zJ9enTZ4zssrq2KLS/Oe35OQCG
	86yg==
X-Gm-Message-State: APzg51DNfDbvPa0XwdsFEiJFRTjEB5Z0mLym+kUmJB1aVsSAZMThEfuB
	wLDnwESH/9dUZuH2p91j5SaL0ukat2OMO7vCEZekUQ==
X-Google-Smtp-Source: ANB0VdZ/HxBa1VB0gV6C6XRxQvQ4yQHlR/O4bjOawVBf3fhpV1x0o4EnJNTybTbFQqahRg/1/GQegmw4q8zwboV262M=
X-Received: by 2002:a2e:2b1b:: with SMTP id
	q27-v6mr2413140lje.147.1536252374861; 
	Thu, 06 Sep 2018 09:46:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:86c9:0:0:0:0:0 with HTTP;
	Thu, 6 Sep 2018 09:46:14 -0700 (PDT)
In-Reply-To: <20180905224445.63319-1-jason.wessel@windriver.com>
References: <20180905224445.63319-1-jason.wessel@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 6 Sep 2018 12:46:14 -0400
Message-ID: <CADkTA4OFV-cFqr=3gP3YK7xQHQKnfPrY0E6=1_JDDa+8JPWQYw@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] openvswitch: Turn off ssl integration by default
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
X-List-Received-Date: Thu, 06 Sep 2018 16:46:20 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Wed, Sep 5, 2018 at 6:44 PM, Jason Wessel <jason.wessel@windriver.com> wrote:
> The openssl library is an optional component for the openvswitch.  The
> problem with it enabled by default is that it will consume system
> entropy to try to initialize the openssl library even though we are not
> using it by default.  With the 4.16 kernel and up there is not always
> enough entropy available at the early boot time which can cause a
> lengthy stall, while waiting to initialize the openvswitch.
>
> If ssl is needed, it can of course be turned on with the package
> config option "ssl".
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  recipes-networking/openvswitch/openvswitch_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> index 4a6002a..4cd82d7 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -40,6 +40,7 @@ DPDK_INSTALL_DIR ?= "/opt/dpdk"
>  PACKAGECONFIG ?= "libcap-ng"
>  PACKAGECONFIG[dpdk] = "--with-dpdk=${STAGING_DIR_TARGET}${DPDK_INSTALL_DIR}/share/${TARGET_ARCH}-native-linuxapp-gcc,,dpdk,dpdk"
>  PACKAGECONFIG[libcap-ng] = "--enable-libcapng,--disable-libcapng,libcap-ng,"
> +PACKAGECONFIG[ssl] = ",--disable-ssl,openssl,"
>
>  # Don't compile kernel modules by default since it heavily depends on
>  # kernel version. Use the in-kernel module for now.
> --
> 2.17.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

