Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (smtp.twobit.us [38.83.192.235])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E6638E0053A
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Feb 2014 08:36:26 -0800 (PST)
Received: from c-76-24-20-220.hsd1.ma.comcast.net ([76.24.20.220]
	helo=[10.79.148.145]) by smtp.twobit.us with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <flihp@twobit.us>)
	id 1WCtod-0001rD-Cp; Mon, 10 Feb 2014 16:34:39 +0000
Message-ID: <52F8FFFE.1010909@twobit.us>
Date: Mon, 10 Feb 2014 11:36:14 -0500
From: Philip Tricca <flihp@twobit.us>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20131104 Icedove/17.0.10
MIME-Version: 1.0
To: cjp256@gmail.com
References: <CABZSBQe0p6X805ErdNkFS99Yuu-04vki+h50B5U00tcO4EV9hQ@mail.gmail.com>
	<1392049962-12222-1-git-send-email-flihp@twobit.us>
In-Reply-To: <1392049962-12222-1-git-send-email-flihp@twobit.us>
X-Enigmail-Version: 1.5.1
X-SA-Exim-Connect-IP: 76.24.20.220
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on smtp.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on smtp.twobit.us)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] xen: Add RDEPENDS block for xendomains script.
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
X-List-Received-Date: Mon, 10 Feb 2014 16:36:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Wrong git range. Please disregards.

Philip

On 02/10/2014 11:32 AM, Philip Tricca wrote:
> I can't explain the dependency on xen-scripts-block as the xendomains
> script doesn't invoke any of these scripts directly. Still xendomains
> hangs indefinitely without them.
> 
> Signed-off-by: Philip Tricca <flihp@twobit.us>
> ---
>  recipes-extended/xen/xen.inc |    7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index d671d0f..7f7df47 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -70,6 +70,13 @@ RDEPENDS_${PN}-xencommons = "\
>      ${PN}-scripts-common \
>      "
>  
> +RDEPENDS_${PN}-xendomains = "\
> +    ${PN}-console \
> +    ${PN}-scripts-block \
> +    ${PN}-scripts-common \
> +    ${PN}-xenstored \
> +    "
> +
>  RDEPENDS_${PN}-xl = "libgcc"
>  
>  PACKAGES = "\
> 


