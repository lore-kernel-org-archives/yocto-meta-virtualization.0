Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E9EC4E003DB; Fri, 20 Jan 2017 12:55:28 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8BDA3E0033D
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jan 2017 12:55:25 -0800 (PST)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v0KKtOuu021376
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jan 2017 12:55:24 -0800 (PST)
Received: from server.local (128.224.21.54) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 20 Jan 2017 12:55:24 -0800
To: Mark Asselstine <mark.asselstine@windriver.com>
References: <1484945365-12675-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <dfdede68-f333-4258-4a9b-090c1e87aa2f@windriver.com>
Date: Fri, 20 Jan 2017 15:55:23 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1484945365-12675-1-git-send-email-mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH 1/4] python-positional: add new recipe to support python-oslo.context
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
X-List-Received-Date: Fri, 20 Jan 2017 20:55:29 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-01-20 3:49 PM, Mark Asselstine wrote:
> Required to support the uprev to python-oslo.context to stable/newton.

all 4 are merged.

Bruce

>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  .../python/python-positional_git.bb                | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-positional_git.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-positional_git.bb b/meta-openstack/recipes-devtools/python/python-positional_git.bb
> new file mode 100644
> index 0000000..821d704
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-positional_git.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION = "Library to enforce positional or key-word arguments"
> +HOMEPAGE = "https://github.com/morganfainberg/positional"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5335066555b14d832335aa4660d6c376"
> +
> +SRCNAME = "positional"
> +SRC_URI = "git://github.com/morganfainberg/positional \
> +"
> +
> +PV = "1.1.1+git${SRCPV}"
> +SRCREV = "1f5e9fc0f50e9e774fc4db27f97f9acae5f0c29f"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit setuptools
> +
> +CLEANBROKEN = "1"
> +
> +RDEPENDS_${PN} += " \
> +    python-wrapt \
> +"
> \ No newline at end of file
>


