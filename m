Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (unknown [38.83.192.235])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 799F8E01798
	for <meta-virtualization@yoctoproject.org>;
	Fri,  8 Nov 2013 10:36:41 -0800 (PST)
Received: from maf2436d0.tmodns.net ([208.54.36.175] helo=[172.16.1.10])
	by smtp.twobit.us with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <flihp@twobit.us>)
	id 1Vequx-0004c6-Ca; Fri, 08 Nov 2013 18:36:29 +0000
Message-ID: <527D2ED8.2090709@twobit.us>
Date: Fri, 08 Nov 2013 13:35:04 -0500
From: Philip Tricca <flihp@twobit.us>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Chris Patterson <cjp256@gmail.com>
References: <1383883267-31992-1-git-send-email-cjp256@gmail.com>
	<1383883267-31992-11-git-send-email-cjp256@gmail.com>
In-Reply-To: <1383883267-31992-11-git-send-email-cjp256@gmail.com>
X-Enigmail-Version: 1.5.1
X-SA-Exim-Connect-IP: 208.54.36.175
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on smtp.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
	version=3.3.2
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on smtp.twobit.us)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH v2 10/10] xen: add xen_git recipe.
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
X-List-Received-Date: Fri, 08 Nov 2013 18:36:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Can I get you to explain the reason for removing libblktap and flask
from RDEPENDS in xen.inc? Other than that the patch set looks good to
me. Deleting stuff is a very good thing :)

- Philip

On 11/07/2013 11:01 PM, Chris Patterson wrote:
> Added recipe for xen unstable from git repository.
> 
> Moved now empty xen-flask and xen-libblktap packages from
> required dependencies from xen.inc into xen_4.3.1.bb.
> 
> Signed-off-by: Chris Patterson <cjp256@gmail.com>
> ---
>  recipes-extended/xen/xen.inc      |  2 --
>  recipes-extended/xen/xen_4.3.1.bb |  5 +++++
>  recipes-extended/xen/xen_git.bb   | 18 ++++++++++++++++++
>  3 files changed, 23 insertions(+), 2 deletions(-)
>  create mode 100644 recipes-extended/xen/xen_git.bb
> 
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index fff3dc1..9d43814 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -35,9 +35,7 @@ RDEPENDS_${PN}-base = "\
>      ${PN}-libvhd \
>      ${PN}-libxenstat \
>      ${PN}-libxenstore \
> -    ${PN}-libblktap \
>      ${PN}-libfsimage \
> -    ${PN}-flask \
>      ${PN}-fsimage \
>      ${PN}-hvmloader \
>      ${PN}-scripts-block \
> diff --git a/recipes-extended/xen/xen_4.3.1.bb b/recipes-extended/xen/xen_4.3.1.bb
> index 46563ce..2c9806b 100644
> --- a/recipes-extended/xen/xen_4.3.1.bb
> +++ b/recipes-extended/xen/xen_4.3.1.bb
> @@ -10,6 +10,11 @@ SRC_URI[sha256sum] = "3b5b7cc508b1739753585b5c25635471cdcef680e8770a78bf6ef9333d
>  
>  S = "${WORKDIR}/xen-${PV}"
>  
> +RDEPENDS_${PN}-base += "\
> +    ${PN}-libblktap \
> +    ${PN}-flask \
> +    "
> +
>  do_configure_prepend() {
>      # fixup qemu-xen-traditional pciutils check hardcoded to test /usr/include/pci
>      sed -i 's/\/usr\/include\/pci/$(STAGING_INCDIR)\/pci/g' ${S}/tools/qemu-xen-traditional/xen-hooks.mak
> diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git.bb
> new file mode 100644
> index 0000000..f333157
> --- /dev/null
> +++ b/recipes-extended/xen/xen_git.bb
> @@ -0,0 +1,18 @@
> +require xen.inc
> +
> +SRCREV = "68bd172e6fa565899c846eb72755c8ffd8562c8a"
> +
> +PV = "4.4.0+git${SRCPV}"
> +
> +S = "${WORKDIR}/git"
> +
> +SRC_URI = " \
> +    git://xenbits.xen.org/xen.git \
> +    "
> +
> +DEFAULT_PREFERENCE = "-1"
> +
> +PACKAGES += "${PN}-xen-mfndump"
> +
> +FILES_${PN}-xen-mfndump = "${sbindir}/xen-mfndump"
> +
> 


