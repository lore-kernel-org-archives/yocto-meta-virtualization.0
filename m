Return-Path: <mbgrego@tycho.nsa.gov>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 78B7FE00B9D; Wed, 16 Dec 2015 08:37:37 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [63.239.67.9 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from emvm-gh1-uea08.nsa.gov (emvm-gh1-uea08.nsa.gov [63.239.67.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0FAC0E00404
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Dec 2015 08:37:34 -0800 (PST)
X-TM-IMSS-Message-ID: <138eb86c000387b3@nsa.gov>
Received: from tarius.tycho.ncsc.mil ([144.51.242.1]) by nsa.gov
	([10.208.42.193]) with ESMTP (TREND IMSS SMTP Service 7.1) id
	138eb86c000387b3 ; Wed, 16 Dec 2015 11:37:52 -0500
Received: from moss-wolfpack.infosec.tycho.ncsc.mil (moss-wolfpack
	[192.168.25.76])
	by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id tBGGbXCm025089
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Dec 2015 11:37:33 -0500
To: meta-virtualization@yoctoproject.org
References: <1450284095-13553-1-git-send-email-mbgrego@tycho.nsa.gov>
From: "M. Gregory" <mbgrego@tycho.nsa.gov>
Message-ID: <56718ADA.1070907@tycho.nsa.gov>
Date: Wed, 16 Dec 2015 11:01:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1450284095-13553-1-git-send-email-mbgrego@tycho.nsa.gov>
X-TM-AS-MML: disable
Subject: Re: [Patch] Enables XSM functionality in builds that contain "xsm" in the PACKAGECONFIG.
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
X-List-Received-Date: Wed, 16 Dec 2015 16:37:37 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Ignore this patch it a part of a larger set that I will send momentarily.

-Machon

On 12/16/2015 11:41 AM, Machon Gregory wrote:
> * Correctly identifies xenpolicy by ${PV}
> * Adds a check to identify if xsm is specified in PACKAGECONFIG and if so manually sets XSM_ENABLE in Xen's .config
>
> Signed-off-by: Machon Gregory <mbgrego@tycho.nsa.gov>
> ---
>  recipes-extended/xen/xen.inc | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 9e35459..03ec935 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -333,7 +333,7 @@ FILES_${PN}-flask = "\
>      ${sbindir}/flask-loadpolicy \
>      ${sbindir}/flask-set-bool \
>      ${sbindir}/flask-setenforce \
> -    /boot/xenpolicy.24 \
> +    /boot/xenpolicy-${PV} \
>      "
>  
>  FILES_${PN}-gdbsx = "\
> @@ -715,6 +715,15 @@ EXTRA_OECONF += " \
>      --disable-ocamltools \
>      "
>  
> +# check for XSM in package config to allow XSM_ENABLE to be set 
> +python () {
> +    pkgconfig = d.getVar('PACKAGECONFIG', True)
> +    if ('xsm') in pkgconfig.split():
> +        d.setVar('XSM_ENABLED', '1')
> +    else:
> +        d.setVar('XSM_ENABLED', '0')
> +}
> +
>  do_configure() {
>      # no stubs-32.h in our 64-bit sysroot - hack it into tools/include/gnu
>      if ! test -f ${STAGING_DIR_TARGET}/usr/include/gnu/stubs-32.h ; then
> @@ -727,6 +736,11 @@ do_configure() {
>          fi
>      fi
>  
> +    #./configure --enable-xsm does not set XSM_ENABLE must be done manually
> +    if [ "${XSM_ENABLED}" = "1" ]; then
> +        echo "XSM_ENABLE := y" > ${S}/.config
> +    fi
> +
>      # do configure
>      oe_runconf
>  }

-- 
Machon Gregory
Trusted Mechanisms Team
Trusted Systems Research Group 
(443)634-3832


