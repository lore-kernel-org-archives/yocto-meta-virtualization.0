Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8BAB2E009BC; Thu,  9 Feb 2017 14:00:51 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0E841E0094C
	for <meta-virtualization@yoctoproject.org>;
	Thu,  9 Feb 2017 14:00:49 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v19M0ltX028214
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 9 Feb 2017 14:00:47 -0800 (PST)
Received: from server.local (128.224.21.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 9 Feb 2017 14:00:46 -0800
To: Fathi Boudra <fathi.boudra@linaro.org>,
	<meta-virtualization@yoctoproject.org>
References: <20170209215358.4272-1-fathi.boudra@linaro.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <5ce81f56-20b4-f3e9-572b-9f17c9e138b7@windriver.com>
Date: Thu, 9 Feb 2017 17:00:46 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20170209215358.4272-1-fathi.boudra@linaro.org>
Cc: koen.kooi@linaro.org
Subject: Re: [PATCH] docker: update to 1.13.1 release
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
X-List-Received-Date: Thu, 09 Feb 2017 22:00:51 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

I'm going to sit on this one for a bit. I have a docker uprev + other
components pending in a wip branch .. but there are larger go issues
to sort out with docker and the recipe specific sysroots.

Once everything is validated at runtime with the latest master/m3, I'll
push the changes.

Bruce

On 2017-02-09 4:53 PM, Fathi Boudra wrote:
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
>  recipes-containers/docker/docker_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
> index 009fe9f..d288898 100644
> --- a/recipes-containers/docker/docker_git.bb
> +++ b/recipes-containers/docker/docker_git.bb
> @@ -18,7 +18,7 @@ DESCRIPTION = "Linux container runtime \
>   subtle and/or glaring issues. \
>   "
>
> -SRCREV = "49bf474f9ed7ce7143a59d1964ff7b7fd9b52178"
> +SRCREV = "092cba3727bb9b4a2f0e922cd6c0f93ea270e363"
>  SRC_URI = "\
>  	git://github.com/docker/docker.git;nobranch=1 \
>  	file://docker.service \
> @@ -33,7 +33,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aadc30f9c14d876ded7bedc0afd2d3d7"
>
>  S = "${WORKDIR}/git"
>
> -DOCKER_VERSION = "1.13.0"
> +DOCKER_VERSION = "1.13.1"
>  PV = "${DOCKER_VERSION}+git${SRCREV}"
>
>  DEPENDS = " \
>


