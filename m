Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5D2F4E00D51; Wed,  8 Nov 2017 11:18:25 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 33794E00D4D
	for <meta-virtualization@yoctoproject.org>;
	Wed,  8 Nov 2017 11:18:23 -0800 (PST)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vA8JINPq018004
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 8 Nov 2017 11:18:23 -0800
Received: from server.local (128.224.20.254) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 8 Nov 2017 11:18:22 -0800
To: Mark Asselstine <mark.asselstine@windriver.com>,
	<meta-virtualization@yoctoproject.org>
References: <1510086342-17518-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <4caa78ad-70a0-72df-9fd6-08f11b26e71f@windriver.com>
Date: Wed, 8 Nov 2017 14:18:21 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1510086342-17518-1-git-send-email-mark.asselstine@windriver.com>
Subject: Re: [m-c-s][PATCH] python-msgpack: drop in favor of version in meta-openembedded
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
X-List-Received-Date: Wed, 08 Nov 2017 19:18:25 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2017-11-07 3:25 PM, Mark Asselstine wrote:
> The bindings for python-msgpack are pretty lenient so we are not
> hugely concerned about having tight version control for this
> package. As such we can drop our recipe and simply use the one in
> meta-openembedded. We can always re-evaluate in the future if
> necessary, but for now this is one less thing to maintain.
> 

merged.

Bruce

> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>   .../recipes-devtools/python/python-msgpack_0.4.6.bb     | 17 -----------------
>   1 file changed, 17 deletions(-)
>   delete mode 100644 meta-openstack/recipes-devtools/python/python-msgpack_0.4.6.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-msgpack_0.4.6.bb b/meta-openstack/recipes-devtools/python/python-msgpack_0.4.6.bb
> deleted file mode 100644
> index 96ec047..0000000
> --- a/meta-openstack/recipes-devtools/python/python-msgpack_0.4.6.bb
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -DESCRIPTION = "MessagePack (de)serializer"
> -HOMEPAGE = "https://pypi.python.org/pypi/msgpack-python/"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751"
> -
> -PR = "r0"
> -SRCNAME = "msgpack-python"
> -
> -SRC_URI = "https://pypi.python.org/packages/source/m/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "8b317669314cf1bc881716cccdaccb30"
> -SRC_URI[sha256sum] = "bfcc581c9dbbf07cc2f951baf30c3249a57e20dcbd60f7e6ffc43ab3cc614794"
> -
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> 


