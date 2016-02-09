Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F2C55E00CB4; Tue,  9 Feb 2016 11:28:18 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 08401E00C87
	for <meta-virtualization@yoctoproject.org>;
	Tue,  9 Feb 2016 11:28:14 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u19JSDjR016388
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 9 Feb 2016 11:28:13 -0800 (PST)
Received: from server.local (147.11.118.115) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 9 Feb 2016 11:28:12 -0800
To: Mark Asselstine <mark.asselstine@windriver.com>
References: <1454943678-4827-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <56BA3DCB.205@windriver.com>
Date: Tue, 9 Feb 2016 14:28:11 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1454943678-4827-1-git-send-email-mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-six: uprev to latest
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
X-List-Received-Date: Tue, 09 Feb 2016 19:28:19 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-02-08 10:01 AM, Mark Asselstine wrote:
> The openstack layer requires a version of six >= 1.9.0

merged.

Bruce

>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>   .../python/{python-requests_2.3.0.bb => python-requests_2.8.1.bb}  | 7 +++----
>   .../python/{python-six_1.7.3.bb => python-six_1.10.0.bb}           | 7 +++----
>   2 files changed, 6 insertions(+), 8 deletions(-)
>   rename recipes-devtools/python/{python-requests_2.3.0.bb => python-requests_2.8.1.bb} (78%)
>   rename recipes-devtools/python/{python-six_1.7.3.bb => python-six_1.10.0.bb} (57%)
>
> diff --git a/recipes-devtools/python/python-requests_2.3.0.bb b/recipes-devtools/python/python-requests_2.8.1.bb
> similarity index 78%
> rename from recipes-devtools/python/python-requests_2.3.0.bb
> rename to recipes-devtools/python/python-requests_2.8.1.bb
> index 6f38bf1..187f97a 100644
> --- a/recipes-devtools/python/python-requests_2.3.0.bb
> +++ b/recipes-devtools/python/python-requests_2.8.1.bb
> @@ -14,15 +14,14 @@ DESCRIPTION = "\
>     "
>   SECTION = "devel/python"
>   LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=c7869e52c8275537186de35e3cd5f9ec"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=58c7e163c9f8ee037246da101c6afd1e"
>
> -PR = "r0"
>   SRCNAME = "requests"
>
>   SRC_URI = "http://pypi.python.org/packages/source/r/requests/${SRCNAME}-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "7449ffdc8ec9ac37bbcd286003c80f00"
> -SRC_URI[sha256sum] = "1c1473875d846fe563d70868acf05b1953a4472f4695b7b3566d1d978957b8fc"
> +SRC_URI[md5sum] = "a27ea3d72d7822906ddce5e252d6add9"
> +SRC_URI[sha256sum] = "84fe8d5bf4dcdcc49002446c47a146d17ac10facf00d9086659064ac43b6c25b"
>
>   S = "${WORKDIR}/${SRCNAME}-${PV}"
>
> diff --git a/recipes-devtools/python/python-six_1.7.3.bb b/recipes-devtools/python/python-six_1.10.0.bb
> similarity index 57%
> rename from recipes-devtools/python/python-six_1.7.3.bb
> rename to recipes-devtools/python/python-six_1.10.0.bb
> index 07dcafd..a84a4c4 100644
> --- a/recipes-devtools/python/python-six_1.7.3.bb
> +++ b/recipes-devtools/python/python-six_1.10.0.bb
> @@ -2,16 +2,15 @@ DESCRIPTION = "Python 2 and 3 compatibility utilities"
>   HOMEPAGE = "http://pypi.python.org/pypi/six/"
>   SECTION = "devel/python"
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=530f34047c21ad45b3199946dd90bea5"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=6f00d4a50713fa859858dd9abaa35b21"
>
> -PR = "r1"
>   SRCNAME = "six"
>
>   SRC_URI = "https://pypi.python.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
>   "
>
> -SRC_URI[md5sum] = "784c6e5541c3c4952de9c0a966a0a80b"
> -SRC_URI[sha256sum] = "7a842c9f882c0b2ab1064d567bb9fff6a21c9efbc3d9992083ad6193787ed393"
> +SRC_URI[md5sum] = "34eed507548117b2ab523ab14b2f8b55"
> +SRC_URI[sha256sum] = "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a"
>
>   S = "${WORKDIR}/${SRCNAME}-${PV}"
>
>


