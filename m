Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2E493E00C25; Tue, 20 Dec 2016 14:30:00 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AB8F9E00BC0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Dec 2016 14:29:57 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uBKMTu46030069
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Dec 2016 14:29:56 -0800
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 20 Dec 2016 14:29:56 -0800
To: Mark Asselstine <mark.asselstine@windriver.com>
References: <1482178727-31463-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <15853cf1-1b62-70f4-7840-113dec2d5a12@windriver.com>
Date: Tue, 20 Dec 2016 17:29:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <1482178727-31463-1-git-send-email-mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH] python-greenlet: update checksums
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
X-List-Received-Date: Tue, 20 Dec 2016 22:30:00 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-12-19 03:18 PM, Mark Asselstine wrote:
> Upstream updated the zip file which resulted in the checksums
> changing. The new checksum can be confirmed via
> https://pypi.python.org/pypi/greenlet/0.4.5 to confirm that this is
> done on the up and up, and not malicious.

merged

Bruce

>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  meta-openstack/recipes-devtools/python/python-greenlet_0.4.5.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-greenlet_0.4.5.bb b/meta-openstack/recipes-devtools/python/python-greenlet_0.4.5.bb
> index a6db8ab..fa6f047 100644
> --- a/meta-openstack/recipes-devtools/python/python-greenlet_0.4.5.bb
> +++ b/meta-openstack/recipes-devtools/python/python-greenlet_0.4.5.bb
> @@ -5,8 +5,8 @@ LICENSE = "MIT & PSF"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
>                      file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
>  SRC_URI = "http://pypi.python.org/packages/source/g/greenlet/greenlet-${PV}.zip"
> -SRC_URI[md5sum] = "c2deda75bdda59c38cae12a77cc53adc"
> -SRC_URI[sha256sum] = "ea671592f8460541286b133ed46a6cf5311a6b75051cc31b53e2bc38992b775a"
> +SRC_URI[md5sum] = "ce383f6475e6311cf8932ea779938703"
> +SRC_URI[sha256sum] = "b990f00f120c4cfb6672eec2acd32210990a2c7b70b815c034d1d8cbf08e2dbe"
>
>  S = "${WORKDIR}/greenlet-${PV}"
>
>


