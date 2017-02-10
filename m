Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C295BE00546; Fri, 10 Feb 2017 07:49:30 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0D933E004D8
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Feb 2017 07:49:29 -0800 (PST)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1AFnTUU027415
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Feb 2017 07:49:29 -0800 (PST)
Received: from server.local (128.224.21.219) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 10 Feb 2017 07:49:28 -0800
To: Mark Asselstine <mark.asselstine@windriver.com>
References: <1486741468-4476-1-git-send-email-mark.asselstine@windriver.com>
	<1486741468-4476-2-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <716ad1ba-3bf4-b44e-321e-4117b154b495@windriver.com>
Date: Fri, 10 Feb 2017 10:49:27 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <1486741468-4476-2-git-send-email-mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 1/2] containerd: uprev to version required by docker 1.13.0
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
X-List-Received-Date: Fri, 10 Feb 2017 15:49:30 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-02-10 10:44 AM, Mark Asselstine wrote:
> Docker defines required dependency versions in its vendor.conf
> file. These can also be validated by running 'docker info' on the
> running system. In order to avoid issues, such as the current one
> where docker can't run containers, we need to ensure we match these
> versions. Uprev containerd to the version defined in docker's
> vendor.conf file.
>

Similar to runc, we need to create a new docker-containerd
package, and a .inc file if elements needs to be shared.

docker can't dictate the versions of these packages.

Bruce

> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-containers/containerd/containerd_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-containers/containerd/containerd_git.bb b/recipes-containers/containerd/containerd_git.bb
> index 5b94dde..67011a3 100644
> --- a/recipes-containers/containerd/containerd_git.bb
> +++ b/recipes-containers/containerd/containerd_git.bb
> @@ -4,9 +4,9 @@ DESCRIPTION = "containerd is a daemon to control runC, built for performance and
>                 containerd leverages runC's advanced features such as seccomp and user namespace \
>                 support as well as checkpoint and restore for cloning and live migration of containers."
>
> -SRCREV = "0ac3cd1be170d180b2baed755e8f0da547ceb267"
> +SRCREV = "03e5862ec0d8d3b3f750e19fca3ee367e13c090e"
>  SRC_URI = "\
> -	git://github.com/docker/containerd.git;nobranch=1 \
> +	git://github.com/docker/containerd.git;branch=docker-1.13.x \
>  	"
>
>  # Apache-2.0 for containerd
> @@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.code;md5=aadc30f9c14d876ded7bedc0afd2d3d7"
>
>  S = "${WORKDIR}/git"
>
> -CONTAINERD_VERSION = "0.2.2"
> +CONTAINERD_VERSION = "0.2.3"
>  PV = "${CONTAINERD_VERSION}+git${SRCREV}"
>
>  DEPENDS = "go-cross-${TARGET_ARCH} \
>


