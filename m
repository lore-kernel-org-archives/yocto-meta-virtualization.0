Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 983C4E00942; Tue, 17 Jan 2017 11:34:21 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4AE6CE00939
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Jan 2017 11:34:19 -0800 (PST)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v0HJYJ9d017113
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Jan 2017 11:34:19 -0800 (PST)
Received: from server.local (128.224.21.29) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 17 Jan 2017 11:34:18 -0800
To: Mark Asselstine <mark.asselstine@windriver.com>
References: <1484668625-29759-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <3a3bb00b-7dcf-5232-15b6-971e53499f74@windriver.com>
Date: Tue, 17 Jan 2017 14:34:18 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1484668625-29759-1-git-send-email-mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH 1/2] python-babel: uprev to 2.3.4
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
X-List-Received-Date: Tue, 17 Jan 2017 19:34:21 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

series merged.

Bruce

On 2017-01-17 10:57 AM, Mark Asselstine wrote:
> This version is required by python-oslo.i18n (after the uprev to
> stable/newton) and possibly others.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  .../recipes-devtools/python/python-babel_1.3.bb    | 19 -------------------
>  .../recipes-devtools/python/python-babel_2.3.4.bb  | 22 ++++++++++++++++++++++
>  2 files changed, 22 insertions(+), 19 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-babel_1.3.bb
>  create mode 100644 meta-openstack/recipes-devtools/python/python-babel_2.3.4.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-babel_1.3.bb b/meta-openstack/recipes-devtools/python/python-babel_1.3.bb
> deleted file mode 100644
> index e61379f..0000000
> --- a/meta-openstack/recipes-devtools/python/python-babel_1.3.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -DESCRIPTION = "A collection of tools for internationalizing Python applications"
> -HOMEPAGE = "http://babel.edgewall.org/"
> -SECTION = "devel/python"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=e6eeaabc92cfc2d03f53e789324d7292"
> -
> -PR = "r0"
> -SRCNAME = "Babel"
> -SRC_URI = "https://pypi.python.org/packages/source/B/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
> -"
> -
> -SRC_URI[md5sum] = "5264ceb02717843cbc9ffce8e6e06bdb"
> -SRC_URI[sha256sum] = "9f02d0357184de1f093c10012b52e7454a1008be6a5c185ab7a3307aceb1d12e"
> -
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> -
> -CLEANBROKEN = "1"
> diff --git a/meta-openstack/recipes-devtools/python/python-babel_2.3.4.bb b/meta-openstack/recipes-devtools/python/python-babel_2.3.4.bb
> new file mode 100644
> index 0000000..790491d
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-babel_2.3.4.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION = "A collection of tools for internationalizing Python applications"
> +HOMEPAGE = "http://babel.edgewall.org/"
> +SECTION = "devel/python"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=e6eeaabc92cfc2d03f53e789324d7292"
> +
> +SRCNAME = "Babel"
> +SRC_URI = "https://pypi.io/packages/source/B/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
> +"
> +
> +SRC_URI[md5sum] = "afa20bc55b0e991833030129ad498f35"
> +SRC_URI[sha256sum] = "c535c4403802f6eb38173cd4863e419e2274921a01a8aad8a5b497c131c62875"
> +
> +S = "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +inherit setuptools
> +
> +CLEANBROKEN = "1"
> +
> +RDEPENDS_${PN} += " \
> +    python-pytz \
> +"
> \ No newline at end of file
>


