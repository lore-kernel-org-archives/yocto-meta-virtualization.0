Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A3388E00AE4; Fri,  6 Apr 2018 06:47:49 -0700 (PDT)
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
	*      [209.85.215.66 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7A241E00A96
	for <meta-virtualization@yoctoproject.org>;
	Fri,  6 Apr 2018 06:47:48 -0700 (PDT)
Received: by mail-lf0-f66.google.com with SMTP id u3-v6so642890lff.5
	for <meta-virtualization@yoctoproject.org>;
	Fri, 06 Apr 2018 06:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NhTYIeAWg0o5rDkbHcFDsU+VXgxK0yz2EClAHAoLU/k=;
	b=AMlpwxTV9Sf0lFfPBzVObNWrNShwxP3Ozb6nxhEj2/LsJvOk9M5+cUuXOT0r3+j6Pb
	Y/UN2awzXJC2FROFLqq4SZRyvGu9Jk243hBMCXD5gKUKBvsHKZ6mSDHduXYfoxJJs4Rg
	otQ0kVsTP6El/BH3ymSeIdK4j2iM3DNPUpVE9U6s8j5bjCdPUmKJ7OiB+TPOAsqbi/UP
	nP/YPDa+qq8uIIwKy8+zITAkhvYlvO/zCBrZCC7YfHLvwGZwbJ6Hcz1RWDSfwWRkFzj8
	JLJ8sfQuBU+zzMGjbAWhHqgTjhEx74hfoT2qh+2fpIHvBeQg61LTDnZDJZ+CFNcSxacB
	XrfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NhTYIeAWg0o5rDkbHcFDsU+VXgxK0yz2EClAHAoLU/k=;
	b=cmtHqYIN3C3arMYU4BvJ/8SB5kx+neQMx1DQUaaNGUjv6wDf92M76I+nwMrrIuoe/f
	Dmfwv3VdUj34nqSaiqzPKQ7+5grQ0Jh16y7fK2dKODOD+3StGNnVD34n/wNgskHet2eo
	Sbml+b90Q3bB3j3O7dj4KI0sn1Xm75CXoR3tUxRTNjaZmnO0by9Yse24mXB6O6HuFGn7
	gYwCWlTH/W6uKpRitLfE4yBmkCLXcpvpmjW5RIIwmKd7DRi+62/DO5UDNdi9hmKGwL8x
	91p34CSGVO6BNvljEYjOaVYjl4AB9Ppj7Yp+/wCmjuj9ShragVGNXkySphhu3F+oRfeh
	l7PQ==
X-Gm-Message-State: AElRT7GCDExZMj2N2oybUazCGrdXZ21sAB8PMCI502pHOpaB0sHXhjV3
	0OnZQWjigqJmrHJFIi70CXw2aXqpMStc7g42U/O+qQ==
X-Google-Smtp-Source: AIpwx49G1F91TzxL0RJUz1u6G47znht/BLE1eaVMoc3b2UQB5SjHrzQMkcf4sNmVbwLt0HK3tKrfn4HApCzOZNKCmL8=
X-Received: by 10.46.23.202 with SMTP id 71mr16609150ljx.49.1523022467056;
	Fri, 06 Apr 2018 06:47:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Fri, 6 Apr 2018 06:47:46 -0700 (PDT)
In-Reply-To: <20180406134156.21533-1-pascal.bach@siemens.com>
References: <20180406134156.21533-1-pascal.bach@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 6 Apr 2018 09:47:46 -0400
Message-ID: <CADkTA4OnjNg7NXbZ1GPWUv4Ajvim0TQBEr5dHc-pPo+2u0nYGw@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 1/2] docker-proxy: add recipe for docker-proxy
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
X-List-Received-Date: Fri, 06 Apr 2018 13:47:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 6, 2018 at 9:41 AM, Pascal Bach <pascal.bach@siemens.com> wrote:
> Before docker-proxy was built as part of the docker-recipe but there
> in some situations when built for x86_64 under x86_64 it incorrectly
> linked against host libraries.
> This puts it into a separate recipe that makes use the go.bbclass to build
> the binary properly.
>

As I hinted, I'm going to figure out how to integrate / fix this in the main
docker recipe.

Having the various SRCREVs managed in multiple recipes is a maintenance
pain and recipe for runtime errors.

I'll dig into what the go class is doing that is so different from what I've
been trying.

Can you provide the output of your properly linked docker-proxy, so I can
use it as a reference ?

Bruce

> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  recipes-containers/docker/docker-proxy_git.bb | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 recipes-containers/docker/docker-proxy_git.bb
>
> diff --git a/recipes-containers/docker/docker-proxy_git.bb b/recipes-containers/docker/docker-proxy_git.bb
> new file mode 100644
> index 0000000..4271e58
> --- /dev/null
> +++ b/recipes-containers/docker/docker-proxy_git.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION = "Docker proxy binary to forward traffic between host and containers"
> +HOMEPAGE = "https://github.com/docker/libnetwork"
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://src/github.com/docker/libnetwork/LICENSE;md5=d2794c0df5b907fdace235a619d80314"
> +
> +SRC_URI = "git://${GO_IMPORT}"
> +SRCREV = "4cb38c2987c236dce03c868d99b57b1e28a4b81c"
> +
> +GO_IMPORT = "github.com/docker/libnetwork"
> +GO_INSTALL = "${GO_IMPORT}/cmd/proxy"
> +
> +DOCKER_VERSION = "18.03.0"
> +PV = "${DOCKER_VERSION}+git${SRCREV}"
> +
> +inherit go
> +
> +# The binary is expected to be called docker-proxy
> +do_install_append() {
> +    mv ${D}${bindir}/proxy ${D}${bindir}/${BPN}
> +}
> --
> 2.11.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

