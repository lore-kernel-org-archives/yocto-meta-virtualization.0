Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C3065E0093F; Tue, 17 Jan 2017 11:34:12 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 66BCAE008D3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Jan 2017 11:34:09 -0800 (PST)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v0HJY86Z012586
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Jan 2017 11:34:08 -0800 (PST)
Received: from server.local (128.224.21.29) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 17 Jan 2017 11:34:08 -0800
To: Mark Asselstine <mark.asselstine@windriver.com>
References: <1484668561-28271-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <557feff4-8544-ddd0-c311-d50bf1429d94@windriver.com>
Date: Tue, 17 Jan 2017 14:34:07 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1484668561-28271-1-git-send-email-mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH] python-pbr: drop recipe
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
X-List-Received-Date: Tue, 17 Jan 2017 19:34:12 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

I tried to apply this, but it failed.

Bruce

On 2017-01-17 10:56 AM, Mark Asselstine wrote:
> We often include our own versions of recipes in meta-virtualization
> and meta-cloud-services in order to satisfy specific version
> dependencies, ie. grouping recipes by usecase. Historically python-pbr
> versions have been extremely flexible (most recipes only specify the
> very old 1.6 as a minimum version) and python-pbr can arguably be seen
> as a core python package, so remove our version of the recipe in favor
> of the one in meta-python.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  .../recipes-devtools/python/python-pbr_1.8.1.bb    | 30 ----------------------
>  1 file changed, 30 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-pbr_1.8.1.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-pbr_1.8.1.bb b/meta-openstack/recipes-devtools/python/python-pbr_1.8.1.bb
> deleted file mode 100644
> index 2018a1b..0000000
> --- a/meta-openstack/recipes-devtools/python/python-pbr_1.8.1.bb
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -DESCRIPTION = "Python Build Reasonableness: PBR is a library that injects some useful and sensible default behaviors into your setuptools run"
> -HOMEPAGE = "https://pypi.python.org/pypi/pbr"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
> -
> -SRCNAME = "pbr"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "c8f9285e1a4ca6f9654c529b158baa3a"
> -SRC_URI[sha256sum] = "e2127626a91e6c885db89668976db31020f0af2da728924b56480fc7ccf09649"
> -
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> -
> -# DEPENDS_default: python-pip
> -
> -DEPENDS += " \
> -        python-pip \
> -        "
> -
> -DEPENDS_class-native += ""
> -
> -# RDEPENDS_default:
> -RDEPENDS_${PN} += " \
> -        "
> -
> -BBCLASSEXTEND = "native"
>


