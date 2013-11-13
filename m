Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (smtp.twobit.us [38.83.192.235])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6900AE01389
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 Nov 2013 09:39:33 -0800 (PST)
Received: from [216.57.91.130] (helo=[10.204.207.200])
	by smtp.twobit.us with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <flihp@twobit.us>)
	id 1VgePK-00005a-K2; Wed, 13 Nov 2013 17:39:15 +0000
Message-ID: <5283B952.1030403@twobit.us>
Date: Wed, 13 Nov 2013 12:39:30 -0500
From: Philip Tricca <flihp@twobit.us>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Riku Voipio <riku.voipio@linaro.org>
References: <1384334721-3625-1-git-send-email-riku.voipio@linaro.org>
In-Reply-To: <1384334721-3625-1-git-send-email-riku.voipio@linaro.org>
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
Subject: Re: [PATCH] fix inittab install when Xen not in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 13 Nov 2013 17:39:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Riku,

Looks good to me. Thanks for cleaning this up.

Regards,
- Philip

On 11/13/2013 04:25 AM, Riku Voipio wrote:
> With the latest patch, OE builds may file like:
> 
> https://ci.linaro.org/jenkins/job/openembedded-armv7ab-rootfs/gcc_version=4.8,label=oe_persistent_cloud,rootfs=minimal/127/consoleText
> 
> By having the "failing" grep within the if block, set -e
> in shell code will not bite configurations where meta-virtualization
> is included but xen is not in DISTRO_FEATURES.
> 
> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> ---
>  recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend b/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend
> index 2edbedf..1b89aec 100644
> --- a/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend
> +++ b/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend
> @@ -1,6 +1,5 @@
>  do_install_append() {
> -	echo "${DISTRO_FEATURES}" | grep -q 'xen'
> -	if [ $? -eq 0 ]; then
> +	if echo "${DISTRO_FEATURES}" | grep -q 'xen'; then
>  		echo "" >> ${D}${sysconfdir}/inittab
>  		echo "X0:12345:respawn:/sbin/getty 115200 hvc0" >> ${D}${sysconfdir}/inittab
>  	fi
> 


