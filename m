Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 18612E00947; Tue, 17 Jan 2017 11:34:34 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B3F92E0093F
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Jan 2017 11:34:32 -0800 (PST)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0HJYV3C027381
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Jan 2017 11:34:31 -0800
Received: from server.local (128.224.21.29) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 17 Jan 2017 11:34:30 -0800
To: Mark Asselstine <mark.asselstine@windriver.com>
References: <1484676338-4704-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <9c39d587-3891-00ee-842b-c637809f65f5@windriver.com>
Date: Tue, 17 Jan 2017 14:34:30 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1484676338-4704-1-git-send-email-mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH 1/2] python-funcsigs: add new dependency for python-debtcollector
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
X-List-Received-Date: Tue, 17 Jan 2017 19:34:34 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

series merged.

Bruce

On 2017-01-17 1:05 PM, Mark Asselstine wrote:
> The uprev of python-debtcollector to version 1.10.0 requires this
> package.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  .../recipes-devtools/python/python-funcsigs_1.0.2.bb   | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-funcsigs_1.0.2.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-funcsigs_1.0.2.bb b/meta-openstack/recipes-devtools/python/python-funcsigs_1.0.2.bb
> new file mode 100644
> index 0000000..07f53da
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-funcsigs_1.0.2.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "Python function signatures from PEP362 for Python 2.6, 2.7 and 3.2+"
> +HOMEPAGE = "http://funcsigs.readthedocs.org"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d6bc91dc8e5793892189fe7481a2d354"
> +
> +SRCNAME = "funcsigs"
> +SRC_URI = "https://pypi.io/packages/source/f/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
> +"
> +
> +SRC_URI[md5sum] = "7e583285b1fb8a76305d6d68f4ccc14e"
> +SRC_URI[sha256sum] = "a7bb0f2cf3a3fd1ab2732cb49eba4252c2af4240442415b4abce3b87022a8f50"
> +
> +S = "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +inherit setuptools
> +
> +CLEANBROKEN = "1"
>


