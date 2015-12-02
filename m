Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 88BAAE005B7; Wed,  2 Dec 2015 13:28:37 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 49AD4E00404
	for <meta-virtualization@yoctoproject.org>;
	Wed,  2 Dec 2015 13:28:33 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tB2LSWr7009692
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 2 Dec 2015 13:28:32 -0800
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 2 Dec 2015 13:28:32 -0800
To: <jianchuan.wang@windriver.com>, <meta-virtualization@yoctoproject.org>
References: <1449036575-9369-1-git-send-email-jianchuan.wang@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <565F6279.8040100@windriver.com>
Date: Wed, 2 Dec 2015 16:28:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1449036575-9369-1-git-send-email-jianchuan.wang@windriver.com>
Subject: Re: [PATCH] protobuf-c: Inherit pkgconfig
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
X-List-Received-Date: Wed, 02 Dec 2015 21:28:37 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 15-12-02 01:09 AM, jianchuan.wang@windriver.com wrote:
> From: Jianchuan Wang <jianchuan.wang@windriver.com>
>
> Finding the libprotobuf.* incorrectly if the host have pkgconfig

merged.

Bruce

>
> Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
> ---
>   recipes-containers/criu/protobuf-c_1.1.1.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/criu/protobuf-c_1.1.1.bb b/recipes-containers/criu/protobuf-c_1.1.1.bb
> index 2800f12..0d03ebe 100644
> --- a/recipes-containers/criu/protobuf-c_1.1.1.bb
> +++ b/recipes-containers/criu/protobuf-c_1.1.1.bb
> @@ -15,7 +15,7 @@ SRC_URI[sha256sum] = "09c5bb187b7a8e86bc0ff860f7df86370be9e8661cdb99c1072dcdab07
>   SRC_URI = "https://github.com/protobuf-c/protobuf-c/releases/download/v1.1.1/protobuf-c-1.1.1.tar.gz "
>   SRC_URI_append_class-target ="file://0001-protobuf-c-Remove-the-rules-which-depend-on-the-nati.patch"
>
> -inherit autotools
> +inherit autotools pkgconfig
>
>   BBCLASSEXTEND = "native nativesdk"
>
>


