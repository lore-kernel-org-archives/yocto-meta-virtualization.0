Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (unknown [38.83.192.235])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 078B7E00461
	for <meta-virtualization@yoctoproject.org>;
	Sat,  9 Nov 2013 16:51:27 -0800 (PST)
Received: from c-76-24-20-220.hsd1.ma.comcast.net ([76.24.20.220]
	helo=[10.79.148.145]) by smtp.twobit.us with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <flihp@twobit.us>)
	id 1VfJFA-00059X-3a; Sun, 10 Nov 2013 00:51:12 +0000
Message-ID: <527ED886.2000109@twobit.us>
Date: Sat, 09 Nov 2013 19:51:18 -0500
From: Philip Tricca <flihp@twobit.us>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Chris Patterson <cjp256@gmail.com>
References: <1383883267-31992-1-git-send-email-cjp256@gmail.com>
	<1383883267-31992-11-git-send-email-cjp256@gmail.com>
	<527D2ED8.2090709@twobit.us>
	<CABZSBQcy88sTwgKqHT0Q7EB-bRqSA_6tZ_C86c15ZQ-_Z-LUxA@mail.gmail.com>
In-Reply-To: <CABZSBQcy88sTwgKqHT0Q7EB-bRqSA_6tZ_C86c15ZQ-_Z-LUxA@mail.gmail.com>
X-Enigmail-Version: 1.5.1
X-SA-Exim-Connect-IP: 76.24.20.220
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on smtp.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
	version=3.3.2
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on smtp.twobit.us)
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
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
X-List-Received-Date: Sun, 10 Nov 2013 00:51:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 11/08/2013 04:38 PM, Chris Patterson wrote:
> Both are no longer built by default: libblktap is for blktap1, and flask
> is now only built if you have xsm enabled.

Gotcha. LGTM.

- Philip

> On Fri, Nov 8, 2013 at 1:35 PM, Philip Tricca <flihp@twobit.us
> <mailto:flihp@twobit.us>> wrote:
> 
>     Can I get you to explain the reason for removing libblktap and flask
>     from RDEPENDS in xen.inc? Other than that the patch set looks good to
>     me. Deleting stuff is a very good thing :)
> 
>     - Philip
> 
>     On 11/07/2013 11:01 PM, Chris Patterson wrote:
>     > Added recipe for xen unstable from git repository.
>     >
>     > Moved now empty xen-flask and xen-libblktap packages from
>     > required dependencies from xen.inc into xen_4.3.1.bb
>     <http://xen_4.3.1.bb>.
>     >
>     > Signed-off-by: Chris Patterson <cjp256@gmail.com
>     <mailto:cjp256@gmail.com>>
>     > ---
>     >  recipes-extended/xen/xen.inc      |  2 --
>     >  recipes-extended/xen/xen_4.3.1.bb <http://xen_4.3.1.bb> |  5 +++++
>     >  recipes-extended/xen/xen_git.bb <http://xen_git.bb>   | 18
>     ++++++++++++++++++
>     >  3 files changed, 23 insertions(+), 2 deletions(-)
>     >  create mode 100644 recipes-extended/xen/xen_git.bb
>     <http://xen_git.bb>
>     >
>     > diff --git a/recipes-extended/xen/xen.inc
>     b/recipes-extended/xen/xen.inc
>     > index fff3dc1..9d43814 100644
>     > --- a/recipes-extended/xen/xen.inc
>     > +++ b/recipes-extended/xen/xen.inc
>     > @@ -35,9 +35,7 @@ RDEPENDS_${PN}-base = "\
>     >      ${PN}-libvhd \
>     >      ${PN}-libxenstat \
>     >      ${PN}-libxenstore \
>     > -    ${PN}-libblktap \
>     >      ${PN}-libfsimage \
>     > -    ${PN}-flask \
>     >      ${PN}-fsimage \
>     >      ${PN}-hvmloader \
>     >      ${PN}-scripts-block \
>     > diff --git a/recipes-extended/xen/xen_4.3.1.bb
>     <http://xen_4.3.1.bb> b/recipes-extended/xen/xen_4.3.1.bb
>     <http://xen_4.3.1.bb>
>     > index 46563ce..2c9806b 100644
>     > --- a/recipes-extended/xen/xen_4.3.1.bb <http://xen_4.3.1.bb>
>     > +++ b/recipes-extended/xen/xen_4.3.1.bb <http://xen_4.3.1.bb>
>     > @@ -10,6 +10,11 @@ SRC_URI[sha256sum] =
>     "3b5b7cc508b1739753585b5c25635471cdcef680e8770a78bf6ef9333d
>     >
>     >  S = "${WORKDIR}/xen-${PV}"
>     >
>     > +RDEPENDS_${PN}-base += "\
>     > +    ${PN}-libblktap \
>     > +    ${PN}-flask \
>     > +    "
>     > +
>     >  do_configure_prepend() {
>     >      # fixup qemu-xen-traditional pciutils check hardcoded to test
>     /usr/include/pci
>     >      sed -i 's/\/usr\/include\/pci/$(STAGING_INCDIR)\/pci/g'
>     ${S}/tools/qemu-xen-traditional/xen-hooks.mak
>     > diff --git a/recipes-extended/xen/xen_git.bb <http://xen_git.bb>
>     b/recipes-extended/xen/xen_git.bb <http://xen_git.bb>
>     > new file mode 100644
>     > index 0000000..f333157
>     > --- /dev/null
>     > +++ b/recipes-extended/xen/xen_git.bb <http://xen_git.bb>
>     > @@ -0,0 +1,18 @@
>     > +require xen.inc
>     > +
>     > +SRCREV = "68bd172e6fa565899c846eb72755c8ffd8562c8a"
>     > +
>     > +PV = "4.4.0+git${SRCPV}"
>     > +
>     > +S = "${WORKDIR}/git"
>     > +
>     > +SRC_URI = " \
>     > +    git://xenbits.xen.org/xen.git <http://xenbits.xen.org/xen.git> \
>     > +    "
>     > +
>     > +DEFAULT_PREFERENCE = "-1"
>     > +
>     > +PACKAGES += "${PN}-xen-mfndump"
>     > +
>     > +FILES_${PN}-xen-mfndump = "${sbindir}/xen-mfndump"
>     > +
>     >
> 
> 


