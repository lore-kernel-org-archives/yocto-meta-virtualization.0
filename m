Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7C45AE00C22; Tue, 20 Dec 2016 14:25:48 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4C538E00BC0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Dec 2016 14:25:44 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uBKMPghp013712
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 20 Dec 2016 14:25:42 -0800 (PST)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 20 Dec 2016 14:25:41 -0800
To: Fathi Boudra <fathi.boudra@linaro.org>,
	<meta-virtualization@yoctoproject.org>
References: <20161220092535.9066-1-fathi.boudra@linaro.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <ea69cab7-5732-8307-535f-187e535de134@windriver.com>
Date: Tue, 20 Dec 2016 17:25:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20161220092535.9066-1-fathi.boudra@linaro.org>
Cc: koen.kooi@linaro.org
Subject: Re: [PATCH v2 1/4] docker: update to docker 1.12.5 release
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
X-List-Received-Date: Tue, 20 Dec 2016 22:25:48 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Looks good to me.

I'll do a quick sanity build and get this merged/pushed out on Wednesday.

Bruce

On 2016-12-20 04:25 AM, Fathi Boudra wrote:
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
>  recipes-containers/docker/docker_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
> index 2cff6f1..f50f25a 100644
> --- a/recipes-containers/docker/docker_git.bb
> +++ b/recipes-containers/docker/docker_git.bb
> @@ -18,7 +18,7 @@ DESCRIPTION = "Linux container runtime \
>   subtle and/or glaring issues. \
>   "
>
> -SRCREV = "34d9a8240914d30f3a8fe28c1b7d1d4e36d0657b"
> +SRCREV = "7392c3b0ce0f9d3e918a321c66668c5d1ef4f689"
>  SRC_URI = "\
>  	git://github.com/docker/docker.git;nobranch=1 \
>  	file://docker.service \
> @@ -32,7 +32,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aadc30f9c14d876ded7bedc0afd2d3d7"
>
>  S = "${WORKDIR}/git"
>
> -DOCKER_VERSION = "1.12.0"
> +DOCKER_VERSION = "1.12.5"
>  PV = "${DOCKER_VERSION}+git${SRCREV}"
>
>  DEPENDS = "go-cross \
>


