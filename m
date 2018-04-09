Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CA7EDE00AF9; Mon,  9 Apr 2018 07:49:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8E72BE00A1C
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Apr 2018 07:49:35 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w39EnYKo010258
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 9 Apr 2018 07:49:34 -0700
Received: from [128.224.56.93] (128.224.56.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 9 Apr 2018 07:49:33 -0700
To: Mark Asselstine <mark.asselstine@windriver.com>,
	<meta-virtualization@yoctoproject.org>
References: <1522872176-22946-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <386501d3-8d52-5987-c777-14fce1ac6a67@windriver.com>
Date: Mon, 9 Apr 2018 10:49:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1522872176-22946-1-git-send-email-mark.asselstine@windriver.com>
Subject: Re: [m-c-s][PATCH 01/12] python-websockify: uprev to v0.8.0
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
X-List-Received-Date: Mon, 09 Apr 2018 14:49:36 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

All outstanding m-c-s and openstack patches are now merged

Bruce

On 04/04/2018 04:02 PM, Mark Asselstine wrote:
> This version is required by the stable/pike version of python-nova.
> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>   .../python/{python-websockify_0.6.0.bb => python-websockify_0.8.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-openstack/recipes-devtools/python/{python-websockify_0.6.0.bb => python-websockify_0.8.0.bb} (69%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-websockify_0.6.0.bb b/meta-openstack/recipes-devtools/python/python-websockify_0.8.0.bb
> similarity index 69%
> rename from meta-openstack/recipes-devtools/python/python-websockify_0.6.0.bb
> rename to meta-openstack/recipes-devtools/python/python-websockify_0.8.0.bb
> index 386a227..641caab 100644
> --- a/meta-openstack/recipes-devtools/python/python-websockify_0.6.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-websockify_0.8.0.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>   LICENSE = "LGPLv3"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a3b5f97c9d64189899b91b3728bfd774"
>   
> -SRC_URI[md5sum] = "673a70d007c1a2445c8ef5c7a3067c07"
> -SRC_URI[sha256sum] = "da4364f54fdcc5350059febe2e8fdf2b53d16cf04ee23c71315e561119f44529"
> +SRC_URI[md5sum] = "8fa547ca4de84a96aa3472d55fbcdd59"
> +SRC_URI[sha256sum] = "547d3d98c5081f2dc2872a2e4a3aef33e0ee5141d5f6209204aab2f4a41548d2"
>   
>   inherit setuptools pypi
>   
> 


