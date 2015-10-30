Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 50932E00B72; Fri, 30 Oct 2015 13:56:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A0EEDE00B5D
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Oct 2015 13:56:51 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9UKuod3018230
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Oct 2015 13:56:50 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 30 Oct 2015 13:56:49 -0700
To: Mark Asselstine <mark.asselstine@windriver.com>,
	<meta-virtualization@yoctoproject.org>
References: <1446232998-8663-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <5633D97A.7010807@windriver.com>
Date: Fri, 30 Oct 2015 16:56:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1446232998-8663-1-git-send-email-mark.asselstine@windriver.com>
Subject: Re: [meta-cloud-services][PATCH] keystone: add missing functools32 module
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
X-List-Received-Date: Fri, 30 Oct 2015 20:56:52 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 15-10-30 03:23 PM, Mark Asselstine wrote:
> Keystone fails to install due to functools32 missing. Add a new recipe
> for functools32 and include the dependency in keystone.

merged.

Bruce

>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>   .../python/python-functools32_3.2.3-2.bb           | 29 ++++++++++++++++++++++
>   .../recipes-devtools/python/python-keystone_git.bb |  1 +
>   2 files changed, 30 insertions(+)
>   create mode 100644 meta-openstack/recipes-devtools/python/python-functools32_3.2.3-2.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-functools32_3.2.3-2.bb b/meta-openstack/recipes-devtools/python/python-functools32_3.2.3-2.bb
> new file mode 100644
> index 0000000..937e933
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-functools32_3.2.3-2.bb
> @@ -0,0 +1,29 @@
> +SUMMARY = "Python higher-order functions and operations on callable objects"
> +HOMEPAGE = "https://pypi.python.org/pypi/functools32"
> +SECTION = "devel/python"
> +LICENSE = "PSFv2"
> +
> +SRCNAME = "functools32"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=27cf2345969ed18e6730e90fb0063a10"
> +SRC_URI = "http://pypi.python.org/packages/source/f/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +SRC_URI[md5sum] = "09f24ffd9af9f6cd0f63cb9f4e23d4b2"
> +SRC_URI[sha256sum] = "f6253dfbe0538ad2e387bd8fdfd9293c925d63553f5813c4e587745416501e6d"
> +
> +S = "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +inherit distutils
> +
> +DISTUTILS_INSTALL_ARGS = "--root=${D} \
> +    --prefix=${prefix} \
> +    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
> +    --install-data=${datadir}"
> +
> +DEPENDS += " \
> +	python-pbr \
> +	"
> +
> +RDEPENDS_${PN} += "python-testtools \
> +	python-pbr \
> +	"
> +
> diff --git a/meta-openstack/recipes-devtools/python/python-keystone_git.bb b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
> index 8fbf996..58aa449 100644
> --- a/meta-openstack/recipes-devtools/python/python-keystone_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-keystone_git.bb
> @@ -286,6 +286,7 @@ RDEPENDS_${PN} += " \
>           python-oauthlib \
>           python-fixtures \
>           python-oslotest \
> +        python-functools32 \
>           "
>
>   RDEPENDS_${SRCNAME}-tests += " bash"
>


