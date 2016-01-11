Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C5B68E0073D; Mon, 11 Jan 2016 06:34:17 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EFF84E00444
	for <meta-virtualization@yoctoproject.org>;
	Mon, 11 Jan 2016 06:34:13 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0BEYCnY002790
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 11 Jan 2016 06:34:12 -0800 (PST)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 11 Jan 2016 06:34:11 -0800
To: Mark Asselstine <mark.asselstine@windriver.com>
References: <1452367642-26161-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <5693BD49.9000404@windriver.com>
Date: Mon, 11 Jan 2016 09:33:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1452367642-26161-1-git-send-email-mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH 1/2] python-monotonic: add new recipe to fulfil dependencies
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
X-List-Received-Date: Mon, 11 Jan 2016 14:34:17 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 16-01-09 02:27 PM, Mark Asselstine wrote:
> This package is required by uprevs of trove, nova, several oslo
> packages, to name a few. Adding this package so that it is available
> for these uprevs as we move to openstack liberty.
>
> This python module provides access to the value, in fractions of a
> second, of a clock.

merged to master.

Bruce

>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>   .../python/python-monotonic_git.bb                 | 31 ++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
>   create mode 100644 meta-openstack/recipes-devtools/python/python-monotonic_git.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-monotonic_git.bb b/meta-openstack/recipes-devtools/python/python-monotonic_git.bb
> new file mode 100644
> index 0000000..2552409
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-monotonic_git.bb
> @@ -0,0 +1,31 @@
> +DESCRIPTION = "An implementation of time.monotonic()"
> +HOMEPAGE = "https://github.com/atdt/monotonic"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
> +
> +PV = "0.4"
> +SRCREV = "93b3d3ba63597e57b20333db4e33ca0f48debf2a"
> +
> +SRCNAME = "monotonic"
> +SRC_URI = "git://github.com/atdt/${SRCNAME}.git"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit distutils
> +
> +DEPENDS += " \
> +        python-pbr \
> +        "
> +
> +RDEPENDS_${PN} += " \
> +        python-pbr \
> +        "
> +
> +do_install_append() {
> +    # Using these "longest" paths will ensure needed shorter paths will be created
> +    install -d ${D}/${libdir}/python2.7/site-packages/${SRCNAME}.egg-info
> +
> +    install -m 644 ${S}/${SRCNAME}.py ${D}/${libdir}/python2.7/site-packages/
> +    install -m 644 ${S}/${SRCNAME}.egg-info/* ${D}/${libdir}/python2.7/site-packages/${SRCNAME}.egg-info/
> +}
>


