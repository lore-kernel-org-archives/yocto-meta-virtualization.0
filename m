Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B4EDAE00A51; Thu,  9 Feb 2017 05:56:42 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 88CF3E00A3B
	for <meta-virtualization@yoctoproject.org>;
	Thu,  9 Feb 2017 05:56:34 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v19DuWL3010648
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 9 Feb 2017 05:56:32 -0800 (PST)
Received: from [128.224.56.214] (128.224.56.214) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 9 Feb 2017 05:56:32 -0800
To: Fathi Boudra <fathi.boudra@linaro.org>,
	<meta-virtualization@yoctoproject.org>
References: <20170209072501.19696-1-fathi.boudra@linaro.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <1269f062-84ce-cce9-b242-73853573593f@windriver.com>
Date: Thu, 9 Feb 2017 08:56:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170209072501.19696-1-fathi.boudra@linaro.org>
Cc: koen.kooi@linaro.org
Subject: Re: [PATCH] docker: downgrade lxc/docker-registry/rt-tests to suggests
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
X-List-Received-Date: Thu, 09 Feb 2017 13:56:42 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-02-09 02:25 AM, Fathi Boudra wrote:
> Regular users don't need lxc, docker-registry and rt-tests on the target.
> These tools aren't even needed or provide additional features when running
> docker at runtime. They also increase the size of the image uneccessarily.

They can also just inhibit the installation of rrecommends (which is
what I do).

But yes, I'm ok with making sure that these aren't slipping into more
builds than necessary.

Bruce

>
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
>  recipes-containers/docker/docker_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
> index c208a02..81fd4d4 100644
> --- a/recipes-containers/docker/docker_git.bb
> +++ b/recipes-containers/docker/docker_git.bb
> @@ -61,8 +61,8 @@ RDEPENDS_${PN} = "curl aufs-util git util-linux iptables \
>                    ${@bb.utils.contains('DISTRO_FEATURES','systemd','','cgroup-lite',d)} \
>                   "
>  RDEPENDS_${PN} += "containerd runc"
> -RRECOMMENDS_${PN} = "lxc docker-registry rt-tests"
> -RRECOMMENDS_${PN} += " kernel-module-dm-thin-pool kernel-module-nf-nat"
> +RRECOMMENDS_${PN} = "kernel-module-dm-thin-pool kernel-module-nf-nat"
> +RSUGGESTS_${PN} = "lxc docker-registry rt-tests"
>  DOCKER_PKG="github.com/docker/docker"
>
>  do_configure[noexec] = "1"
>


