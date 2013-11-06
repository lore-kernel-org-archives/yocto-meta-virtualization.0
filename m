Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (unknown [38.83.192.235])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0991DE017C8
	for <meta-virtualization@yoctoproject.org>;
	Wed,  6 Nov 2013 05:21:13 -0800 (PST)
Received: from [216.57.91.130] (helo=[10.204.207.200])
	by smtp.twobit.us with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <flihp@twobit.us>)
	id 1Ve32c-0002Uu-OK; Wed, 06 Nov 2013 13:21:03 +0000
Message-ID: <527A4247.80105@twobit.us>
Date: Wed, 06 Nov 2013 08:21:11 -0500
From: Philip Tricca <flihp@twobit.us>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Chris Patterson <cjp256@gmail.com>
References: <1383707342-3827-1-git-send-email-cjp256@gmail.com>
	<1383707342-3827-4-git-send-email-cjp256@gmail.com>
In-Reply-To: <1383707342-3827-4-git-send-email-cjp256@gmail.com>
X-Enigmail-Version: 1.5.1
X-SA-Exim-Connect-IP: 216.57.91.130
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on smtp.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
	version=3.3.2
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on smtp.twobit.us)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 4/4] xen: upgrade to 4.3.1
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
X-List-Received-Date: Wed, 06 Nov 2013 13:21:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

All of this looks good to me but I'm not seeing PATCH 2/4.

- Philip

On 11/05/2013 10:09 PM, Chris Patterson wrote:
> Changelog available at:
> http://xenproject.org/downloads/xen-archives/supported-xen-43-series/xen-431.html
> 
> Signed-off-by: Chris Patterson <cjp256@gmail.com>
> ---
>  recipes-extended/xen/{xen_4.3.0.bb => xen_4.3.1.bb} | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename recipes-extended/xen/{xen_4.3.0.bb => xen_4.3.1.bb} (99%)
> 
> diff --git a/recipes-extended/xen/xen_4.3.0.bb b/recipes-extended/xen/xen_4.3.1.bb
> similarity index 99%
> rename from recipes-extended/xen/xen_4.3.0.bb
> rename to recipes-extended/xen/xen_4.3.1.bb
> index f1067bc..6985624 100644
> --- a/recipes-extended/xen/xen_4.3.0.bb
> +++ b/recipes-extended/xen/xen_4.3.1.bb
> @@ -11,8 +11,8 @@ SRC_URI = " \
>      file://flask-avoid-installing-policy-file-as-boot.patch \
>      "
>  
> -SRC_URI[md5sum] = "7b18cfb58f1ac2ce39cf35a1867f0c0a"
> -SRC_URI[sha256sum] = "e1e9faabe4886e2227aacdbde74410653b233d66642ca1972a860cbec6439961"
> +SRC_URI[md5sum] = "7616b8704e1ab89c81f011f0e3703bc8"
> +SRC_URI[sha256sum] = "3b5b7cc508b1739753585b5c25635471cdcef680e8770a78bf6ef9333d26a9fd"
>  
>  S = "${WORKDIR}/xen-${PV}"
>  
> @@ -215,11 +215,11 @@ FILES_${PN}-libfsimage-dev = "${libdir}/libfsimage.so"
>  FILES_${PN}-fsimage = "${libdir}/fs/*/*fsimage.so"
>  
>  FILES_${PN}-hypervisor = "\
> -    /boot/xen-4.3.0.gz \
> +    /boot/xen-4.3.1.gz \
>      /boot/xen-4.3.gz \
>      /boot/xen-4.gz \
>      /boot/xen.gz \
> -    /boot/xen-syms-4.3.0 \
> +    /boot/xen-syms-4.3.1 \
>      "
>  
>  FILES_${PN}-base = "\
> 


