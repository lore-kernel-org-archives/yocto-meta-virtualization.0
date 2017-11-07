Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2BFE2E00AD7; Tue,  7 Nov 2017 12:15:11 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 85C9CE00A6A
	for <meta-virtualization@yoctoproject.org>;
	Tue,  7 Nov 2017 12:15:10 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vA7KFABe014402
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 7 Nov 2017 12:15:10 -0800 (PST)
Received: from [128.224.56.93] (128.224.56.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 7 Nov 2017 12:15:09 -0800
To: Mark Asselstine <mark.asselstine@windriver.com>,
	<meta-virtualization@yoctoproject.org>
References: <1510000004-16624-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <c8664851-0363-4dde-0a48-67c0cefd36fa@windriver.com>
Date: Tue, 7 Nov 2017 15:15:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1510000004-16624-1-git-send-email-mark.asselstine@windriver.com>
Subject: Re: [v3 PATCH] python-webob: uprev to v1.7.3
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
X-List-Received-Date: Tue, 07 Nov 2017 20:15:11 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/06/2017 03:26 PM, Mark Asselstine wrote:
> The only user in meta-virtualization is python-bugsnag and there is no
> version dependency. This new version is however required by the latest
> openstack. Switched to using the "common" pypi.bbclass while we are at
> it.
> 

merged.

Bruce

> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
> 
> OK, dialed back the matching threashold completely and managed
> to get the rename logic to trigger. Sorry for the spam.
> 
>   .../python/{python-webob_1.6.0.bb => python-webob_1.7.3.bb} | 13 ++++---------
>   1 file changed, 4 insertions(+), 9 deletions(-)
>   rename recipes-devtools/python/{python-webob_1.6.0.bb => python-webob_1.7.3.bb} (45%)
> 
> diff --git a/recipes-devtools/python/python-webob_1.6.0.bb b/recipes-devtools/python/python-webob_1.7.3.bb
> similarity index 45%
> rename from recipes-devtools/python/python-webob_1.6.0.bb
> rename to recipes-devtools/python/python-webob_1.7.3.bb
> index 71c74ff..a2448be 100644
> --- a/recipes-devtools/python/python-webob_1.6.0.bb
> +++ b/recipes-devtools/python/python-webob_1.7.3.bb
> @@ -4,17 +4,12 @@ SECTION = "devel/python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://docs/license.txt;md5=8ed3584bcc78c16da363747ccabc5af5"
>   
> -PR = "r0"
> -SRCNAME = "WebOb"
> +PYPI_PACKAGE = "WebOb"
>   
> -SRC_URI = "http://pypi.python.org/packages/source/W/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +SRC_URI[md5sum] = "350028baffc508e3d23c078118e35316"
> +SRC_URI[sha256sum] = "e65ca14b9f5ae5b031988ffc93f8b7f305ddfcf17a4c774ae0db47bcb3b87283"
>   
> -SRC_URI[md5sum] = "089d7fc6745f175737800237c7287802"
> -SRC_URI[sha256sum] = "63d262d8f61b516321f786879c9277fa2209f7f57eb47b537eeecfea383d55b7"
> -
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>   
>   RDEPENDS_${PN} += " \
>   	python-sphinx \
> 


